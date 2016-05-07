<?php
require_once(CLASS_PATH."Recorder.class.php");
require_once(CLASS_PATH."URL.class.php");
//用于连接本机的hash及签章运算服务
class javaComm{
		
  protected $recorder;
  public $urlUtils;
  protected $error;

  function __construct($port){
    $this->recorder = new Recorder();
    $this->urlUtils = new URL();

		$this->recorder->write('equipId',"123456");
		$state = md5(uniqid(rand(), TRUE));
    $this->recorder->write('state',$state);
    $this->recorder->write('javaInitUrl', 'http://localhost:' . $port . '/sdkwrapper/servlet/Init');
    $this->recorder->write('javaLoginUrl', 'http://localhost:' . $port . '/sdkwrapper/servlet/Login');
    $this->recorder->write('javaSignByCode', 'http://localhost:' . $port . '/sdkwrapper/servlet/Signbycode');
    $this->recorder->write('javaSign', 'http://localhost:' . $port . '/sdkwrapper/servlet/Sign');
  }
	
	public function init($project_id, $project_secret, $redirectUrl, $notifyUrl)
	{    
		//-------请求参数列表
    $keysArr = array(
        "projectId" => $project_id,
				"projectSecret" => $project_secret,
				"redirectUrl" => $redirectUrl,
				"notifyUrl" => $notifyUrl
    );		
		
		$response = $this->urlUtils->post($this->recorder->read('javaInitUrl'), $keysArr);
		
		/*echo 'java服务初始化结果：<br>';
		print_r($response);;
		echo '<br>';*/
		
		if(empty($response)){
			return 9999;
		}
		$ret = json_decode($response,TRUE);
		return $ret['errCode'];
	}

	public function projectid_login(){
		$keysArr = array(
        "response_type" => "post",
        "loginType" => "4",
    );
		$response = $this->urlUtils->post($this->recorder->read('javaLoginUrl'), $keysArr);		
		
		/*echo 'java服务项目登录结果：<br>';
		print_r($response);;
		echo '<br>';*/
		
		if(empty($response)){
			return false;
		}
		$ret = json_decode($response,TRUE);
		
		
		
		if($ret['errCode']!= 0){
			return false;
		}
		return true;
  }
  
  public function localSignPDFByCode($code, $srcPdfFile, $dstPdfFile, $seaId, $signType, $posPage, $posX, $posY, $key)
  {
  	if(!empty($key))
  	{
  		$posType = 1;
  	} else {
  		$posType = 0;
  	}
  	
  	$keysArr = array(
  		"code" => $code,
  		"srcPdfFile" => $srcPdfFile,
  		"dstPdfFile" => $dstPdfFile,
			"sealId" => $seaId,
			"signType" => $signType,
			"posType" => $posType,
			"posPage" => $posPage,
			"posX" => $posX,
			"posY" => $posY,
			"key" => $key
		);
		/*echo '本地文件签署（印章通知专用）传参：<br>';
		print_r($keysArr);
		echo '<br>';*/
		
		$response = $this->urlUtils->post($this->recorder->read('javaSignByCode'), $keysArr);
		/*echo '本地文件签署（印章通知专用）结果：<br>';
		echo $response;
		echo '<br>';*/
		
		if(empty($response)){
			return array(
				errCode => 101,
				msg => "网络错误",
				httpRet =>$response,
				errShow => false);
		}
		return json_decode($response,TRUE);
  }
  
  public function localSignPDF($account, $srcPdfFile, $dstPdfFile, $seaId, $signType, $posPage, $posX, $posY, $key)
  {
  	if(!empty($key))
  	{
  		$posType = 1;
  	} else {
  		$posType = 0;
  	}
  	
  	$keysArr = array(
  		"accountId" => $account,
  		"srcPdfFile" => $srcPdfFile,
  		"dstPdfFile" => $dstPdfFile,
			"sealId" => $seaId,
			"signType" => $signType,
			"posType" => $posType,
			"posPage" => $posPage,
			"posX" => $posX,
			"posY" => $posY,
			"key" => $key
		);
		/*echo '本地文件签署（印章通知专用）传参：<br>';
		print_r($keysArr);
		echo '<br>';*/
		
		$response = $this->urlUtils->post($this->recorder->read('javaSign'), $keysArr);
		/*echo '本地文件签署（印章通知专用）结果：<br>';
		echo $response;
		echo '<br>';*/
		
		if(empty($response)){
			return array(
				errCode => 101,
				msg => "网络错误",
				httpRet =>$response,
				errShow => false);
		}
		return json_decode($response,TRUE);
  }
  
}
