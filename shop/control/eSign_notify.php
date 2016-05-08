<?php

header("Content-type: text/html; charset=utf-8");

/**
 * 活动
 *
 *
 *
 *
 * @copyright  Copyright (c) 2007-2013 ShopNC Inc. (http://www.shopnc.net)
 * @license    http://www.shopnc.net
 * @link       http://www.shopnc.net
 * @since      File available since Release v1.1
 */
use Shopnc\Tpl;

defined('InShopNC') or exit('Access Invalid!');
include_once './config/esign.config.ini.php';
require_once("./api/esign/eSignOpenAPI.php");
require_once("./api/esign/class/eSign.class.php");
require_once("./api/esign/comm/utils.php");
require_once 'eSign.php';

class eSign_notifyControl extends Control {

    /**
     * 
     * E签宝签署以后通知界面
     * 同步地址： http://localhost/coalold/shop/index.php?act=eSign_notify&op=index&sign=sync
     * 异步地址： http://localhost/coalold/shop/index.php?act=eSign_notify&op=index&sign=async
     * 自定义标识为: customNum
     *               格式: 合同ID号_用户ID号_企业ID号(为空时为0)
     *               例如： 10_178_0  或者 10_179_24
     * 
     */
    public function indexOp() {
        $_json_result = $json_result = isset($_POST['esign_return']) ? $_POST['esign_return'] : "";
        $json_result = htmlspecialchars_decode($json_result);
        $sign = isset($_GET['sign']) ? $_GET['sign'] : "async";
        eSgin::write("eSign_notify.php--->indexOp.post-------->" . $json_result);
        $message = "";
        if (!empty($json_result)) {
            $str = str_replace('\\', '', $json_result);
            $json_result = json_decode($str, TRUE);
            //错误码，0标识成功，其他均标识失败，详见错误码索引
            $errCode = $json_result['errCode']; //错误码
            $customNum = isset($json_result['customNum']) ? $json_result['customNum'] : ""; //客户自定义标识
            if (!empty($customNum)) {
                $customNumArray = explode("_", $customNum);
                $contractId = $customNumArray[0];
                $memberId = $customNumArray[1];
                $storeId = $customNumArray[2];
                if (intval($contractId) >= 1 && intval($memberId) >= 1) {
                    //操作类型，sign—签署操作的通知；login—登录操作的通知；seal—获取印章操作的通知；
                    //certSign-UKEY签署操作的通知；certSeal-UKEY获取印章操作的通知；certMerge-UKEY签署合并操作的通知，不可空
                    $action = isset($json_result['action']) ? $json_result['action'] : ""; //操作类型
                    $msg = isset($json_result['msg']) ? $json_result['msg'] : ""; //错误信息
                    $errorShow = isset($json_result['errorShow']) ? $json_result['errorShow'] : ""; //错误信息是否
                    $signerEmail = isset($json_result['signerEmail']) ? $json_result['signerEmail'] : ""; //签署账户邮箱
                    $signerMobile = isset($json_result['signerMobile']) ? $json_result['signerMobile'] : ""; //签署账户手机
                    $urls = isset($json_result['urls'][0]) ? $json_result['urls'][0] : array();  //签署后文档下载地址
                    $downUrl = $urls;
                    //$downUrl = isset($urls['downUrl']) ? $urls['downUrl'] : "";   //签章后文档下载地址
                    $docId = isset($json_result['docId'][0]) ? $json_result['docId'][0] : 0;       //文档标识

                    $contractModel = Model('eqb_contract');
                    $signedStatus = $contractModel::MEMBER_SIGNED_STATUS_WAIT_KEY;
                    if (intval($errCode) != 0) {
                        $message = "签署合同失败!" . $json_result['msg'];
                        $signedStatus = $contractModel::MEMBER_SIGNED_STATUS_FAIL_KEY;
                    } else {
                        $signedStatus = $contractModel::MEMBER_SIGNED_STATUS_SUCCESS_KEY;
                    }
                    $contractInfo = $contractModel->getInfo("id='{$contractId}' AND doc_id='{$docId}'");
                    if (!empty($contractInfo)) {
                        //判断是用户还是企业签署合同
                        $status = "";
                        if (intval($storeId) >= 1) {
                            $status = (intval($errCode) == 0) ? $contractModel::STATUS_STORE_SUCCESS_KEY : $contractModel::STATUS_STORE_FAIL_KEY;
                            if ($status == $contractModel::STATUS_STORE_SUCCESS_KEY) {
                                if ($contractInfo['status'] == $contractModel::STATUS_PERSON_SUCCESS_KEY && $contractInfo['member_signed_status'] == $contractModel::MEMBER_SIGNED_STATUS_SUCCESS_KEY) {
                                    $status = $contractModel::STATUS_BOTH_SUCCESS_KEY;
                                }
                            }
                            $data = array("store_signed_status" => $signedStatus,
                                "store_signed_file_path" => $downUrl,
                                "store_signed_datetime" => date("Y-m-d H:i:s", time()),
                                "store_signed_data" => $_json_result);
                        } else {
                            $status = (intval($errCode) == 0) ? $contractModel::STATUS_PERSON_SUCCESS_KEY : $contractModel::STATUS_PERSON_FAIL_KEY;
                            if ($status == $contractModel::STATUS_PERSON_SUCCESS_KEY) {
                                if ($contractInfo['status'] == $contractModel::STATUS_STORE_SUCCESS_KEY && $contractInfo['store_signed_status'] == $contractModel::STORE_SIGNED_STATUS_SUCCESS_KEY) {
                                    $status = $contractModel::STATUS_BOTH_SUCCESS_KEY;
                                }
                            }
                            $data = array("member_signed_status" => $signedStatus,
                                "member_signed_file_path" => $downUrl,
                                "member_signed_datetime" => date("Y-m-d H:i:s", time()),
                                "member_signed_data" => $_json_result);
                        }
                        $this->savePdfFile($downUrl);

                        if (!empty($downUrl)) {
                            //$data['file_path'] = $downUrl; 暂时不更新源文件
                        }
                        $data['modifyuid'] = $memberId;
                        $data['modifydate'] = date("Y-m-d H:i:s", time());
                        $data['status'] = $status;
                        $result = $contractModel->myUpdate("id='{$contractId}' AND doc_id='{$docId}'", $data);
                        if ($result) {
                            $message = "合同签署通知操作成功!";
                        } else {
                            $message = "更新合同各自状态失败!";
                        }
                    } else {
                        $message = "查询不到合同基本信息!";
                    }
                } else {
                    $message = "客户自定义标识中的合同ID及用户ID为空!";
                }
            } else {
                $message = "客户自定义标识为空!";
            }
        } else {
            $message = "E签宝回调内容为空!";
        }
        eSgin::write("eSign_notify.php--->indexOp.message-------->" . $message);
        if ($sign == "sync") {
            showDialog($message, 'index.php', 'succ');
        } else {
            echo $message;
            die();
        }
    }

    /**
     * 
     * 保存PDF文件
     * 
     */
    public function savePdfFile($pdfFile) {
        //保存PDF文件
        $pdfFile = "http://esignoss.oss-cn-hangzhou.aliyuncs.com/10878/PDF_668ff46b-28b7-469c-ad34-a331f516f0da?Expires=1462709385&OSSAccessKeyId=FBzUaPMorqiiUAfb&Signature=vR%2BZCmyHUknF8KFnvQ6TCHnSffI%3D";
        echo $pdfFile;
//        $fileObject = file_get_contents($pdfFile);
//        var_dump($fileObject);
//
//        file_put_contents("a.pdf", $fileObject);
        
        $this->getImg($pdfFile, "bb.pdf");
        
    }

    function getImg($url = "", $filename = "") {
        if (is_dir(basename($filename))) {
            echo "The Dir was not exits";
            Return false;
        }
//去除URL连接上面可能的引号 
        $url = preg_replace('/(?:^[\'"]+|[\'"\/]+$)/', '', $url);
        $hander = curl_init();
        $fp = fopen($filename, 'wb');
        curl_setopt($hander, CURLOPT_URL, $url);
        curl_setopt($hander, CURLOPT_FILE, $fp);
        curl_setopt($hander, CURLOPT_HEADER, 0);
        curl_setopt($hander, CURLOPT_FOLLOWLOCATION, 1);
//curl_setopt($hander,CURLOPT_RETURNTRANSFER,false);//以数据流的方式返回数据,当为false是直接显示出来 
        curl_setopt($hander, CURLOPT_TIMEOUT, 60);
        /* $options = array( 
          CURLOPT_URL=> 'http://jb51.net/content/uploadfile/201106/thum-f3ccdd27d2000e3f9255a7e3e2c4880020110622095243.jpg',
          CURLOPT_FILE => $fp,
          CURLOPT_HEADER => 0,
          CURLOPT_FOLLOWLOCATION => 1,
          CURLOPT_TIMEOUT => 60
          );
          curl_setopt_array($hander, $options);
         */
        curl_exec($hander);
        curl_close($hander);
        fclose($fp);
        Return true;
    }

}
