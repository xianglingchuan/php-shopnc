<?php
/**
 * 统计管理
 *
 * by shopjl 网店运维技术交流中心 w w w.sho pj l .c om www.shopjl.com 开发
 */
defined('InShopNC') or exit('Access Invalid!');
class ihuyiModel extends Model{
   public  function index(){
	  $result =$this->query("select * from ". $this->getTableName("ihuyi_user")  ) ;
		if(count($result[0])>0){
			
			return 	$result[0];
		}else{
			return false;	
		}
		
	}
	
	
	
	 /**
     * 短信列表
     * @param array $condition
     * @param string $field
     * @param number $page
     * @param string $order
     */
    public function getSmsList($condition = array(), $field = '*', $page = 0, $order = 'id desc', $limit = '') {
	
       return $this->table('ihuyi_sms')->where($condition)->page($page)->order($order)->limit($limit)->select();
    }
	

	/*
		检查数据库表存在否
	*/
	public function boolTable(){
		$bool ="";
		//获取名称
		$result =$this->query("SHOW TABLES LIKE '".trim($this->getTableName("ihuyi_user"),'`')."'");
	
		if(count($result[0])>0){
			$bool =  true;
		}else{
			 $sql1 ="CREATE TABLE ".$this->getTableName("ihuyi_user")." ( `ihuyi_user_name`  varchar(20) NULL , `ihuyi_user_password`  varchar(36) NULL  ) ;"; 
			 if($this->execute($sql1) ) {
					$bool =  true;
			 }else{
			 	 echo '创建表ihuyi_user失败，请检查数据库账号权限';
				 $bool =  false;
			 }	
		}
		
		
		
		//获取名称
		$result =$this->query("SHOW TABLES LIKE '".trim($this->getTableName("ihuyi_sms"),'`')."'");
	
		if(count($result[0])>0){
			
		}else{
			 $sql1 ="CREATE TABLE ".$this->getTableName("ihuyi_sms")." (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `todate` varchar(20) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `return_code` int(11) DEFAULT NULL,
  `return_content` varchar(100) DEFAULT NULL,
  `session_user` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
)"; 

			 if($this->execute($sql1) ) {
			  //echo '成功';
			 }else{
			 	 echo '创建表ihuyi_sms失败，请检查数据库账号权限';
			 }	
		}
			
		return $bool ;

	}
	
	
	
	/*更新账号信息*/
	public function updateUser($ihuyi_name,$ihuyi_password){
		$result =$this->query("select * from ". $this->getTableName("ihuyi_user")  ) ;
		if(count($result[0])>0){
			$this->execute("update ".$this->getTableName("ihuyi_user")." set ihuyi_user_name='".$ihuyi_name."' , ihuyi_user_password = '".$ihuyi_password."'");
			return true;
		}else{
			$this->execute("insert into ".$this->getTableName("ihuyi_user")." (ihuyi_user_name,ihuyi_user_password) VALUES('".$ihuyi_name."','".$ihuyi_password."')");
			return true;
		}
	}
	
	/*获取账号密码*/
	public function selectUser(){
		
		$result =$this->query("select * from ". $this->getTableName("ihuyi_user")  ) ;
		return $result[0];
			
	}
	
	
	
	
	
	/*保存短信*/
	public function insertSms($mobile,$content,$date,$sess){
		
	
		$this->execute("INSERT INTO ".$this->getTableName("ihuyi_sms")."(content , mobile,todate,SESSION_user) VALUES ('".$content."', '".$mobile."','".$date."','".$sess."');");
		
		return $this->getLastId();
		
		
	}

	/*获取短信-更新内容*/
	public function updateSms($msm_id,$code,$msg,$smsid){
		
	
		$this->execute("update ".$this->getTableName("ihuyi_sms")." set return_id =".$smsid." ,  return_code=".$code." , return_content='".$msg."' where id =".$msm_id);
		
		return true;
		
		
	}
	
	
	
		/**
	 * 删除会员
	 *
	 * @param int $id 记录ID
	 * @return array $rs_row 返回数组形式的查询结果
	 */
	public function del($id){
		if (intval($id) > 0){
			$where = " id = '". intval($id) ."'";
			$result = Db::delete('ihuyi_sms',$where);
			return $result;
		}else {
			return false;
		}
	}
}