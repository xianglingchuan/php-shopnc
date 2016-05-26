<?php
require_once("load.php");

if($_POST['action']){
	switch($_POST['action']){
		case 'check_cat_name': 
			$app->action('con_notice','ajax_check_cat_name',$_POST);
			break;
		case 'delcate':
			$app->action('con_notice','ajax_delcate',$_POST['ids']);
			break;
		case 'delarticle':
			$app->action('con_notice','ajax_delarticle',$_POST['ids']);
			break;
		case 'activeop': 
			 $app->action('con_notice','ajax_active',$_POST);
			break;
		case 'alt_activeop': 
			 $app->action('con_notice','ajax_alt_activeop',$_POST);
			break;
		default:
		    die('非法操作！');
	}
	exit;
}

$type = isset($_GET['type']) ? $_GET['type'] : "catelist";

switch($type){
	case 'catelist': 
		$app->action('con_notice','catelist');
		break;
	case 'cateedit': 
	case 'cateadd':
		$app->action('con_notice','cateinfo',$type,(isset($_GET['id']) ?  $_GET['id'] : 0));
		break;
	case 'newlist': 
		$app->action('con_notice','newlist');
		break;
	case 'newedit': 
	case 'newadd':
		$app->action('con_notice','newinfo',$type,(isset($_GET['id']) ?  $_GET['id'] : 0));
		break;
	default:
		$app->action('con_notice','catelist');
		break;
	
		
}
?>