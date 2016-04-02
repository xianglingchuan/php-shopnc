<?php
/**
 * 手机端下载地址
 *
 *
 *
 *
 * @copyright  Copyright (c) 2007-2013 ShopNC Inc. (http://www.shopnc.net)
 * @license    http://www.shopnc.net
 * @link       http://www.shopnc.net
 * @since      File available since Release v1.1
 */
use Shopnc\Tpl;


defined('InShopNC') or exit('Access Invalid!');
class mb_appControl extends BaseHomeControl {
    public function __construct() {
        parent::__construct();
    }
	/**
	 * 下载地址
	 *
	 */
    public function indexOp() {
		$mobilebrowser_list ='iphone|ipad';
		if(preg_match("/$mobilebrowser_list/i", $_SERVER['HTTP_USER_AGENT'])) {
		    @header('Location: '.C('mobile_ios'));exit;
        } else {
            @header('Location: '.C('mobile_apk'));exit;
        }
    }
}
