<?php defined('InShopNC') or exit('Access Invalid!'); ?>
<link href="<?php echo SHOP_TEMPLATES_URL; ?>/css/index.css" rel="stylesheet" type="text/css">
<!--<script type="text/javascript" src="<?php echo SHOP_RESOURCE_SITE_URL; ?>/js/home_index.js" charset="utf-8"></script>-->
<!--[if IE 6]>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL; ?>/js/ie6.js" charset="utf-8"></script>
<![endif]-->
<link type="text/css" rel="Stylesheet" media="screen" href="<?php echo SHOP_SITE_URL; ?>/resource/css/slideshow.css"/>
<link rel="stylesheet" type="text/css" href="<?php echo SHOP_SITE_URL; ?>/resource/index12345_files/home.css"/>
<link rel="stylesheet" type="text/css" href="<?php echo SHOP_SITE_URL; ?>/resource/index12345_files/tehuihuodong.css"/>

<link type="text/css" rel="stylesheet" media="screen" href="<?php echo SHOP_SITE_URL; ?>/resource/css/swiper.min.css"/>
<link type="text/css" rel="Stylesheet" media="screen" href="<?php echo SHOP_SITE_URL; ?>/resource/css/base.css"/>
<link type="text/css" rel="Stylesheet" media="screen" href="<?php echo SHOP_SITE_URL; ?>/resource/css/homepage.css"/>
<link type="text/css" rel="Stylesheet" media="screen" href="<?php echo SHOP_SITE_URL; ?>/resource/css/main.css"/>
<link rel="stylesheet" type="text/css" href="<?php echo SHOP_SITE_URL; ?>/resource/css/slick.css"/>
<link rel="stylesheet" type="text/css" href="<?php echo SHOP_SITE_URL; ?>/resource/css/slick-theme.css"/>


<link rel="stylesheet" href="<?php echo SHOP_TEMPLATES_URL; ?>/indexnew/css/bootstrap.min.css">
<link rel="stylesheet" href="<?php echo SHOP_TEMPLATES_URL; ?>/indexnew/css/public.css">
<link rel="stylesheet" href="<?php echo SHOP_TEMPLATES_URL; ?>/indexnew/css/home.css">
<body>
    <?php

    function getGoodsAttr($goodsAttr, $name) {
        if (!empty($goodsAttr)) {
            foreach ($goodsAttr as $buf) {
                $val = array_values($buf);
                if ($val[0] == $name) {
                    return $val[1];
                }
            }
        }
        return array();
    }
    ?>
    <div class="x_nav01"> 
        <div class="container">
            <div class="pull-left">
                <div class="pull-left x_pull_left" id="module_dynamic">
                    <ul>
                        <li class="x_active" data-id="zh"><span>找煤碳</span></li>
                        <li data-id="zwl"><span>找物流</span></li>
                        <li data-id="qht"><span>签合同</span></li>
                    </ul>
                </div>
                <div class="pull-left x_pullw myShow" id="model_content_zh">
                    <div class="pull_top" id="search_dynamic">
                        <ul>
                            <li class="x_p_active" data-id="3">动力煤</li>
                            <li data-id="2">炼焦煤</li>
                            <li data-id="4">无烟煤</li>
                        </ul>
                        <form id="search_form" class="form-inline row" method="POST" cate_id="3" action="<?php echo urlShop('search', 'index', array('cate_id' => 2)); ?>">
                            <div id="search_form_3" class="myShow">
                                <div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-4 class_add">
                                    <label for="exampleInputEmail02">地区</label>
                                    <select class="form-control">
                                        <option value="0">全国</option>
                                        <?php
                                        $address = getGoodsAttr($goodsAttr['dlm'], "所在地");
                                        if (!empty($address)) {
                                            foreach ($address as &$_tmp) {
                                                echo "<option value='" . $_tmp['attr_value_id'] . "'>" . $_tmp['attr_value_name'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-4 class_add">
                                    <label for="exampleInputEmail02">煤种</label>
                                    <select class="form-control">
                                        <option value="0">所有</option>
                                        <?php
                                        $vals = getGoodsAttr($goodsAttr['dlm'], "煤种");
                                        if (!empty($vals)) {
                                            foreach ($vals as &$_tmp) {
                                                echo "<option value='" . $_tmp['attr_value_id'] . "'>" . $_tmp['attr_value_name'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>


                                <div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-4 class_add">
                                    <label for="exampleInputEmail02">粒度</label>
                                    <select class="form-control">
                                        <option value="0">所有</option>
                                        <?php
                                        $vals = getGoodsAttr($goodsAttr['dlm'], "粒度");
                                        if (!empty($vals)) {
                                            foreach ($vals as &$_tmp) {
                                                echo "<option value='" . $_tmp['attr_value_id'] . "'>" . $_tmp['attr_value_name'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-4 class_add">
                                    <label for="exampleInputEmail02">灰份</label>
                                    <select class="form-control">
                                        <option value="0">所有</option>
                                        <?php
                                        $vals = getGoodsAttr($goodsAttr['dlm'], "灰份");
                                        if (!empty($vals)) {
                                            foreach ($vals as &$_tmp) {
                                                echo "<option value='" . $_tmp['attr_value_id'] . "'>" . $_tmp['attr_value_name'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>


                                <div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-4 class_add">
                                    <label for="exampleInputEmail02">水分</label>
                                    <select class="form-control">
                                        <option value="0">所有</option>
                                        <?php
                                        $vals = getGoodsAttr($goodsAttr['dlm'], "水分");
                                        if (!empty($vals)) {
                                            foreach ($vals as &$_tmp) {
                                                echo "<option value='" . $_tmp['attr_value_id'] . "'>" . $_tmp['attr_value_name'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>


                                <div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-4 class_add">
                                    <label for="exampleInputEmail02">热量</label>
                                    <select class="form-control">
                                        <option value="0">所有</option>
                                        <?php
                                        $vals = getGoodsAttr($goodsAttr['dlm'], "发热量");
                                        if (!empty($vals)) {
                                            foreach ($vals as &$_tmp) {
                                                echo "<option value='" . $_tmp['attr_value_id'] . "'>" . $_tmp['attr_value_name'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>
                            </div>

                            <div id="search_form_2" class="myHidden">
                                <div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-4 class_add">
                                    <label for="exampleInputEmail02">地区</label>
                                    <select class="form-control">
                                        <option value="0">全国</option>
                                        <?php
                                        $address = getGoodsAttr($goodsAttr['ljm'], "所在地");
                                        if (!empty($address)) {
                                            foreach ($address as &$_tmp) {
                                                echo "<option value='" . $_tmp['attr_value_id'] . "'>" . $_tmp['attr_value_name'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-4 class_add">
                                    <label for="exampleInputEmail02">煤种</label>
                                    <select class="form-control">
                                        <option value="0">所有</option>
                                        <?php
                                        $vals = getGoodsAttr($goodsAttr['ljm'], "煤种");
                                        if (!empty($vals)) {
                                            foreach ($vals as &$_tmp) {
                                                echo "<option value='" . $_tmp['attr_value_id'] . "'>" . $_tmp['attr_value_name'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>


                                <div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-4 class_add">
                                    <label for="exampleInputEmail02">粒度</label>
                                    <select class="form-control">
                                        <option value="0">所有</option>
                                        <?php
                                        $vals = getGoodsAttr($goodsAttr['ljm'], "粒度");
                                        if (!empty($vals)) {
                                            foreach ($vals as &$_tmp) {
                                                echo "<option value='" . $_tmp['attr_value_id'] . "'>" . $_tmp['attr_value_name'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-4 class_add">
                                    <label for="exampleInputEmail02">灰份</label>
                                    <select class="form-control">
                                        <option value="0">所有</option>
                                        <?php
                                        $vals = getGoodsAttr($goodsAttr['ljm'], "灰份");
                                        if (!empty($vals)) {
                                            foreach ($vals as &$_tmp) {
                                                echo "<option value='" . $_tmp['attr_value_id'] . "'>" . $_tmp['attr_value_name'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>


                                <div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-4 class_add">
                                    <label for="exampleInputEmail02">水分</label>
                                    <select class="form-control">
                                        <option value="0">所有</option>
                                        <?php
                                        $vals = getGoodsAttr($goodsAttr['ljm'], "水分");
                                        if (!empty($vals)) {
                                            foreach ($vals as &$_tmp) {
                                                echo "<option value='" . $_tmp['attr_value_id'] . "'>" . $_tmp['attr_value_name'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>


                                <div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-4 class_add">
                                    <label for="exampleInputEmail02">热量</label>
                                    <select class="form-control">
                                        <option value="0">所有</option>
                                        <?php
                                        $vals = getGoodsAttr($goodsAttr['ljm'], "发热量");
                                        if (!empty($vals)) {
                                            foreach ($vals as &$_tmp) {
                                                echo "<option value='" . $_tmp['attr_value_id'] . "'>" . $_tmp['attr_value_name'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>
                            </div>

                            <div id="search_form_4" class="myHidden">
                                <div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-4 class_add">
                                    <label for="exampleInputEmail02">地区</label>
                                    <select class="form-control">
                                        <option value="0">全国</option>
                                        <?php
                                        $address = getGoodsAttr($goodsAttr['wym'], "所在地");
                                        if (!empty($address)) {
                                            foreach ($address as &$_tmp) {
                                                echo "<option value='" . $_tmp['attr_value_id'] . "'>" . $_tmp['attr_value_name'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-4 class_add">
                                    <label for="exampleInputEmail02">煤种</label>
                                    <select class="form-control">
                                        <option value="0">所有</option>
                                        <?php
                                        $vals = getGoodsAttr($goodsAttr['wym'], "煤种");
                                        if (!empty($vals)) {
                                            foreach ($vals as &$_tmp) {
                                                echo "<option value='" . $_tmp['attr_value_id'] . "'>" . $_tmp['attr_value_name'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>


                                <div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-4 class_add">
                                    <label for="exampleInputEmail02">粒度</label>
                                    <select class="form-control">
                                        <option value="0">所有</option>
                                        <?php
                                        $vals = getGoodsAttr($goodsAttr['wym'], "粒度");
                                        if (!empty($vals)) {
                                            foreach ($vals as &$_tmp) {
                                                echo "<option value='" . $_tmp['attr_value_id'] . "'>" . $_tmp['attr_value_name'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-4 class_add">
                                    <label for="exampleInputEmail02">灰份</label>
                                    <select class="form-control">
                                        <option value="0">所有</option>
                                        <?php
                                        $vals = getGoodsAttr($goodsAttr['wym'], "灰份");
                                        if (!empty($vals)) {
                                            foreach ($vals as &$_tmp) {
                                                echo "<option value='" . $_tmp['attr_value_id'] . "'>" . $_tmp['attr_value_name'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>


                                <div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-4 class_add">
                                    <label for="exampleInputEmail02">水分</label>
                                    <select class="form-control">
                                        <option value="0">所有</option>
                                        <?php
                                        $vals = getGoodsAttr($goodsAttr['wym'], "水分");
                                        if (!empty($vals)) {
                                            foreach ($vals as &$_tmp) {
                                                echo "<option value='" . $_tmp['attr_value_id'] . "'>" . $_tmp['attr_value_name'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>


                                <div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-4 class_add">
                                    <label for="exampleInputEmail02">热量</label>
                                    <select class="form-control">
                                        <option value="0">所有</option>
                                        <?php
                                        $vals = getGoodsAttr($goodsAttr['wym'], "发热量");
                                        if (!empty($vals)) {
                                            foreach ($vals as &$_tmp) {
                                                echo "<option value='" . $_tmp['attr_value_id'] . "'>" . $_tmp['attr_value_name'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>
                            </div>
<!--                            <div class="form-group col-xs-8 col-sm-8 col-md-8 col-lg-8 class_add" style=" margin-top: 18px;">
                                <label for="exampleInputEmail03">名称</label>
                                <input type="text" style="width:250px;" name="search_keyword" class="form-control" id="search_keyword">
                            </div>-->

                            <button type="button" onclick="searchSubmit('<?php echo SHOP_SITE_URL; ?>')" class="btn x_btn">搜索</button>

                        </form>

                    </div>
                </div>

                <div class="pull-left x_pullw myHidden" id="model_content_zwl">
                    <div class="pull_top" id="search_dynamic">
                        <div style="height: 180px; line-height: 50px; font-size: 14px;">
                            正在开发中......
                        </div>
                    </div>
                </div>

                <div class="pull-left x_pullw myHidden" id="model_content_qht">
                    <div class="pull_top" id="search_dynamic">
                        <div style="height: 180px;line-height: 50px; font-size: 14px;">
                            正在开发中......
                        </div>
                    </div>
                </div>                


            </div>
        </div>
    </div>


    <div class="x_pull_list">
        <div class="container">
            <div class="row">
                <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                    <div class="x_pull_top">
                        <span>调价动态</span>
                        <div class="pull-right list_li" id="price_dynamic">
                            <ul>
                                <li class="x_p_active" data-id="3">动力煤</li>
                                <li data-id="2">炼焦煤</li>
                                <li data-id="4">无烟煤</li>
                            </ul>
                        </div>
                    </div>
                    <!---动力煤_start-->
                    <div class="row x_all_dong myShow" id="data_content_3">
                        <?php
                        if (!empty($goodsList['dlm'])) {
                            foreach ($goodsList['dlm'] as &$tmp) {
                                ?>    
                                <a href="<?php echo urlShop('goods', 'index', array('goods_id' => $tmp['goods_id'])); ?>" class="col-xs-2 col-sm-2 col-md-2 col-lg-2 x_dong_list">
                                    <h3><?php echo $tmp['store_name']; ?></h3>
                                    <div class="x_price">
                                        <i class="x_green">￥<?php echo $tmp['goods_price']; ?></i>
                                        <span>价格<span class="glyphicon glyphicon-triangle-bottom x_green"></span></span>
                                    </div>
                                    <div class="x_class">
                                        <b>动力煤</b>
                                        <span>材质</span>
                                    </div>
                                </a>
                                <?php
                            }
                        }
                        ?>   
                    </div>
                    <!---动力煤_end-->

                    <!---炼焦煤_start-->
                    <div class="row x_all_dong myHidden" id="data_content_2">
                        <?php
                        if (!empty($goodsList['ljm'])) {
                            foreach ($goodsList['ljm'] as &$tmp) {
                                ?>    
                                <a href="<?php echo urlShop('goods', 'index', array('goods_id' => $tmp['goods_id'])); ?>" class="col-xs-2 col-sm-2 col-md-2 col-lg-2 x_dong_list">
                                    <h3><?php echo $tmp['store_name']; ?></h3>
                                    <div class="x_price">
                                        <i class="x_green">￥<?php echo $tmp['goods_price']; ?></i>
                                        <span>价格<span class="glyphicon glyphicon-triangle-bottom x_green"></span></span>
                                    </div>
                                    <div class="x_class">
                                        <b>炼焦煤</b>
                                        <span>材质</span>
                                    </div>
                                </a>
                                <?php
                            }
                        }
                        ?>  
                    </div>
                    <!---炼焦煤_end-->


                    <!---无烟煤_start-->
                    <div class="row x_all_dong myHidden" id="data_content_4">
                        <?php
                        if (!empty($goodsList['wym'])) {
                            foreach ($goodsList['wym'] as &$tmp) {
                                ?>    
                                <a href="<?php echo urlShop('goods', 'index', array('goods_id' => $tmp['goods_id'])); ?>" class="col-xs-2 col-sm-2 col-md-2 col-lg-2 x_dong_list">
                                    <h3><?php echo $tmp['store_name']; ?></h3>
                                    <div class="x_price">
                                        <i class="x_green">￥<?php echo $tmp['goods_price']; ?></i>
                                        <span>价格<span class="glyphicon glyphicon-triangle-bottom x_green"></span></span>
                                    </div>
                                    <div class="x_class">
                                        <b>无烟煤</b>
                                        <span>材质</span>
                                    </div>
                                </a>
                                <?php
                            }
                        }
                        ?>   
                    </div>
                    <!---无烟煤_end-->


                    <div class="x_recommend">
                        <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/recommend.png">
                        <a href="<?php echo SHOP_SITE_URL; ?>/cate-3-0-0-0-0-0-0-0-0.html"><img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/recommend01.png"></a>
                        <a href="<?php echo SHOP_SITE_URL; ?>/cate-4-0-0-0-0-0-0-0-0.html"><img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/recommend02.png"></a>
                        <a href="<?php echo SHOP_SITE_URL; ?>/cate-2-0-0-0-0-0-0-0-0.html"><img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/recommend03.png"></a> 							
                    </div>
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    <div class="x_col_right">
                        <div class="col_right_list"> 
                            <div class="col_top">
                                <i>昨天服务人数</i>
                                <b>2540</b>
                                <span>位</span>
                            </div>
                            <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/person.png">							
                        </div>
                        <div class="col_right_list"> 
                            <div class="col_top">
                                <i>昨天服务人数</i>
                                <b>2540</b>
                                <span>位</span>
                            </div>
                            <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/person01.png">							
                        </div>
                        <div class="col_right_list row"> 
                            <div class="col_left col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <div class="col_left_x">
                                    <i>动力煤</i>
                                    <span>昨天成交</span>
                                </div>								
                                <b>2540.12</b>
                                <span>吨</span>
                            </div>	
                            <div class="col_left col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <div class="col_left_x">
                                    <i>动力煤</i>
                                    <span>昨天成交</span>
                                </div>								
                                <b>2540.12</b>
                                <span>吨</span>
                            </div>
                            <div class="col_left col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <div class="col_left_x">
                                    <i>动力煤</i>
                                    <span>昨天成交</span>
                                </div>								
                                <b>2540.12</b>
                                <span>吨</span>
                            </div>	
                            <div class="col_left col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <div class="col_left_x">
                                    <i>动力煤</i>
                                    <span>昨天成交</span>
                                </div>								
                                <b>2540.12</b>
                                <span>吨</span>
                            </div>				
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>




    <?php if (!empty($output['brand_c'])) { ?>
        <?php
        $i = 0;
        foreach ($output['brand_c'] as $key => $brand_c) {
            $i++;
            ?>    
            <div class="x_pull_list">
                <div class="container">
                    <div class="x_pull_top2">
                        <span>煤炭企业</span>
                    </div>	
                    <div class="x_carousel">
                        <div class="rollBox">   
                            <div class="LeftBotton_home" onmousedown="ISL_GoUp()" onmouseup="ISL_StopUp()" onmouseout="ISL_StopUp()"></div>   
                            <div class="Cont" id="ISL_Cont">   
                                <div class="ScrCont">   
                                    <div id="List1" class="row item_row"> 
                                        <?php if ($brand_c['image']) { ?>
            <?php foreach ($brand_c['image'] as $key => $brand) { ?>
                                                <a  href="<?php echo urlShop('brand', 'list', array('brand' => $brand['brand_id'])); ?>" class="pic">
                                                    <img src="<?php echo brandImage($brand['brand_pic']); ?>"></a>                         
                                            <?php } ?>
        <?php } ?>                                
                                        <!--                                <a  href="" class="pic">
                                                                            <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/re05.png">
                                                                        </a>
                                                                        <a  href="" class="pic">
                                                                            <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/re05.png">
                                                                        </a> 
                                                                        <a  href="" class="pic">
                                                                            <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/re05.png">
                                                                        </a>
                                                                        <a  href="" class="pic">
                                                                            <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/re05.png">
                                                                        </a> 
                                                                        <a  href="" class="pic">
                                                                            <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/re05.png">
                                                                        </a>
                                                                        <a  href="" class="pic">
                                                                            <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/re05.png">
                                                                        </a>
                                                                        <a  href="" class="pic">
                                                                            <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/re05.png">
                                                                        </a>-->
                                    </div>   
                                    <div id="List2"></div>   
                                </div>   
                            </div>   
                            <div class="RightBotton_home" onmousedown="ISL_GoDown()" onmouseup="ISL_StopDown()" onmouseout="ISL_StopDown()"></div>   
                        </div>            
                    </div>						
                </div>
            </div>
        <?php } ?>
<?php } ?>


    <div class="x_pull_list">
        <div class="container">
            <div class="x_pull_top2">
                <span>找物流</span>
            </div>	
            <div class="x_pull_container">
                <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/re101.png">
                <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/re102.png">
            </div>

        </div>
    </div>
    <div class="x_pull_list">
        <div class="container">
            <div class="x_pull_top2">
                <span>找合同</span>
            </div>	
            <div class="x_pull_container">
                <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/re111.png">
                <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/re112.png">
            </div>									
        </div>
    </div>



    <div class="x_relist">
        <div class="container">
            <div class="row x_relist_row">
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/relist120.png">
                    <span>免费找货找车</span>
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/relist121.png">
                    <span>商城煤企直供</span>
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/relist122.png">
                    <span>品种规格</span>
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/relist123.png">
                    <span>安全有效</span>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="<?php echo SHOP_TEMPLATES_URL; ?>/new/js/home.js"></script>