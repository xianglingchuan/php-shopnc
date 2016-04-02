<?php
/**
 * 队列
 *
 *
 *
 *
 * @copyright  Copyright (c) 2007-2014 ShopNC Inc. (http://www.shopnc.net)
 * @license    http://www.shopnc.net
 * @link       http://www.shopnc.net
 * @since      File available since Release v1.1
 */


if (empty($_SERVER['argv'][1])) exit('Access Invalid!');

define('APP_ID','crontab');
define('BASE_PATH',str_replace('\\','/',dirname(__FILE__)));
define('TRANS_MASTER',true);
require __DIR__ . '/../shopnc.php';

if (PHP_SAPI == 'cli') {
    $_GET['act'] = $_SERVER['argv'][1];
    $_GET['op'] = empty($_SERVER['argv'][2]) ? 'index' : $_SERVER['argv'][2];
}

Shopnc\Core::runApplication();
