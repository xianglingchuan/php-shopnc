<?php
require_once('load.php');

if($_POST['action']){
	switch($_POST['action']){
		case 'ajaxsetcaijipreg':
			$app->action('caiji','ajaxsetcaijipreg',$_POST);
			break;
	}
	exit;
}
$type = isset($_GET['type'])&&!empty($_GET['type']) ? $_GET['type'] : 'goodslist';
		//$rts = array('kk' => 1,'url'=>'','gcid'=>$type,'maxpage'=>0,'message'=>'ID为空');
		//die(Import::json()->encode($rts));
$app->action('caiji',$type);
?>