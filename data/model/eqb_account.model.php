<?php
/**
 * Circle Level
 *
 * 
 *
 *
 * @copyright  Copyright (c) 2007-2013 ShopNC Inc. (http://www.shopnc.net)
 * @license    http://www.shopnc.net
 * @link       http://www.shopnc.net
 * @since      File available since Release v1.1
 */
defined('InShopNC') or exit('Access Invalid!');

class eqb_accountModel extends Model {
    
    
    /**
     * 帐户类型 
     */
    const TYPE_PERSON_KEY = "0";
    const TYPE_PERSON_VALUE = "个人";
    const TYPE_STORE_KEY = "1";
    const TYPE_STORE_KEY = "企业";
    
    
    
    public function __construct() {
        parent::__construct();
    }

}
