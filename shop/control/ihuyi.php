<?php
/**
 * 前台商品
 *
 *
 *
 **你正在使用的程序由网店运维技术交流中心www.shopjl.com提供！这里有专业化shopnc技术指导！以便你更好的了解这个程序*/


defined('InShopNC') or exit('Access Invalid!');

class ihuyiControl extends BaseGoodsControl {
    public function __construct() {
        parent::__construct ();
        Language::read('store_goods_index');
    }


	
	/*提交验证*/
	public function boolRegOp(){
		//注册

		if($_GET['mobile']!=$_SESSION['mobile'] or $_GET['mobile_code']!=$_SESSION['mobile_code']){
			echo "false";
		}else{
			echo "true";
		}
	
	}
	
	
	
	/*注册验证*/
	public function registerOp(){
		
                if($_POST['type'] == "company"){
                    $sendCodeKey = "company_send_code";
                }else{
                    $sendCodeKey = "send_code";
                }
		if(empty($_SESSION[$sendCodeKey]) or $_POST["send_code"]!=$_SESSION[$sendCodeKey]){//防用户恶意请求站外调用，不需要可删除
			
			echo '请求超时，请刷新页面后重试';
			return true;
		}
		
		$mobile =$_POST['mobile'];
		$mobile_code=rand(100000,999999);
		
		$sms = new Sms();
		//$gets =  $sms->send_arr($mobile,"您的验证码是：".$mobile_code."。请不要把验证码泄露给其他人。");
		//您的订单：{$order_sn}，确认收货成功。感谢您购买与支持，欢迎您下次光临！
		$gets =  $sms->send_arr($mobile,"您的验证码是：".$mobile_code."。请不要把验证码泄露给其他人。");
		
		if($gets['code']==2){ //发送成功，保存手机，和手机验证码。提交的时候还需要验证
			$_SESSION['mobile'] = $mobile;
			$_SESSION['mobile_code'] = $mobile_code;
			echo "2";	
		}else{
			$_SESSION['mobile'] = "";
			$_SESSION['mobile_code'] = "";
			echo "-1";	
		}
		return true;
	}
   
}
