<?php
/**
 * 商城板块初始化文件
 *
 * 商城板块初始化文件，引用框架初始化文件
 *
 *
 * @copyright  Copyright (c) 2007-2013 ShopNC Inc. (http://www.shopnc.net)
 * @license    http://www.shopnc.net
 * @link       http://www.shopnc.net
 * @since      File available since Release v1.1
 */
define('APP_ID','cms');
define('BASE_PATH',str_replace('\\','/',dirname(__FILE__)));

require __DIR__ . '/../shopnc.php';

define('APP_SITE_URL',CMS_SITE_URL);
define('TPL_NAME',TPL_CMS_NAME);
define('BASE_TPL_PATH',BASE_PATH.'/templates/'.TPL_NAME);

define('CMS_RESOURCE_SITE_URL',CMS_SITE_URL.'/resource');
define('CMS_TEMPLATES_URL',CMS_SITE_URL.'/templates/'.TPL_NAME);
define('CMS_BASE_TPL_PATH',dirname(__FILE__).'/templates/'.TPL_NAME);
define('CMS_SEO_KEYWORD',$config['seo_keywords']);
define('CMS_SEO_DESCRIPTION',$config['seo_description']);
//cms框架扩展
require(BASE_PATH.'/framework/function/function.php');

Shopnc\Core::runApplication();
