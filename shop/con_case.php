<?php
require_once("load.php");

//ajax处理操作
if($_POST['action']){
	switch($_POST['action']){
		case 'check_cat_name': 
			$app->action('con_case','ajax_check_cat_name',$_POST);
			break;
		case 'check_color_cat_name': 
			$app->action('con_case','ajax_check_color_cat_name',$_POST);
			break;
		case 'delcate':
			$app->action('con_case','ajax_delcate',$_POST['ids']);
			break;
		case 'delcate_color': //删除颜色列表
			$app->action('con_case','ajax_delcate_color',$_POST['ids']);
			break;
		case 'delarticle':
			$app->action('con_case','ajax_delarticle',$_POST['ids']);
			break;
		case 'activeop': 
			 $app->action('con_case','ajax_active',$_POST);
			break;
		case 'alt_activeop': 
			 $app->action('con_case','ajax_alt_activeop',$_POST);
			break;
		case 'vieworder':
		    $app->action('con_case','ajax_vieworder',$_POST);
			break;
		case 'vieworder_color': //颜色分类的排序
		    $app->action('con_case','ajax_vieworder_color',$_POST);
			break;
		default:
		    die('非法操作！');
	}
	exit;
}

$type = isset($_GET['type']) ? $_GET['type'] : "catelist";

switch($type){
	case 'catelist': 
		$app->action('con_case','catelist');
		break;
	case 'cateedit': 
	case 'cateadd':
		$app->action('con_case','cateinfo',$type,(isset($_GET['id']) ?  $_GET['id'] : 0));
		break;
	case 'newlist': 
		$app->action('con_case','newlist');
		break;
	case 'newedit': 
	case 'newadd':
		$app->action('con_case','newinfo',$type,(isset($_GET['id']) ?  $_GET['id'] : 0));
		break;
	case 'colorlist': //颜色分类
		$app->action('con_case','colorlist');
		break;
	case 'colorinfo': 
		$app->action('con_case','colorinfo',(isset($_GET['id']) ?  $_GET['id'] : 0));
		break;
	default:
		$app->action('con_case','catelist');
		break;
	
		
}
?>