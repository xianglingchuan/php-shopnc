<?php
/**
 * 我的代金券
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

class member_voucherControl extends mobileMemberControl {

	public function __construct() {
		parent::__construct();
	}

    /**
     * 地址列表
     */
    public function voucher_listOp() {
		$model_voucher = Model('voucher');
        $voucher_list = $model_voucher->getMemberVoucherList($this->member_info['member_id'], $_POST['voucher_state'], $this->page);
        $page_count = $model_voucher->gettotalpage();

        output_data(array('voucher_list' => $voucher_list), mobile_page($page_count));
    }
}
