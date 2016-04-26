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

class eqb_logModel extends Model {

    /**
     * 是否同意签署文件的状态以衣文件签署到那一步的状态 
     */
    const TYPE_DB_KEY = "1";
    const TYPE_DB_VALUE = "本地数据操作";
    const TYPE_REQUEST_EQB_KEY = "2";
    const TYPE_REQUEST_EQB_VALUE = "请求e签保操作";
    const TYPE_RESPONSE_EQB_KEY = "3";
    const TYPE_RESPONSE_EQB_VALUE = "e签保回调操作";

    public function __construct() {
        parent::__construct();
    }
    
    
    /**
     * 添加日志
     */
    private function _add($data){
        $data['createdate'] = date("Y-m-d H:i:s",time());
        return $this->table('eqb_log')->insert($data);
    }
    
    
    /**
     * 添加日志
     */
    public function add($type, $memberId, $storeId, $title, $description, $data, $userId){
        $data = array("type"=>$type, "member_id"=>$memberId, "store_id"=>$storeId, "title"=>$title, "description"=>$description,
                      "data"=>$data, "createuid"=>$userId);
        return $this->add($data);
    }     
}
