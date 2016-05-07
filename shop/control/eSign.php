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

class eSgin{
    
    
	/**
	 * E签宝用户注册
	 */
        public function accountPerson($permobile, $pername, $peridNo, $perArea){
            $sign = new eSign();
            $iRet = $sign->init(E_PROJECT_ID, E_PROJECT_SECRET);          
            // 初始化成功，执行项目账户登录
            $returnArray = array("ret"=>0, "msg"=>"", "accountId"=>0);
            if(0 == $iRet){
		// 项目账户登录成功
		if($sign->projectid_login()){			
		    //添加个人账户
		    $ret = $sign->addPersonAccount($permobile, $pername, $peridNo,'','','','',$perArea);
		    $errCode = $ret['errCode'];
		    if($errCode == 0){
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
        public function accountStore($orgmobile, $orgname, $orgcode, $legalName, $legalArea){
            $sign = new eSign();
            $iRet = $sign->init(E_PROJECT_ID, E_PROJECT_SECRET);          
            // 初始化成功，执行项目账户登录
            $returnArray = array("ret"=>0, "msg"=>"", "accountId"=>0);
            if(0 == $iRet){
		// 项目账户登录成功
		if($sign->projectid_login()){			
		    // 添加企业账户
		    $ret = $sign->addOrganizeAccount($orgmobile, $orgname, $orgcode,'',0,'',$legalName,$legalArea);
		    $errCode = $ret['errCode'];
		    if($errCode == 0){
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
        public function updateFile($filePath, $fileName){
            // 初始化e签宝 PHP SDK
            $sign = new eSign();
            $iRet = $sign->init(E_PROJECT_ID, E_PROJECT_SECRET); 
	    // 初始化成功，执行项目账户登录
            if(0 == $iRet){
                // 项目账户登录成功
                if($sign->projectid_login()){
                    //文档添加类型，0-将文档转换为PDF后保存，1-直接保存PDF文档
                    $filePathInfo = pathinfo($filePath);
                    $docType = $filePathInfo['extension'];
                    $type = $docType != "pdf" ? 0 : 1;   
                    var_dump($type);
                    die();
                    //$type = $_POST['type'];
                    //将文档转换为PDF后保存
                    if($type == 0){	
                        $ret = $sign->conv2pdf($_POST['docFilePath'], $_POST['docType']);		
                        print_r($ret);
                        echo "<br><br><br>";
                        $errCode = $ret['errCode'];
                        if($errCode == 0){
                            // 文档转换成功，将转换后文档保存至e签宝
                            $saveRet = $sign->addFileByOssKey($ret['oss_key'], $_POST['docName']);
                        }else {
                           echo '文档转换失败，错误码：' . $ret['errCode'] . '，错误详情：' . $ret['msg'] . '<br><br>';
                        }
                    } 
                    // 直接保存PDF文档
                            if($type == 1){				
                                    $saveRet = $sign->addFile($_POST['docFilePath'], $_POST['docName']);
                            }

                            if($errCode == 0){
                                    if($saveRet['errCode'] == 0){
                                            echo '文档保存成功，文档标识：' . $saveRet['docId'] . '<br><br>';
                                    } else {
                                            echo '文档保存失败，错误码：' . $saveRet['errCode'] . '，错误详情：' . $saveRet['msg'] . '<br><br>';
                                    }
                            }
                            
                            die();
                            
                            
                            // 文档保存成功，显示平台用户签署开始页面
                            if($errCode == 0 && $saveRet['errCode'] == 0){
                                    echo '<form action="signShowFile.php" method="post">';
                                    echo '待签署文档标识：<input type="text" name="docId" value="' . $saveRet['docId'] . '" /><br><br>';
                                    echo '认证类型：<input type="text" name="authType" value="3,4" />（身份认证类型，1-手机/验证码验证，2-手机接收授权短信验证，3-邮箱/签署口令，4-手机/签署口令，5-UKEY证书，默认1。支持多种认证类型，多个以“,”隔开）<br><br>';
                                    echo '印章获取类型：<input type="text" name="sealType" value="1" />（印章获取方式。0-实时手绘印章，1-预先定义的默认印章，2-实施模板印章，3-选择历史印章。默认0。支持多种印章获取方式，多个以“,”隔开）<br><br>';
                                    echo '签署账户标识信息：<input type="text" name="signer" value="" /><br><br>';
                                    echo '签署账户标识信息类型：<input type="text" name="signerType" value="0" />（签署账户标识信息类型，0-邮箱，1-手机，2-certSN，默认0）<br><br>';
                                    echo '客户自定义标识：<input type="text" name="customNum" value="1111111111" /><br><br>';
                                    echo '同步通知地址：<input type="text" name="redirectUrl" value="http://localhost/demo-php/example/showfile/notify.php" /><br><br>';
                                    echo '异步通知地址：<input type="text" name="notifyUrl" value="http://localhost/demo-php/example/showfile/notify.php" /><br><br>';
                                    echo '<input type="submit" value="开始签署"/>';
                                    echo '</form>';
                            }
                    }
            }
            
        }
}
