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
        if($type != "-1"){
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
                    }else if($type == 1){
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
            
        }else{
            Tpl::showpage('tsign.account', 'null_layout');
        }
    }
    
    
    //文档签署（原文上传）
    public function addfileOp(){
        
        
    }
    
    //文件签置完成以后同步或异步通知
    public function notifyOp(){
        
        
    }
    
}
