<?php
require_once("load.php");

if($_POST['action']){
	switch($_POST['action']){
		case 'check_cat_name': 
			$app->action('con_default','ajax_check_cat_name',$_POST);
			break;
		case 'delcate':
			$app->action('con_default','ajax_delcate',$_POST['ids']);
			break;
		case 'delarticle':
			$app->action('con_default','ajax_delarticle',$_POST['ids']);
			break;
		case 'activeop': 
			 $app->action('con_default','ajax_active',$_POST);
			break;
		case 'alt_activeop': 
			 $app->action('con_default','ajax_alt_activeop',$_POST);
			break;
		case 'vieworder':
			$app->action('con_default','ajax_vieworder',$_POST); //这里是排序默认系统文章的
			break;
		case 'cate_vieworder':
			$app->action('con_default','ajax_cate_vieworder',$_POST); 
			break;
	}
	exit;
}

$type = isset($_GET['type']) ? $_GET['type'] : "catelist";

switch($type){
	case 'catelist': 
		$app->action('con_default','catelist');
		break;
	case 'cateedit': 
	case 'cateadd':
		$app->action('con_default','cateinfo',$type,(isset($_GET['id']) ?  $_GET['id'] : 0));
		break;
	case 'newlist': 
		$app->action('con_default','newlist');
		break;
	case 'newedit': 
	case 'newadd':
		$app->action('con_default','newinfo',$type,(isset($_GET['id']) ?  $_GET['id'] : 0));
		break;
	default:
		$app->action('con_default','catelist');
		break;
	
		
}
?>