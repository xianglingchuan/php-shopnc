<?php
/**
 * 手机短信类-互亿无线
 * ----------------------------------  使用规则   -------------------------------------
 * 
 *
 * 
 */
defined('InShopNC') or exit('Access Invalid!');

class Sms {
	
	private $userName 	  = "";   //用户名
	private $userPassword = "";  //密码    

	
    /**
     * 发送手机短信，返回true 或者 false
     * @param unknown $mobile 手机号
     * @param unknown $content 短信内容
     */
    public function send($mobile,$content) {
	   return $this->ihuyi($mobile,$content,1);
    }
	
	/*
		发送手机短信，返回 数组
	*/
	public function send_arr($mobile,$content) {
	   return $this->ihuyi($mobile,$content,2);
    }
	

	private function ihuyi($mobile,$content,$type){
		
		$user= Model('ihuyi')->selectUser();
		$this->userName = $user['ihuyi_user_name'];
		$this->userPassword =md5($user['ihuyi_user_password']); 
		
		//插入发送的短信
		$msm_id = Model('ihuyi')->insertSms($mobile,$content,date('Y-m-d H:i:s',time()),$_SESSION['member_name']);
		
			$target	  	  = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";  //发送短信接口地址
			$post_data	  = "account=".$this->userName."&password=".$this->userPassword."&mobile=".$mobile."&content=".rawurlencode($content);  //互亿无线接口参数
			
		if(!function_exists('curl_init')){ 
			$gets['code']=0;
			$gets['num'] =0;
			$gets['msg'] ='PHP配置环境异常：curl扩展未开启，请开启后重启服务再次尝试。';
		} else{	
			$gets		  =  $this->xml_to_array($this->Post($post_data, $target));   //POST请求接口，返回XML格式值 ，xml_to_array转换为数组格式
			// 返回值处理 
			$gets['code'] = $gets['SubmitResult']['code'];  //接口返回的状态
			$gets['msg']  = $gets['SubmitResult']['msg'];   //接口返回结果描述
			$gets['smsid']= $gets['SubmitResult']['smsid']; //接口返回发送成功的消息ID,不成功则
			if($gets['code']=="" and $gets['msg']==""){
				$gets['code']=-1;
				$gets['smsid'] =0;
				$gets['msg']='请检查参数是否正确，和短信平台通讯是否异常';
			}
		}

		//返回值处理，更新记录
		if($msm_id>0){	
			$msm_id = Model('ihuyi')->updateSms($msm_id,$gets['code'],$gets['msg'],$gets['smsid']);
		}

		if($type==2){   //返回所以内容
			return $gets;
		}else{ //系统默认只接收true和false
			if($gets['code']==2){
				return true;
			}else{
				return false;	
			}
		}

		
	}
	
	
	
	function selectNum(){
		$user= Model('ihuyi')->selectUser();
		$this->userName = $user['ihuyi_user_name'];
		$this->userPassword =md5($user['ihuyi_user_password']); 
		
		$target	  	  = "http://106.ihuyi.cn/webservice/sms.php?method=GetNum";  //查询余额接口地址
		$post_data	  = "account=".$this->userName."&password=".$this->userPassword;  //互亿无线接口参数
		
		//检查异常
		$gets = "";
		
		if(!function_exists('curl_init')){ 
			$gets['code']=0;
			$gets['num'] =0;
			$gets['msg'] ='PHP配置环境异常：curl扩展未开启，请开启后重启服务再次尝试。';
		}else{
			
		 $a =	$this-> getMillisecond();
		 $gets	  =  $this->xml_to_array($this->Post($post_data, $target));   //POST请求接口，返回XML格式值 ，xml_to_array转换为数组格式
		 $b	= $this-> getMillisecond();
		 
		$gets['retuTime'] = ($b-$a)/1000;
			// 返回值处理 
			$gets['code'] = $gets['GetNumResult']['code'];  //接口返回的状态
			$gets['msg']  = $gets['GetNumResult']['msg'];   //接口返回结果描述
			$gets['num']  = $gets['GetNumResult']['num']; //剩余条数
			if($gets['code']=="" and $gets['msg']==""){
				$gets['code']=-1;
				$gets['num'] =0;
				$gets['msg']='请求接口异常';
			}
		}

		
		return $gets; //返回数组
	}
	
	
	
	 /**
     * 发送手机短信
     * @param unknown $curlPost ：参数
     * @param unknown $$url ：请求地址
     */
	function Post($curlPost,$url){
			$curl = curl_init();
			curl_setopt($curl, CURLOPT_URL, $url);
			curl_setopt($curl, CURLOPT_HEADER, false);
			curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($curl, CURLOPT_NOBODY, true);
			curl_setopt($curl, CURLOPT_POST, true);
			curl_setopt($curl, CURLOPT_POSTFIELDS, $curlPost);
			$return_str = curl_exec($curl);
			curl_close($curl);
			return $return_str;
	}
	
	/**XML格式转换数组*/
	function xml_to_array($xml){
		$reg = "/<(\w+)[^>]*>([\\x00-\\xFF]*)<\\/\\1>/";
		if(preg_match_all($reg, $xml, $matches)){
			$count = count($matches[0]);
			for($i = 0; $i < $count; $i++){
			$subxml= $matches[2][$i];
			$key = $matches[1][$i];
				if(preg_match( $reg, $subxml )){
					$arr[$key] = $this->xml_to_array( $subxml );
				}else{
					$arr[$key] = $subxml;
				}
			}
		}
		return $arr;
	}

	/** 获取当前时间戳，精确到毫秒 */
	function getMillisecond() {
		list($s1, $s2) = explode(' ', microtime());
		return (float)sprintf('%.0f', (floatval($s1) + floatval($s2)) * 1000);
	}
	
	
	/* 解决方案 */
	function help(){
		
	$result = array(
		'0'=>'说明：<br>未知异常<br><br>解决方案：<br>请联系您的专属客服，咨询返回值为0的异常情况，我们会为您排查。',
		
		'2'=>'说明：<br>提交成功',
		
		'400'=>'说明：<br>您的IP受到我们服务器的限制，这可能是您的IP对使用接口有异常行为<br><br>解决方案：<br>请联系您的专属客服进行解除限制',
		
		'401'=>'说明：<br>您已经请求到我们的短信接口，但是您提交的账号为空。<br><br>解决方案：<br>请检查程序中账号是否设置，如果正确设置无效，请技术人员跟踪程序上相关的参数。<br>提示：短信类路径：core/framework/libraries/sms.php ,数据库表：前缀+ihuyi_sms',
		
		'402'=>'说明：<br>您已经请求到我们的短信接口，但是您提交的密码为空。<br><br>解决方案：<br>请检查程序中密码是否设置，如果正确设置无效，请技术人员跟踪程序上相关的参数。<br>提示：短信类路径：core/framework/libraries/sms.php <br>数据库表：前缀+ihuyi_sms',
		
		'403'=>'说明：<br>您提交的手机号码为空。<br><br>解决方案：<br>请技术人员检查程序中手机号码参数值是否异常。<br>提示：短信类路径：core/framework/libraries/sms.php ',
		
		'4030'=>'说明：<br>手机号码已被列入黑名单。<br><br>解决方案：请联系您的专属客服，并且提供手机号。',
		
		'404'=>'说明：<br>提交过来的参数缺少短信内容。<br><br>解决方案：请检查您程序中发送请求的地方，短信内容参数是否为空。',
		
		'405'=>'说明：<br>提交过来的账号密码错误。<br><br>解决方案：<br>1、请尝试使用该账号密码登入短信后台，如果提示错误，请纠正。如需要找回或者修改。请通过后台或者联系您的专属客服重置。<br>2、是否存在多个账号，确定使用的是哪个账号？',
		
		'4050'=>'说明：<br>您的互亿账号被冻结。<br><br>解决方案：<br>1、在您未知情的情况下，可能是程序死循环请求接口导致，或者页面重复提交<br>2、您的程序发送请求被他人非法利用。',
		
		'4051'=>'说明：<br>您的剩余条数不足。<br><br>解决方案：请通过官方短信后台充值或者联系您的专属客服进行充值',
		
		'4052'=>'说明：<br>您的账号绑定了您的服务器IP地址，我们只会受理您账号绑定的IP地址如果需要解除限制。<br><br>解决方案：如果需要解除，请联系您的专属客服。',
		
		'406'=>'说明：<br>请检查您提交过来的手机号码是否是正常的手机格式。<br><br>解决方案：请检查您发送的手机号码是否有误！如果您发送的是国外号码，请联系您的专属客服',
		
		'407'=>'说明：<br>您的短信内容中含有敏感字符，请纠正。<br><br>解决方案：如果不清楚哪些是敏感字符，请通过后台检查，或者联系您的专属客服进行排查和调整',
		
		'4070'=>'说明：<br>您在我们后台设置中的签名异常。<br><br>解决方案：请联系您的专属客服调整',
		
		'4071'=>'说明：<br>没有提交备案模板<br><br>解决方案：请到短信平台中提交报备（只有正式用户才能报备哦）',
		
		'4072'=>'说明：<br>企业对外发送短信，短信平台和通讯商需要根据上级规定对短信内容进行严格的审核，确保不下发违法、违规、诈骗等非法内容。如果您看到该内容，则说明您发送的内容未提交短信模版，或者与提交的短信模版不匹配。如果您是测试用户，则只能发送本平台默认的短信格式内容，详细可以咨询您的专属客服。<br><br>解决方案：<br>1、测试用户：请发送默认格式的短信内容，修改“短信设置”，具体可发送的模板请咨询您的专属客服。<br>2、正式用户：请将您发送的短信模板在我们短信后台中报备，审核通过后，即可发送。后台地址：<a href=http://106.ihuyi.com/login.html >http://106.ihuyi.com</a>  <br><br>模板报备规则：<br>如果您要发送 “ <span style=\'color:#099ACF;\'>尊敬的<strong>张三</strong>你好,你的注册验证码是<strong>5236</strong>。</span> ” 或者  “ <span style=\'color:#099ACF;\'>尊敬的<strong>李四</strong>你好,你的注册验证码是<strong>1234</strong>。</span>”  则报备 “ <span style=\'color:#099ACF;\'>尊敬的<strong>【变量】</strong>你好,你的注册验证码是<strong>【变量】</strong>。</span> ”<br>如果您要发送 “ <span style=\'color:#099ACF;\'>尊敬的用户，您的订单已通过<strong>圆通快递</strong>发货，订单号为<strong>856952477</strong>。</span> ” 或者  “ <span style=\'color:#099ACF;\'>尊敬的用户，您的订单已通过<strong>顺风快递</strong>发货，订单号为<strong>6516543213</strong>。</span> ”  则报备 “ <span style=\'color:#099ACF;\'>尊敬的用户，您的订单已通过<strong>【变量】</strong>发货，订单号为<strong>【变量】</strong>。</span> ”<br><br>注意事项：<br>1、短信内容中不需要设置签名，如【京东商城】，这个是在我们短信后台设置，自动加的。<br>2、设置请注意中英文符号哦！ 最长300个字，一条短信为66个字，如果67个字则发两条短信，其中短信长度包含签名。（一个字母一个符号一个汉字都算一个字符）',
		
		'4073'=>'说明：<br>短信内容超过限制。<br><br>解决方案：限制300个字，请调整！。',
		
		'408'=>'说明：<br>您的帐户疑被恶意利用，已被自动冻结。<br><br>解决方案：请与您的专属客服解冻。',
		
		'4080'=>'说明：<br>通讯商的通道安全使用限制：同一手机号码同一秒钟不能超过2条。<br><br>解决方案：<br>如该限制不符合您的需求，请联系您的专属客服解决。',
		
		'4081'=>'说明：<br>通讯商的通道安全使用限制：同一手机号码一分钟之内发送频率超不能超过1条。<br><br>解决方案：<br>如该限制不符合您的需求，请联系您的专属客服解决。',
		
		'4082'=>'说明：<br>通讯商的通道安全使用限制：同一手机号码一天之内发送频率超不能超过5条。<br><br>解决方案：<br>如该限制不符合您的需求，请联系您的专属客服解决。',
		
		'4083'=>'说明：<br>通讯商的通道安全使用限制：同内容每分钟限制：1条。<br><br>解决方案：<br>如该限制不符合您的需求，请联系您的专属客服解决。',
		
		'4084'=>'说明：<br>通讯商的通道安全使用限制：同内容每日限制：5条。<br><br>解决方案：<br>如该限制不符合您的需求，请联系您的专属客服解决。',
		
		'4085'=>'说明：<br>通讯商的通道安全使用限制：同一手机号码验证码短信发送量超出5条。<br><br>解决方案：<br>如该限制不符合您的需求，请联系您的专属客服解决。',
		
		'4086'=>'说明：<br>通讯商的通道安全使用限制：提交失败，同一个手机号码发送频率太频繁。<br><br>解决方案：<br>如该限制不符合您的需求，请联系您的专属客服解决。',
		);	
		
		
		return $result;
		
	}
		
}
	
	




