<?php
require_once("load.php");

if($_POST['action']){
	switch($_POST['action']){
		case 'check_cat_name': 
			$app->action('con_new','ajax_check_cat_name',$_POST);
			break;
		case 'delcate':
			$app->action('con_new','ajax_delcate',$_POST['ids']);
			break;
		case 'delarticle':
			$app->action('con_new','ajax_delarticle',$_POST['ids']);
			break;
		case 'activeop': 
			 $app->action('con_new','ajax_active',$_POST);
			break;
		case 'alt_activeop': 
			 $app->action('con_new','ajax_alt_activeop',$_POST);
			break;
		case 'vieworder':
		    $app->action('con_new','ajax_vieworder',$_POST);
			break;
		case 'oauthadd':
		    $app->action('con_new','ajax_oauthadd',$_POST);
			break;
		case 'oauthedit':
		    $app->action('con_new','ajax_oauthedit',$_POST);
			break;
		case 'oauthdel':
		    $app->action('con_new','ajax_oauthdel',$_POST);
			break;
	}
	exit;
}

$type = isset($_GET['type']) ? $_GET['type'] : "catelist";

switch($type){
	case 'catelist': 
		$app->action('con_new','catelist');
		break;
	case 'cateedit': 
	case 'cateadd':
		$app->action('con_new','cateinfo',$type,(isset($_GET['id']) ?  $_GET['id'] : 0));
		break;
	case 'newlist': 
		$app->action('con_new','newlist');
		break;
	case 'newedit': 
	case 'newadd':
		$app->action('con_new','newinfo',$type,(isset($_GET['id']) ?  $_GET['id'] : 0));
		break;
	default:
		$app->action('con_new','catelist');
		break;
	
		
}
?>