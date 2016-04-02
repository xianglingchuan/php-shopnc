<?php
/**
 * ihuyi有问题请联系382820748
 **/

defined('InShopNC') or exit('Access Invalid!');

class ihuyiControl extends SystemControl{
    private $links = array(
        array('url'=>'act=stat_general&op=general','lang'=>'stat_generalindex'),
        array('url'=>'act=stat_general&op=setting','lang'=>'stat_goodspricerange'),
        array('url'=>'act=stat_general&op=orderprange','lang'=>'stat_orderpricerange')
    );
    public function __construct(){
        parent::__construct();
        Language::read('stat');
        import('function.statistics');
    }
	public function indexOp(){
		
	    $model = Model('ihuyi');
	    
		$ihuyi_user = $model->index();
		if($ihuyi_user){
			Tpl::output('ihuyi',$ihuyi_user);
		}
		
    	Tpl::showpage('ihuyi_index');
	}
	/*账号设置*/
	public function  userSetOp(){
		
		 $model = Model('ihuyi');
		 if($model->boolTable()){ //检查表是否存在
			 
			 //更新账号密码
		if(trim($_POST['user_name'])!="" && trim($_POST['user_password']) !="" ){
				 if($model->updateUser( trim($_POST['user_name']) , trim($_POST['user_password'])  )){
					echo "<script>alert('操作成功!')</script>";
				}
			}
		 }
		 
		$ihuyi = $model->selectUser();//获取账号密码
		
		//include_once('menu.php');
		$sms = new Sms();
		
		$num= $sms->selectNum();
		
		Tpl::output('num',$num);
		 
		Tpl::output('ihuyi',$ihuyi);
		
		Tpl::showpage('ihuyi_user.set');
	}
	
	
	
	
	
	/*短信列表*/
	public function ihuyi_smsOp(){
		$lang	= Language::getLangContent();
		
		$model_ihuyi = Model('ihuyi');
		if (empty($order)) {
		    $order = 'id desc';
		}
		
		$sms = new Sms();

		$result = $sms->help();
		
		
		/*删除*/
		if (!empty($_POST['del_id'])){
				if (is_array($_POST['del_id'])){
					foreach ($_POST['del_id'] as $k => $v){
						$v = intval($v);
						$rs = true;
						if ($rs){
							//删除短信
							$model_ihuyi->del($v);
						}
					}
				}
		}
		
		
		Tpl::output('result',$result);
		$ihuyi_sms_list = $model_ihuyi->getSmsList($condition, '*', 10, $order);		
		Tpl::output('ihuyi_sms_list',$ihuyi_sms_list);
		Tpl::output('page',$model_ihuyi->showpage());
		Tpl::showpage('ihuyi_sms.index');
	}
	
}