<?php
require_once("load.php");

if($_POST['action']){
	switch($_POST['action']){
		case 'check_cat_name': 
			$app->action('con_website','ajax_check_cat_name',$_POST);
			break;
		case 'delcate':
			$app->action('con_website','ajax_delcate',$_POST['ids']);
			break;
		case 'delarticle':
			$app->action('con_website','ajax_delarticle',$_POST['ids']);
			break;
		case 'activeop': 
			 $app->action('con_website','ajax_active',$_POST);
			break;
		case 'alt_activeop': 
			 $app->action('con_website','ajax_alt_activeop',$_POST);
			break;
		case 'vieworder':
		    $app->action('con_case','ajax_vieworder',$_POST);
			break;
		default:
		    die('非法操作！');
	}
	exit;
}

$type = isset($_GET['type']) ? $_GET['type'] : "catelist";

switch($type){
	case 'catelist': 
		$app->action('con_website','catelist');
		break;
	case 'cateedit': 
	case 'cateadd':
		$app->action('con_website','cateinfo',$type,(isset($_GET['id']) ?  $_GET['id'] : 0));
		break;
	case 'newlist': 
		$app->action('con_website','newlist');
		break;
	case 'newedit': 
	case 'newadd':
		$app->action('con_website','newinfo',$type,(isset($_GET['id']) ?  $_GET['id'] : 0));
		break;
	default:
		$app->action('con_website','catelist');
		break;
	
		
}
?>