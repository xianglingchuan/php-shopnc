<?php defined('InShopNC') or exit('Access Invalid!');?>

<div class="page">
  <div class="fixed-bar">
    <div class="item-title">
      <h3>会员审核内容详情<?php //echo $lang['nc_member_predepositmanage'];?></h3>
    </div>
  </div>
  <div class="fixed-empty"></div>
  <table class="table tb-type2 nobdb">
    <tbody>

      <tr class="noborder">
          <td class="vatop rowform"><B>会员名称：</B></td>
        <td class="vatop tips"><?php echo $output['memberInfo']['member_name']; ?></td>
      </tr>
      
      <tr class="noborder">
          <td class="vatop rowform"><B>审核状态：</B></td>
        <td class="vatop tips">
            <span style="color:red;"><B><?php 
            if($output['memberInfo']['audit'] == 0){
                echo "待审核";
            }else if($output['memberInfo']['audit']== 1){
                echo "审核通过";
            }else if($output['memberInfo']['audit'] == 2){
                echo "审核拒绝";
            }          
          ?></B></span>
          </td>
      </tr>
      
      
      <?php  if($output['memberInfo']['member_type'] == MemberModel::TYPE_COMPANY_KEY){ ?>
      <tr class="noborder">
          <td class="vatop rowform"><B>公司电话：</B></td>
        <td class="vatop tips"><?php echo $output['memberInfo']['member_name']; ?></td>
      </tr>
      <?php } ?>
      
      
      <tr class="noborder">
        <td class="vatop rowform">
            <B><?php echo $output['memberInfo']['member_type'] == MemberModel::TYPE_COMPANY_KEY ? "公司法人：" : "真实姓名："; ?></B>    
        </td>
        <td class="vatop tips"><?php echo $output['memberInfo']['username']; ?></td>
      </tr>
      
      <tr class="noborder">
        <td class="vatop rowform">
            <B><?php 
            echo $member_info['member_type'] == MemberModel::TYPE_COMPANY_KEY ? "公司法人身份证号：" : "身份证号：";
            ?></B>
        </td>
        <td class="vatop tips"><?php echo $output['memberInfo']['identity']; ?></td>
      </tr>
      
      <tr class="noborder">
        <td class="vatop rowform">
            <B><?php 
            echo $member_info['member_type'] == MemberModel::TYPE_COMPANY_KEY ? "公司法人身份证照片：" : "个人身份证照片：";
            ?></B>
        </td>
        <td class="vatop tips">
            <?php 
            if(!empty($output['memberInfo']['identity_hand_img'])){?>
            <a href="<?php echo UPLOAD_SITE_URL.DS.$output['memberInfo']['identity_img']; ?>" style="margin: 0px; padding: 0px; border: 0px;" target="_blank"><img border="0px" height="100px" style="border: 5px solid #C0C0C0;" src="<?php echo UPLOAD_SITE_URL.DS.$output['memberInfo']['identity_img']; ?>" ></a>    
            <?php
            }else{
                echo "暂未上传法人身份证照片!";
            }
            ?>
        </td>
      </tr>      
      <tr class="noborder">
          <td class="vatop rowform">
           <B><?php 
           echo $member_info['member_type'] == MemberModel::TYPE_COMPANY_KEY ? "公司法人认证照片：" : "个人认证照片：";
           ?></B>              
          </td>
        <td class="vatop tips">
            <?php 
            if(!empty($output['memberInfo']['identity_hand_img'])){?>
            <a href="<?php echo UPLOAD_SITE_URL.DS.$output['memberInfo']['identity_hand_img']; ?>" style="margin: 0px; padding: 0px; border: 0px;" target="_blank"><img border="0px" height="100px" style="border: 5px solid #C0C0C0;" src="<?php echo UPLOAD_SITE_URL.DS.$output['memberInfo']['identity_hand_img']; ?>" ></a>    
            <?php
            }else{
                echo "暂未上传法人手拿身份证照片!";
            }
            ?>
        </td>
      </tr>
      
      <?php
      if($output['memberInfo']['member_type'] == MemberModel::TYPE_COMPANY_KEY){
      ?>
      
      <tr class="noborder">
          <td class="vatop rowform"><B>公司开户银行：</B></td>
        <td class="vatop tips"><?php echo $output['memberInfo']['bank_name']; ?></td>
      </tr>
      
      <tr class="noborder">
          <td class="vatop rowform"><B>公司银行帐号：</B></td>
        <td class="vatop tips"><?php echo $output['memberInfo']['bank_account']; ?></td>
      </tr>
      
      <tr class="noborder">
          <td class="vatop rowform"><B>纳税人识别码：</B></td>
        <td class="vatop tips"><?php echo $output['memberInfo']['id_code']; ?></td>
      </tr>
      
      <tr class="noborder">
          <td class="vatop rowform"><B>营业执照图片：</B></td>
        <td class="vatop tips">
            <?php 
            if(!empty($output['memberInfo']['business_license'])){?>
            <a href="<?php echo UPLOAD_SITE_URL.DS.$output['memberInfo']['business_license']; ?>" style="margin: 0px; padding: 0px; border: 0px;" target="_blank"><img border="0px" height="100px" style="border: 5px solid #C0C0C0;" src="<?php echo UPLOAD_SITE_URL.DS.$output['memberInfo']['business_license']; ?>" ></a>    
            <?php
            }else{
                echo "暂未上传营业执照图片!";
            }
            ?>
            </td>
      </tr>
      
      <tr class="noborder">
        <td class="vatop rowform"><B>组织机构代码：</B></td>
        <td class="vatop tips"><?php echo $output['memberInfo']['organization_code']; ?></td>
      </tr>
      <?php } ?>
      <tr class="noborder">
        <td class="vatop rowform"><B>提交日期：</B></td>
        <td class="vatop tips"><?php echo $output['memberInfo']['modify_datetime']; ?></td>
      </tr>
      
      
      <tr class="noborder">
        <td class="vatop rowform"><B>最后审核时间：</B></td>
        <td class="vatop tips"><?php echo !empty($output['memberInfo']['audit_createdate']) ? $output['memberInfo']['audit_createdate'] : "暂无"; ?>
        </td>
      </tr>
      <tr class="noborder">
        <td class="vatop rowform"><B>最后审核管理员：</B></td>
        <td class="vatop tips"><?php echo !empty($output['memberInfo']['audit_admin_name']) ? $output['memberInfo']['audit_admin_name'] : "暂无"; ?></td>
      </tr>
      
      
      
    </tbody>
        <tfoot id="submit-holder">
        <tr class="tfoot">
        <td colspan="2">
            <?php if(intval($output['memberInfo']['audit']) <= 0 ){ ?>
            <a class="btn" href="index.php?act=certification&op=setAudit&member_id=<?php echo $output['memberInfo']['member_id']; ?>&type=1"><span>审核通过</span></a>
            <a class="btn" href="index.php?act=certification&op=setAudit&member_id=<?php echo $output['memberInfo']['member_id']; ?>&type=2"><span>审核拒绝</span></a>
            <?php } ?>
            <a class="btn" href="index.php?act=certification&op=index"><span>返回</span></a>
        </td>
        </tr>
        </tfoot>
  </table>
</div>
