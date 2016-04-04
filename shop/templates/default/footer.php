<?php defined('InShopNC') or exit('Access Invalid!'); ?>
<?php echo getChat($layout); ?>
<div id="faq">
    <div class="wrapper">
        <?php if (is_array($output['article_list']) && !empty($output['article_list'])) { ?>
            <ul>
            <?php foreach ($output['article_list'] as $k => $article_class) { ?>
                <?php if (!empty($article_class)) { ?>
                     <li <?php if ($k == 2) echo 'style="display:none;"';?> >
                        <dl class="s<?php echo '' . $k + 1; ?>">
                            <dt>
                                <?php if (is_array($article_class['class'])) echo $article_class['class']['ac_name']; ?>
                            </dt>
                            <?php if (is_array($article_class['list']) && !empty($article_class['list'])) { ?>
                                <?php foreach ($article_class['list'] as $article) { ?>
                                    <dd><!--<i></i>--><a
                                            href="<?php if ($article['article_url'] != '') echo $article['article_url']; else echo urlShop('article', 'show', array('article_id' => $article['article_id'])); ?>"
                                            title="<?php echo $article['article_title']; ?>"> <?php echo $article['article_title']; ?> </a>
                                    </dd>
                                <?php } ?>
                            <?php } ?>
                        </dl>
                    </li>
                <?php } ?>
            <?php } ?></ul>
        <?php } ?>
    </div>
</div>
<!--<div style="background-color:#d9d9d9;width: 100%; height: 35px; " id="footer_container">-->
<div id="footer" class="wrapper">
   <!-- <p style="display: none;">
        <?php if (!empty($output['nav_list']) && is_array($output['nav_list'])) { ?>
            <?php foreach ($output['nav_list'] as $nav) { ?>
                <?php if ($nav['nav_location'] == '2') { ?>
                    | <a <?php if ($nav['nav_new_open']){ ?>target="_blank"
                         <?php } ?>href="<?php switch ($nav['nav_type']) {
                             case '0':
                                 echo $nav['nav_url'];
                                 break;
                             case '1':
                                 echo urlShop('search', 'index', array('cate_id' => $nav['item_id']));
                                 break;
                             case '2':
                                 echo urlShop('article', 'article', array('ac_id' => $nav['item_id']));
                                 break;
                             case '3':
                                 echo urlShop('activity', 'index', array('activity_id' => $nav['item_id']));
                                 break;
                         } ?>"><?php echo $nav['nav_title']; ?></a>
                <?php } ?>
            <?php } ?>
        <?php } ?>
    </p>-->
    <!--<?php echo $output['setting_config']['shopnc_version']; ?> <?php echo $output['setting_config']['icp_number']; ?>-->

    <?php echo html_entity_decode($output['setting_config']['statistics_code'], ENT_QUOTES); ?>
    <!--<a href="<?php echo SHOP_SITE_URL; ?>"><?php echo $lang['nc_index']; ?></a>-->

</div></div>
<?php if (C('debug') == 1) { ?>
    <div id="think_page_trace" class="trace">
        <fieldset id="querybox">
            <legend><?php echo $lang['nc_debug_trace_title']; ?></legend>
            <div> <?php print_r(\Shopnc\Tpl::showTrace());?> </div>
        </fieldset>
    </div>
<?php } ?>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL; ?>/js/jquery.cookie.js"></script>
<link href="<?php echo RESOURCE_SITE_URL; ?>/js/perfect-scrollbar.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL; ?>/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL; ?>/js/qtip/jquery.qtip.min.js"></script>
<link href="<?php echo RESOURCE_SITE_URL; ?>/js/qtip/jquery.qtip.min.css" rel="stylesheet" type="text/css">
<!-- 对比 -->
<script src="<?php echo SHOP_RESOURCE_SITE_URL; ?>/js/compare.js"></script>
<script type="text/javascript">
    $(function () {
        // Membership card
        $('[nctype="mcard"]').membershipCard({type: 'shop'});
    });
</script>
<script>
var hmt = hmt || [];
<script type="text/javascript"> var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://"); document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F30bb6a00b30ccc78540d33b3a51860e1' type='text/javascript'%3E%3C/script%3E")) </script>
