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

                        //下载远程PDF文件
                        $filepathProto = $contractInfo['file_path_proto'];
                        $pathInfo = pathinfo($filepathProto);
                        $extension = $pathInfo['extension'];
                        $newFileName = "_" . date("Ymd", time()) . "_" . $customNum;
                        $newFilePath = str_replace("." . $extension, $newFileName . ".pdf", $filepathProto);
                        $savePdfresult = $this->savePdfFile($downUrl, BASE_PATH . "/../data/upload/" . $newFilePath);
                        $filePath = "";
                        if ($savePdfresult['ret'] == 1) {
                            $filePath = $newFilePath;
                        } else {
                            $message = $savePdfresult["msg"];
                        }

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
                                "store_signed_file_path" => $filePath,
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
                                "member_signed_file_path" => $filePath,
                                "member_signed_datetime" => date("Y-m-d H:i:s", time()),
                                "member_signed_data" => $_json_result);
                        }

                        //如果双方合同都签署完成了,完成本地pdf到E签宝服务器,以备以后举证使用
//                        if ($status == $contractModel::STATUS_BOTH_SUCCESS_KEY && !empty($filePath)) {
//                            $eSignClass = new eSgin();
//                            $filePath = BASE_PATH . "/../data/upload/" . $filePath;
//                            $eSignClass->saveSignedFile($filePath);
//                            die();
//                        }

                        
                        if (!empty($filePath)) {
                            $data['file_path'] = $filePath;
                        }
                        $data['modifyuid'] = $memberId;
                        $data['modifydate'] = date("Y-m-d H:i:s", time());
                        $data['status'] = $status;
                        $result = $contractModel->myUpdate("id='{$contractId}' AND doc_id='{$docId}'", $data);
                        if ($result) {
                            //如果双方合同都签署完成了,完成本地pdf到E签宝服务器,以备以后举证使用
                            if ($status == $contractModel::STATUS_BOTH_SUCCESS_KEY && !empty($filePath)) {
                                $eSignClass = new eSgin();
                                $filePath = BASE_PATH . "/../data/upload/" . $filePath;
                                $eSignClass->saveSignedFile($filePath);
                            }
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
    public function savePdfFile($url, $newfilePath) {
        $data = $this->getHTTPS($url);
        $ret = 0;
        $msg = "";
        if (!empty($data)) {
            $result = file_put_contents($newfilePath, $data);
            if ($result) {
                $ret = 1;
                $msg = "成功!";
            } else {
                $msg = "失败!";
            }
        } else {
            $msg = "获取远程PDF文件内容为空!";
        }
        return array("ret" => $ret, "msg" => $msg);
    }

    function getHTTPS($url) {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_REFERER, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;
    }

}
