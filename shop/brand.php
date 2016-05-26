<?php
require_once("load.php");

if($_POST['action']){
	switch($_POST['action']){
		case 'brand_dels':
			$app->action('brand','ajax_brand_dels',$_POST['ids']);
			break;
		case 'brand_active': 
			 $app->action('brand','ajax_brand_active',$_POST);
			break;
		case 'brand_order':
		    $app->action('brand','ajax_brand_order',$_POST);
			break;
		case 'brand_type_del':
		    $app->action('brand','ajax_brand_type_del',$_POST['id']);
			break;
	}
	exit;
}

$type = isset($_GET['type']) ? $_GET['type'] : "goods_list";

switch($type){
	case 'band_list': 
		$app->action('brand','brand_list');
		break;
	case 'band_info':
		$app->action('brand','brand_info',(isset($_GET['id']) ?  $_GET['id'] : 0));
		break;
	/*case 'band_type': 
		$app->action('brand','band_type_info');
		break;*/
	default:
		$app->action('brand','brand_list');
		break;
	
}
?>