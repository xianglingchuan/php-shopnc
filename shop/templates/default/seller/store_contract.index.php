<?php defined('InShopNC') or exit('Access Invalid!');?>
<style>
    .bgwhite {
        background: #FFF;
    }
    .mt7 {
        margin-top: 30px;
    }
    .fileRemind {
        height: 370px;
    }
    .wrap {
        margin-left: auto;
        margin-right: auto;
        width: 100%;
    } 

    .fileRemind li.li_first {
        border-left: 1px;
        border-left-color: #fff;
        border-left-style: solid;
    }
    .fileRemind li {
        width: 250px;
    }
    .fileRemind li {
        width: 250px;
        text-align: center;
        float: left;
        height: 95px;
        padding-top: 40px;
    }
    ol, ul, li {
        list-style: none;
    }
    .f32 {
        font-size: 32px;
    }
    ul li a {
        color: #6c6c6c;
    }
    a {
        text-decoration: none;
    }
    a {
        color: #666;
    }
    a {
        color: #000;
        text-decoration: none;
    }
    a {
        text-decoration: none;
    }
</style>
<div class="tabmenu">
  <?php include template('layout/submenu');?>
</div>
    <div class="bgwhite wrap fileRemind mt7">
        <ul>
            <li class="li_first" style="border-left-color: #fff;">
                <div class="f32">
                    <a href="index.php?act=store_contract&op=waitMeList" style="cursor: pointer;"><img src="<?php echo SHOP_TEMPLATES_URL ?>/2016/images/doc.png"><span id="waitForMeCount"><?php echo $output['data'][0]['waitmeCount'];?></span></a>
                </div>
                <div class="f14 pt5">需要我完成的</div>
            </li>
            <li class="line1">
                <div class="f32">
                    <a href="index.php?act=store_contract&op=waitOthersList" style="cursor: pointer;"><img src="<?php echo SHOP_TEMPLATES_URL ?>/2016/images/write.png"><span id="waitForTaCount"><?php echo $output['data'][0]['waitothersCount'];?></span></a>
                </div>
                <div class="f14 pt5">等待他人完成的</div>
            </li>
            <li class="line1">
                <div class="f32">
                    <a href="index.php?act=store_contract&op=bothSuccessList" style="cursor: pointer;"><img src="<?php echo SHOP_TEMPLATES_URL ?>/2016/images/done.png"><span id="doneCount"><?php echo $output['data'][0]['bothsuccessCount'];?></span></a>
                </div>
                <div class="f14 pt5">已经完成的</div>
            </li>
<!--            <li class="li_first">
                <div class="f32">
                    <a href="https://smlweb.tsign.cn/user/doc!page?skip=doclist-view&amp;type=3" style="cursor: pointer;"><img src="<?php echo SHOP_TEMPLATES_URL ?>/2016/images/cloud.png"><span id="cloudCount">0</span></a>
                </div>
                <div class="f14 pt5">云文件</div>
            </li>-->
            <li class="line1">
                <div class="f32">
                    <a href="index.php?act=store_contract&op=returnList" style="cursor: pointer;"><img src="<?php echo SHOP_TEMPLATES_URL ?>/2016/images/returned.png"><span id="sendbackCount"><?php echo $output['data'][0]['returnCount'];?></span></a>
                </div>
                <div class="f14 pt5">退回文件</div>
            </li>
            <li class="line1">
                <div class="f32">
                    <a href="index.php?act=store_contract&op=closeList" style="cursor: pointer;"><img src="<?php echo SHOP_TEMPLATES_URL ?>/2016/images/close.png"><span id="closeCount"><?php echo $output['data'][0]['closeCount'];?></span></a>
                </div>
                <div class="f14 pt5">关闭文件</div>
            </li>
            <div class="cl"></div>
        </ul>
    </div>
