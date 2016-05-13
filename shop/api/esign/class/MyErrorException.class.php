<?php
   header("Content-type: text/html; charset=utf-8"); 
  /** 
  异常信息 
  **/ 
class MyErrorException
{
   private $errCode;//错误码
   private $errMsg;//错误消息
  //构造函数
  function __construct($errCode,$errMsg)
  {
    $this->errCode = $errCode;
    $this->errMsg=$errMsg;
  }

  //格式化输出json字符串
  function __tostring(){//在类中定义一个__toString方法
      $array=array(
        errCode => $this->errCode,
        msg => $this->errMsg,
        errShow => true
      ); 
      $result=json_encode($array);
      return preg_replace("#\\\u([0-9a-f]+)#ie", "iconv('UCS-2', 'UTF-8', pack('H4', '\\1'))", $result);  
  }
}
?>