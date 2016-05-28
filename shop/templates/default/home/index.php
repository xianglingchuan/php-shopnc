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

<link href="<?php echo SHOP_TEMPLATES_URL; ?>/css/datouwang.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<?php echo SHOP_TEMPLATES_URL; ?>/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<?php echo SHOP_TEMPLATES_URL; ?>/js/koala.min.1.5.js"></script>
<!-- 导航菜单-->
<style type="text/css">
    .category {
        display: block !important;
    }
</style>
<!-- 导航菜单-->
<script type="text/javascript" src="/js/jquery-1.4.1.min.js?1011"></script>
<script type="text/javascript" src="/js/swiper.min.js"></script>
<script type="text/javascript" src="/js/jquery.kxbdmarquee.js"></script>
<script type="text/javascript" src="/js/slick.min.js"></script>

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
 
 <!-- 代码 开始 -->
<div id="focus" style="position: absolute;z-index: 1;">
<div id="fsD1" class="focus">  
    <div id="D1pic1" class="fPic">  
        <div class="fcon" style="display: none; background:url(http://www.zg03.com/shop/templates/default/images/b001.jpg) center 0 no-repeat;"></div>
        <div class="fcon" style="display: none; background:url(http://www.zg03.com/shop/templates/default/images/b002.jpg) center 0 no-repeat;"></div>
        <div class="fcon" style="display: none; background:url(http://www.zg03.com/shop/templates/default/images/b003.jpg) center 0 no-repeat;"></div> 

    </div>
    
    <div class="fbg">  
        <div class="D1fBt" id="D1fBt">  
            <a href="javascript:void(0)" hidefocus="true" target="_self" class=""><i>1</i></a>  
            <a href="javascript:void(0)" hidefocus="true" target="_self" class=""><i>2</i></a>  
            <a href="javascript:void(0)" hidefocus="true" target="_self" class="current"><i>3</i></a>

        </div>  
    </div> 
  
</div>  

</div>


<div style="position: relative;width:1200px;border:0px #000 solid;text-align: center;margin: 0 auto;height: 280px;z-index: 999;">
	<div style="width: 250px;height: 88px;float:right;border:0px #000 solid;z-index: 999;margin-top: 98px;/* line-height: 280px; */">
      <div style=" width:100%; text-align: center; background-color:#fff; height:88px; /* margin-top: 8px; */opacity: 0.95;">
                        <div class="w" style="padding: 10px;vertical-align: middle;">
                            <img src="/shop/templates/default/images/meiqiruzhu.png" style="float: left; width: 60px; margin-top: 5px;  ">

                            <div style="float:left;padding-top: 10px; width: 150px;">
                                <a href="/shop/index.php?act=show_joinin&amp;op=index" title="煤炭企业申请入驻；已提交申请，可查看当前审核状态。" target="_blank" style="color: #706f6f;font-size:20px;display: block;">煤企入驻</a>
                                <span style="color:#a6a6a6; font-family:arial; font-size:12px; display: block;clear: both;padding-top:5px;">COAL ENTERPRISE SETTLED</span>
                            </div>
                    </div></div>
  </div>
</div>



<script type="text/javascript">
	Qfast.add('widgets', { path: "<?php echo SHOP_TEMPLATES_URL; ?>/js/terminator2.2.min.js", type: "js", requires: ['fx'] });  
	Qfast(false, 'widgets', function () {
		K.tabs({
			id: 'fsD1',   //焦点图包裹id  
			conId: "D1pic1",  //** 大图域包裹id  
			tabId:"D1fBt",  
			tabTn:"a",
			conCn: '.fcon', //** 大图域配置class       
			auto: 1,   //自动播放 1或0
			effect: 'fade',   //效果配置
			eType: 'mouseover', //** 鼠标事件
			pageBt:true,//是否有按钮切换页码
			bns: ['.prev', '.next'],//** 前后按钮配置class                          
			interval: 3000  //** 停顿时间  
		}) 
	})  
</script>
<!-- 代码 结束 -->
 
 <!-- 
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
                          <div class="form-group col-xs-8 col-sm-8 col-md-8 col-lg-8 class_add" style=" margin-top: 18px;">
                                <label for="exampleInputEmail03">名称</label>
                                <input type="text" style="width:250px;" name="search_keyword" class="form-control" id="search_keyword">
                            </div>

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
-->

    <div class="x_pull_list">
        <div class="container">
            <div class="row">
                <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                    <div class="x_pull_top">
                        <span style=" padding-bottom: 12px;">调价动态</span>
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
                                    <span style="display: block;padding-bottom: 7px;border-bottom: 1px rgba(0, 0, 0, 0.18) solid;">
									<i></i>
									<h3 style="display:inline-block;"><?php echo $tmp['store_name']; ?></h3>
									</span>
                                    <div class="x_price">
                                        
                                        <span>价格<span class="glyphicon glyphicon-triangle-bottom x_green"></span></span>
                                    </div>
                                    <div class="x_class">
                                        <i class="x_green">￥<?php echo $tmp['goods_price']; ?></i>
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
								<span style="display: block;padding-bottom: 7px;border-bottom: 1px rgba(0, 0, 0, 0.18) solid;">
								<i></i>
                                    <h3 style="display:inline-block;"><?php echo $tmp['store_name']; ?></h3>
								</span>
                                    <div class="x_price">
                                        
                                        <span>价格<span class="glyphicon glyphicon-triangle-bottom x_green"></span></span>
                                    </div>
                                    <div class="x_class">
                                        <i class="x_green">￥<?php echo $tmp['goods_price']; ?></i>
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
								<span style="display: block;padding-bottom: 7px;border-bottom: 1px rgba(0, 0, 0, 0.18) solid;">
								<i></i>
                                    <h3 style="display:inline-block;"><?php echo $tmp['store_name']; ?></h3>
								</span>
                                    <div class="x_price">
                                        
                                        <span>价格<span class="glyphicon glyphicon-triangle-bottom x_green"></span></span>
                                    </div>
                                    <div class="x_class">
                                        <i class="x_green">￥<?php echo $tmp['goods_price']; ?></i>
                                    </div>
                                </a>
                                <?php
                            }
                        }
                        ?>   
                    </div>
                    <!---无烟煤_end-->

					<div class="x_pull_top2" style="margin-top:50px;">
                        <span>直购专区</span>
                    </div>

                    <div class="x_recommend">
                        <!--<img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/recommend.png">-->
                        <a href="<?php echo SHOP_SITE_URL; ?>/cate-3-0-0-0-0-0-0-0-0.html"><!--<img style="border-left:1px #ccc solid;" src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/recommend05.png">--><div class="left_d">
  <div class="left_span">
<span class="name_s">清洁型燃煤</span>
<span class="name_n">新建煤业</span>
</div>
<div class="right_img">
<img src="http://www.zg03.com/shop/templates/default/new/img/index/recommend05.png">
</div>
  
</div></a>
                        <a href="<?php echo SHOP_SITE_URL; ?>/cate-4-0-0-0-0-0-0-0-0.html"><!--<img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/recommend02.png">--><div class="left_d">
  <div class="left_span">
<span class="name_s">无烟煤</span>
<span class="name_n">长沁集团</span>
</div>
<div class="right_img">
<img src="http://www.zg03.com/shop/templates/default/new/img/index/recommend02.png">
</div>
  
</div></a>
                        <a href="<?php echo SHOP_SITE_URL; ?>/cate-2-0-0-0-0-0-0-0-0.html"><!--<img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/recommend03.png">--><div class="left_d">
  <div class="left_span">
<span class="name_s">炼焦煤</span>
<span class="name_n">晋瑞选煤</span>
</div>
<div class="right_img">
<img src="http://www.zg03.com/shop/templates/default/new/img/index/recommend03.png">
</div>
  
</div></a> 
						<a href="<?php echo SHOP_SITE_URL; ?>/cate-6-0-0-0-0-0-0-0-0.html"><!--<img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/recommend04.png">--><div class="left_d">
  <div class="left_span">
<span class="name_s">焦炭</span>
<span class="name_n">三元王庄煤矿</span>
</div>
<div class="right_img">
<img src="http://www.zg03.com/shop/templates/default/new/img/index/recommend04.png">
</div>
  
</div></a>	
<a href="<?php echo SHOP_SITE_URL; ?>/cate-3-0-0-0-0-0-0-0-0.html"><!--<img style="border-left:1px #ccc solid;" src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/recommend01.png">-->
<div class="left_d">
  <div class="left_span">
<span class="name_s">动力煤</span>
<span class="name_n">晋瑞选煤</span>
</div>
<div class="right_img">
<img src="http://www.zg03.com/shop/templates/default/new/img/index/recommend01.png">
</div>
  
</div>
</a>

                        <a href="<?php echo SHOP_SITE_URL; ?>/cate-4-0-0-0-0-0-0-0-0.html"><!--<img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/recommend06.png">--><div class="left_d">
  <div class="left_span">
<span class="name_s">焦粉</span>
<span class="name_n">雄山煤炭</span>
</div>
<div class="right_img">
<img src="http://www.zg03.com/shop/templates/default/new/img/index/recommend06.png">
</div>
  
</div></a>
                        <a href="<?php echo SHOP_SITE_URL; ?>/cate-2-0-0-0-0-0-0-0-0.html"><!--<img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/recommend07.png">--><div class="left_d">
  <div class="left_span">
<span class="name_s">焦炭化工品</span>
<span class="name_n">雄山煤炭</span>
</div>
<div class="right_img">
<img src="http://www.zg03.com/shop/templates/default/new/img/index/recommend07.png">
</div>
  
</div></a> 
						<a href="<?php echo SHOP_SITE_URL; ?>/cate-6-0-0-0-0-0-0-0-0.html"><!--<img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/recommend08.png">--><div class="left_d">
  <div class="left_span">
<span class="name_s">民用炭块</span>
<span class="name_n">西山煤业</span>
</div>
<div class="right_img">
<img src="http://www.zg03.com/shop/templates/default/new/img/index/recommend08.png">
</div>
  
</div></a>							
                    </div>
                </div>
				
                <!--<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
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
				-->
				
				
				
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
                        <span>煤企推荐</span>
                    </div>	
                    <div class="x_carousel" style="
    border: 1px rgb(235,235,235) solid;
    background-color: rgb(247,247,247);
	position: relative;
">
                        <div class="RightBotton_home" onmousedown="ISL_GoDown()" onmouseup="ISL_StopDown()" onmouseout="ISL_StopDown()"></div><div class="LeftBotton_home" onmousedown="ISL_GoUp()" onmouseup="ISL_StopUp()" onmouseout="ISL_StopUp()"></div>
						
						<div class="rollBox">   
                               
                            <div class="Cont" id="ISL_Cont" style="
">   
                                <div class="ScrCont">   
                                    <div id="List1" class="row item_row"> 
                                        <?php if ($brand_c['image']) { ?>
            <?php foreach ($brand_c['image'] as $key => $brand) { ?>
                                                <a  href="<?php echo urlShop('brand', 'list', array('brand' => $brand['brand_id'])); ?>" class="pic">
												  <div>
                                                    <img src="<?php echo brandImage($brand['brand_pic']); ?>">
													
													<span class="w_adr" >所在地</span>
<span class="w_adrt">山西长治
</span>
<span class="w_adbu">进入煤企</span>
</div>
													</a>                         
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
                               
                        </div>            
                    </div>
<div class="x_pull_top2" style="width: 1170px;margin: 30px auto 0px auto;">
<span>我的3号线</span>					
</div>
            </div>
        <?php } ?>
<?php } ?>

<!--
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
                <span>签合同</span>
            </div>	
            <div class="x_pull_container">
                <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/re111.png">
                <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/re112.png">
            </div>									
        </div>
    </div>

-->

		
        </div>
    <div class="x_relist" style="
    background-color: #fff;
">
        <div class="container" style="
    height: 214px;
">
            <div class="x_relist_row">
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/relist120.png">
                    <a href="./index.php?act=member_contract&op=index" style="
    display: block;
    margin-top: 28px;
"><span style="
    font-weight: 600;
    letter-spacing: 2px;
    font-family: 微软雅黑;
">我的合同</span></a><span style="
    font-size: 15px;
    margin-top: 2px;
    display: block;
">方便快捷 一键签署</span>
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/relist121.png">
                    <a href="#" style="
    display: block;
    margin-top: 28px;
"><span style="
    font-weight: 900;
    letter-spacing: 2px;
    font-family: 微软雅黑;
">我的物流</span></a><span style="
    font-size: 15px;
    margin-top: 2px;
    display: block;
">全程监管 质量监控</span>
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/relist122.png">
                    <a href="#" style="
    display: block;
    margin-top: 28px;
"><span style="
    font-weight: 900;
    letter-spacing: 2px;
    font-family: 微软雅黑;
">我的金融</span></a><span style="
    font-size: 15px;
    margin-top: 2px;
    display: block;
">第三方监管 保驾护航</span>
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" style="border-right:1px #e8e8e8 solid;">
                    <img src="<?php echo SHOP_TEMPLATES_URL; ?>/new/img/index/relist123.png">
                    <a href="#" style="
    display: block;
    margin-top: 28px;
"><span style="
    font-weight: 900;
    letter-spacing: 2px;
    font-family: 微软雅黑;
">我的化验单</span></a><span style="
    font-size: 15px;
    margin-top: 2px;
    display: block;
">第三方权威验证机构</span>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="<?php echo SHOP_TEMPLATES_URL; ?>/new/js/home.js"></script>
