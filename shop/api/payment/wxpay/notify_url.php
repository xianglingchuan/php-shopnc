<?php
/**
 * 接收微信支付异步通知回调地址
 *
 * 
 * @copyright  Copyright (c) 2007-2015 ShopNC Inc. (http://www.shopnc.net)
 * @license    http://www.shopnc.net
 * @link       http://www.shopnc.net
 * @since      File available since Release v1.1
 */
error_reporting(7);
$_GET['act']	= 'payment';
$_GET['op']		= 'wxpay_notify';
require_once(dirname(__FILE__).'/../../../index.php');
