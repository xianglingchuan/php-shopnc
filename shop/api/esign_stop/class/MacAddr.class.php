<?php 
  /** 
  获取网卡的MAC地址原码；目前支持WIN/LINUX系统 
  获取机器网卡的物理（MAC）地址 
  **/ 
       
  class GetMacAddr{          
    var $return_array = array(); // 返回带有MAC地址的字串数组 
    var $mac_addr; 
 
    function GetMacAddr($os_type){ 
         switch ( strtolower($os_type) ){ 
                  case "linux": 
                            $this->forLinux(); 
                            break; 
                  case "solaris": 
                            break; 
                  case "unix": 
                             break; 
                   case "aix": 
                             break; 
                   default: 
                         $this->forWindows(); 
                         break;  
          } 
  
             
          $temp_array = array(); 
          foreach ( $this->return_array as $value ){ 
  
                    if ( 
preg_match("/[0-9a-f][0-9a-f][:-]"."[0-9a-f][0-9a-f][:-]"."[0-9a-f][0-9a-f][:-]"."[0-9a-f][0-9a-f][:-]"."[0-9a-f][0-9a-f][:-]"."[0-9a-f][0-9a-f]/i",$value, 
$temp_array ) ){ 
                             $this->mac_addr = $temp_array[0]; 
                             break; 
                   } 
  
          }
          $rand = $this->randStr();
          $this->mac_addr = $this->mac_addr . '-' . $rand;
          unset($temp_array); 
          return $this->mac_addr; 
     } 
     
     function randStr($m = 6) {
		  $new_str = '';
		  $str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwsyz0123456789';
		  $max=strlen($str)-1;
		  for ($i = 1; $i <= $m; ++$i) {
		    $new_str .=$str[mt_rand(0, $max)];
		  }
		  return $new_str;
		}

  
  
     function forWindows(){ 
          @exec("ipconfig /all", $this->return_array); 
          if ( $this->return_array ) 
                   return $this->return_array; 
          else{ 
                   $ipconfig = $_SERVER["WINDIR"]."\system32\ipconfig.exe"; 
                   if ( is_file($ipconfig) ) 
                      @exec($ipconfig." /all", $this->return_array); 
                   else 
                      @exec($_SERVER["WINDIR"]."\system\ipconfig.exe /all", $this->return_array); 
                   return $this->return_array; 
          } 
     } 
  
  
  
     function forLinux(){ 
          @exec("ifconfig -a", $this->return_array); 
          return $this->return_array; 
     } 
        
  } 
?>
