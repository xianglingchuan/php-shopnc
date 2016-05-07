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
    const STATUS_DEFAULT_VALUE = "等待签置";
    const STATUS_AGREE_KEY = "1";
    const STATUS_AGREE_VALUE = "同意签署";
    const STATUS_REJECT_KEY = "2";
    const STATUS_REJECT_VALUE = "退回签署";
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
    const STATUS_CLOSE_KEY = "8";
    const STATUS_CLOSE_VALUE = "关闭";
    
    
    private function _getStatus(){
        return array(
            self::STATUS_DEFAULT_KEY => self::STATUS_DEFAULT_VALUE,
            self::STATUS_AGREE_KEY=> self::STATUS_AGREE_VALUE,
            self::STATUS_REJECT_KEY => self::STATUS_REJECT_VALUE,
            self::STATUS_PERSON_SUCCESS_KEY => self::STATUS_PERSON_SUCCESS_VALUE,
            self::STATUS_PERSON_FAIL_KEY => self::STATUS_PERSON_FAIL_VALUE,
            self::STATUS_STORE_SUCCESS_KEY => self::STATUS_STORE_SUCCESS_VALUE,
            self::STATUS_STORE_FAIL_KEY => self::STATUS_STORE_FAIL_VALUE,
            self::STATUS_BOTH_SUCCESS_KEY => self::STATUS_BOTH_SUCCESS_VALUE,
            self::STATUS_CLOSE_KEY => self::STATUS_CLOSE_VALUE
        );
    }
    
    public function getStatusByKey($key){
        $values = $this->_getStatus();
        if(isset($values[$key])){
            return $values[$key];
        }else{
            return "";
        }        
    }

    
    /**
     * 个人用户签署合同状态 
     */
    const MEMBER_SIGNED_STATUS_WAIT_KEY = "0";
    const MEMBER_SIGNED_STATUS_WAIT_VALUE = "等待签署";
    const MEMBER_SIGNED_STATUS_SUCCESS_KEY = "1";
    const MEMBER_SIGNED_STATUS_SUCCESS_VALUE = "已签署";
    const MEMBER_SIGNED_STATUS_FAIL_KEY = "2";
    const MEMBER_SIGNED_STATUS_FAIL_VALUE = "签署失败";
    
    private function _getMemberSignedStatus(){
        return array(
            self::MEMBER_SIGNED_STATUS_WAIT_KEY => self::MEMBER_SIGNED_STATUS_WAIT_VALUE,
            self::MEMBER_SIGNED_STATUS_SUCCESS_KEY => self::MEMBER_SIGNED_STATUS_SUCCESS_VALUE,
            self::MEMBER_SIGNED_STATUS_FAIL_KEY => self::MEMBER_SIGNED_STATUS_FAIL_VALUE
        );
    }
    
    public function getMemberSignedStatusByKey($key){
        $values = $this->_getMemberSignedStatus();
        if(isset($values[$key])){
            return $values[$key];
        }else{
            return "";
        }   
    }
    
    
    
    /**
     * 企业用户签署合同状态 
     */    
    const STORE_SIGNED_STATUS_WAIT_KEY = "0";
    const STORE_SIGNED_STATUS_WAIT_VALUE = "等待签署";
    const STORE_SIGNED_STATUS_SUCCESS_KEY = "1";
    const STORE_SIGNED_STATUS_SUCCESS_VALUE = "已签署";
    const STORE_SIGNED_STATUS_FAIL_KEY = "2";
    const STORE_SIGNED_STATUS_FAIL_VALUE = "签署失败";     
    
    
    private function _getStoreSignedStatus(){
        return array(
            self::STORE_SIGNED_STATUS_WAIT_KEY => self::STORE_SIGNED_STATUS_WAIT_VALUE,
            self::STORE_SIGNED_STATUS_SUCCESS_KEY => self::STORE_SIGNED_STATUS_SUCCESS_VALUE,
            self::STORE_SIGNED_STATUS_FAIL_KEY => self::STORE_SIGNED_STATUS_FAIL_VALUE
        );
    }
    
    public function getStoreSignedStatusByKey($key){
        $values = $this->_getStoreSignedStatus();
        if(isset($values[$key])){
            return $values[$key];
        }else{
            return "";
        }   
    }    
    
    
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
     * 修改信息 
     */ 
    public function myUpdate($where, $data){
        return $this->table('eqb_contract')->where($where)->update($data);
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
    
    
    /**
     * 普通用户添加合同信息 
     */ 
    public function storeAdd($data){
        $data['createuid'] = $data['store_member_id'];
        $data['createdate'] = date("Y-m-d H:i:s",time());
        $data['create_store_id'] = $data['store_id'];
        $data['modifyuid'] = $data['store_member_id'];
        $data['modifydate'] = date("Y-m-d H:i:s",time());
        return $this->add($data);
    }    
    

    /**
     * 获取合同并且展示分类内容
     *
     * @param unknown_type $condition
     * @param unknown_type $pagesize
     * @param unknown_type $filed
     * @param unknown_type $order
     * @param string $key  以哪个字段作为下标,这里一般指pay_id
     * @return unknown
     */
    public function getList($condition, $pagesize = '', $filed = '*', $order = '') {
        $list =  $this->table('eqb_contract,member,store')
                    ->join("inner,inner")
                    ->on("member.member_id=eqb_contract.member_id,store.store_id=eqb_contract.store_id")
                    ->field($filed)->where($condition)->order($order)->page($pagesize)->select();
        if(!empty($list)){
            foreach ($list as &$buf){
                $buf['status_name'] = $this->getStatusByKey($buf['status']);
                $buf['member_signed_status_name'] = $this->getMemberSignedStatusByKey($buf['member_signed_status']);
                $buf['store_signed_status_name'] = $this->getMemberSignedStatusByKey($buf['store_signed_status']);
            }
        }
        return $list;
    }    
    
    
    /**
     * 获取单条记录 
     */ 
    public function getInfo($where){
        return  $this->table('eqb_contract')->field("*")->where($where)->find();
    }      
    
    /**
     * 关闭合同 
     */ 
    public function close($id, $memberId){
        $data = array("status"=>self::STATUS_CLOSE_KEY, "modifyuid"=>$memberId, "modifydate"=>date("Y-m-d H:i:s",time()));
        return $this->myUpdate(" id='{$id}' ", $data);
    }
    
    /**
     * 退回合同 
     */ 
    public function sendback($id, $memberId){
        $data = array("status"=>self::STATUS_REJECT_KEY, "modifyuid"=>$memberId, "modifydate"=>date("Y-m-d H:i:s",time()));
        return $this->myUpdate(" id='{$id}' ", $data);
    }
 

    
    /**
     * 统计信息 
     */ 
    public function getStatistics($memberId){
        //待我签署的合同
        $waitemWhere = "shopnc_eqb_contract.member_id='".$memberId."' AND shopnc_eqb_contract.member_signed_status IN(".eqb_contractModel::MEMBER_SIGNED_STATUS_WAIT_KEY.",".eqb_contractModel::MEMBER_SIGNED_STATUS_FAIL_KEY.") "
                   . "AND shopnc_eqb_contract.status NOT IN(".eqb_contractModel::STATUS_REJECT_KEY.", ".eqb_contractModel::STATUS_BOTH_SUCCESS_KEY.", ".eqb_contractModel::STATUS_CLOSE_KEY.")";
        //待他们签署的合同
        $waitothersWhere = "shopnc_eqb_contract.member_id='".$memberId."' AND shopnc_eqb_contract.store_signed_status IN(".eqb_contractModel::STORE_SIGNED_STATUS_WAIT_KEY.",".eqb_contractModel::STORE_SIGNED_STATUS_FAIL_KEY.") "
                        . "AND shopnc_eqb_contract.status NOT IN(".eqb_contractModel::STATUS_REJECT_KEY.", ".eqb_contractModel::STATUS_BOTH_SUCCESS_KEY.", ".eqb_contractModel::STATUS_CLOSE_KEY.")";
        //已签署完成
        $bothsuccessWhere = "shopnc_eqb_contract.member_id='".$memberId."' AND shopnc_eqb_contract.store_signed_status='".eqb_contractModel::STORE_SIGNED_STATUS_SUCCESS_KEY."' AND shopnc_eqb_contract.member_signed_status='".eqb_contractModel::MEMBER_SIGNED_STATUS_SUCCESS_KEY."' "
                   . "AND shopnc_eqb_contract.status='".eqb_contractModel::STATUS_BOTH_SUCCESS_KEY."' ";
        //退回的文件
        $returnWhere = " shopnc_eqb_contract.status='".eqb_contractModel::STATUS_REJECT_KEY."' AND shopnc_eqb_contract.createuid='".$memberId."' ";
        //关闭的文件
        $closeWhere = " shopnc_eqb_contract.status='".eqb_contractModel::STATUS_CLOSE_KEY."' AND shopnc_eqb_contract.createuid='".$memberId."' ";
        
        $sql = "select (select count(*) from shopnc_eqb_contract WHERE {$waitemWhere}) as waitmeCount, "
              . " (select count(*) from shopnc_eqb_contract WHERE {$waitothersWhere}) as waitothersCount, "
              . " (select count(*) from shopnc_eqb_contract WHERE {$bothsuccessWhere}) as bothsuccessCount,  "
              . " (select count(*) from shopnc_eqb_contract WHERE {$returnWhere}) as returnCount,  "
              . " (select count(*) from shopnc_eqb_contract WHERE {$closeWhere}) as closeCount";
      return Model()->query($sql);
    }    
    
    
    /**
     * 获取单条合同详细内容
     */ 
    public function getDetailInfo($where){
        $info =   $this->table('eqb_contract,member,store')->field("eqb_contract.*, member.member_name, store.store_name")
                       ->join("inner,inner")
                       ->on("member.member_id=eqb_contract.member_id,store.store_id=eqb_contract.store_id")
                       ->where($where)->find();
        if(!empty($info)){
                $info['status_name'] = $this->getStatusByKey($info['status']);
                $info['member_signed_status_name'] = $this->getMemberSignedStatusByKey($info['member_signed_status']);
                $info['store_signed_status_name'] = $this->getMemberSignedStatusByKey($info['store_signed_status']);
        }
        return $info;
    }     
    
    
    /**
     * 获取煤企信息列表 
     */ 
    public function getMemberCompanyList(){
        return  $this->table('member')->where("member_type='".memberModel::TYPE_COMPANY_KEY."'")->field("member_id, member_name")->select();
    }
    

    /**
     * 获取煤企信息 
     */ 
    public function getMemberCompanyInfo($memberId){
        return  $this->table('member')->field("*")->where("member_id='{$memberId}'")->find();
    }      
    
    
    
    /**
     * 统计信息 
     */ 
    public function getStoreStatistics($storeId){
        //待我签署的合同
        $waitemWhere = "shopnc_eqb_contract.store_id='".$storeId."' AND shopnc_eqb_contract.store_signed_status IN(".eqb_contractModel::STORE_SIGNED_STATUS_WAIT_KEY.",".eqb_contractModel::STORE_SIGNED_STATUS_FAIL_KEY.") "
                   . "AND shopnc_eqb_contract.status NOT IN(".eqb_contractModel::STATUS_REJECT_KEY.", ".eqb_contractModel::STATUS_BOTH_SUCCESS_KEY.", ".eqb_contractModel::STATUS_CLOSE_KEY.")";
        //待他们签署的合同
        $waitothersWhere = "shopnc_eqb_contract.store_id='".$storeId."' AND shopnc_eqb_contract.member_signed_status IN(".eqb_contractModel::MEMBER_SIGNED_STATUS_WAIT_KEY.",".eqb_contractModel::MEMBER_SIGNED_STATUS_FAIL_KEY.") "
                        . "AND shopnc_eqb_contract.status NOT IN(".eqb_contractModel::STATUS_REJECT_KEY.", ".eqb_contractModel::STATUS_BOTH_SUCCESS_KEY.", ".eqb_contractModel::STATUS_CLOSE_KEY.")";
        //已签署完成
        $bothsuccessWhere = "shopnc_eqb_contract.store_id='".$storeId."' AND shopnc_eqb_contract.store_signed_status='".eqb_contractModel::STORE_SIGNED_STATUS_SUCCESS_KEY."' AND shopnc_eqb_contract.member_signed_status='".eqb_contractModel::MEMBER_SIGNED_STATUS_SUCCESS_KEY."' "
                   . "AND shopnc_eqb_contract.status='".eqb_contractModel::STATUS_BOTH_SUCCESS_KEY."' ";
        //退回的文件
        $returnWhere = " shopnc_eqb_contract.status='".eqb_contractModel::STATUS_REJECT_KEY."' AND shopnc_eqb_contract.create_store_id='".$storeId."' ";
        //关闭的文件
        $closeWhere = " shopnc_eqb_contract.status='".eqb_contractModel::STATUS_CLOSE_KEY."' AND shopnc_eqb_contract.create_store_id='".$storeId."' ";
        
        $sql = "select (select count(*) from shopnc_eqb_contract WHERE {$waitemWhere}) as waitmeCount, "
              . " (select count(*) from shopnc_eqb_contract WHERE {$waitothersWhere}) as waitothersCount, "
              . " (select count(*) from shopnc_eqb_contract WHERE {$bothsuccessWhere}) as bothsuccessCount,  "
              . " (select count(*) from shopnc_eqb_contract WHERE {$returnWhere}) as returnCount,  "
              . " (select count(*) from shopnc_eqb_contract WHERE {$closeWhere}) as closeCount";
      return Model()->query($sql);
    }        
    
    
}
