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
    const TYPE_STORE_VALUE = "企业";

    public function __construct() {
        parent::__construct();
    }

    /**
     * 查询指定条件信息 
     */
    public function getInfo($memberId, $type, $storeId = 0) {
        $where = " member_id='{$memberId}' AND type='{$type}' ";
        if (intval($storeId) >= 1) {
            $where.=" AND store_id='{$storeId}' ";
        }
        return $this->table('eqb_account')->field("*")->where($where)->find();
    }

    /**
     * 添加合同信息 
     */
    public function add($data) {
        return $this->table('eqb_account')->insert($data);
    }

    /**
     * 添加用户信息 
     */
    public function accountAdd($data) {
        $data['createuid'] = $data['member_id'];
        $data['createdate'] = date("Y-m-d H:i:s", time());
        return $this->add($data);
    }

    /**
     * 添加用户信息 
     */
    public function getEsignAccountId($memberId, $accountInfo) {
        //获取E签宝用户注册唯一码
        $info = $this->getInfo($memberId, eqb_accountModel::TYPE_PERSON_KEY);
        $accountId = $info['account_id'];
        $message = "";
        if (empty($info)) {
            //开始注册E签宝
            $memberInfo = Model('member')->getMemberInfoByID($memberId, 'member_mobile');
            $companyName = $accountInfo['company_name'];
            $organization_code = $accountInfo['organization_code'];
            $member_mobile = $memberInfo['member_mobile'];
            if (!empty($member_mobile) && !empty($companyName) && !empty($organization_code)) {
                $eSignClass = new eSgin();
                $result = $eSignClass->accountStore($member_mobile, $companyName, $organization_code, '1', '1');
                if ($result['ret'] == 1 && intval($result['accountId']) >= 1) {
                    $data = array("type" => eqb_accountModel::TYPE_PERSON_KEY,
                        "member_id" => $memberId,
                        "store_id" => 0,
                        "account_id" => $result['accountId']);
                    $result = $this->accountAdd($data);
                    $accountId = $result['accountId'];
                    if (!$result) {
                        $message = "E签宝的account_id写入失败,account_id值为{$result['accountId']}!";
                    }
                } else {
                    $message = $result['msg'];
                }
            } else {
                $message = "企业认证信息不完成,无法创建e签宝帐号!";
            }
        }
        return array("message" => $message, "accountId" => $accountId);
    }

    /**
     * 获取用户基本扩展信息 
     */
    public function getMemberExpandInfo($memberId) {
        return Model('member_expand')->where(array("member_id" => $memberId))->find();
    }

    /**
     * 添加企业用户
     */
    public function getEsignStoreAccountId($memberId, $storeId, $storeInfo) {
        //获取E签宝用户注册唯一码
        $info = $this->getInfo($memberId, eqb_accountModel::TYPE_STORE_KEY, $storeId);
        $accountId = $info['account_id'];
        $message = "";
        if (empty($info)) {
            //开始注册E签宝
            $memberInfo = Model('member')->getMemberInfoByID($memberId, 'member_mobile');
            $member_mobile = $memberInfo['member_mobile'];
            $companyName = $storeInfo['store_company_name'];      //企业名称
            $organization_code = $storeInfo['organization_code']; //企业代码
            if (!empty($member_mobile) && !empty($companyName) && !empty($organization_code)) {
                $eSignClass = new eSgin();
                $result = $eSignClass->accountStore($member_mobile, $companyName, $organization_code, '1', '1');
                if ($result['ret'] == 1 && intval($result['accountId']) >= 1) {
                    $data = array("type" => eqb_accountModel::TYPE_STORE_KEY,
                        "member_id" => $memberId,
                        "store_id" => $storeId,
                        "account_id" => $result['accountId']);
                    $result = $this->accountAdd($data);
                    $accountId = $data['account_id'];
                    if (!$result) {
                        $message = "E签宝的account_id写入失败,account_id值为{$result['accountId']}!";
                    }
                } else {
                    $message = $result['msg'];
                }
            } else {
                $message = "企业认证信息不完成,无法创建e签宝帐号!";
            }
        }
        return array("message" => $message, "accountId" => $accountId);
    }


}
