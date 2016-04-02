<?php
/**
 * 初始化文件
 *
 *
 *
 * @copyright  Copyright (c) 2007-2013 ShopNC Inc. (http://www.shopnc.net)
 * @license    http://www.shopnc.net
 * @link       http://www.shopnc.net
 * @since      File available since Release v1.1
 */
define('APP_ID','chat');
define('BASE_PATH',str_replace('\\','/',dirname(__FILE__)));

require __DIR__ . '/../shopnc.php';

define('APP_SITE_URL',CHAT_SITE_URL);
//@include(BASE_PATH.'/config/config.ini.php');

Shopnc\Core::runApplication();
