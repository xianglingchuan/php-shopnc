<?php defined('InShopNC') or exit('Access Invalid!');?>

<div class="page">
  <div class="fixed-bar">
    <div class="item-title">
      <h3>平台充值卡</h3>
      <ul class="tab-base">
        <li><a href="<?php echo urlAdmin('rechargecard', 'index'); ?>"><span>列表</span></a></li>
        <li><a href="<?php echo urlAdmin('rechargecard', 'add_card'); ?>"><span>新增</span></a></li>
        <li><a href="javascript:void(0);" class="current"><span>明细</span></a></li>
      </ul>
    </div>
  </div>
  <div class="fixed-empty"></div>

  <form method="get" name="formSearch" id="formSearch">
    <input type="hidden" name="act" value="rechargecard">
    <input type="hidden" name="op" value="log_list">
    <table class="tb-type1 noborder search">
      <tbody>
        <tr>
          <th><label>会员名称</label></th>
          <td><input type="text" name="mname" class="txt" value='<?php echo $_GET['mname'];?>'></td>

          <th><label>变更时间</label></th>
          <td><input type="text" id="stime" name="stime" class="txt date" value="<?php echo $_GET['stime'];?>" >
            <label>~</label>
            <input type="text" id="etime" name="etime" class="txt date" value="<?php echo $_GET['etime'];?>" ></td>
          <td><a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="<?php echo $lang['nc_query'];?>">&nbsp;</a></td>
        </tr>
      </tbody>
    </table>
  </form>

  <table class="table tb-type2" id="prompt">
    <tbody>
      <tr class="space odd">
        <th colspan="12"><div class="title">
            <h5><?php echo $lang['nc_prompts'];?></h5>
            <span class="arrow"></span></div></th>
      </tr>
      <tr>
        <td><ul>
            <li>此处展示了会员的充值卡使用明细</li>
          </ul></td>
      </tr>
    </tbody>
  </table>

  <div style="text-align:right;"><a class="btns" target="_blank" href="index.php?<?php echo $_SERVER['QUERY_STRING']; ?>&op=log_export_step1"><span>导出Excel</span></a></div>

  <table class="table tb-type2">
    <thead>
      <tr class="thead">
        <th>会员名称</th>
        <th class="align-center">变更时间</th>
        <th>可用金额(元)</th>
        <th>冻结金额(元)</th>
        <th>描述</th>
      </tr>
    </thead>
    <tbody>
      <?php if(!empty($output['list_log']) && is_array($output['list_log'])){ ?>
      <?php foreach($output['list_log'] as $k => $v){?>
      <tr class="hover">
        <td><?php echo $v['member_name'];?></td>
        <td class="nowarp align-center"><?php echo @date('Y-m-d H:i:s',$v['add_time']);?></td>
        <td><?php echo floatval($v['available_amount']) ? (floatval($v['available_amount']) > 0 ? '+' : null ).$v['available_amount'] : null;?></td>
        <td><?php echo floatval($v['freeze_amount']) ? (floatval($v['freeze_amount']) > 0 ? '+' : null ).$v['freeze_amount'] : null;?></td>
        <td><?php echo $v['description'];?>
        </td>
      </tr>
      <?php } ?>
      <?php }else { ?>
      <tr class="no_data">
        <td colspan="10"><?php echo $lang['nc_no_record'];?></td>
      </tr>
      <?php } ?>
    </tbody>
    <tfoot>
      <tr>
        <td colspan="16" id="dataFuncs"><div class="pagination"> <?php echo $output['show_page'];?></div></td>
      </tr>
    </tfoot>
  </table>
</div>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="<?php echo RESOURCE_SITE_URL;?>/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script language="javascript">
$(function(){
	$('#stime').datepicker({dateFormat: 'yy-mm-dd'});
	$('#etime').datepicker({dateFormat: 'yy-mm-dd'});
    $('#ncsubmit').click(function(){
    	$('#formSearch').submit();
    });
});
</script>