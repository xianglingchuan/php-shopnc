<?php
/**
 * 店铺扩展模型
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
class store_extendModel extends Model {
    public function __construct(){
        parent::__construct('store_extend');
    }

    /**
	 * 查询店铺扩展信息
     *
	 * @param int $store_id 店铺编号
	 * @param string $field 查询字段
     * @return array
	 */
    public function getStoreExtendInfo($condition, $field = '*') {
        return $this->field($field)->where($condition)->find();
    }

	/*
	 * 编辑店铺扩展信息
     *
	 * @param array $update 更新信息
	 * @param array $condition 条件
	 * @return bool
	 */
    public function editStoreExtend($update, $condition){
        return $this->where($condition)->update($update);
    }

    /*
     * 删除店铺扩展信息
     */
    public function delStoreExtend($condition)
    {
        return $this->where($condition)->delete();
    }
}
