<?php
/**
 * 邮件任务队列模型
 *
 * @copyright  Copyright (c) 2007-2013 ShopNC Inc. (http://www.shopnc.net)
 * @license    http://www.shopnc.net
 * @link       http://www.shopnc.net
 * @since      File available since Release v1.1
 */
defined('InShopNC') or exit('Access Invalid!');
class mail_cronModel extends Model{
    public function __construct() {
        parent::__construct('mail_cron');
    }
    /**
     * 新增企业消息任务计划
     * @param unknown $insert
     */
    public function addMailCron($insert) {
        return $this->insert($insert);
    }
    /**
     * 查看企业消息任务计划
     * 
     * @param unknown $condition
     * @param number $limit
     */
    public function getMailCronList($condition, $limit = 0, $order = 'mail_id asc') {
        return $this->where($condition)->limit($limit)->order($order)->select();
    }
    
    /**
     * 删除企业消息任务计划
     * @param unknown $condition
     */
    public function delMailCron($condition) {
        return $this->where($condition)->delete();
    }
}