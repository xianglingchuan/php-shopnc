<?php

/**
 * 默认展示页面
 *
 *
 *
 * @网店运维提供技术支持 授权请购买shopnc授权
 * @license    http://www.shopwwi.com
 * @link       交流群号：111731672
 */
use Shopnc\Tpl;

defined('InShopNC') or exit('Access Invalid!');

require_once("./api/tsign/eSignOpenAPI.php");
require_once("./api/tsign/class/eSign.class.php");
require_once("./api/tsign/comm/utils.php");
require_once("./config/tsign.config.ini.php");

class tsignControl extends BaseHomeControl {

    //首页界面
    public function indexOp() {
        Tpl::showpage('tsign', 'null_layout');
    }

    //注册用户
    public function accountOp() {
        //保存注册用户信息
        header("Content-type: text/html; charset=utf-8");

        //判断是否为提交信息
        $type = isset($_POST['type']) ? $_POST['type'] : -1; //账户类型，0-个人，1-企业
        if ($type != "-1") {
            // 初始化e签宝 PHP SDK
            $sign = new eSign();
            $iRet = $sign->init(E_PROJECT_ID, E_PROJECT_SECRET);
            // 初始化成功，执行项目账户登录
            if (0 == $iRet) {
                // 项目账户登录成功
                if ($sign->projectid_login()) {
                    // 添加个人账户
                    if ($type == 0) {
                        $permobile = isset($_POST['permobile']) && !empty($_POST['permobile']) ? trim($_POST['permobile']) : ""; //手机号
                        $pername = isset($_POST['pername']) && !empty($_POST['pername']) ? trim($_POST['pername']) : ""; //姓名
                        $peridNo = isset($_POST['peridNo']) && !empty($_POST['peridNo']) ? trim($_POST['peridNo']) : ""; //身份证号
                        $perArea = isset($_POST['perArea']) && !empty($_POST['perArea']) ? trim($_POST['perArea']) : 0; //用户归属地 0-大陆 1-香港 2-澳门 3-台湾 4-外籍
                        $ret = $sign->addPersonAccount($permobile, $pername, $peridNo, '', '', '', '', $perArea);
                        //添加企业账户                        
                    } else if ($type == 1) {
                        $orgmobile = isset($_POST['orgmobile']) && !empty($_POST['orgmobile']) ? trim($_POST['orgmobile']) : ""; //手机号
                        $orgname = isset($_POST['orgname']) && !empty($_POST['orgname']) ? trim($_POST['orgname']) : "";         //公司名称
                        $orgcode = isset($_POST['orgcode']) && !empty($_POST['orgcode']) ? trim($_POST['orgcode']) : "";         //组织机构代码
                        $legalArea = isset($_POST['legalArea']) && !empty($_POST['legalArea']) ? trim($_POST['legalArea']) : 0; //用户归属地 0-大陆 1-香港 2-澳门 3-台湾 4-外籍                        
                        $ret = $sign->addOrganizeAccount($orgmobile, $orgname, $orgcode, '', 0, '', '', $legalArea);
                    }
                    $errCode = $ret['errCode'];
                    if ($errCode == 0) {
                        echo '账户添加成功，账户标识：' . $ret['accountId'] . '<br><br>';
                    } else {
                        echo '账户添加失败，错误码：' . $errCode . '，错误详情：' . $ret['msg'] . '<br><br>';
                    }
                    echo '<a href="index.html">返回</a>';
                }
            }
        } else {
            Tpl::showpage('tsign.account', 'null_layout');
        }
    }

    //文档签署（原文上传）
    public function addfileOp() {
         header("Content-type: text/html; charset=utf-8");
        $type = isset($_POST['type']) ? $_POST['type'] : -1; //文档添加类型，0-将文档转换为PDF后保存，1-直接保存PDF文档
        if ($type != "-1") {
            // 初始化e签宝 PHP SDK
            $sign = new eSign();
            $iRet = $sign->init(E_PROJECT_ID, E_PROJECT_SECRET);
            // 初始化成功，执行项目账户登录
            if (0 == $iRet) {
                // 项目账户登录成功
                if ($sign->projectid_login()) {
                    $docFilePath = isset($_POST['docFilePath']) && !empty($_POST['docFilePath']) ? trim($_POST['docFilePath']) : "";//文档路径
                    $docType = isset($_POST['docType']) && !empty($_POST['docType']) ? trim($_POST['docType']) : "";//文档类型
                    $docName = isset($_POST['docName']) && !empty($_POST['docName']) ? trim($_POST['docName']) : "";//文档名称
                    // 将文档转换为PDF后保存
                    if ($type == 0) {
                        $ret = $sign->conv2pdf($docFilePath, $docType);
                        print_r($ret);
                        echo "<br><br><br>";
                        $errCode = $ret['errCode'];
                        if ($errCode == 0) {
                            // 文档转换成功，将转换后文档保存至e签宝
                            $saveRet = $sign->addFileByOssKey($ret['oss_key'], $docName);
                        } else {
                            echo '文档转换失败，错误码：' . $ret['errCode'] . '，错误详情：' . $ret['msg'] . '<br><br>';
                        }
                    }
                    // 直接保存PDF文档
                    if ($type == 1) {
                        $saveRet = $sign->addFile($docFilePath, $docName);
                    }
                    if ($errCode == 0) {
                        if ($saveRet['errCode'] == 0) {
                            echo '文档保存成功，文档标识：' . $saveRet['docId'] . '<br><br>';
                        } else {
                            echo '文档保存失败，错误码：' . $saveRet['errCode'] . '，错误详情：' . $saveRet['msg'] . '<br><br>';
                        }
                    }

                    // 文档保存成功，显示平台用户签署开始页面
                    if ($errCode == 0 && $saveRet['errCode'] == 0) {
                        echo '<form action="signShowFile.php" method="post">';
                        echo '待签署文档标识：<input type="text" name="docId" value="' . $saveRet['docId'] . '" /><br><br>';
                        echo '认证类型：<input type="text" name="authType" value="3,4" />（身份认证类型，1-手机/验证码验证，2-手机接收授权短信验证，3-邮箱/签署口令，4-手机/签署口令，5-UKEY证书，默认1。支持多种认证类型，多个以“,”隔开）<br><br>';
                        echo '印章获取类型：<input type="text" name="sealType" value="1" />（印章获取方式。0-实时手绘印章，1-预先定义的默认印章，2-实施模板印章，3-选择历史印章。默认0。支持多种印章获取方式，多个以“,”隔开）<br><br>';
                        echo '签署账户标识信息：<input type="text" name="signer" value="" /><br><br>';
                        echo '签署账户标识信息类型：<input type="text" name="signerType" value="0" />（签署账户标识信息类型，0-邮箱，1-手机，2-certSN，默认0）<br><br>';
                        echo '客户自定义标识：<input type="text" name="customNum" value="1111111111" /><br><br>';
                        echo '同步通知地址：<input type="text" name="redirectUrl" value="http://localhost/coalold/shop/index.php?act=tsign&op=notify" /><br><br>';
                        echo '异步通知地址：<input type="text" name="notifyUrl" value="http://localhost/coalold/shop/index.php?act=tsign&op=notify" /><br><br>';
                        echo '<input type="submit" value="开始签署"/>';
                        echo '</form>';
                    }
                }
            }
        }else{
            Tpl::showpage('tsign.addfile', 'null_layout');
        }
    }

    //文件签置完成以后同步或异步通知
    public function notifyOp() {
        
    }

}
