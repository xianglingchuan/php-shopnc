<?php
/**
 * 车辆监控中心首页
 *
 **/

defined('InShopNC') or exit('Access Invalid!');

class indexControl extends BaseDeliveryControl{
    public function __construct(){
        parent::__construct();
        @header('location: index.php?act=login');die;
    }
}

