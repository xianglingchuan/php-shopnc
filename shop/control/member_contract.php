<?php

/**
 * SNS我的空间
 *
 * @copyright  Copyright (c) 2007-2013 ShopNC Inc. (http://www.shopnc.net)
 * @license    http://www.shopnc.net
 * @link       http://www.shopnc.net
 * @since      File available since Release v1.1
 */
use Shopnc\Tpl;

defined('InShopNC') or exit('Access Invalid!');

class member_contractControl extends BaseMemberControl {

    public function __construct() {
        parent::__construct();
    }

    /**
     * 合同首页
     */
    public function indexOp() {
        $this->profile_menu('index');
        Tpl::showpage('member_contract.index');
    }

    /**
     * 发布合同
     */
    public function addOp() {
        $this->profile_menu('add');
        Tpl::showpage('member_contract.add');
    }

    /**
     * 待我签署
     */
    public function waitMeListOp() {
        $this->profile_menu('waitme');
        Tpl::showpage('member_contract.waitmelist');
    }

    /**
     * 待他人签署
     */
    public function waitOthersListOp() {
        $this->profile_menu('waitothers');
        Tpl::showpage('member_contract.waitotherslist');
    }

    /**
     * 已完成签署 - 双方签署成功
     */
    public function bothSuccessListOp() {
        $this->profile_menu('bothsuccess');
        Tpl::showpage('member_contract.bothsuccesslist');
    }

    /**
     * 退回的文件 - 对方拒绝签署请求
     */
    public function returnListOp() {
        $this->profile_menu('return');
        Tpl::showpage('member_contract.returnlist');
    }

    /**
     * 已关闭 - 关闭合同
     */
    public function closeListOp() {
        $this->profile_menu('close');
        Tpl::showpage('member_contract.closelist');
    }

    /**
     * 用户中心右边，小导航
     *
     * @param string 	$menu_key	当前导航的menu_key
     * @return
     */
    private function profile_menu($menu_key = '') {
        $menu_array = array(
            1 => array('menu_key' => 'index', 'menu_name' => "概要统计", 'menu_url' => 'index.php?act=member_contract&op=index'),
            2 => array('menu_key' => 'waitme', 'menu_name' => "待我签署", 'menu_url' => 'index.php?act=member_contract&op=waitMeList'),
            3 => array('menu_key' => 'waitothers', 'menu_name' => "待他人签署", 'menu_url' => 'index.php?act=member_contract&op=waitOthersList'),
            4 => array('menu_key' => 'bothsuccess', 'menu_name' => "已完成签署", 'menu_url' => 'index.php?act=member_contract&op=bothSuccessList'),
            5 => array('menu_key' => 'return', 'menu_name' => '退回文件', 'menu_url' => 'index.php?act=member_contract&op=returnList'),
            6 => array('menu_key' => 'close', 'menu_name' => '已关闭', 'menu_url' => 'index.php?act=member_contract&op=closeList'),
            7 => array('menu_key' => 'add', 'menu_name' => '发起合同', 'menu_url' => 'index.php?act=member_contract&op=add')
        );
        //		if($menu_key == 'sendmsg') {
        //			$menu_array[] = array('menu_key'=>'sendmsg','menu_name'=>Language::get('home_message_send_message'),'menu_url'=>'index.php?act=member_message&op=sendmsg');
        //		}elseif($menu_key == 'showmsg') {
        //			$menu_array[] = array('menu_key'=>'showmsg','menu_name'=>Language::get('home_message_view_message'),'menu_url'=>'#');
        //		}
        Tpl::output('member_menu', $menu_array);
        Tpl::output('menu_key', $menu_key);
    }

}
