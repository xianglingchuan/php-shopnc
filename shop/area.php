<?php
require_once('load.php');

$type = isset($_GET['type'])&&!empty($_GET['type']) ? $_GET['type'] : 'list';

switch($type){
	case 'list':
		$app->action('area','index',(isset($_GET['id'])?intval($_GET['id']):0));
		break;	
	case 'update_region_name':
		$app->action('area','ajax_update_region_name',$_GET);
		break;
	case 'ajax_area_open_op':
		$app->action('area','ajax_area_open_op');
		break;
	default:
		die("没有定义页面");
		break;
}
?>