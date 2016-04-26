<?php defined('InShopNC') or exit('Access Invalid!'); ?>
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
<div class="wrap">
    <div class="tabmenu">
        <ul class="tab">
            <?php
            if (is_array($output['member_menu']) and ! empty($output['member_menu'])) {
                foreach ($output['member_menu'] as $key => $val) {
                    $classname = 'normal';
                    if ($val['menu_key'] == $output['menu_key']) {
                        $classname = 'active';
                    }
//		if ($val['menu_key'] == 'message'){
//			echo '<li class="'.$classname.'"><a href="'.$val['menu_url'].'">'.$val['menu_name'].'(<span style="color: red;">'.$output['newcommon'].'</span>)</a></li>';
//		}elseif ($val['menu_key'] == 'system'){
//			echo '<li class="'.$classname.'"><a href="'.$val['menu_url'].'">'.$val['menu_name'].'(<span style="color: red;">'.$output['newsystem'].'</span>)</a></li>';
//		}elseif ($val['menu_key'] == 'close'){
//			echo '<li class="'.$classname.'"><a href="'.$val['menu_url'].'">'.$val['menu_name'].'(<span style="color: red;">'.$output['newpersonal'].'</span>)</a></li>';
//		}else{
                    echo '<li class="' . $classname . '"><a href="' . $val['menu_url'] . '">' . $val['menu_name'] . '</a></li>';
//		}
                }
            }
            ?>
        </ul>
        <?php if ($output['isallowsend']) { ?>
            <a href="index.php?act=member_message&op=sendmsg" class="ncm-btn ncm-btn-orange" title="<?php echo $lang['home_message_send_message']; ?>"><i class="icon-envelope-alt"></i><?php echo $lang['home_message_send_message']; ?></a>
<?php } ?>
    </div>
    
    
    <div class="bgwhite wrap fileRemind mt7">
        <ul>
            <li class="li_first" style="border-left-color: #fff;">
                <div class="f32">
                    <a href="https://smlweb.tsign.cn/user/doc!page?skip=doclist-view-batch&amp;type=4" style="cursor: pointer;"><img src="<?php echo SHOP_TEMPLATES_URL ?>/2016/images/doc.png"><span id="waitForMeCount">0</span></a>
                </div>
                <div class="f14 pt5">需要我完成的</div>
            </li>
            <li class="line1">
                <div class="f32">
                    <a href="https://smlweb.tsign.cn/user/doc!page?skip=doclist-view&amp;type=5" style="cursor: pointer;"><img src="<?php echo SHOP_TEMPLATES_URL ?>/2016/images/write.png"><span id="waitForTaCount">0</span></a>
                </div>
                <div class="f14 pt5">等待他人完成的</div>
            </li>
            <li class="line1">
                <div class="f32">
                    <a href="https://smlweb.tsign.cn/user/doc!page?skip=doclist-view&amp;type=2" style="cursor: pointer;"><img src="<?php echo SHOP_TEMPLATES_URL ?>/2016/images/done.png"><span id="doneCount">0</span></a>
                </div>
                <div class="f14 pt5">已经完成的</div>
            </li>
            <li class="li_first">
                <div class="f32">
                    <a href="https://smlweb.tsign.cn/user/doc!page?skip=doclist-view&amp;type=3" style="cursor: pointer;"><img src="<?php echo SHOP_TEMPLATES_URL ?>/2016/images/cloud.png"><span id="cloudCount">0</span></a>
                </div>
                <div class="f14 pt5">云文件</div>
            </li>
            <li class="line1">
                <div class="f32">
                    <a href="https://smlweb.tsign.cn/user/doc!page?skip=doclist-view&amp;type=10" style="cursor: pointer;"><img src="<?php echo SHOP_TEMPLATES_URL ?>/2016/images/returned.png"><span id="sendbackCount">0</span></a>
                </div>
                <div class="f14 pt5">退回文件</div>
            </li>
            <li class="line1">
                <div class="f32">
                    <a href="https://smlweb.tsign.cn/user/doc!page?skip=doclist-view&amp;type=11" style="cursor: pointer;"><img src="<?php echo SHOP_TEMPLATES_URL ?>/2016/images/close.png"><span id="closeCount">0</span></a>
                </div>
                <div class="f14 pt5">关闭文件</div>
            </li>
            <div class="cl"></div>
        </ul>
    </div>





</div>
