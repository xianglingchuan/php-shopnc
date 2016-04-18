<?php

/**
 * 会员模型
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

class memberModel extends Model {

    public function __construct() {
        parent::__construct('member');
    }
    
    const TYPE_PERSON_KEY = "0";
    const TYPE_PERSON_VALUE = "个人";
    const TYPE_COMPANY_KEY = "1";
    const TYPE_COMPANY_VALUE = "公司";
    

    /**
     * 会员详细信息（查库）
     * @param array $condition
     * @param string $field
     * @return array
     */
    public function getMemberInfo($condition, $field = '*', $master = false) {
        return $this->table('member')->field($field)->where($condition)->master($master)->find();
    }

    /**
     * 取得会员详细信息（优先查询缓存）
     * 如果未找到，则缓存所有字段
     * @param int $member_id
     * @param string $field 需要取得的缓存键值, 例如：'*','member_name,member_sex'
     * @return array
     */
    public function getMemberInfoByID($member_id, $fields = '*') {
        $member_info = rcache($member_id, 'member', $fields);
        if (empty($member_info)) {
            $member_info = $this->getMemberInfo(array('member_id' => $member_id), '*', true);
            wcache($member_id, $member_info, 'member');
        }
        return $member_info;
    }

    /**
     * 会员列表
     * @param array $condition
     * @param string $field
     * @param number $page
     * @param string $order
     */
    public function getMemberList($condition = array(), $field = '*', $page = 0, $order = 'member_id desc', $limit = '') {
        return $this->table('member')->where($condition)->page($page)->order($order)->limit($limit)->select();
    }

    /**
     * 会员数量
     * @param array $condition
     * @return int
     */
    public function getMemberCount($condition) {
        return $this->table('member')->where($condition)->count();
    }

    /**
     * 编辑会员
     * @param array $condition
     * @param array $data
     */
    public function editMember($condition, $data) {
        $update = $this->table('member')->where($condition)->update($data);
        if ($update && $condition['member_id']) {
            dcache($condition['member_id'], 'member');
        }
        return $update;
    }

    /**
     * 登录时创建会话SESSION
     *
     * @param array $member_info 会员信息
     */
    public function createSession($member_info = array(), $reg = false) {
        if (empty($member_info) || !is_array($member_info))
            return;

        $_SESSION['is_login'] = '1';
        $_SESSION['member_id'] = $member_info['member_id'];
        $_SESSION['member_name'] = $member_info['member_name'];
        $_SESSION['member_email'] = $member_info['member_email'];
        $_SESSION['is_buy'] = isset($member_info['is_buy']) ? $member_info['is_buy'] : 1;
        $_SESSION['avatar'] = $member_info['member_avatar'];

        $seller_info = Model('seller')->getSellerInfo(array('member_id' => $_SESSION['member_id']));
        $_SESSION['store_id'] = $seller_info['store_id'];

        if (trim($member_info['member_qqopenid'])) {
            $_SESSION['openid'] = $member_info['member_qqopenid'];
        }
        if (trim($member_info['member_sinaopenid'])) {
            $_SESSION['slast_key']['uid'] = $member_info['member_sinaopenid'];
        }

        if (!$reg) {
            //添加会员积分
            $this->addPoint($member_info);
            //添加会员经验值
            $this->addExppoint($member_info);
        }

        if (!empty($member_info['member_login_time'])) {
            $update_info = array(
                'member_login_num' => ($member_info['member_login_num'] + 1),
                'member_login_time' => TIMESTAMP,
                'member_old_login_time' => $member_info['member_login_time'],
                'member_login_ip' => getIp(),
                'member_old_login_ip' => $member_info['member_login_ip']
            );
            $this->editMember(array('member_id' => $member_info['member_id']), $update_info);
        }
        setNcCookie('cart_goods_num', '', -3600);
    }

    /**
     * 注册
     */
    public function register($register_info) {
        // 注册验证
        $obj_validate = new Validate();
        $obj_validate->validateparam = array(
            array("input" => $register_info["username"], "require" => "true", "message" => '用户名不能为空'),
            array("input" => $register_info["password"], "require" => "true", "message" => '密码不能为空'),
            array("input" => $register_info["password_confirm"], "require" => "true", "validator" => "Compare", "operator" => "==", "to" => $register_info["password"], "message" => '密码与确认密码不相同'),
                //array("input"=>$register_info["email"],			"require"=>"true",		"validator"=>"email", "message"=>'电子邮件格式不正确'),
        );
        $error = $obj_validate->validate();
        if ($error != '') {
            return array('error' => $error);
        }

        // 验证用户名是否重复
        $check_member_name = $this->getMemberInfo(array('member_name' => $register_info['username']));
        if (is_array($check_member_name) and count($check_member_name) > 0) {
            return array('error' => '用户名已存在');
        }

        // 验证邮箱是否重复
        $check_member_email = $this->getMemberInfo(array('member_email' => $register_info['email']));
        if (is_array($check_member_email) and count($check_member_email) > 0) {
            return array('error' => '邮箱已存在');
        }
        //互亿无线插件 start - 验证手机号是否存在
        $check_member_mobile = $this->getMemberInfo(array('member_mobile' => $register_info['mobile']));
        if (is_array($check_member_mobile) and count($check_member_mobile) > 0) {
            return array('error' => '手机号码已经存在');
        }
        //互亿无线插件 end   -验证手机号是否存在
        // 会员添加
        $member_info = array();
        $member_info['member_name'] = $register_info['username'];
        $member_info['member_passwd'] = $register_info['password'];
        $member_info['member_email'] = $register_info['email'];
        //互亿无线插件 start - 添加到数据库
        $member_info['member_mobile'] = $register_info['mobile']; //手机号
        $member_info['member_mobile_bind'] = 1;  //1 注册验证后自动绑定手机  0 不绑定
        $member_info['member_type'] = $register_info['member_type']; //用户的注册类型
        //互亿无线插件 end - 添加到数据库
        $insert_id = $this->addMember($member_info);
        if ($insert_id) {
            //添加会员积分
            if (C('points_isuse')) {
                Model('points')->savePointsLog('regist', array('pl_memberid' => $insert_id, 'pl_membername' => $register_info['username']), false);
            }

            // 添加默认相册
            $insert['ac_name'] = '买家秀';
            $insert['member_id'] = $insert_id;
            $insert['ac_des'] = '买家秀默认相册';
            $insert['ac_sort'] = 1;
            $insert['is_default'] = 1;
            $insert['upload_time'] = TIMESTAMP;
            $this->table('sns_albumclass')->insert($insert);

            $member_info['member_id'] = $insert_id;
            $member_info['is_buy'] = 1;

            return $member_info;
        } else {
            return array('error' => '注册失败');
        }
    }

    /**
     * 注册商城会员
     *
     * @param	array $param 会员信息
     * @return	array 数组格式的返回结果
     */
    public function addMember($param) {
        if (empty($param)) {
            return false;
        }
        try {
            $this->beginTransaction();
            $member_info = array();
            $member_info['member_id'] = $param['member_id'];
            $member_info['member_name'] = $param['member_name'];
            $member_info['member_passwd'] = md5(trim($param['member_passwd']));
            $member_info['member_email'] = $param['member_email'];
            $member_info['member_time'] = TIMESTAMP;
            $member_info['member_login_time'] = TIMESTAMP;
            $member_info['member_old_login_time'] = TIMESTAMP;
            $member_info['member_login_ip'] = getIp();
            $member_info['member_old_login_ip'] = $member_info['member_login_ip'];

            $member_info['member_truename'] = $param['member_truename'];
            $member_info['member_qq'] = $param['member_qq'];
            $member_info['member_sex'] = $param['member_sex'];
            $member_info['member_avatar'] = $param['member_avatar'];
            $member_info['member_qqopenid'] = $param['member_qqopenid'];
            $member_info['member_qqinfo'] = $param['member_qqinfo'];
            $member_info['member_sinaopenid'] = $param['member_sinaopenid'];
            $member_info['member_sinainfo'] = $param['member_sinainfo'];
            //互亿无线插件 start - 添加到数据库
            $member_info['member_mobile'] = $param['member_mobile'];
            $member_info['member_mobile_bind'] = $param['member_mobile_bind'];
            $member_info['member_type'] = $param['member_type'];
            //互亿无线插件 end - 添加到数据库
            $insert_id = $this->table('member')->insert($member_info);
            if (!$insert_id) {
                throw new Exception();
            }
            $insert = $this->addMemberCommon(array('member_id' => $insert_id));
            if (!$insert) {
                throw new Exception();
            }
            //查入用户自定义护展信息
            $_insert = $this->addMemberExpand(array('member_id' => $insert_id, 'tel'=> $param['tel']));
            if (!$_insert) {
                throw new Exception();
            }
            $this->commit();
            return $insert_id;
        } catch (Exception $e) {
            $this->rollback();
            return false;
        }
    }

    /**
     * 会员登录检查
     *
     */
    public function checkloginMember() {
        if ($_SESSION['is_login'] == '1') {
            @header("Location: index.php");
            exit();
        }
    }

    /**
     * 检查会员是否允许举报煤炭
     *
     */
    public function isMemberAllowInform($member_id) {
        $condition = array();
        $condition['member_id'] = $member_id;
        $member_info = $this->getMemberInfo($condition, 'inform_allow');
        if (intval($member_info['inform_allow']) === 1) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 取单条信息
     * @param unknown $condition
     * @param string $fields
     */
    public function getMemberCommonInfo($condition = array(), $fields = '*') {
        return $this->table('member_common')->where($condition)->field($fields)->find();
    }

    /**
     * 插入扩展表信息
     * @param unknown $data
     * @return Ambigous <mixed, boolean, number, unknown, resource>
     */
    public function addMemberCommon($data) {
        return $this->table('member_common')->insert($data);
    }

    /**
     * 编辑会员扩展表
     * @param unknown $data
     * @param unknown $condition
     * @return Ambigous <mixed, boolean, number, unknown, resource>
     */
    public function editMemberCommon($data, $condition) {
        return $this->table('member_common')->where($condition)->update($data);
    }

    /**
     * 添加会员积分
     * @param unknown $member_info
     */
    public function addPoint($member_info) {
        if (!C('points_isuse') || empty($member_info))
            return;

        //一天内只有第一次登录赠送积分
        if (trim(@date('Y-m-d', $member_info['member_login_time'])) == trim(date('Y-m-d')))
            return;

        //加入队列
        $queue_content = array();
        $queue_content['member_id'] = $member_info['member_id'];
        $queue_content['member_name'] = $member_info['member_name'];
        QueueClient::push('addPoint', $queue_content);
    }

    /**
     * 添加会员经验值
     * @param unknown $member_info
     */
    public function addExppoint($member_info) {
        if (empty($member_info))
            return;

        //一天内只有第一次登录赠送经验值
        if (trim(@date('Y-m-d', $member_info['member_login_time'])) == trim(date('Y-m-d')))
            return;

        //加入队列
        $queue_content = array();
        $queue_content['member_id'] = $member_info['member_id'];
        $queue_content['member_name'] = $member_info['member_name'];
        QueueClient::push('addExppoint', $queue_content);
    }

    /**
     * 取得会员安全级别
     * @param unknown $member_info
     */
    public function getMemberSecurityLevel($member_info = array()) {
        $tmp_level = 0;
        if ($member_info['member_email_bind'] == '1') {
            $tmp_level += 1;
        }
        if ($member_info['member_mobile_bind'] == '1') {
            $tmp_level += 1;
        }
        if ($member_info['member_paypwd'] != '') {
            $tmp_level += 1;
        }
        return $tmp_level;
    }

    /**
     * 获得会员等级
     * @param bool $show_progress 是否计算其当前等级进度
     * @param int $exppoints  会员经验值
     * @param array $cur_level 会员当前等级
     */
    public function getMemberGradeArr($show_progress = false, $exppoints = 0, $cur_level = '') {
        $member_grade = C('member_grade') ? unserialize(C('member_grade')) : array();
        //处理会员等级进度
        if ($member_grade && $show_progress) {
            $is_max = false;
            if ($cur_level === '') {
                $cur_gradearr = $this->getOneMemberGrade($exppoints, false, $member_grade);
                $cur_level = $cur_gradearr['level'];
            }
            foreach ($member_grade as $k => $v) {
                if ($cur_level == $v['level']) {
                    $v['is_cur'] = true;
                }
                $member_grade[$k] = $v;
            }
        }
        return $member_grade;
    }

    /**
     * 获得某一会员等级
     * @param int $exppoints
     * @param bool $show_progress 是否计算其当前等级进度
     * @param array $member_grade 会员等级
     */
    public function getOneMemberGrade($exppoints, $show_progress = false, $member_grade = array()) {
        if (!$member_grade) {
            $member_grade = C('member_grade') ? unserialize(C('member_grade')) : array();
        }
        if (empty($member_grade)) {//如果会员等级设置为空
            $grade_arr['level'] = -1;
            $grade_arr['level_name'] = '暂无等级';
            return $grade_arr;
        }

        $exppoints = intval($exppoints);

        $grade_arr = array();
        if ($member_grade) {
            foreach ($member_grade as $k => $v) {
                if ($exppoints >= $v['exppoints']) {
                    $grade_arr = $v;
                }
            }
        }
        //计算提升进度
        if ($show_progress == true) {
            if (intval($grade_arr['level']) >= (count($member_grade) - 1)) {//如果已达到顶级会员
                $grade_arr['downgrade'] = $grade_arr['level'] - 1; //下一级会员等级
                $grade_arr['downgrade_name'] = $member_grade[$grade_arr['downgrade']]['level_name'];
                $grade_arr['downgrade_exppoints'] = $member_grade[$grade_arr['downgrade']]['exppoints'];
                $grade_arr['upgrade'] = $grade_arr['level']; //上一级会员等级
                $grade_arr['upgrade_name'] = $member_grade[$grade_arr['upgrade']]['level_name'];
                $grade_arr['upgrade_exppoints'] = $member_grade[$grade_arr['upgrade']]['exppoints'];
                $grade_arr['less_exppoints'] = 0;
                $grade_arr['exppoints_rate'] = 100;
            } else {
                $grade_arr['downgrade'] = $grade_arr['level']; //下一级会员等级
                $grade_arr['downgrade_name'] = $member_grade[$grade_arr['downgrade']]['level_name'];
                $grade_arr['downgrade_exppoints'] = $member_grade[$grade_arr['downgrade']]['exppoints'];
                $grade_arr['upgrade'] = $member_grade[$grade_arr['level'] + 1]['level']; //上一级会员等级
                $grade_arr['upgrade_name'] = $member_grade[$grade_arr['upgrade']]['level_name'];
                $grade_arr['upgrade_exppoints'] = $member_grade[$grade_arr['upgrade']]['exppoints'];
                $grade_arr['less_exppoints'] = $grade_arr['upgrade_exppoints'] - $exppoints;
                $grade_arr['exppoints_rate'] = round(($exppoints - $member_grade[$grade_arr['level']]['exppoints']) / ($grade_arr['upgrade_exppoints'] - $member_grade[$grade_arr['level']]['exppoints']) * 100, 2);
            }
        }
        return $grade_arr;
    }
    
    
    /**
     * 插入扩展表信息
     * @param unknown $data
     * @return 
     */
    public function addMemberExpand($data) {
        return $this->table('member_expand')->insert($data);
    }    
    
    
    /**
     * 修改扩展表信息
     * @param unknown $data
     * @return 
     */  
    public function updateMemberExpand($data){
        $data['create_uid'] = $data['modify_uid'] = $_SESSION['member_id'];
        $info = Model('member_expand')->where(array("member_id"=>$data['member_id']))->find();
        if(!empty($info)){
            $data['modify_datetime'] =  date("Y-m-d H:i:s",time());
            return $this->table('member_expand')->where(array("member_id"=>$data['member_id']))->update($data);
        }else{
            $data['modify_datetime'] = $data['create_datetime'] = date("Y-m-d H:i:s",time());
            return $this->addMemberExpand($data);
        }
    }
    
    /**
     * 会员扩展信息列表
     */
    public function getMemberExpandList($condition = array(), $field = 'member_expand.*, member.member_name, member.member_avatar, member.member_type, member.is_expand', $page = 0, $order = 'member_expand.modify_datetime desc', $limit = '') {
        return  $this->table('member_expand,member')
                    ->join("inner")
                    ->on("member.member_id=member_expand.member_id")
                    ->where($condition)->page($page)->order($order)->limit($limit)->select();
    }    
    
    
    /**
     * 会员扩展信息
     */
    public function getMemberExpandInfo($condition = array(), $field = 'member_expand.*, member.member_name, member.member_avatar, member.member_type, member.is_expand') {
        return  $this->table('member_expand,member')
                    ->join("inner")
                    ->on("member.member_id=member_expand.member_id")
                    ->where($condition)->find();
    }      
    
    /**
     * 审核会员扩展信息
     */
    public function updateMemberExpandAudit($memberId, $data){
        return $this->table("member_expand")->where("member_id='{$memberId}'")->update($data);
    }
    
    
    /**
     * 修改member表中扩展信息是否完成的值
     */
    public function updateMemberIsExpand($memberId, $isExpand){
        return $this->table("member")->where("member_id='{$memberId}'")->update(array("	is_expand"=>$isExpand));
    }
}
