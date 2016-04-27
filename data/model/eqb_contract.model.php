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

class eqb_contractModel extends Model {

    
    /**
     * 是否同意签署文件的状态以衣文件签署到那一步的状态 
     */
    const STATUS_DEFAULT_KEY = "0";
    const STATUS_DEFAULT_VALUE = "默认";
    const STATUS_AGREE_KEY = "1";
    const STATUS_AGREE_VALUE = "同意签署";
    const STATUS_REJECT_KEY = "2";
    const STATUS_REJECT_VALUE = "拒绝签署";
    const STATUS_PERSON_SUCCESS_KEY = "3";
    const STATUS_PERSON_SUCCESS_VALUE = "个人签署成功";
    const STATUS_PERSON_FAIL_KEY = "4";
    const STATUS_PERSON_FAIL_VALUE = "个人签署失败";
    const STATUS_STORE_SUCCESS_KEY = "5";
    const STATUS_STORE_SUCCESS_VALUE = "企业签署成功";
    const STATUS_STORE_FAIL_KEY = "6";
    const STATUS_STORE_FAIL_VALUE = "企业签署失败";
    const STATUS_BOTH_SUCCESS_KEY = "7";
    const STATUS_BOTH_SUCCESS_VALUE = "双方签署完成";

    
    /**
     * 个人用户签署合同状态 
     */
    const MEMBER_SIGNED_STATUS_WAIT_KEY = "0";
    const MEMBER_SIGNED_STATUS_WAIT_VALUE = "等待";
    const MEMBER_SIGNED_STATUS_SUCCESS_KEY = "1";
    const MEMBER_SIGNED_STATUS_SUCCESS_VALUE = "已签署";
    const MEMBER_SIGNED_STATUS_FAIL_KEY = "2";
    const MEMBER_SIGNED_STATUS_FAIL_VALUE = "签署失败"; 
    
    
    /**
     * 企业用户签署合同状态 
     */    
    const STORE_SIGNED_STATUS_WAIT_KEY = "0";
    const STORE_SIGNED_STATUS_WAIT_VALUE = "等待";
    const STORE_SIGNED_STATUS_SUCCESS_KEY = "1";
    const STORE_SIGNED_STATUS_SUCCESS_VALUE = "已签署";
    const STORE_SIGNED_STATUS_FAIL_KEY = "2";
    const STORE_SIGNED_STATUS_FAIL_VALUE = "签署失败";     
    
    
    public function __construct() {
        parent::__construct('eqb_contract');
    }
    
    
    /**
     * 获取煤企信息列表 
     */ 
    public function getStoreList(){
        return  $this->table('store')->field("store_id, store_name, member_id, member_name, seller_name")->select();
    }
    

    /**
     * 获取煤企信息 
     */ 
    public function getStoreInfo($storeId){
        return  $this->table('store')->field("store_id, store_name, member_id, member_name, seller_name")->where("store_id='{$storeId}'")->find();
    }    
    
    
    /**
     * 添加合同信息 
     */ 
    public function add($data){
        return $this->table('eqb_contract')->insert($data);
    }
    
    
    /**
     * 普通用户添加合同信息 
     */ 
    public function memberAdd($data){
        $data['createuid'] = $data['member_id'];
        $data['createdate'] = date("Y-m-d H:i:s",time());
        $data['create_store_id'] = 0;
        $data['modifyuid'] = $data['member_id'];
        $data['modifydate'] = date("Y-m-d H:i:s",time());
        return $this->add($data);
    }

    
    
}
