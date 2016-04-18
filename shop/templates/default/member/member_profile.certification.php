<?php defined('InShopNC') or exit('Access Invalid!');?>
<link rel="stylesheet" type="text/css" href="<?php echo RESOURCE_SITE_URL;?>/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="<?php echo SHOP_TEMPLATES_URL;?>/2016/js/uploadPreview.js"></script>
<style>
  .inputWidth{ width: 250px;}  
  .updateImageHelp{float:left; text-align: center; margin-left: 20px;}
</style>
<div class="wrap">
  <div class="tabmenu">
    <?php include template('layout/submenu');?>
  </div>
  <div class="ncm-user-profile">
<!--    <div class="user-avatar"><span><img src="<?php echo getMemberAvatar($output['member_info']['member_avatar']);?>"></span></div>-->
    <div class="ncm-default-form fr" style="width:100%;">
      <form method="post" id="profile_form" enctype="multipart/form-data" action="index.php?act=member_information&op=certification">
        <input type="hidden" name="form_submit" value="ok" />
        <dl>
            <dt>
            <?php 
            echo $member_info['member_type'] == MemberModel::TYPE_COMPANY_KEY ? "公司法人姓名：" : "真实姓名：";
            ?>
            </dt>
          <dd>
              <span class="w400">
                  <?php 
                  if(intval($expandInfo['audit']) == 1){
                      echo $expandInfo['username'];
                  }else{ ?>
                      <input type="text" class="text inputWidth" maxlength="20" name="username" value="<?php echo $expandInfo['username'];?>" />
                 <?php } ?>
              </span>
         </dd>
        </dl>
       
        <dl>
          <dt>
            <?php 
            echo $member_info['member_type'] == MemberModel::TYPE_COMPANY_KEY ? "公司法人身份证号：" : "身份证号：";
            ?>
          </dt>
          <dd>
              <span class="w400">
                  <?php 
                  if(intval($expandInfo['audit']) == 1){
                      echo $expandInfo['identity'];
                  }else{ ?>
                      <input type="text" class="text inputWidth" maxlength="20" name="identity" value="<?php echo $expandInfo['identity'];?>" />
                 <?php } ?>
              </span>
         </dd>
        </dl>
        
        <dl>
          <dt style="line-height:100px;">
            <?php 
            echo $member_info['member_type'] == MemberModel::TYPE_COMPANY_KEY ? "公司法人身份证照片：" : "个人身份证照片：";
            ?>
          </dt>
          <dd>
                  <?php 
                  if(intval($expandInfo['audit']) == 1){?>
                        <span class="w400" style="float:left;"><img id="identity_img_ImgPr" height="80px" src="<?php echo UPLOAD_SITE_URL.DS.$expandInfo['identity_img'];?>" style=" border:2px solid #CCCACC;"/></span>
                  <?php                   
                  }else{ ?>
                        <span class="w400" style="float:left;">
                            <div class="ncm-upload-btn" style="margin-top: 35px;"> <a href="javascript:void(0);"><span>
                            <input type="file" hidefocus="true" size="1" class="input-file" name="identity_img" id="identity_img" file_id="0" multiple="" maxlength="0"/>
                            </span>
                            <p><i class="icon-upload-alt"></i>上传图片</p>
                            <input id="submit_button" style="display:none" type="button" value="&nbsp;"/>
                            </a>
                          </div>
                          <?php if(!empty($expandInfo['identity_img'])){?>
                          <img id="identity_img_ImgPr" height="80px" src="<?php echo UPLOAD_SITE_URL.DS.$expandInfo['identity_img'];?>" style=" border:2px solid #CCCACC;"/>    
                          <?php }else{ ?>
                          <img id="identity_img_ImgPr" height="80px" style=" border:2px solid #CCCACC; display: none"/>
                          <?php  } ?>
                       </span>
                        <div class="updateImageHelp"><img style="width:100px;" src="<?php echo SHOP_TEMPLATES_URL;?>/2016/images/identity_img_default.jpg">
                            <BR><span style="color:red;">请按图例上传认证照片</span>
                        </div>                                                
                 <?php } ?>
         </dd>
         
        </dl>
        <dl>
           <dt style="line-height: 100px;">
           <?php 
           echo $member_info['member_type'] == MemberModel::TYPE_COMPANY_KEY ? "公司法人认证照片：" : "个人认证照片：";
           ?>
          </dt>
          <dd>
              <?php 
                if(intval($expandInfo['audit']) == 1){?>
                    <span class="w400" style="float:left;"><img id="identity_hand_img_ImgPr" height="80px" src="<?php echo UPLOAD_SITE_URL.DS.$expandInfo['identity_hand_img'];?>" style=" border:2px solid #CCCACC;"/></span>
                <?php }else{ ?>                    
                    <span class="w400" style="float:left;">
                      <div class="ncm-upload-btn" style="margin-top: 35px;"> <a href="javascript:void(0);"><span>
                        <input type="file" hidefocus="true" size="1" class="input-file" name="identity_hand_img" id="identity_hand_img" file_id="0" multiple="" maxlength="0"/>
                        </span>
                        <p><i class="icon-upload-alt"></i>上传图片</p>
                        <input id="submit_button" style="display:none" type="button" value="&nbsp;"/>
                        </a>
                      </div>
                      <?php if(!empty($expandInfo['identity_hand_img'])){?>
                      <img id="identity_hand_img_ImgPr" height="80px" src="<?php echo UPLOAD_SITE_URL.DS.$expandInfo['identity_hand_img'];?>" style=" border:2px solid #CCCACC;"/>    
                      <?php }else{ ?>
                      <img id="identity_hand_img_ImgPr" height="80px" style=" border:2px solid #CCCACC; display: none"/>
                      <?php  } ?>
                   </span>
                   <div class="updateImageHelp"><img style="width:100px;" src="<?php echo SHOP_TEMPLATES_URL;?>/2016/images/identity_hand_img_default.jpg">
                        <BR><span style="color:red;">请按图例上传认证照片</span>
                   </div>                    
                <?php } ?>
         </dd>
        </dl>
        
        
        
        
        <?php if($member_info['member_type'] == MemberModel::TYPE_COMPANY_KEY){?>
        <dl>
          <dt>公司开户银行：</dt>
          <dd>
              <span class="w400">
                  <?php 
                  if(intval($expandInfo['audit']) == 1){
                      echo $expandInfo['bank_name'];
                  }else{ ?>
                      <input type="text" class="text inputWidth" maxlength="20" name="bank_name" value="<?php echo $expandInfo['bank_name'];?>" />
                 <?php } ?>
              </span>
         </dd>
        </dl>        
        <dl>
          <dt>公司银行帐号：</dt>
          <dd>
              <span class="w400">
                  <?php 
                  if(intval($expandInfo['audit']) == 1){
                      echo $expandInfo['bank_account'];
                  }else{ ?>
                      <input type="text" class="text inputWidth" maxlength="20" name="bank_account" value="<?php echo $expandInfo['bank_account'];?>" />
                 <?php } ?>
              </span>
         </dd>
        </dl>    
        <dl>
          <dt>纳税人识别码：</dt>
          <dd>
              <span class="w400">
                  
                  <?php 
                  if(intval($expandInfo['audit']) == 1){
                      echo $expandInfo['id_code'];
                  }else{ ?>
                      <input type="text" class="text inputWidth" maxlength="20" name="id_code" value="<?php echo $expandInfo['id_code'];?>" />
                 <?php } ?>
                  
                  
              </span>
         </dd>
        </dl>           
        <dl>
          <dt>营业执照图片：</dt>
          <dd>
              <span class="w400">
                  
                  <?php 
                  if(intval($expandInfo['audit']) == 1){?>
                      <img id="ImgPr" height="80px" src="<?php echo UPLOAD_SITE_URL.DS.$expandInfo['business_license'];?>" style=" border:2px solid #CCCACC;"/>
                  <?php }else{ ?>
                    <div class="ncm-upload-btn"> <a href="javascript:void(0);"><span>
                      <input type="file" hidefocus="true" size="1" class="input-file" name="business_license" id="business_license" file_id="0" multiple="" maxlength="0"/>
                      </span>
                      <p><i class="icon-upload-alt"></i>上传图片</p>
                      <input id="submit_button" style="display:none" type="button" value="&nbsp;"/>
                      </a>
                    </div>
                    <?php if(!empty($expandInfo['business_license'])){?>
                    <img id="ImgPr" height="80px" src="<?php echo UPLOAD_SITE_URL.DS.$expandInfo['business_license'];?>" style=" border:2px solid #CCCACC;"/>    
                    <?php }else{ ?>
                    <img id="ImgPr" height="80px" style=" border:2px solid #CCCACC; display: none"/>
                    <?php  } ?>
                 <?php } ?>                  
             </span>
         </dd>
        </dl>        
        <dl>
          <dt>组织机构代码：</dt>
          <dd>
              <span class="w400">
                  <?php 
                  if(intval($expandInfo['audit']) == 1){
                      echo $expandInfo['organization_code'];
                  }else{ ?>
                      <input type="text" class="text inputWidth" maxlength="20" name="organization_code" value="<?php echo $expandInfo['organization_code'];?>" />
                 <?php } ?>
              </span>
         </dd>
        </dl>       
        <dl>
            <dt>公司电话号码：</dt>
          <dd>
              <span class="w400">
                  <?php 
                  if(intval($expandInfo['audit']) == 1){
                      echo $expandInfo['tel'];
                  }else{ ?>
                      <input type="text" class="text inputWidth" maxlength="20" name="tel" value="<?php echo $expandInfo['tel'];?>" />
                 <?php } ?>
              </span>
         </dd>
        </dl>   
        <?php } ?>
        
        <?php if(!empty($expandInfo)){ ?>
        <dl>
            <dt>审核状态：</dt>
          <dd>
              <span class="w400">
                <?php 
                if(intval($expandInfo['audit']) >= 1){
                    if($expandInfo['audit']==1){
                        echo "审核通过";
                    }else if($expandInfo['audit'] == 2){
                        echo "审核拒绝";
                    }
                }else{
                    if(!empty($expandInfo['username'])){
                        echo "正在等待平台管理员审核......";                        
                    }
                }
                ?>                    
              </span>
         </dd>
        </dl>
        
        <?php if(intval($expandInfo['audit']) >= 1){?>
        <dl>
            <dt>最后审核时间：</dt>
          <dd>
              <span class="w400">
                  <?php echo $expandInfo['audit_createdate'];?>
              </span>
         </dd>
        <dl>
            <dt>最后审核管理员名称：</dt>
          <dd>
              <span class="w400">
                  <?php echo $expandInfo['audit_admin_name'];?>
              </span>
         </dd>
        </dl> 
        <?php } ?>  
         
        <?php } ?>
        
        
        
        
        
        
        <?php if(intval($expandInfo['audit']) != 1){?>
        <dl class="bottom">
          <dt></dt>
          <dd>
            <label class="submit-border">
              <input type="submit" class="submit" value="<?php echo $lang['home_member_save_modify'];?>" />
            </label>
          </dd>
        </dl>
        <?php } ?>  
         
         
      </form>
    </div>
  </div>
</div>

<script>
$(function () {
    //营业执照图片
    $("#business_license").uploadPreview({ Img: "ImgPr", Width: 120, Height: 120, ImgType: ["gif", "jpeg", "jpg", "bmp", "png"],Callback: function () { $("#ImgPr").show(); } });
    $("#identity_img").uploadPreview({ Img: "identity_img_ImgPr", Width: 120, Height: 120, ImgType: ["gif", "jpeg", "jpg", "bmp", "png"],Callback: function () { $("#identity_img_ImgPr").show(); } });
    $("#identity_hand_img").uploadPreview({ Img: "identity_hand_img_ImgPr", Width: 120, Height: 120, ImgType: ["gif", "jpeg", "jpg", "bmp", "png"],Callback: function () { $("#identity_hand_img_ImgPr").show(); } });
});
</script>
