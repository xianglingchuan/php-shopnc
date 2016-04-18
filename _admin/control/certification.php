<?php
/**
 * 会员管理
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

class certificationControl extends SystemControl{
	const EXPORT_SIZE = 1000;
	public function __construct(){
		parent::__construct();
		Language::read('member');
	}

	/**
	 * 会员管理
	 */
	public function indexOp(){
                $lang	= Language::getLangContent();
		//会员级别
		$model_member = Model('member');
//		$member_grade = $model_member->getMemberGradeArr();
		if ($_GET['search_field_value'] != '') {
                    switch ($_GET['search_field_name']){
                            case 'member_name':
                                    $condition['member_name'] = array('like', '%' . trim($_GET['search_field_value']) . '%');
                                    break;
                            case 'member_email':
                                    $condition['member_email'] = array('like', '%' . trim($_GET['search_field_value']) . '%');
                                    break;
                            case 'member_truename':
                                    $condition['member_truename'] = array('like', '%' . trim($_GET['search_field_value']) . '%');
                                    break;
                    }
		}
                
                if(isset($_GET['audit']) && $_GET['audit']!= "-1"){
                    $condition['member_expand.audit'] = array("eq", $_GET['audit']);
                }
                $member_list = $model_member->getMemberExpandList($condition, '*', 10, $order);	
                
		//Tpl::output('member_grade',$member_grade);
		Tpl::output('search_sort',trim($_GET['search_sort']));
		Tpl::output('search_field_name',trim($_GET['search_field_name']));
		Tpl::output('search_field_value',trim($_GET['search_field_value']));
                Tpl::output('audit',$_GET['audit']);
		Tpl::output('member_list',$member_list);
		Tpl::output('page',$model_member->showpage());
		Tpl::showpage('certification.index');
	}
        
        
	/**
	 * 查看详情
	 */
        public function viewOp(){
            $model_member = Model('member');
            $member_id = isset($_GET['member_id']) && intval($_GET['member_id']) >=1 ? intval($_GET['member_id']) : 0;
            if(intval($member_id) >=1){
                $condition = " member.member_id='{$member_id}' ";
                $memberInfo  = $model_member->getMemberExpandInfo($condition, '*');	
                Tpl::output('memberInfo',$memberInfo);
                Tpl::showpage('certification.view');
            }else{
                showMessage("参数错误!");
            }
        }
        
        
        
	/**
	 * 审核信息内容
	 */
        public function setAuditOp(){            
            $member_id = isset($_GET['member_id']) && intval($_GET['member_id']) >=1 ? intval($_GET['member_id']) : 0;
            $type = isset($_GET['type']) && intval($_GET['type'])>=1 ? intval($_GET['type']) : 0;
            if(intval($member_id) >=1 && in_array($type, array(1,2))){
                //开始审核
                $model_member = Model('member');
                $data = array("audit"=>$type, "member_id"=>$member_id, "audit_createdate"=>date("Y-m-d H:i:s",time()), "audit_admin_id"=>$this->admin_info['id'],"audit_admin_name"=>$this->admin_info['name']);
                $result = $model_member->updateMemberExpandAudit($member_id, $data);
                if($result){
                    if(intval($data['audit']) === 1){ //如果是审核通过，那么更新member表中的is_expand值为1
                        $model_member->updateMemberIsExpand($member_id,$data['audit']);
                    }
                    showMessage("审核操作成功!");
                }else{
                    showMessage("审核操作失败!");
                }
            }else{
                showMessage("用户ID号审核状态值非法操作!");
            }
        }
}
