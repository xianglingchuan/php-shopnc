<?php
require_once(CLASS_PATH."Recorder.class.php");
require_once(CLASS_PATH."URL.class.php");
require_once(CLASS_PATH."javaComm.class.php");
require_once (CLASS_PATH . "MacAddr.class.php");
require_once (CLASS_PATH . "ErrorConstant.class.php");
class eSign{
  const VERSION = "1.0";
  private $ITSM_GETAPIINFO_URL = "http://121.40.164.61:8080/tgmonitor/rest/app!getAPIInfo2";
  //private $ITSM_GETAPIINFO_URL = "http://121.43.159.210:8080/tgmonitor/rest/app!getAPIInfo2";
	private $TECH_SERVICE_PORT = "8080";
	private $project_id;
	private $project_secret;
	private $redirectUrl;
	private $notifyUrl;
	private $token;
	private $devId;
		
  protected $recorder;
  public $urlUtils;
  protected $error;
  protected $javaComm;
  protected $ErrorConstant;

  function __construct(){
  	$this->recorder = new Recorder();
  	$this->urlUtils = new URL();
  	$this->javaComm = new javaComm($this->TECH_SERVICE_PORT);
		$this->macAddr = new GetMacAddr(PHP_OS);
		$this->recorder->write( 'equipId', $this->macAddr->mac_addr );
	
		//-------生成唯一随机串防CSRF攻击
    $state = md5(uniqid(rand(), TRUE));
    $this->recorder->write('state',$state);
    $this->ErrorConstant = new ErrorConstant();
  }
	
	public function init($project_id, $project_secret, $redirectUrl='', $notifyUrl='')
	{
    if(empty($project_id)){
        return $this->ErrorConstant->PROJECT_ID_NULLPOINTER;
    }
    if(empty($project_secret)){
        return $this->ErrorConstant->PROJECT_SECRET_NULLPOINTER;
    }
		$this->redirectUrl = $redirectUrl;
		$this->notifyUrl = $notifyUrl;
			
		if(!empty($this->project_id) && !empty($this->project_secret) 
				&& 0 == strcmp($this->project_id, $project_id) 
				&& 0 == strcmp($this->project_secret, $project_secret))
		{
			return 0;
		}
		$this->project_id = $project_id;
		$this->project_secret = $project_secret;		
		$ret = $this->javaComm->init($project_id, $project_secret, $redirectUrl, $notifyUrl);
		return $this->getUrlListFromSrv();
	}
    
  private function getUrlListFromSrv()
  {
  	//-------请求参数列表
    $keysArr = array(
    	"project_id" => $this->project_id,
      "project_secret" => $this->project_secret,
      "redirectUrl" => $this->redirectUrl,
      "notifyUrl" => $this->notifyUrl,
      "channel" => "phpsdk1.0",
      "version" => "1.0"
    );
		$response = $this->urlUtils->post($this->ITSM_GETAPIINFO_URL, $keysArr);
    //--------检测错误是否发生
    $itsm = json_decode($response);

    if($itsm->errCode != 0){
        echo "eSign init error <br>";
        return (int)$itsm->errCode;
    }
    $this->saveUrlInfo($itsm->https_urls);
    return 0;
  }
  
  private function saveUrlInfo($urlAry)
	{
		$urlCount = count($urlAry);
		for($i = 0; $i < $urlCount; $i++)
		{
			$url = $urlAry[$i];
			
			if(0 == strcmp($url->urlKey, 'loginUrl'))
			{
				$this->recorder->write('loginUrl', $url->urlValue);
			}			
			if(0 == strcmp($url->urlKey, 'createAccountUrl'))
			{
				$this->recorder->write('createAccountUrl', $url->urlValue);
			}			
			if(0 == strcmp($url->urlKey, 'ConvertDocUrl'))
			{
				$this->recorder->write('ConvertDocUrl', $url->urlValue);
			}			
			if(0 == strcmp($url->urlKey, 'saveFileUrl'))
			{
				$this->recorder->write('saveFileUrl', $url->urlValue);
			}						
			if(0 == strcmp($url->urlKey, 'quickSignShowFile'))
			{
				$this->recorder->write('quickSignShowFile', $url->urlValue);
			}			
			if(0 == strcmp($url->urlKey, 'toEsignServerQuickSealUrl'))
			{
				$this->recorder->write('toEsignServerQuickSealUrl', $url->urlValue);
			}
			
			if(0 == strcmp($url->urlKey, 'techGetDocUrlUrl'))
			{
				$this->recorder->write('techGetDocUrlUrl', $url->urlValue);
			}

      if(0 == strcmp($url->urlKey, 'localPdfToImageUrl'))
      {
        $this->recorder->write('localPdfToImageUrl', $url->urlValue);
      } 

      if(0 == strcmp($url->urlKey, 'pdfToImageUrl'))
      {
        $this->recorder->write('pdfToImageUrl', $url->urlValue);
      }

      if(0 == strcmp($url->urlKey, 'getRefAccountInfoUrl'))
      {
        $this->recorder->write('getRefAccountInfoUrl', $url->urlValue);
      } 

      if(0 == strcmp($url->urlKey, 'saveSignedFile'))
      {
        $this->recorder->write('saveSignedFile', $url->urlValue);
      } 

		}
	}
        
	public function projectid_login(){
		$equipId = $this->recorder->read("equipId");
    //-------构造请求参数列表
    $keysArr = array(
  		"project_id" => $this->project_id,
  		"project_secret" => $this->project_secret,			
  		"response_type" => "post",
  		"equipId" => $equipId,
  		"loginType" => "4",
		);
    $login_url = $this->urlUtils->post($this->recorder->read('loginUrl'), $keysArr);
		
		//echo '<br>==============';
		//print_r($login_url);
		//echo '<br>==============';
		$ret_json = json_decode($login_url,TRUE);
		$errCode = $ret_json['errCode'];
		if($errCode == 0)
		{
			$this->token = $ret_json['token'];			
			//$this->recorder->write('token',$this->token);
			$this->devId = $ret_json['accountId'];			
			//echo '登录成功：token--' . $this->token . '<br>';
			$this->javaComm->projectid_login();				
			return true;
		}
		return false;		
  }	
  
  public function addPersonAccount($mobile, $name, $idNo, $email='', $organ='', $title='', $address='',$personarea=0)
  {
    if(empty($mobile)){
        return $this->ErrorConstant->MOBILE_NULLPOINTER;
    }
    if(empty($name)){
        return $this->ErrorConstant->PERSON_NAME_NULLPOINTER;
    }
    if(empty($idNo)){
        return $this->ErrorConstant->PERSON_IDNO_NULLPOINTER;
    }
    $personareaArr=array(0=>"0",1=>"1",2=>"2",3=>"3",4=>"4");

    $personarea=(string)$personarea;
    // echo "string".$personarea.'&nbsp;<br/>';

    if(($personarea!="0"&&empty($personarea))||!in_array($personarea, $personareaArr,true))
    {
      return $this->ErrorConstant->PERSON_AREA_ILLEGAL;
    }
  	$keysArr = array(
  		"token" => $this->token,
  		"equipId" => $this->recorder->read("equipId"),
			"account"=>array(
				"email"=>$email,	//邮箱地址
				"mobile" => $mobile,	//手机号码
				"person" => array
				(
				  "name" => $name,		//真实姓名
				  "idNo" => $idNo,		//身份证号码
				  "organ" => $organ,			//公司
				  "title" => $title,		//职务
				  "address" => $address,		//邮寄地址
           "personArea"=>$personarea //用户归属地
				)
			)
		);
  	list($return_code, $return_content) = $this->urlUtils->http_post_json($this->recorder->read('createAccountUrl'), json_encode($keysArr)); 
  	if($return_code != 200)
  	{
  		return array(
				errCode => 101,
				msg => "网络错误",
				httpError=>$return_code,
				httpRet =>$return_content,
				errShow => false);
  	} 
  	return json_decode($return_content,TRUE);
  }
  
  public function addOrganizeAccount($mobile, $name, $organCode, $email='', $organType=0, $regCode ='', $legalName='',$legalArea=0)
  { 
    if(empty($mobile)){
        return $this->ErrorConstant->MOBILE_NULLPOINTER;
    }
    if(empty($name)){
        return $this->ErrorConstant->ORGANIZE_NAME_NULLPOINTER;
    }
    if(empty($organCode)){
        return $this->ErrorConstant->ORGAN_CODE_NULLPOINTER;
    }
    $personareaArr=array(0=>"0",1=>"1",2=>"2",3=>"3",4=>"4");
    $legalArea=(string)$legalArea;
    if(($legalArea!='0'&&empty($legalArea))||!in_array($legalArea, $personareaArr))
    {
      return $this->ErrorConstant->LEGAL_AREA_INVALIDATE;
    } 	
  	$keysArr = array(
  		"token" => $this->token,
  		"equipId" => $this->recorder->read("equipId"),
			"account"=>array(
				"email"=>$email,	
				"mobile" => $mobile,
				"organize" => array
				(
				  "name" => $name,		
				  "organCode" => $organCode,		
				  "organType" => $organType,			
				  "regCode" => $regCode,		
				  "legalName" => $legalName,
				  "userType" => 1,
				  "legalArea" => $legalArea
				)
			)
		);
  	list($return_code, $return_content) = $this->urlUtils->http_post_json($this->recorder->read('createAccountUrl'), json_encode($keysArr));  
  	if($return_code != 200)
  	{
  		return array(
				errCode => 101,
				msg => "网络错误",
				httpError=>$return_code,
				httpRet =>$return_content,
				errShow => false);
  	}
  	return json_decode($return_content,TRUE);
  }
  public function conv2pdf($docFilePath, $docType='doc')
  {
    if($docFilePath!="0" && empty($docFilePath))
    {
      return $this->ErrorConstant->FILE_NOT_EXIST;
    }
  	$keysArr = array(
  		"token" => $this->token,
  		"equipId" => $this->recorder->read("equipId"),
  		"file" => '@'.$docFilePath,
  		"doctype" => $docType
  	);
  	
  	$response = $this->urlUtils->post($this->recorder->read('ConvertDocUrl'), $keysArr);		
		if(empty($response))
  	{
  		return array(
				errCode => 101,
				msg => "网络错误",
				httpRet =>$response,
				errShow => false);
  	}
  	return json_decode($response,TRUE);
  }

  public function addFileByOssKey($ossKey, $docName)
  {
    if($ossKey!="0"&&empty($ossKey))
    {
        return $this->ErrorConstant->OSS_APPLY_NULLPOINTER;
    }

    if($ossKey!="0"&&empty($docName))
    {
        return $this->ErrorConstant->DOC_NAME_NULLPOINTER;
    }

  	$keysArr = array(
  		"token" => $this->token,
  		"equipId" => $this->recorder->read("equipId"),
  		"docName" => $docName,
  		"docType" => "9",
  		"url" => $ossKey
  	);
  	
  	$response = $this->urlUtils->post($this->recorder->read('saveFileUrl'), $keysArr);
  	if(empty($response))
  	{
  		return array(
				errCode => 101,
				msg => "网络错误",
				httpRet =>$response,
				errShow => false);
  	}
  	return json_decode($response,TRUE); 
  }
  
  public function addFile($docFilePath,$docName)
  {
    if($docFilePath!="0"&&empty($docFilePath))
    {
       return $this->ErrorConstant->FILE_NOT_EXIST;
    }
    if($docName!="0"&&empty($docName))
    {
      return $this->ErrorConstant->DOC_NAME_NULLPOINTER;
    }

  	$keysArr = array(
  		"token" => $this->token,
  		"equipId" => $this->recorder->read("equipId"),
  		"docName" => $docName,
  		"file" => '@'.$docFilePath,
  		"docType" => "9"
  	);
  	$response = $this->urlUtils->post($this->recorder->read('saveFileUrl'), $keysArr);		
		if(empty($response))
  	{
  		return array(
				errCode => 101,
				msg => "网络错误",
				httpRet =>$response,
				errShow => false);
  	}
  	return json_decode($response,TRUE);
  }
  
  public function quickSignPDFPage($customNum, $docId, $authType=1, $sealType=0, $signer='', $signerType=0)
  {
    if($customNum!="0"&&empty($customNum))
    {
       return $this->ErrorConstant->CUSTOMFLAG_NULLPOINTER;
    }
    if($docId!="0"&&empty($docId))
    {
      return $this->ErrorConstant->DOCID_NULLPOINTER;
    }
  	$keysArr = array(
  		"response_type" => "get",
  		"equipId" => $this->recorder->read("equipId"),
  		"signer" => $signer,
  		"docId" => $docId,
  		"signerType" => $signerType,
  		"loginType" => "3",
  		"sealType" => $sealType,
  		"projectId" => $this->project_id,
  		"redirectUrl" => $this->redirectUrl,
  		"notifyUrl" => $this->notifyUrl,
  		"authType" => $authType,
  		"customNum" => $customNum
  	);
  	Header("Location:". $this->recorder->read('quickSignShowFile') . '?esign_json='.json_encode($keysArr));
  }
  
  public function getSealPage($customNum, $authType=1, $sealType=0, $signer='', $signerType=0)
  {
    if($customNum!="0"&&empty($customNum))
    {
       return $this->ErrorConstant->CUSTOMFLAG_NULLPOINTER;
    }
  	$keysArr = array(
  		"equipId" => $this->recorder->read("equipId"),
  		"signer" => $signer,
  		"signerType" => $signerType,
  		"sealType" => $sealType,
  		"projectId" => $this->project_id,
  		"redirectUrl" => $this->redirectUrl,
  		"notifyUrl" => $this->notifyUrl,
  		"authType" => $authType,
  		"customNum" => $customNum
  	);
  	Header("Location:". $this->recorder->read('toEsignServerQuickSealUrl') . '?esign_json='.json_encode($keysArr));
  }
  
  public function localSignPDFByCode($code, $srcPdfFile, $dstPdfFile, $seaId, $signType='1', $posPage, $posX, $posY, $key)
  {
    if($code!="0"&&empty($code))
    {
       return $this->ErrorConstant->ACCOUNT_NULLPOINTER;
    }
    if($srcPdfFile!="0"&&empty($srcPdfFile))
    {
       return $this->ErrorConstant->SING_FILE_NOT_EXISTS;
    }
    if($dstPdfFile!="0"&&empty($dstPdfFile))
    {
       return $this->ErrorConstant->SIGNED_FILE_NOT_EXISTS;
    }
    if($seaId!="0"&&empty($seaId))
    {
       return $this->ErrorConstant->SESEALID_NULLPOINTER;
    }

    if($signType!="0"&&empty($signType))
    {
       return $this->ErrorConstant->SIGNTYPE_NULLPOINTER;
    }

  	return $this->javaComm->localSignPDFByCode($code, $srcPdfFile, $dstPdfFile, $seaId, $signType, $posPage, $posX, $posY, $key);
  }
  
  public function localSignPDF($srcPdfFile,	$dstPdfFile, $seaId, $signType, $posPage, $posX, $posY, $key)
  {
   if($srcPdfFile!="0"&&empty($srcPdfFile))
    {
       return $this->ErrorConstant->SING_FILE_NOT_EXISTS;
    }
    if($dstPdfFile!="0"&&empty($dstPdfFile))
    {
       return $this->ErrorConstant->SIGNED_FILE_NOT_EXISTS;
    }

  	return $this->javaComm->localSignPDF($this->devId, $srcPdfFile, $dstPdfFile, $seaId, $signType, $posPage, $posX, $posY, $key);
  }
    
	public function saveSignedFile ($docFilePath, $docName, $signer)
	{
    if(empty($docFilePath)){
      return $this->ErrorConstant->FILE_NOT_EXIST; 
    }

    if(empty($docName)){
      return $this->ErrorConstant->DOC_NAME_NULLPOINTER; 
    }

    if(empty($signer)){
      return $this->ErrorConstant->SIGNER_NOT_EXISTS; 
    }

		$keysArr = array(
  		"token" => $this->token,
  		"equipId" => $this->recorder->read("equipId"),
			"docName" => $docName,
			"signer" => $signer,
			"file"=> '@'.$docFilePath
		);
//		print_r($keysArr);
//		echo "<br>";
//		echo $this->recorder->read('saveSignedFile');
//		echo "<br>";
  	$response = $this->urlUtils->post($this->recorder->read('saveSignedFile'), $keysArr);
//    echo "string".$response;

  	if(empty($response))
  	{
  		return array(
				errCode => 101,
				msg => "网络错误",
				httpRet =>$response,
				errShow => false);
  	}
  	return json_decode($response,TRUE);
	}
	
	public function getSignedFile ($docId)
	{
		$keysArr = array(
  		"token" => $this->token,
  		"equipId" => $this->recorder->read("equipId"),
			"docId" => $docId
		);
  	list($return_code, $return_content) = $this->urlUtils->http_post_json($this->recorder->read('techGetDocUrlUrl'), json_encode($keysArr));  
  	if($return_code != 200)
  	{
  		return array(
				errCode => 101,
				msg => "网络错误",
				httpError=>$return_code,
				httpRet =>$return_content,
				errShow => false);
  	}
  	return json_decode($return_content,TRUE);
	}
   //返回错误信息
  public function showError($errorMsg)
  {
      return array(
        errCode => 101,
        msg => $errorMsg,
        errShow => false
      );
  }

  //pdf文档转化为图片(本地文件)
  public function localPdf2Image($docFilePath, $pageNum="", $imageSize="max")
  {
    if(empty($docFilePath) ||!file_exists($docFilePath))
    {
        return $this->ErrorConstant->FILE_NOT_EXIST;
    }
    $keysArr=array(
        "token" =>$this->token,
        "equipId"=>$this->recorder->read("equipId"),
        "file"=> '@'.$docFilePath,
        "pageNum"=>$pageNum,
        "imageSize"=>$imageSize);
    $response = $this->urlUtils->post($this->recorder->read('localPdfToImageUrl'), $keysArr);
    if(empty($response))
    {
      return array(
        errCode => 101,
        msg => "网络错误",
        httpRet =>$response,
        errShow => false);
    }
    return json_decode($response,TRUE);
  }

  //pdf文档转化为图片(oss文件)
  public function ossPdf2Image($osskey, $pageNum="", $imageSize="max")
  {
    if(empty($osskey))
    {
        return $this->ErrorConstant->OSS_APPLY_NULLPOINTER;
    }
    $keysArr=array(
        "token" =>$this->token,
        "equipId"=>$this->recorder->read("equipId"),
        "osskey"=> $osskey,
        "pageNum"=>$pageNum,
        "imageSize"=>$imageSize);

    list($return_code, $return_content) = $this->urlUtils->http_post_json($this->recorder->read('pdfToImageUrl'), json_encode($keysArr)); 
    // print_r($keysArr);
    // echo "string<br/>";
    // echo $this->recorder->read('pdfToImageUrl');
    if($return_code != 200)
    {
      return array(
        errCode => 101,
        msg => "网络错误",
        httpError=>$return_code,
        httpRet =>$return_content,
        errShow => false);
    } 
    return json_decode($return_content,TRUE);
  }

  //获取项目关联的用户信息
  public function getAccountInfo($infoId)
  {
      if(empty($infoId)){
        return $this->ErrorConstant->PARAM_NULLPOINTER;
      }
      if(strpos($infoId, '@')==false){
        $mobile=$infoId;
      }else{
        $email=$infoId;
      }

    $keysArr = array(
      "token" => $this->token,
      "equipId" => $this->recorder->read("equipId"),
      "mobile" => $mobile,
      "email" => $email,
    );
    list($return_code, $return_content) = $this->urlUtils->http_post_json($this->recorder->read('getRefAccountInfoUrl'), json_encode($keysArr));  
    if($return_code != 200)
    {
      return array(
        errCode => 101,
        msg => "网络错误",
        httpError=>$return_code,
        httpRet =>$return_content,
        errShow => false);
    }
    else
    {
      $ret = json_decode($return_content,TRUE);
      $type = $ret['type'];
      if($type=="1"){
        $ret['type']="person";
      }else{
        $ret['type']="organize";
      }
      return $ret;
    }
    //return json_decode($return_content,TRUE);
  }
}
