<?php
require_once('load.php');

//ajax处理
if(isset($_POST['action'])){ 
	switch($_POST['action']){
		case 'backdb':
			$app->action('database','ajax_backup',$_POST['type'],$_POST['tables']);
			break;
		case 'backdb_test':
			$app->action('database','ajax_dumpsql',$_POST);
			break;
		case 'deldb':
			$app->action('database','ajax_deldbfile',$_POST['filename']);
			break;
		case 'importdb':
			$app->action('database','ajax_restoredb',$_POST['filename']);
			break;
		case 'youhuadb':
			$app->action('database','ajax_run_optimize');
			break;
	}
	exit;
}


if(isset($_GET['type'])) $type = $_GET['type'];
if(!isset($_GET['type']) || empty($type)) $type = 'backdb';

switch($type){
	case 'backdb':
		$app->action('database','backdb');
		break;
	case 'restoredb':
		$app->action('database','restoredblist');
		break;
	case 'youhua':
		$app->action('database','youhuadb');
		break;
	case 'backdb_test':
		$app->action('database','backdb_test');
		break;
	
	default:
		$app->action('database','backdb');
		break;
}

?>