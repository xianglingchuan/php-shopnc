<?php defined('InShopNC') or exit('Access Invalid!');?>
<link rel="stylesheet" type="text/css" href="<?php echo RESOURCE_SITE_URL;?>/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<style>
  .inputWidth{ width: 250px;}  
</style>
<div class="wrap">
  <div class="tabmenu">
    <?php include template('layout/submenu');?>
  </div>
  <div class="ncm-user-profile">
<!--    <div class="user-avatar"><span><img src="<?php echo getMemberAvatar($output['member_info']['member_avatar']);?>"></span></div>-->
    <div class="ncm-default-form fr" style="width:100%;">
      <form method="post" id="profile_form" action="index.php?act=member_information&op=certification">
        <input type="hidden" name="form_submit" value="ok" />
        <dl>
            <dt>公司法人姓名：</dt>
          <dd>
              <span class="w400">
                  <input type="text" class="text inputWidth" maxlength="20" name="username" value="<?php echo $expandInfo['username'];?>" />
              </span>
         </dd>
        </dl>
       
        
        <dl>
          <dt>公司法人身份证号：</dt>
          <dd>
              <span class="w400">
                  <input type="text" class="text inputWidth" maxlength="20" name="identity" value="<?php echo $expandInfo['identity'];?>" />
              </span>
         </dd>
        </dl>
        
        <dl>
          <dt>公司法人身份证照片：</dt>
          <dd>
              <span class="w400">
                  <input type="text" class="text inputWidth" maxlength="20" name="identity_img" value="<?php echo $expandInfo['identity_img'];?>" />
              </span>
         </dd>
        </dl>
        <dl>
          <dt>法人手拿身份证照片：</dt>
          <dd>
              <span class="w400">
                  <input type="text" class="text inputWidth" maxlength="20" name="identity_hand_img" value="<?php echo $expandInfo['identity_hand_img'];?>" />
              </span>
         </dd>
        </dl>
        
        <dl>
          <dt>公司开户银行：</dt>
          <dd>
              <span class="w400">
                  <input type="text" class="text inputWidth" maxlength="20" name="bank_name" value="<?php echo $expandInfo['bank_name'];?>" />
              </span>
         </dd>
        </dl>        
        
        <dl>
          <dt>公司银行帐号：</dt>
          <dd>
              <span class="w400">
                  <input type="text" class="text inputWidth" maxlength="20" name="bank_account" value="<?php echo $expandInfo['bank_account'];?>" />
              </span>
         </dd>
        </dl>    
        
        <dl>
          <dt>纳税人识别码：</dt>
          <dd>
              <span class="w400">
                  <input type="text" class="text inputWidth" maxlength="20" name="id_code" value="<?php echo $expandInfo['id_code'];?>" />
              </span>
         </dd>
        </dl>           
        <dl>
          <dt>营业执照图片：</dt>
          <dd>
              <span class="w400">
                  <input type="text" class="text inputWidth" maxlength="20" name="business_license" value="<?php echo $expandInfo['business_license'];?>" />
              </span>
         </dd>
        </dl>        
        
        <dl>
          <dt>组织机构代码：</dt>
          <dd>
              <span class="w400">
                  <input type="text" class="text inputWidth" maxlength="20" name="organization_code" value="<?php echo $expandInfo['organization_code'];?>" />
              </span>
         </dd>
        </dl>       
        
        <dl>
            <dt>公司电话号码：</dt>
          <dd>
              <span class="w400">
                  <input type="text" class="text inputWidth" maxlength="20" name="tel" value="<?php echo $expandInfo['tel'];?>" />
              </span>
         </dd>
        </dl>        
        
        
        <dl class="bottom">
          <dt></dt>
          <dd>
            <label class="submit-border">
              <input type="submit" class="submit" value="<?php echo $lang['home_member_save_modify'];?>" />
            </label>
          </dd>
        </dl>
      </form>
    </div>
  </div>
</div>
<!--<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/common_select.js" charset="utf-8"></script> -->
<script type="text/javascript">
////注册表单验证
//$(function(){
//	regionInit("region");
//	$('#birthday').datepicker({dateFormat: 'yy-mm-dd'});
//    $('#profile_form').validate({
//    	submitHandler:function(form){
//    		if ($('select[class="valid"]').eq(0).val()>0) $('#province_id').val($('select[class="valid"]').eq(0).val());
//			if ($('select[class="valid"]').eq(1).val()>0) $('#city_id').val($('select[class="valid"]').eq(1).val());
//			ajaxpost('profile_form', '', '', 'onerror')
//		},
//        rules : {
//            member_truename : {
//				minlength : 2,
//                maxlength : 20
//            },
//            member_qq : {
//				digits  : true,
//                minlength : 5,
//                maxlength : 12
//            }
//        },
//        messages : {
//            member_truename : {
//				minlength : '<?php echo $lang['home_member_username_range'];?>',
//                maxlength : '<?php echo $lang['home_member_username_range'];?>'
//            },
//            member_qq  : {
//				digits    : '<?php echo $lang['home_member_input_qq'];?>',
//                minlength : '<?php echo $lang['home_member_input_qq'];?>',
//                maxlength : '<?php echo $lang['home_member_input_qq'];?>'
//            }
//        }
//    });
//});
</script> 
<!--<script charset="utf-8" type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/jquery-ui/i18n/zh-CN.js" ></script>-->