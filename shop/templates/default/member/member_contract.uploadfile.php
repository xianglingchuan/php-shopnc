<?php defined('InShopNC') or exit('Access Invalid!');?>

<div class="eject_con">
  <div class="adds">
    <div id="warning"></div>
    <form method="post" action="index.php?act=member_contract&op=signShowFile" id="address_form" target="_blank">
      <?php
      if($output['ret'] != 1){
          echo $output['message'];
      }else{
      ?>
      <dl>
        <dt>合同名称：</dt>
        <dd>
          <?php echo $output['title'];?>
        </dd>
      </dl>
      
      
      <dl>
        <dt>待签署文档标识：</dt>
        <dd>
          <?php echo $output['data']['docId'];?>
          <input type="hidden" class="text w100" name="docId" value="<?php echo $output['data']['docId'];?>"/>
        </dd>
      </dl>
      
<!--      <dl>
        <dt>认证类型</dt>
        <dd>-->
    <input type="hidden" class="text w100" name="authType" value="<?php echo $output['data']['authType'];?>"/>
          <!--（身份认证类型，1-手机/验证码验证，2-手机接收授权短信验证，3-邮箱/签署口令，4-手机/签署口令，5-UKEY证书，默认1。支持多种认证类型，多个以“,”隔开）-->
<!--        </dd>
      </dl>-->
      
      <dl>
        <dt>印章获取类型：</dt>
        <dd>
            预先定义的默认印章
            <input type="hidden" class="text w100" name="sealType" value="<?php echo $output['data']['sealType'];?>"/>
          <!--印章获取方式。0-实时手绘印章，1-预先定义的默认印章，2-实施模板印章，3-选择历史印章。默认0。支持多种印章获取方式，多个以“,”隔开-->
        </dd>
      </dl>
      
      
      
      <dl>
        <dt>签署账户标识：</dt>
        <dd>
          <input type="text" class="text w100" name="signer" value="<?php echo $output['data']['signer'];?>"/>
          <!---手机号-->
        </dd>
      </dl>
      
<!--      <dl>
        <dt>签署账户标识信息类型</dt>
        <dd>-->
          <input type="hidden" class="text w100" name="signerType" value="<?php echo $output['data']['signerType'];?>"/>
          <!--签署账户标识信息类型，0-邮箱，1-手机，2-certSN，默认0--->
<!--        </dd>
      </dl>-->
      
      
      
      
      
<!--      <dl>
        <dt>客户自定义标识：</dt>
        <dd>-->
          <input type="hidden" class="text w100" name="customNum" value="<?php echo $output['data']['customNum'];?>"/>
<!--        </dd>
      </dl>  -->
        
        
        
<!--      <dl>
        <dt>同步通知地址</dt>
        <dd>-->
          <input type="hidden" class="text w100" name="redirectUrl" value="<?php echo $output['data']['redirectUrl'];?>"/>
<!--        </dd>
      </dl> -->
        
        
<!--      <dl>
        <dt>异步通知地址</dt>
        <dd>-->
          <input type="hidden" class="text w100" name="notifyUrl" value="<?php echo $output['data']['notifyUrl'];?>"/>
<!--        </dd>
      </dl>        -->
      
     
      <div class="bottom">
        <label class="submit-border">
          <input type="submit" class="submit" value="开始签署" />
        </label>
        <a class="ncm-btn ml5" href="javascript:DialogManager.close('my_address_edit');">取消</a> </div>
        <?php } ?>
    </form>
  </div>
</div>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/common_select.js" charset="utf-8"></script> 