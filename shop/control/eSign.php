<?php

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

class eSgin {

    //同步地址
    const REDIRECTURL = "/index.php?act=eSign_notify&op=index&sign=sync";
    //异步地址
    const NOTIFYURL = "/index.php?act=eSign_notify&op=index&sign=async";

    /**
     * E签宝用户注册
     */
    public function accountPerson($permobile, $pername, $peridNo, $perArea) {
        $sign = new eSign();
        $iRet = $sign->init(E_PROJECT_ID, E_PROJECT_SECRET);
        // 初始化成功，执行项目账户登录
        $returnArray = array("ret" => 0, "msg" => "", "accountId" => 0);
        if (0 == $iRet) {
            // 项目账户登录成功
            if ($sign->projectid_login()) {
                //添加个人账户
                $ret = $sign->addPersonAccount($permobile, $pername, $peridNo, '', '', '', '', $perArea);
                $errCode = $ret['errCode'];
                if ($errCode == 0) {
                    $returnArray['msg'] = "账户添加成功";
                    $returnArray['accountId'] = $ret['accountId'];
                } else {
                    $returnArray['msg'] = "账户添加失败，错误码：{$errCode}，错误详情：{$ret['msg']}";
                }
            }
        }
        return $returnArray;
    }

    /**
     * E签宝企业注册
     */
    public function accountStore($orgmobile, $orgname, $orgcode, $legalName, $legalArea) {
        $sign = new eSign();
        $iRet = $sign->init(E_PROJECT_ID, E_PROJECT_SECRET);
        // 初始化成功，执行项目账户登录
        $returnArray = array("ret" => 0, "msg" => "", "accountId" => 0);
        if (0 == $iRet) {
            // 项目账户登录成功
            if ($sign->projectid_login()) {
                // 添加企业账户
                $ret = $sign->addOrganizeAccount($orgmobile, $orgname, $orgcode, '', 0, '', $legalName, $legalArea);
                $errCode = $ret['errCode'];
                if ($errCode == 0) {
                    $returnArray['ret'] = 1;
                    $returnArray['msg'] = "账户添加成功";
                    $returnArray['accountId'] = $ret['accountId'];
                } else {
                    $returnArray['msg'] = "账户添加失败，错误码：{$errCode}，错误详情：{$ret['msg']}";
                }
            }
        }
        return $returnArray;
    }

    /**
     * 上传合同文件
     */
    public function updateFile($filePath, $docName) {
        $returnArray = array("ret" => 0, "msg" => "", "doc_id" => 0);
        // 初始化e签宝 PHP SDK
        $sign = new eSign();
        $iRet = $sign->init(E_PROJECT_ID, E_PROJECT_SECRET);
        // 初始化成功，执行项目账户登录
        if (0 == $iRet) {
            // 项目账户登录成功
            if ($sign->projectid_login()) {
                //文档添加类型，0-将文档转换为PDF后保存，1-直接保存PDF文档
                $filePathInfo = pathinfo($filePath);
                $docType = $filePathInfo['extension'];
                if (in_array($docType, array("doc", "pdf"))) {
                    $type = $docType != "pdf" ? 0 : 1;
                    $saveRet = array();
                    $errCode = 0;
                    if (intval($type) == 0) {
                        $ret = $sign->conv2pdf($filePath, $docType); //将文档转换为PDF后保存
                        $errCode = $ret['errCode'];
                        if ($errCode == 0) { //文档转换成功，将转换后文档保存至e签宝
                            $saveRet = $sign->addFileByOssKey($ret['oss_key'], $docName);
                        } else {
                            $returnArray['msg'] = '文档转换失败，错误码：' . $ret['errCode'] . '，错误详情：' . $ret['msg'];
                        }
                    }
                    //直接保存PDF文档
                    if (intval($type) == 1) {
                        $saveRet = $sign->addFile($filePath, $docName);
                    }
                    if ($errCode == 0) {
                        if ($saveRet['errCode'] == 0) {
                            $returnArray['msg'] = '文档保存成功';
                            $returnArray['ret'] = 1;
                            $returnArray['doc_id'] = $saveRet['docId'];
                        } else {
                            $returnArray['msg'] = '文档保存失败，错误码：' . $saveRet['errCode'] . '，错误详情：' . $saveRet['msg'];
                        }
                    }
                } else {
                    $returnArray['msg'] = "合同文件只能是doc或pdf格式!";
                }
            } else {
                $returnArray['msg'] = "项目账户登录失败!";
            }
        } else {
            $returnArray['msg'] = "项目账户初始化失败!";
        }
        return $returnArray;
    }

    /**
     * 显示签署页面
     */
    public function signShowFile($data) {
        // 初始化e签宝 PHP SDK
        $sign = new eSign();
        $iRet = $sign->init(E_PROJECT_ID, E_PROJECT_SECRET, $data['redirectUrl'], $data['notifyUrl']);
        // 初始化成功，显示签署页面
        if (0 == $iRet) {
            $sign->quickSignPDFPage($data['customNum'], $data['docId'], $data['authType'], $data['sealType'], $data['signer'], $data['signerType']);
        }
    }
    

    /**
     *
     * @Date:   2013-07-28
     * @Auth:   Xlc
     * @Desc:   写入日志内容
     * @Param:  $info String 日志内容
     * @Return: Void
     *
     */
    public static function write($info) {
        $logFile = BASE_PATH . "/../data/log/" . date('y_m_d') . '.html';
        $info = "[" . date("Y-m-d H:i:s", time()) . "]<BR>\r" . $info . "\r<BR><BR>";
        $fp = @fopen($logFile, "a+");
        @fwrite($fp, $info);
        @fclose($fp);
    }

}
