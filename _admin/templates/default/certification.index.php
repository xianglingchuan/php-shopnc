<?php defined('InShopNC') or exit('Access Invalid!');?>

<div class="page">
  <div class="fixed-bar">
    <div class="item-title">
      <h3>会员认证审核<?php //echo $lang['member_index_manage']?></h3>
    </div>
  </div>
  <div class="fixed-empty"></div>
  <form method="get" name="formSearch" id="formSearch">
    <input type="hidden" value="certification" name="act">
    <input type="hidden" value="index" name="op">
    <table class="tb-type1 noborder search">
      <tbody>
        <tr>
          <td><select name="search_field_name" >
              <option <?php if($output['search_field_name'] == 'member_name'){ ?>selected='selected'<?php } ?> value="member_name"><?php echo $lang['member_index_name']?></option>
              <option <?php if($output['search_field_name'] == 'member_email'){ ?>selected='selected'<?php } ?> value="member_email"><?php echo $lang['member_index_email']?></option>
              <option <?php if($output['search_field_name'] == 'member_truename'){ ?>selected='selected'<?php } ?> value="member_truename"><?php echo $lang['member_index_true_name']?></option>
            </select></td>
          <td><input type="text" value="<?php echo $output['search_field_value'];?>" name="search_field_value" class="txt"></td>
          <td>
              
          </td>
          <td>
          </td>
          <td>
          </td>
          <td><a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="<?php echo $lang['nc_query'];?>">&nbsp;</a>
            <?php if($output['search_field_value'] != '' or $output['search_sort'] != ''){?>
            <a href="index.php?act=member&op=member" class="btns "><span><?php echo $lang['nc_cancel_search']?></span></a>
            <?php }?></td>
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
            <li>通过会员认证审核，你可以进行查看、会员认证资料并进行审核操作<?php //echo $lang['member_index_help1'];?></li>
            <li>你可以根据条件搜索会员，然后选择相应的操作<?php //echo $lang['member_index_help2'];?></li>
          </ul></td>
      </tr>
    </tbody>
  </table>
  <form method="post" id="form_member">
    <input type="hidden" name="form_submit" value="ok" />
    <table class="table tb-type2 nobdb">
      <thead>
        <tr class="thead">
          <th>&nbsp;</th>
          <th colspan="2"><?php echo $lang['member_index_name']?></th>
          <th class="align-center">类型</th>
          <th class="align-center">审核状态</th>
          <th class="align-center">最后提交时间</th>
<!--          <th class="align-center"><?php echo $lang['member_index_prestore'];?></th>
          <th class="align-center">经验值</th>
          <th class="align-center">级别</th>
          <th class="align-center"><?php echo $lang['member_index_login']; ?></th>-->
          <th class="align-center"><?php echo $lang['nc_handle']; ?></th>
        </tr>
      <tbody>
        <?php if(!empty($output['member_list']) && is_array($output['member_list'])){ ?>
        <?php 
        foreach($output['member_list'] as $k => $v){ ?>
        <tr class="hover member">
          <td class="w24"></td>
          <td class="w48 picture"><div class="size-44x44"><span class="thumb size-44x44"><i></i><img src="<?php if ($v['member_avatar'] != ''){ echo UPLOAD_SITE_URL.DS.ATTACH_AVATAR.DS.$v['member_avatar'];}else { echo UPLOAD_SITE_URL.'/'.ATTACH_COMMON.DS.C('default_user_portrait');}?>?<?php echo microtime();?>"  onload="javascript:DrawImage(this,44,44);"/></span></div></td>
          <td><p class="name"><strong><?php echo $v['member_name']; ?></strong>(<?php echo $lang['member_index_true_name']?>: <?php echo $v['member_truename']; ?>)</p>
          </td>
          <td class="align-center"><?php echo $v['member_type'] == 1 ? "企业" : "个人"; ?>
          </td>
          <td class="align-center">
          <?php 
            if($v['audit'] == 0){
                echo "待审核";
            }else if($v['audit']== 1){
                echo "审核通过";
            }else if($v['audit'] == 2){
                echo "审核未通过";
            }          
          ?></td>
          <td class="align-center"><?php echo $v['modify_datetime']; ?></td>
          <td class="align-center"><a href="index.php?act=certification&op=view&member_id=<?php echo $v['member_id']; ?>">查看</a>
              <?php if($v['audit'] != 1){ ?>
              | <a href="index.php?act=notice&op=notice&member_name=<?php echo ltrim(base64_encode($v['member_name']),'='); ?>">审核通过</a>
              | <a href="index.php?act=notice&op=notice&member_name=<?php echo ltrim(base64_encode($v['member_name']),'='); ?>">审核未通过</a>
              <?php } ?>
          </td>
        </tr>
        <?php } ?>
        <?php }else { ?>
        <tr class="no_data">
          <td colspan="11"><?php echo $lang['nc_no_record']?></td>
        </tr>
        <?php } ?>
      </tbody>
      <tfoot class="tfoot">
        <?php if(!empty($output['member_list']) && is_array($output['member_list'])){ ?>
        <tr>
          <td colspan="16">
            <div class="pagination"> <?php echo $output['page'];?> </div></td>
        </tr>
        <?php } ?>
      </tfoot>
    </table>
  </form>
</div>
<script>
$(function(){
    $('#ncsubmit').click(function(){
    	$('input[name="op"]').val('member');$('#formSearch').submit();
    });	
});
</script>
