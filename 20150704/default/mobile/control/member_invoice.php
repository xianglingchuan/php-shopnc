<?php
/**
 * 我的发票
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

class member_invoiceControl extends mobileMemberControl {

	public function __construct() {
		parent::__construct();
	}

    /**
     * 发票信息列表
     */
    public function invoice_listOp() {
        $model_invoice = Model('invoice');

        $condition = array();
        $condition['member_id'] = $this->member_info['member_id'];

	    $invoice_list = $model_invoice->getInvList($condition, 10, 'inv_id,inv_title,inv_content');

        output_data(array('invoice_list' => $invoice_list));
    }

    /**
     * 发票信息删除
     */
    public function invoice_delOp() {
        $inv_id = intval($_POST['inv_id']);
        if($inv_id <= 0) {
            output_error('参数错误');
        }

        $model_invoice = Model('invoice');

        $result = $model_invoice->delInv(array('inv_id'=>$inv_id, 'member_id'=>$this->member_info['member_id']));
        if($result) {
            output_data('1');
        } else {
            output_error('删除失败');
        }
    }

    /**
     * 发票信息添加
     */
    public function invoice_addOp() {
        $model_invoice = Model('invoice');

        $data = array();
        $data['inv_state'] = 1;
        $data['inv_title'] = $_POST['inv_title_select'] == 'person' ? '个人' : $_POST['inv_title'];
        $data['inv_content'] = $_POST['inv_content'];
        $data['member_id'] = $this->member_info['member_id'];
        $result = $model_invoice->addInv($data);
        if($result) {
            output_data(array('inv_id' => $result));
        } else {
            output_error('添加失败');
        }
    }

    /**
     * 发票内容列表
     */
    public function invoice_content_listOp() {
        $invoice_content_list = array(
            '明细',
            );
        output_data(array('invoice_content_list' => $invoice_content_list));
    }

}
