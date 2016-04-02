<?php
/**
 *
 *
 * @copyright  Copyright (c) 2007-2013 ShopNC Inc. (http://www.shopnc.net)
 * @license    http://www.shopnc.net
 * @link       http://www.shopnc.net
 * @since      File available since Release v1.1
 */
define('APP_ID','delivery');
define('BASE_PATH',str_replace('\\','/',dirname(__FILE__)));

require __DIR__ . '/../shopnc.php';

define('APP_SITE_URL',DELIVERY_SITE_URL);
define('DELIVERY_TEMPLATES_URL', DELIVERY_SITE_URL.'/templates/'.TPL_DELIVERY_NAME);
define('BASE_DELIVERY_TEMPLATES_URL', dirname(__FILE__).'/templates/'.TPL_DELIVERY_NAME);
define('DELIVERY_RESOURCE_SITE_URL',DELIVERY_SITE_URL.'/resource');

Shopnc\Core::runApplication();
