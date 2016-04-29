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
        $contractModel	= Model('eqb_contract');
        $data = $contractModel->getStatistics($_SESSION['member_id']);  //合同统计信息
        Tpl::output('data',$data);  
        $this->profile_menu('index');
        Tpl::showpage('member_contract.index');
    }

    /**
     * 发布合同
     */
    public function addOp() {
        header("Content-type: text/html; charset=utf-8");    
        $contractModel	= Model('eqb_contract');
        $storeList = $contractModel->getStoreList();
        if (chksubmit()) {
            $message = "";
            $title = isset($_POST['title']) && !empty($_POST['title']) ? trim($_POST['title']) : "";
            $description = isset($_POST['description']) && !empty($_POST['description']) ? trim($_POST['description']) : "";
            $storeId = isset($_POST['store_id']) && intval($_POST['store_id']) >= 1 ? intval($_POST['store_id']) : 0;
            $fileObject = $_FILES['contract_file'];
            if (!empty($title) && intval($storeId) >= 1) {
                $storeInfo = $contractModel->getStoreInfo($storeId);
                if (!empty($storeInfo)) {
                    if (!empty($fileObject['name'])) {
                        //获取文件的格式
                        $pathInfo = pathinfo($fileObject['name']);
                        $extensionArray = array("doc", "pdf");
                        if (in_array($pathInfo['extension'], $extensionArray)) {
                            $upload = new UploadFile();
                            $upload->set('default_dir',ATTACH_MALBUM);
                            $upload->set('max_size',10240);
                            $uploadResult = $upload->upfile2("contract_file");
                            if($uploadResult){
                                $filePath = $upload->get("save_path").DS.$upload->get("file_name");
                                $data = array("title" => $title, "description" => $description, "store_id"=>$storeId, 
                                              "store_member_id"=>$storeInfo['member_id'], "member_id"=>$_SESSION['member_id'],
                                              "file_path"=>$filePath, "file_path_proto"=>$filePath);
                                $result = $contractModel->memberAdd($data);
                                if($result){
                                    $message = "操作成功!";
                                }else{
                                    $message = "操作失败!";
                                }
                            }else{
                                $message = "合同文件上传失败!";
                            }             
                        } else {
                            $message = "只能上传doc和pdf格式文件!";
                        }
                    } else {
                        $message = "请选择上传合同文件!";
                    }
                } else {
                    $message = "煤企信息不存在!";
                }
            } else {
                $message = "合同标题和煤企为必填项!";
            }
            showDialog($message,'reload',$result ? 'succ' : 'error');
        }
        Tpl::output('storeList', $storeList);
        $this->profile_menu('add');
        Tpl::showpage('member_contract.add');
    }

    
    /**
     * 待我签署
     */
    public function waitMeListOp() {
        $contractModel	= Model('eqb_contract');
        //读取当前登录用户接受或者发起的合同
        $condition = "eqb_contract.member_id='".$_SESSION['member_id']."' AND eqb_contract.member_signed_status IN(".eqb_contractModel::MEMBER_SIGNED_STATUS_WAIT_KEY.",".eqb_contractModel::MEMBER_SIGNED_STATUS_FAIL_KEY.") "
                   . "AND eqb_contract.status NOT IN(".eqb_contractModel::STATUS_REJECT_KEY.", ".eqb_contractModel::STATUS_BOTH_SUCCESS_KEY.", ".eqb_contractModel::STATUS_CLOSE_KEY.")";
        $list = $contractModel->getList($condition,'','eqb_contract.*, member.member_name, store.store_name','','eqb_contract.id');
        Tpl::output('list',$list);
        Tpl::output('show_page',$contractModel->showpage());          
        $this->profile_menu('waitme');
        Tpl::showpage('member_contract.waitmelist');
    }
    
    
     /**
     * 关闭合同 - 只有自己发启的合同才能被自己关闭
     */
    public function closeOp(){
        $contractModel	= Model('eqb_contract');
        $id = isset($_GET['id']) && intval($_GET['id'])>=1 ? intval($_GET['id']) : 0;
        $message = "";
        $result = false;
        if(intval($id) >= 1){
            $info = $contractModel->getInfo("id='{$id}'");
            if(intval($info['createuid']) == intval($_SESSION['member_id'])){
                $result = $contractModel->close($id, $_SESSION['member_id']);
                if($result){
                    $message = "关闭合同成功.";
                }else{
                    $message = "关闭合同失败.";
                }
            }else{
                $message = "不能关闭其他人发起的合同.";
            }
        }else{
            $message = "参数错误.";
        }
        showDialog("关闭合同成功.",'reload',  ($result ? 'succ':'error'));
    }
    
    
     /**
     * 退回合同 - 只有发给自己的合同才有权退回
     */
    public function sendbackOp(){
        $contractModel	= Model('eqb_contract');
        $id = isset($_GET['id']) && intval($_GET['id'])>=1 ? intval($_GET['id']) : 0;
        $message = "";
        $result = false;
        if(intval($id) >= 1){
            $info = $contractModel->getInfo("id='{$id}'");
            if(intval($info['member_id']) == intval($_SESSION['member_id'])  &&   intval($info['createuid'])!=intval($_SESSION['member_id'])){
                $result = $contractModel->sendback($id, $_SESSION['member_id']);
                if($result){
                    $message = "退回合同成功.";
                }else{
                    $message = "退回合同失败.";
                }
            }else{
                $message = "不能非法退回合同.";
            }
        }else{
            $message = "参数错误.";
        }
        showDialog("关闭合同成功.",'reload',  ($result ? 'succ':'error'));
    }
    
    
    

    /**
     * 待他人签署
     */
    public function waitOthersListOp() {
        $contractModel	= Model('eqb_contract');
        //读取当前登录用户接受或者发起的合同
        $condition = "eqb_contract.member_id='".$_SESSION['member_id']."' AND eqb_contract.store_signed_status IN(".eqb_contractModel::STORE_SIGNED_STATUS_WAIT_KEY.",".eqb_contractModel::STORE_SIGNED_STATUS_FAIL_KEY.") "
                   . "AND eqb_contract.status NOT IN(".eqb_contractModel::STATUS_REJECT_KEY.", ".eqb_contractModel::STATUS_BOTH_SUCCESS_KEY.", ".eqb_contractModel::STATUS_CLOSE_KEY.")";
        $list = $contractModel->getList($condition,'','eqb_contract.*, member.member_name, store.store_name','','eqb_contract.id');
        Tpl::output('list',$list);
        Tpl::output('show_page',$contractModel->showpage());          
        $this->profile_menu('waitothers');
        Tpl::showpage('member_contract.waitotherslist');
    }

    /**
     * 已完成签署 - 双方签署成功
     */
    public function bothSuccessListOp() {
        $contractModel	= Model('eqb_contract');
        $condition = "eqb_contract.member_id='".$_SESSION['member_id']."' AND eqb_contract.store_signed_status='".eqb_contractModel::STORE_SIGNED_STATUS_SUCCESS_KEY."' AND eqb_contract.member_signed_status='".eqb_contractModel::MEMBER_SIGNED_STATUS_SUCCESS_KEY."' "
                   . "AND eqb_contract.status='".eqb_contractModel::STATUS_BOTH_SUCCESS_KEY."' ";
        $list = $contractModel->getList($condition,'','eqb_contract.*, member.member_name, store.store_name','','eqb_contract.id');
        Tpl::output('list',$list);
        Tpl::output('show_page',$contractModel->showpage());   
        $this->profile_menu('bothsuccess');
        Tpl::showpage('member_contract.bothsuccesslist');
    }

    /**
     * 退回的文件 - 对方拒绝签署请求
     */
    public function returnListOp() {
        $contractModel	= Model('eqb_contract');
        $condition = " eqb_contract.status='".eqb_contractModel::STATUS_REJECT_KEY."' AND eqb_contract.createuid='".$_SESSION['member_id']."' ";
        $list = $contractModel->getList($condition,'','eqb_contract.*, member.member_name, store.store_name','','eqb_contract.id');
        Tpl::output('list',$list);
        Tpl::output('show_page',$contractModel->showpage());   
        $this->profile_menu('return');
        Tpl::showpage('member_contract.returnlist');
    }

    /**
     * 已关闭 - 关闭合同
     */
    public function closeListOp() {
        $contractModel	= Model('eqb_contract');
        $condition = " eqb_contract.status='".eqb_contractModel::STATUS_CLOSE_KEY."' AND eqb_contract.createuid='".$_SESSION['member_id']."' ";
        $list = $contractModel->getList($condition,'','eqb_contract.*, member.member_name, store.store_name','','eqb_contract.id');
        Tpl::output('list',$list);
        Tpl::output('show_page',$contractModel->showpage());   
        $this->profile_menu('close');
        Tpl::showpage('member_contract.closelist');
    }
    
    
    /**
     * 合同的详情展示
     */    
    public function viewOp(){
        $id = isset($_GET['id']) && intval($_GET['id'])>=1 ? intval($_GET['id']) : 0;
        $member_menu = isset($_GET['member_menu']) ? trim($_GET['member_menu']) : "";
        if(intval($id) >=1){
            $contractModel = Model('eqb_contract');
            $info = $contractModel->getDetailInfo("eqb_contract.id='{$id}'");
            Tpl::output('info', $info);
            $this->profile_menu($member_menu);
            Tpl::showpage('member_contract.view');            
        }else{
            $message = "合同ID不合法.";
            showDialog($message,'reload', 'error');
        }
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
