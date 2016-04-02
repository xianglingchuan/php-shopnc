<?php defined('InShopNC') or exit('Access Invalid!');?>

<div class="page">
 

  
  <table class="table tb-type2" id="prompt">
    <tbody>
      <tr class="space odd">
        <th colspan="12"><div class="title">
            <h5>列表说明</h5>
            <span class="arrow"></span></div></th>
      </tr>
      <tr>
        <td><ul>
       	
            <li>您可以通过这些记录，来查看短信发送的情况，以及一些发送失败的解决方案</li>
            
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
          <th colspan="align-center">编号</th>
          <th  style="width:40%">发送内容</th>
          <th class="align-center">发送手机</th>
          <th class="align-center">发送时间</th>
          <th class="align-center">登入用户</th>
          <th class="align-center">返回状态</th>
          <th class="align-center">返回内容</th>
          <th class="align-center">操作</th>
        </tr>
      <tbody>
        <?php if(!empty($output['ihuyi_sms_list']) && is_array($output['ihuyi_sms_list'])){ ?>
        <?php foreach($output['ihuyi_sms_list'] as $k => $v){ ?>
        <tr class="hover member">
       	 
          <td class="w24"><input type="checkbox" name='del_id[]' value="<?php echo $v['id']; ?>" class="checkitem"></td>
          
          <td class="w24"><?php echo $v['id']; ?></td>
          <td class="w48 picture"><?php echo $v['content']; ?></td>
          <td><?php echo $v['mobile']; ?> </td>
          <td class="align-center"><?php echo $v['todate']; ?></td>
          <td class="w150 align-center"><?php echo $v['session_user']; ?></td>
          
          <td   class="align-center" <?php if($v['return_code']!=2){ echo "style='color:red;'"; } ?>><?php echo $v['return_code']; ?></td>
          <td class="align-center" <?php if($v['return_code']!=2){ echo "style='color:red;'"; } ?>><?php echo $v['return_content']; ?> </td>
          
          <td class="align-center"> <?php if($v['return_code']!=2){?> <a onclick="show('tr_<?php echo $v['id']; ?>')">查看解决方案</a> <?php }?>  </td>
        </tr>
        
        
         <tr class="hover member" id="tr_<?php echo $v['id']; ?>" style="display:none">
          <td class="w24"  colspan="8"  style="color:#360" ><?php echo $output['result'][$v['return_code']]?></td>
         </tr>
        
        
        <?php } ?>
        <?php }else { ?>
        <tr class="no_data">
          <td colspan="11"><?php echo $lang['nc_no_record']?></td>
        </tr>
        <?php } ?>
      </tbody>
      <tfoot class="tfoot">
        <?php if(!empty($output['ihuyi_sms_list']) && is_array($output['ihuyi_sms_list'])){ ?>
        <tr>
          <td class="w24"><input type="checkbox" class="checkall" id="checkallBottom"></td>
          <td colspan="16">
          <label for="checkallBottom"><?php echo $lang['nc_select_all']; ?></label>
            &nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn" onclick="if(confirm('<?php echo $lang['nc_ensure_del']?>')){$('#form_member').submit();}"><span><?php echo $lang['nc_del'];?></span></a>
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
function show(id){
	$("#"+id).toggle(200);
	
}

</script>
