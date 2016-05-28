<?php

/**
 * 默认展示页面
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

class indexControl extends BaseHomeControl {

    public function __construct() {
        parent::__construct();
        Tpl::output('hidden_nctoolbar', 1);
    }

    public function indexOp() {
        Tpl::output('hidden_nctoolbar', 1);
        Language::read('home_index_index');
        Tpl::output('index_sign', 'index');

        //团购专区
        Language::read('member_groupbuy');
        $model_groupbuy = Model('groupbuy');
        $group_list = $model_groupbuy->getGroupbuyCommendedList(4);
        Tpl::output('group_list', $group_list);

        //限时折扣
        $model_xianshi_goods = Model('p_xianshi_goods');
        $xianshi_item = $model_xianshi_goods->getXianshiGoodsCommendList(4);
        Tpl::output('xianshi_item', $xianshi_item);

        //板块信息
        $model_web_config = Model('web_config');
        $web_html = $model_web_config->getWebHtml('index');
        Tpl::output('web_html', $web_html);


        //获得企业列表
        $model = Model();
        $brand_c_list = $model->table('brand')->where(array('brand_apply' => '1'))->order('brand_sort asc')->select();
        $brands = $this->_tidyBrand($brand_c_list);
        extract($brands);
        Tpl::output('brand_c', $brand_listnew);
        
        //$storeList = $model->table('store')->where(array())->order('store_id DESC')->select();
        //var_dump($storeList);
        
        //调价动态
        $goodsList['dlm'] = $this->getGoodsListByCategoryId(3);//动力煤
        $goodsList['ljm'] = $this->getGoodsListByCategoryId(2);//练焦煤
        $goodsList['wym'] = $this->getGoodsListByCategoryId(4);//无烟煤
        Tpl::output('goodsList', $goodsList);
        
        
        //获得经过属性过滤的煤炭信息
        $this->_model_search = Model('search');
        list($goods_param_dlm, $brand_array_dlm, $attr_array_dlm, $checked_brand_dlm, $checked_attr_dlm) = $this->_model_search->getAttr($_GET, 3);//动力煤
        list($goods_param_ljm, $brand_array_ljm, $attr_array_ljm, $checked_brand_ljm, $checked_attr_ljm) = $this->_model_search->getAttr($_GET, 2);//练焦煤
        list($goods_param_wym, $brand_array_wym, $attr_array_wym, $checked_brand_wym, $checked_attr_wym) = $this->_model_search->getAttr($_GET, 4);//无烟煤
        $goodsAttr['dlm'] =  $attr_array_dlm;
        $goodsAttr['ljm'] =  $attr_array_dlm;
        $goodsAttr['wym'] =  $attr_array_dlm;
        Tpl::output('goodsAttr', $goodsAttr);
    

        Model('seo')->type('index')->show();
        Tpl::showpage('index');
    }

    //json输出煤炭分类
    public function josn_classOp() {
        /**
         * 实例化煤炭分类模型
         */
        $model_class = Model('goods_class');
        $goods_class = $model_class->getGoodsClassListByParentId(intval($_GET['gc_id']));
        $array = array();
        if (is_array($goods_class) and count($goods_class) > 0) {
            foreach ($goods_class as $val) {
                $array[$val['gc_id']] = array('gc_id' => $val['gc_id'], 'gc_name' => htmlspecialchars($val['gc_name']), 'gc_parent_id' => $val['gc_parent_id'], 'commis_rate' => $val['commis_rate'], 'gc_sort' => $val['gc_sort']);
            }
        }
        /**
         * 转码
         */
        if (strtoupper(CHARSET) == 'GBK') {
            $array = Language::getUTF8(array_values($array)); //网站GBK使用编码时,转换为UTF-8,防止json输出汉字问题
        } else {
            $array = array_values($array);
        }
        echo $_GET['callback'] . '(' . json_encode($array) . ')';
    }

    /**
     * json输出地址数组 原data/resource/js/area_array.js
     */
    public function json_areaOp() {
        echo $_GET['callback'] . '(' . json_encode(Model('area')->getAreaArrayForJson()) . ')';
    }

    //判断是否登录
    public function loginOp() {
        echo ($_SESSION['is_login'] == '1') ? '1' : '0';
    }

    /**
     * 头部最近浏览的煤炭
     */
    public function viewed_infoOp() {
        $info = array();
        if ($_SESSION['is_login'] == '1') {
            $member_id = $_SESSION['member_id'];
            $info['m_id'] = $member_id;
            if (C('voucher_allow') == 1) {
                $time_to = time(); //当前日期
                $info['voucher'] = Model()->table('voucher')->where(array('voucher_owner_id' => $member_id, 'voucher_state' => 1,
                            'voucher_start_date' => array('elt', $time_to), 'voucher_end_date' => array('egt', $time_to)))->count();
            }
            $time_to = strtotime(date('Y-m-d')); //当前日期
            $time_from = date('Y-m-d', ($time_to - 60 * 60 * 24 * 7)); //7天前
            $info['consult'] = Model()->table('consult')->where(array('member_id' => $member_id,
                        'consult_reply_time' => array(array('gt', strtotime($time_from)), array('lt', $time_to + 60 * 60 * 24), 'and')))->count();
        }
        $goods_list = Model('goods_browse')->getViewedGoodsList($_SESSION['member_id'], 5);
        if (is_array($goods_list) && !empty($goods_list)) {
            $viewed_goods = array();
            foreach ($goods_list as $key => $val) {
                $goods_id = $val['goods_id'];
                $val['url'] = urlShop('goods', 'index', array('goods_id' => $goods_id));
                $val['goods_image'] = thumb($val, 60);
                $viewed_goods[$goods_id] = $val;
            }
            $info['viewed_goods'] = $viewed_goods;
        }
        if (strtoupper(CHARSET) == 'GBK') {
            $info = Language::getUTF8($info);
        }
        echo json_encode($info);
    }

    /**
     * 查询每月的周数组
     */
    public function getweekofmonthOp() {
        import('function.datehelper');
        $year = $_GET['y'];
        $month = $_GET['m'];
        $week_arr = getMonthWeekArr($year, $month);
        echo json_encode($week_arr);
        die;
    }

    /**
     * 整理企业
     * 所有企业全部显示在一级类目下，不显示二三级类目
     * @param array $brand_c_list
     * @return array
     */
    private function _tidyBrand($brand_c_list) {
        $brand_listnew = array();
        $brand_class = array();
        $brand_r_list = array();
        if (!empty($brand_c_list) && is_array($brand_c_list)) {
            $goods_class = Model('goods_class')->getGoodsClassForCacheModel();
            foreach ($brand_c_list as $key => $brand_c) {
                $gc_array = $this->_getTopClass($goods_class, $brand_c['class_id']);
                if (empty($gc_array)) {
                    if ($brand_c['show_type'] == 1) {
                        $brand_listnew[0]['text'][] = $brand_c;
                    } else {
                        $brand_listnew[0]['image'][] = $brand_c;
                    }
                    $brand_class[0]['brand_class'] = '其他';
                } else {
                    if ($brand_c['show_type'] == 1) {
                        $brand_listnew[$gc_array['gc_id']]['text'][] = $brand_c;
                    } else {
                        $brand_listnew[$gc_array['gc_id']]['image'][] = $brand_c;
                    }
                    $brand_class[$gc_array['gc_id']]['brand_class'] = $gc_array['gc_name'];
                }
                //推荐企业
                if ($brand_c['brand_recommend'] == 1) {
                    $brand_r_list[] = $brand_c;
                }
            }
        }
        krsort($brand_class);
        krsort($brand_listnew);
        return array('brand_listnew' => $brand_listnew, 'brand_class' => $brand_class, 'brand_r_list' => $brand_r_list);
    }

    /**
     * 获取顶级煤炭分类
     * 递归调用
     * @param array $goods_class
     * @param int $gc_id
     * @return array
     */
    private function _getTopClass($goods_class, $gc_id) {
        if (!isset($goods_class[$gc_id])) {
            return null;
        }
        return $goods_class[$gc_id]['gc_parent_id'] == 0 ? $goods_class[$gc_id] : $this->_getTopClass($goods_class, $goods_class[$gc_id]['gc_parent_id']);
    }
    
    
    private function getGoodsListByCategoryId($categoryId, $order="goods_id asc", $limit=6){
        $model_goods = Model('goods');    
        if ($categoryId) {
            $goods_class = Model('goods_class')->getGoodsClassForCacheModel();
            $depth = $goods_class[$categoryId]['depth'];
            $condition['gc_id_'.$depth] = $categoryId;
        }
        $fields = "goods_id,goods_commonid,goods_name,goods_jingle,gc_id,store_id,store_name,goods_price,goods_promotion_price,goods_promotion_type,goods_marketprice,goods_storage,goods_image,goods_freight,goods_salenum,color_id,evaluation_good_star,evaluation_count,is_virtual,is_fcode,is_appoint,is_presell,have_gift";
        $goods_list = $model_goods->getGoodsListByColorDistinct($condition, $fields, $order, $limit);
        return $goods_list;
    }
}
