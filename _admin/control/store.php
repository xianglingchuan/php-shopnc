<?php
/**
 * 店铺管理界面
 *
 *
 * @copyright  Copyright (c) 2007-2013 ShopNC Inc. (http://www.shopnc.net)
 * @license    http://www.shopnc.net
 * @link       http://www.shopnc.net
 * @since      File available since Release v1.1
 */

use Shopnc\Tpl;

defined('InShopNC') or exit('Access Invalid!');

class storeControl extends SystemControl{
	const EXPORT_SIZE = 1000;
	public function __construct(){
		parent::__construct();
		Language::read('store,store_grade');
	}

	/**
	 * 店铺
	 */
	public function storeOp(){
		$lang = Language::getLangContent();

		$model_store = Model('store');

		if(trim($_GET['owner_and_name']) != ''){
			$condition['member_name']	= array('like', '%'.$_GET['owner_and_name'].'%');
			Tpl::output('owner_and_name',$_GET['owner_and_name']);
		}
		if(trim($_GET['store_name']) != ''){
			$condition['store_name']	= array('like', '%'.trim($_GET['store_name']).'%');
			Tpl::output('store_name',$_GET['store_name']);
		}
		if(intval($_GET['grade_id']) > 0){
			$condition['grade_id']		= intval($_GET['grade_id']);
			Tpl::output('grade_id',intval($_GET['grade_id']));
		}

        switch ($_GET['store_type']) {
            case 'close':
                $condition['store_state'] = 0;
                break;
            case 'open':
                $condition['store_state'] = 1;
                break;
            case 'expired':
                $condition['store_end_time'] = array('between', array(1, TIMESTAMP));
                $condition['store_state'] = 1;
                break;
            case 'expire':
                $condition['store_end_time'] = array('between', array(TIMESTAMP, TIMESTAMP + 864000));
                $condition['store_state'] = 1;
                break;
        }

        // 默认店铺管理不包含自营店铺
        $condition['is_own_shop'] = 0;

		//店铺列表
		$store_list = $model_store->getStoreList($condition, 10,'store_id desc');

		//店铺等级
		$model_grade = Model('store_grade');
		$grade_list = $model_grade->getGradeList($condition);
		if (!empty($grade_list)){
			$search_grade_list = array();
			foreach ($grade_list as $k => $v){
				$search_grade_list[$v['sg_id']] = $v['sg_name'];
			}
		}
        Tpl::output('search_grade_list', $search_grade_list);

		Tpl::output('grade_list',$grade_list);
		Tpl::output('store_list',$store_list);
        Tpl::output('store_type', $this->_get_store_type_array());
		Tpl::output('page',$model_store->showpage('2'));
		Tpl::showpage('store.index');
	}

    private function _get_store_type_array() {
        return array(
            'open' => '开启',
            'close' => '关闭',
            'expire' => '即将到期',
            'expired' => '已到期'
        );
    }
	/**
	 * 店铺编辑
	 */
	public function store_editOp(){
		$lang = Language::getLangContent();

		$model_store = Model('store');
		//保存
		if (chksubmit()){
			//取店铺等级的审核
			$model_grade = Model('store_grade');
			$grade_array = $model_grade->getOneGrade(intval($_POST['grade_id']));
			if (empty($grade_array)){
				showMessage($lang['please_input_store_level']);
			}
			//结束时间
			$time	= '';
			if(trim($_POST['end_time']) != ''){
				$time = strtotime($_POST['end_time']);
			}
			$update_array = array();
			$update_array['store_name'] = trim($_POST['store_name']);
			$update_array['sc_id'] = intval($_POST['sc_id']);
			$update_array['grade_id'] = intval($_POST['grade_id']);
			$update_array['store_end_time'] = $time;
			$update_array['store_state'] = intval($_POST['store_state']);
			if ($update_array['store_state'] == 0){
				//根据店铺状态修改该店铺所有煤炭状态
				$model_goods = Model('goods');
				$model_goods->editProducesOffline(array('store_id' => $_POST['store_id']));
				$update_array['store_close_info'] = trim($_POST['store_close_info']);
				$update_array['store_recommend'] = 0;
			}else {
				//店铺开启后煤炭不在自动上架，需要手动操作
				$update_array['store_close_info'] = '';
				$update_array['store_recommend'] = intval($_POST['store_recommend']);
			}
            $result = $model_store->editStore($update_array, array('store_id' => $_POST['store_id']));
			if ($result){
				$url = array(
				array(
				'url'=>'index.php?act=store&op=store',
				'msg'=>$lang['back_store_list'],
				),
				array(
				'url'=>'index.php?act=store&op=store_edit&store_id='.intval($_POST['store_id']),
				'msg'=>$lang['countinue_add_store'],
				),
				);
				$this->log(L('nc_edit,store').'['.$_POST['store_name'].']',1);
				showMessage($lang['nc_common_save_succ'],$url);
			}else {
				$this->log(L('nc_edit,store').'['.$_POST['store_name'].']',1);
				showMessage($lang['nc_common_save_fail']);
			}
		}
		//取店铺信息
		$store_array = $model_store->getStoreInfoByID($_GET['store_id']);
		if (empty($store_array)){
			showMessage($lang['store_no_exist']);
		}
		//整理店铺内容
		$store_array['store_end_time'] = $store_array['store_end_time']?date('Y-m-d',$store_array['store_end_time']):'';
		//店铺分类
		$model_store_class = Model('store_class');
		$parent_list = $model_store_class->getStoreClassList(array(),'',false);
		//店铺等级
		$model_grade = Model('store_grade');
		$grade_list = $model_grade->getGradeList();
		Tpl::output('grade_list',$grade_list);
		Tpl::output('class_list',$parent_list);
		Tpl::output('store_array',$store_array);

		$joinin_detail = Model('store_joinin')->getOne(array('member_id'=>$store_array['member_id']));
        Tpl::output('joinin_detail', $joinin_detail);
		Tpl::showpage('store.edit');
	}

    /**
     * 编辑保存注册信息
     */
    public function edit_save_joininOp() {
        if (chksubmit()) {
            $member_id = $_POST['member_id'];
            if ($member_id <= 0) {
                showMessage(L('param_error'));
            }
            $param = array();
            $param['company_name'] = $_POST['company_name'];
            $param['company_province_id'] = intval($_POST['province_id']);
            $param['company_address'] = $_POST['company_address'];
            $param['company_address_detail'] = $_POST['company_address_detail'];
            $param['company_phone'] = $_POST['company_phone'];
            $param['company_employee_count'] = intval($_POST['company_employee_count']);
            $param['company_registered_capital'] = intval($_POST['company_registered_capital']);
            $param['contacts_name'] = $_POST['contacts_name'];
            $param['contacts_phone'] = $_POST['contacts_phone'];
            $param['contacts_email'] = $_POST['contacts_email'];
            $param['business_licence_number'] = $_POST['business_licence_number'];
            $param['business_licence_address'] = $_POST['business_licence_address'];
            $param['business_licence_start'] = $_POST['business_licence_start'];
            $param['business_licence_end'] = $_POST['business_licence_end'];
            $param['business_sphere'] = $_POST['business_sphere'];
            if ($_FILES['business_licence_number_electronic']['name'] != '') {
                $param['business_licence_number_electronic'] = $this->upload_image('business_licence_number_electronic');
            }
            $param['organization_code'] = $_POST['organization_code'];
            if ($_FILES['organization_code_electronic']['name'] != '') {
                $param['organization_code_electronic'] = $this->upload_image('organization_code_electronic');
            }
            if ($_FILES['general_taxpayer']['name'] != '') {
                $param['general_taxpayer'] = $this->upload_image('general_taxpayer');
            }
            $param['bank_account_name'] = $_POST['bank_account_name'];
            $param['bank_account_number'] = $_POST['bank_account_number'];
            $param['bank_name'] = $_POST['bank_name'];
            $param['bank_code'] = $_POST['bank_code'];
            $param['bank_address'] = $_POST['bank_address'];
            if ($_FILES['bank_licence_electronic']['name'] != '') {
                $param['bank_licence_electronic'] = $this->upload_image('bank_licence_electronic');
            }
            $param['settlement_bank_account_name'] = $_POST['settlement_bank_account_name'];
            $param['settlement_bank_account_number'] = $_POST['settlement_bank_account_number'];
            $param['settlement_bank_name'] = $_POST['settlement_bank_name'];
            $param['settlement_bank_code'] = $_POST['settlement_bank_code'];
            $param['settlement_bank_address'] = $_POST['settlement_bank_address'];
            $param['tax_registration_certificate'] = $_POST['tax_registration_certificate'];
            $param['taxpayer_id'] = $_POST['taxpayer_id'];
            if ($_FILES['tax_registration_certificate_electronic']['name'] != '') {
                $param['tax_registration_certificate_electronic'] = $this->upload_image('tax_registration_certificate_electronic');
            }
            $result = Model('store_joinin')->editStoreJoinin(array('member_id' => $member_id), $param);
            if ($result) {
                showMessage(L('nc_common_op_succ'), 'index.php?act=store&op=store');
            } else {
                showMessage(L('nc_common_op_fail'));
            }
        }
    }
    
    private function upload_image($file) {
        $pic_name = '';
        $upload = new UploadFile();
        $uploaddir = ATTACH_PATH.DS.'store_joinin'.DS;
        $upload->set('default_dir',$uploaddir);
        $upload->set('allow_type',array('jpg','jpeg','gif','png'));
        if (!empty($_FILES[$file]['name'])){
            $result = $upload->upfile($file);
            if ($result){
                $pic_name = $upload->file_name;
                $upload->file_name = '';
            }
        }
        return $pic_name;
    }
    
    /**
     * 店铺经营类目管理
     */
    public function store_bind_classOp() {
        $store_id = intval($_GET['store_id']);

        $model_store = Model('store');
        $model_store_bind_class = Model('store_bind_class');
        $model_goods_class = Model('goods_class');

        $gc_list = $model_goods_class->getGoodsClassListByParentId(0);
        Tpl::output('gc_list',$gc_list);

        $store_info = $model_store->getStoreInfoByID($store_id);
        if(empty($store_info)) {
            showMessage(L('param_error'),'','','error');
        }
        Tpl::output('store_info', $store_info);

        $store_bind_class_list = $model_store_bind_class->getStoreBindClassList(array('store_id'=>$store_id,'state'=>array('in',array(1,2))), null);
        $goods_class = Model('goods_class')->getGoodsClassIndexedListAll();
        for($i = 0, $j = count($store_bind_class_list); $i < $j; $i++) {
            $store_bind_class_list[$i]['class_1_name'] = $goods_class[$store_bind_class_list[$i]['class_1']]['gc_name'];
            $store_bind_class_list[$i]['class_2_name'] = $goods_class[$store_bind_class_list[$i]['class_2']]['gc_name'];
            $store_bind_class_list[$i]['class_3_name'] = $goods_class[$store_bind_class_list[$i]['class_3']]['gc_name'];
        }
        Tpl::output('store_bind_class_list', $store_bind_class_list);

        Tpl::showpage('store_bind_class');
    }

    /**
     * 添加经营类目
     */
    public function store_bind_class_addOp() {
        $store_id = intval($_POST['store_id']);
        $commis_rate = intval($_POST['commis_rate']);
        if($commis_rate < 0 || $commis_rate > 100) {
            showMessage(L('param_error'), '');
        }
        list($class_1, $class_2, $class_3) = explode(',', $_POST['goods_class']);

        $model_store_bind_class = Model('store_bind_class');

        $param = array();
        $param['store_id'] = $store_id;
        $param['class_1'] = $class_1;
        $param['state'] = 1;
        if(!empty($class_2)) {
            $param['class_2'] = $class_2;
        }
        if(!empty($class_3)) {
            $param['class_3'] = $class_3;
        }

        // 检查类目是否已经存在
        $store_bind_class_info = $model_store_bind_class->getStoreBindClassInfo($param);
        if(!empty($store_bind_class_info)) {
            showMessage('该类目已经存在','','','error');
        }

        $param['commis_rate'] = $commis_rate;
        $result = $model_store_bind_class->addStoreBindClass($param);

        if($result) {
            $this->log('删除店铺经营类目，类目编号:'.$result.',店铺编号:'.$store_id);
            showMessage(L('nc_common_save_succ'), '');
        } else {
            showMessage(L('nc_common_save_fail'), '');
        }
    }

    /**
     * 删除经营类目
     */
    public function store_bind_class_delOp() {
        $bid = intval($_POST['bid']);

        $data = array();
        $data['result'] = true;

        $model_store_bind_class = Model('store_bind_class');
        $model_goods = Model('goods');

        $store_bind_class_info = $model_store_bind_class->getStoreBindClassInfo(array('bid' => $bid));
        if(empty($store_bind_class_info)) {
            $data['result'] = false;
            $data['message'] = '经营类目删除失败';
            echo json_encode($data);die;
        }

        // 煤炭下架
        $condition = array();
        $condition['store_id'] = $store_bind_class_info['store_id'];
        $gc_id = $store_bind_class_info['class_1'].','.$store_bind_class_info['class_2'].','.$store_bind_class_info['class_3'];
        $update = array();
        $update['goods_stateremark'] = '管理员删除经营类目';
        $condition['gc_id'] = array('in', rtrim($gc_id, ','));
        $model_goods->editProducesLockUp($update, $condition);

        $result = $model_store_bind_class->delStoreBindClass(array('bid'=>$bid));

        if(!$result) {
            $data['result'] = false;
            $data['message'] = '经营类目删除失败';
        }
        $this->log('删除店铺经营类目，类目编号:'.$bid.',店铺编号:'.$store_bind_class_info['store_id']);
        echo json_encode($data);die;
    }

    public function store_bind_class_updateOp() {
        $bid = intval($_GET['id']);
        if($bid <= 0) {
            echo json_encode(array('result'=>FALSE,'message'=>Language::get('param_error')));
            die;
        }
        $new_commis_rate = intval($_GET['value']);
        if ($new_commis_rate < 0 || $new_commis_rate >= 100) {
            echo json_encode(array('result'=>FALSE,'message'=>Language::get('param_error')));
            die;
        } else {
            $update = array('commis_rate' => $new_commis_rate);
            $condition = array('bid' => $bid);
            $model_store_bind_class = Model('store_bind_class');
            $result = $model_store_bind_class->editStoreBindClass($update, $condition);
            if($result) {
                $this->log('更新店铺经营类目，类目编号:'.$bid);
                echo json_encode(array('result'=>TRUE));
                die;
            } else {
                echo json_encode(array('result'=>FALSE,'message'=>L('nc_common_op_fail')));
                die;
            }
        }
    }


	/**
	 * 店铺 待审核列表
	 */
	public function store_joininOp(){
		//店铺列表
		if(!empty($_GET['owner_and_name'])) {
			$condition['member_name'] = array('like','%'.$_GET['owner_and_name'].'%');
		}
		if(!empty($_GET['store_name'])) {
			$condition['store_name'] = array('like','%'.$_GET['store_name'].'%');
		}
		if(!empty($_GET['grade_id']) && intval($_GET['grade_id']) > 0) {
			$condition['sg_id'] = $_GET['grade_id'];
		}
		if(!empty($_GET['joinin_state']) && intval($_GET['joinin_state']) > 0) {
            $condition['joinin_state'] = $_GET['joinin_state'] ;
        } else {
            $condition['joinin_state'] = array('gt',0);
        }
		$model_store_joinin = Model('store_joinin');
		$store_list = $model_store_joinin->getList($condition, 10, 'joinin_state asc');
		Tpl::output('store_list', $store_list);
        Tpl::output('joinin_state_array', $this->get_store_joinin_state());

		//店铺等级
		$model_grade = Model('store_grade');
		$grade_list = $model_grade->getGradeList();
		Tpl::output('grade_list', $grade_list);

		Tpl::output('page',$model_store_joinin->showpage('2'));
		Tpl::showpage('store_joinin');
	}

	/**
	 * 经营类目申请列表
	 */
	public function store_bind_class_applay_listOp(){
	    $condition = array();

        // 不显示自营店铺绑定的类目
        if ($_GET['state'] != '') {
            $condition['state'] = intval($_GET['state']);
            if (!in_array($condition['state'], array('0', '1', )))
                unset($condition['state']);
        } else {
            $condition['state'] = array('in', array('0', '1', ));
        }

	    if(intval($_GET['store_id'])) {
	        $condition['store_id'] = intval($_GET['store_id']);
	    }

        $model_store_bind_class = Model('store_bind_class');
        $store_bind_class_list = $model_store_bind_class->getStoreBindClassList($condition, 15,'state asc,bid desc');
        $goods_class = Model('goods_class')->getGoodsClassIndexedListAll();
        $store_ids = array();
        for($i = 0, $j = count($store_bind_class_list); $i < $j; $i++) {
            $store_bind_class_list[$i]['class_1_name'] = $goods_class[$store_bind_class_list[$i]['class_1']]['gc_name'];
            $store_bind_class_list[$i]['class_2_name'] = $goods_class[$store_bind_class_list[$i]['class_2']]['gc_name'];
            $store_bind_class_list[$i]['class_3_name'] = $goods_class[$store_bind_class_list[$i]['class_3']]['gc_name'];
            $store_ids[] = $store_bind_class_list[$i]['store_id'];
        }
        //取店铺信息
        $model_store = Model('store');
        $store_list = $model_store->getStoreList(array('store_id'=>array('in',$store_ids)),null);
        $bind_store_list = array();
        if (!empty($store_list) && is_array($store_list)) {
            foreach ($store_list as $k => $v) {
                $bind_store_list[$v['store_id']]['store_name'] = $v['store_name'];
                $bind_store_list[$v['store_id']]['seller_name'] = $v['seller_name'];
            }
        }

        Tpl::output('bind_list', $store_bind_class_list);
        Tpl::output('bind_store_list',$bind_store_list);

	    Tpl::output('page',$model_store_bind_class->showpage('2'));
	    Tpl::showpage('store_bind_class_applay.list');
	}

	/**
	 * 审核经营类目申请
	 */
	public function store_bind_class_applay_checkOp() {
	    $model_store_bind_class = Model('store_bind_class');
	    $condition = array();
	    $condition['bid'] = intval($_GET['bid']);
	    $condition['state'] = 0;
	    $update = $model_store_bind_class->editStoreBindClass(array('state'=>1),$condition);
	    if ($update) {
	        $this->log('审核新经营类目申请，店铺ID：'.$_GET['store_id'],1);
	        showMessage('审核成功',getReferer());
	    } else {
	        showMessage('审核失败',getReferer(),'html','error');
	    }
	}

	/**
	 * 删除经营类目申请
	 */
	public function store_bind_class_applay_delOp() {
	    $model_store_bind_class = Model('store_bind_class');
	    $condition = array();
	    $condition['bid'] = intval($_GET['bid']);
	    $del = $model_store_bind_class->delStoreBindClass($condition);
	    if ($del) {
	        $this->log('删除经营类目，店铺ID：'.$_GET['store_id'],1);
	        showMessage('删除成功',getReferer());
	    } else {
	        showMessage('删除失败',getReferer(),'html','error');
	    }
	}

    private function get_store_joinin_state() {
        $joinin_state_array = array(
            STORE_JOIN_STATE_NEW => '新申请',
            STORE_JOIN_STATE_PAY => '已付款',
            STORE_JOIN_STATE_VERIFY_SUCCESS => '待付款',
            STORE_JOIN_STATE_VERIFY_FAIL => '审核失败',
            STORE_JOIN_STATE_PAY_FAIL => '付款审核失败',
            STORE_JOIN_STATE_FINAL => '开店成功',
        );
        return $joinin_state_array;
    }

    /**
     * 店铺续签申请列表
     */
    public function reopen_listOp(){
        $condition = array();
        if(intval($_GET['store_id'])) {
            $condition['re_store_id'] = intval($_GET['store_id']);
        }
        if(!empty($_GET['store_name'])) {
            $condition['re_store_name'] = $_GET['store_name'];
        }
        if ($_GET['re_state'] != '') {
            $condition['re_state'] = intval($_GET['re_state']);
        }
        $model_store_reopen = Model('store_reopen');
        $reopen_list = $model_store_reopen->getStoreReopenList($condition, 15);

        Tpl::output('reopen_list', $reopen_list);

        Tpl::output('page',$model_store_reopen->showpage('2'));
        Tpl::showpage('store_reopen.list');
    }

    /**
     * 审核店铺续签申请
     */
    public function reopen_checkOp() {
        if (intval($_GET['re_id']) <= 0) exit();
        $model_store_reopen = Model('store_reopen');
        $condition = array();
        $condition['re_id'] = intval($_GET['re_id']);
        $condition['re_state'] = 1;
        //取当前申请信息
        $reopen_info = $model_store_reopen->getStoreReopenInfo($condition);

        //取目前店铺有效截止日期
        $store_info = Model('store')->getStoreInfoByID($reopen_info['re_store_id']);
        $data = array();
        $data['re_start_time'] = strtotime(date('Y-m-d 0:0:0',$store_info['store_end_time']))+24*3600;
        $data['re_end_time'] = strtotime(date('Y-m-d 23:59:59', $data['re_start_time'])." +".intval($reopen_info['re_year'])." year");
        $data['re_state'] = 2;
        $update = $model_store_reopen->editStoreReopen($data,$condition);
        if ($update) {
            //更新店铺有效期
            Model('store')->editStore(array('store_end_time'=>$data['re_end_time']),array('store_id'=>$reopen_info['re_store_id']));
            $msg = '审核通过店铺续签申请，店铺ID：'.$reopen_info['re_store_id'].'，续签时间段：'.date('Y-m-d',$data['re_start_time']).' - '.date('Y-m-d',$data['re_end_time']);
            $this->log($msg,1);
            showMessage('续签成功，店铺有效成功延续到了'.date('Y-m-d',$data['re_end_time']).'日',getReferer());
        } else {
            showMessage('审核失败',getReferer(),'html','error');
        }
    }

    /**
     * 删除店铺续签申请
     */
    public function reopen_delOp() {
        $model_store_reopen = Model('store_reopen');
        $condition = array();
        $condition['re_id'] = intval($_GET['re_id']);
        $condition['re_state'] = array('in',array(0,1));

        //取当前申请信息
        $reopen_info = $model_store_reopen->getStoreReopenInfo($condition);
        $cert_file = BASE_UPLOAD_PATH.DS.ATTACH_STORE_JOININ.DS.$reopen_info['re_pay_cert'];
        $del = $model_store_reopen->delStoreReopen($condition);
        if ($del) {
            if (is_file($cert_file)) {
                unlink($cert_file);
            }
            $this->log('删除店铺续签目申请，店铺ID：'.$_GET['re_store_id'],1);
            showMessage('删除成功',getReferer());
        } else {
            showMessage('删除失败',getReferer(),'html','error');
        }
    }

	/**
	 * 审核详细页
	 */
	public function store_joinin_detailOp(){
		$model_store_joinin = Model('store_joinin');
        $joinin_detail = $model_store_joinin->getOne(array('member_id'=>$_GET['member_id']));
        $joinin_detail_title = '查看';
        if(in_array(intval($joinin_detail['joinin_state']), array(STORE_JOIN_STATE_NEW, STORE_JOIN_STATE_PAY))) {
            $joinin_detail_title = '审核';
        }
        if (!empty($joinin_detail['sg_info'])) {
            $store_grade_info = Model('store_grade')->getOneGrade($joinin_detail['sg_id']);
            $joinin_detail['sg_price'] = $store_grade_info['sg_price'];
        } else {
            $joinin_detail['sg_info'] = @unserialize($joinin_detail['sg_info']);
            if (is_array($joinin_detail['sg_info'])) {
                $joinin_detail['sg_price'] = $joinin_detail['sg_info']['sg_price'];
            }
        }
        Tpl::output('joinin_detail_title', $joinin_detail_title);
		Tpl::output('joinin_detail', $joinin_detail);
		Tpl::showpage('store_joinin.detail');
	}

	/**
	 * 审核
	 */
	public function store_joinin_verifyOp() {
        $model_store_joinin = Model('store_joinin');
        $joinin_detail = $model_store_joinin->getOne(array('member_id'=>$_POST['member_id']));

        switch (intval($joinin_detail['joinin_state'])) {
            case STORE_JOIN_STATE_NEW:
                $this->store_joinin_verify_pass($joinin_detail);
                break;
            case STORE_JOIN_STATE_PAY:
                $this->store_joinin_verify_open($joinin_detail);
                break;
            default:
                showMessage('参数错误','');
                break;
        }
	}

    private function store_joinin_verify_pass($joinin_detail) {
        $param = array();
        $param['joinin_state'] = $_POST['verify_type'] === 'pass' ? STORE_JOIN_STATE_VERIFY_SUCCESS : STORE_JOIN_STATE_VERIFY_FAIL;
        $param['joinin_message'] = $_POST['joinin_message'];
        $param['paying_amount'] = abs(floatval($_POST['paying_amount']));
        $param['store_class_commis_rates'] = implode(',', $_POST['commis_rate']);
        $model_store_joinin = Model('store_joinin');
        $model_store_joinin->modify($param, array('member_id'=>$_POST['member_id']));
        if ($param['paying_amount'] > 0) {
            showMessage('店铺入驻申请审核完成','index.php?act=store&op=store_joinin');
        } else {
            //如果开店支付费用为零，则审核通过后直接开通，无需再上传付款凭证
            $this->store_joinin_verify_open($joinin_detail);
        }
    }

    private function store_joinin_verify_open($joinin_detail) {
        $model_store_joinin = Model('store_joinin');
        $model_store	= Model('store');
        $model_seller = Model('seller');

        //验证卖家用户名是否已经存在
        if($model_seller->isSellerExist(array('seller_name' => $joinin_detail['seller_name']))) {
            showMessage('卖家用户名已存在','');
        }

        $param = array();
        $param['joinin_state'] = $_POST['verify_type'] === 'pass' ? STORE_JOIN_STATE_FINAL : STORE_JOIN_STATE_PAY_FAIL;
        $param['joinin_message'] = $_POST['joinin_message'];
        $model_store_joinin->modify($param, array('member_id'=>$_POST['member_id']));
        if($_POST['verify_type'] === 'pass') {
            //开店
 			$shop_array		= array();
            $shop_array['member_id']	= $joinin_detail['member_id'];
            $shop_array['member_name']	= $joinin_detail['member_name'];
            $shop_array['seller_name'] = $joinin_detail['seller_name'];
			$shop_array['grade_id']		= $joinin_detail['sg_id'];
			$shop_array['store_name']	= $joinin_detail['store_name'];
			$shop_array['sc_id']		= $joinin_detail['sc_id'];
            $shop_array['store_company_name'] = $joinin_detail['company_name'];
			$shop_array['province_id']	= $joinin_detail['company_province_id'];
			$shop_array['area_info']	= $joinin_detail['company_address'];
			$shop_array['store_address']= $joinin_detail['company_address_detail'];
			$shop_array['store_zip']	= '';
			$shop_array['store_zy']		= '';
			$shop_array['store_state']	= 1;
            $shop_array['store_time']	= time();
            $shop_array['store_end_time'] = strtotime(date('Y-m-d 23:59:59', strtotime('+1 day'))." +".intval($joinin_detail['joinin_year'])." year");
            $store_id = $model_store->addStore($shop_array);

            if($store_id) {
                //写入卖家账号
                $seller_array = array();
                $seller_array['seller_name'] = $joinin_detail['seller_name'];
                $seller_array['member_id'] = $joinin_detail['member_id'];
                $seller_array['seller_group_id'] = 0;
                $seller_array['store_id'] = $store_id;
                $seller_array['is_admin'] = 1;
                $state = $model_seller->addSeller($seller_array);
            }

			if($state) {
				// 添加相册默认
				$album_model = Model('album');
				$album_arr = array();
				$album_arr['aclass_name'] = Language::get('store_save_defaultalbumclass_name');
				$album_arr['store_id'] = $store_id;
				$album_arr['aclass_des'] = '';
				$album_arr['aclass_sort'] = '255';
				$album_arr['aclass_cover'] = '';
				$album_arr['upload_time'] = time();
				$album_arr['is_default'] = '1';
				$album_model->addClass($album_arr);

				$model = Model();
				//插入店铺扩展表
				$model->table('store_extend')->insert(array('store_id'=>$store_id));
				$msg = Language::get('store_save_create_success');

                //插入店铺绑定分类表
                $store_bind_class_array = array();
                $store_bind_class = unserialize($joinin_detail['store_class_ids']);
                $store_bind_commis_rates = explode(',', $joinin_detail['store_class_commis_rates']);
                for($i=0, $length=count($store_bind_class); $i<$length; $i++) {
                    list($class1, $class2, $class3) = explode(',', $store_bind_class[$i]);
                    $store_bind_class_array[] = array(
                        'store_id' => $store_id,
                        'commis_rate' => $store_bind_commis_rates[$i],
                        'class_1' => $class1,
                        'class_2' => $class2,
                        'class_3' => $class3,
                        'state' => 1
                    );
                }
                $model_store_bind_class = Model('store_bind_class');
                $model_store_bind_class->addStoreBindClassAll($store_bind_class_array);
                showMessage('店铺开店成功','index.php?act=store&op=store_joinin');
            } else {
                showMessage('店铺开店失败','index.php?act=store&op=store_joinin');
            }
        } else {
            showMessage('店铺开店拒绝','index.php?act=store&op=store_joinin');
        }
    }

    /**
     * 提醒续费
     */
    public function remind_renewalOp() {
        $store_id = intval($_GET['store_id']);
        $store_info = Model('store')->getStoreInfoByID($store_id);
        if (!empty($store_info) && $store_info['store_end_time'] < (TIMESTAMP + 864000) && cookie('remindRenewal'.$store_id) == null) {
            // 发送企业消息
            $param = array();
            $param['code'] = 'store_expire';
            $param['store_id'] = intval($_GET['store_id']);
            $param['param'] = array();
            QueueClient::push('sendStoreMsg', $param);

            setNcCookie('remindRenewal'.$store_id, 1, 86400 * 10);  // 十天
            showMessage('消息发送成功');
        }
            showMessage('消息发送失败');
    }
    
    /**
     * 验证店铺名称是否存在
     */
    public function ckeck_store_nameOp() {
        /**
         * 实例化卖家模型
         */
        $where = array();
        $where['store_name'] = $_GET['store_name'];
        $where['store_id'] = array('neq', $_GET['store_id']);
        $store_info = Model('store')->getStoreInfo($where);
        if(!empty($store_info['store_name'])) {
            echo 'false';
        } else {
            echo 'true';
        }
    }
}
