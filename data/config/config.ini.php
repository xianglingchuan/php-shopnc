<?php
// defined('InShopNC') or exit('Access Invalid!');

$config = array();
$config['shop_site_url']        = 'http://localhost/coalold/shop';
$config['cms_site_url']         = 'http://localhost/coalold/cms';
$config['microshop_site_url']   = 'http://localhost/coalold/microshop';
$config['circle_site_url']      = 'http://localhost/coalold/circle';
$config['admin_site_url']       = 'http://localhost/coalold/_admin';
$config['mobile_site_url']      = 'http://localhost/coalold/mobile';
$config['wap_site_url']         = 'http://localhost/coalold/wap';
$config['chat_site_url']        = 'http://localhost/coalold/chat';
$config['node_site_url']        = 'http://123.57.67.81:8090';
$config['delivery_site_url']    = 'http://localhost/coalold/delivery';
$config['upload_site_url']      = 'http://localhost/coalold/data/upload';
$config['resource_site_url']    = 'http://localhost/coalold/data/resource';
$config['version']              = '201408206680';
$config['setup_date']           = '2015-04-21 13:52:45';
$config['gip']                  = 0;
$config['dbdriver']             = 'mysqli';
$config['tablepre']             = 'shopnc_';
$config['db']['master']['dbhost']       = '127.0.0.1';
$config['db']['master']['dbport']       = '3306';
$config['db']['master']['dbuser']       = 'root';
$config['db']['master']['dbpwd']        = '111111';
$config['db']['master']['dbname']       = 'shop';
$config['db']['master']['dbcharset']    = 'UTF-8';
$config['db']['slave']                  = $config['db']['master'];
$config['session_expire'] 	= 3600;
$config['lang_type'] 		= 'zh_cn';
$config['cookie_pre'] 		= '59C3_';
$config['thumb']['cut_type'] = 'gd';
$config['thumb']['impath'] = '';
$config['cache_open'] = false;
$config['redis']['prefix']      	= 'nc_';
$config['redis']['master']['port']     	= 6379;
$config['redis']['master']['host']     	= '127.0.0.1';
$config['redis']['master']['pconnect'] 	= 0;
//$config['redis']['slave']      	    = array();
$config['fullindexer']['open']      = true;
$config['fullindexer']['appname']   = 'shopnc';
$config['debug'] 			=false;
$config['url_model'] = true;
$config['subdomain_suffix'] = '';
//$config['session_type'] = 'redis';
//$config['session_save_path'] = 'tcp://127.0.0.1:6379';
$config['node_chat'] = true;
//流量记录表数量，为1~10之间的数字，默认为3，数字设置完成后请不要轻易修改，否则可能造成流量统计功能数据错误
$config['flowstat_tablenum'] = 3;
$config['sms']['gwUrl'] = 'http://sdk4report.eucp.b2m.cn:8080/sdk/SDKService';
$config['sms']['serialNumber'] = '';
$config['sms']['password'] = '';
$config['sms']['sessionKey'] = '';
$config['queue']['open'] = false;
$config['queue']['host'] = '127.0.0.1';
$config['queue']['port'] = 6379;
return $config;
