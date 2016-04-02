<?php
/**
 * 合作伙伴管理
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
class mb_feedbackControl extends SystemControl{
	public function __construct(){
		parent::__construct();
		Language::read('mobile');
	}
	/**
	 * 意见反馈
	 */
	public function flistOp(){
		$model_mb_feedback = Model('mb_feedback');
		$list = $model_mb_feedback->getMbFeedbackList(array(), 10);

		Tpl::output('list', $list);
		Tpl::output('page', $model_mb_feedback->showpage());
		Tpl::showpage('mb_feedback.index');
	}

	/**
	 * 删除
	 */
	public function delOp(){
        $model_mb_feedback = Model('mb_feedback');
        $result = $model_mb_feedback->delMbFeedback($_POST['feedback_id']);
		if ($result){
			showMessage(L('nc_common_op_succ'));
		}else {
			showMessage(L('nc_common_op_fail'));
		}
	}
}
