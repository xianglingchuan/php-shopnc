<?php defined('InShopNC') or exit('Access Invalid!');?>
<style type="text/css">
body {
background: #637159 url(<?php echo DELIVERY_TEMPLATES_URL;
?>/images/login_bg.png) no-repeat center top;
}
</style>
<div class="ncd-login-pics">
  <div class="add"></div>
  <div class="marker a"><i></i></div>
  <div class="marker b"><i></i></div>
  <div class="marker c"><i></i></div>
  <div class="marker d"><i></i></div>
</div>
<div class="ncd-login-title">
  <h1>三号线运输车辆监管平台</h1>
  <h4>加盟三号线中国煤炭网，全程煤炭监管，拉近买方与卖方的距离，共赢未来。</h4>
</div>
<div class="ncd-login-form">
  <form id="delivery_login" method="post" action="<?php echo DELIVERY_SITE_URL;?>/index.php?act=login">
    <input type="hidden" name="form_submit" value="ok" />
    <!--<div class="form-item"><label class="phrases">用户名</label>
      <input class="input-txt" type="text" name="dname" id="dname" autofocus="autofocus" autocomplete="off"  />
      <span></span></div>
    <div class="form-item"><label class="phrases">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
      <input class="input-txt" type="password" name="dpasswd" id="dpasswd" />
      <span></span></div>-->
    <input name="按钮" type="button" class="submit" value="登        录" onclick="window.open('http://218.26.89.156:8080/')">
  </form>
  <a href="index.php?act=joinin" class="register">三号线运输车辆监管平台</a> </div>
<script type="text/javascript">
$(function(){
    $("#delivery_login .input-txt").placeholder();
    $('#delivery_login').validate({
        errorPlacement: function(error, element){
            element.next().append(error);
        },
        submitHandler:function(form){
            ajaxpost('delivery_login', '', '', 'onerror');
        },
        rules : {
            dname : {
                required : true
            },
            dpasswd : {
                required : true
            }
        },
        messages : {
            dname : {
                required : '请输入您的用户名'
            },
            dpasswd  : {
                required : '请输入您的密码'
            }
        }
    });
});
</script>