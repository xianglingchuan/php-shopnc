<?php defined('InShopNC') or exit('Access Invalid!');?>

<link type="text/css" rel="stylesheet" media="screen" href="<?php echo SHOP_TEMPLATES_URL; ?>/2016/css/register/base.css"/>
<link type="text/css" rel="stylesheet" media="screen" href="<?php echo SHOP_TEMPLATES_URL; ?>/2016/css/register/home_header.css"/>
<link type="text/css" rel="stylesheet" media="screen" href="<?php echo SHOP_TEMPLATES_URL; ?>/2016/css/register/member_login.css"/>
<link type="text/css" rel="stylesheet" media="screen" href="<?php echo SHOP_TEMPLATES_URL; ?>/2016/css/register/font-awesome.min.css"/>

<script>
function tabRegister(type,_this){
    if(type=="person"){
        $("#default").show();
        $("#register_company").hide();
        $("#person").attr("class","tabulous_active");
        $("#company_tab").attr("class","");
    }else{
        $("#default").hide();
        $("#register_company").show();
        $("#person").attr("class","");
        $("#person_tab").attr("class","");
    }
    $(_this).attr("class","tabulous_active");
}
</script>


<div class="nc-register-bg">
  <div class="nc-register-box">
    <div class="nc-register-layout">
      <div class="left">
        <div class="nc-register-mode">
          <ul class="tabs-nav">
              <li><a href="javascript:void(0)" id="person_tab" onclick="tabRegister('person', this)" class="tabulous_active">个人注册<i></i></a></li>
              <li><a href="javascript:void(0)" id="company_tab" onclick="tabRegister('company', this)" class="">企业注册<i></i></a></li><span class="tabulousclear"></span>
          </ul>
          <div id="tabs_container" class="tabs-container" style="height: 549px;">
            <div id="default" class="tabs-content" style="position: absolute; top: 0px;">
              <form id="register_form" class="nc-login-form" method="post" action="http://www.nenhaitao.com/shop/index.php?act=login&amp;op=usersave">
              	<input type="hidden" name="reg_source" id="reg_source" value="">
                <input type="hidden" name="formhash" value="SeE4QaPk_WXkD4E5Q7aEhBmG4Dmz7dU">                <dl>
                  <dt>用户名：</dt>
                  <dd>
                    <input type="text" id="user_name" name="user_name" class="text" tipmsg="请使用3-15个中、英文、数字及“-”符号组成，不能为纯数字，不能以“CBT”开头" value="请使用3-15个中、英文、数字及“-”符号组成，不能为纯数字，不能以“CBT”开头" style="color: rgb(187, 187, 187);">
                  </dd>
                </dl>
                <dl>
                  <dt>设置密码：</dt>
                  <dd>
                    <input type="text" id="password" name="password" class="text" tipmsg="6-20个大小写英文字母、符号或数字" value="6-20个大小写英文字母、符号或数字" style="color: rgb(187, 187, 187);">
                  </dd>
                </dl>
                <dl>
                  <dt>确认密码：</dt>
                  <dd>
                    <input type="text" id="password_confirm" name="password_confirm" class="text" tipmsg="请再次输入密码" value="请再次输入密码" style="color: rgb(187, 187, 187);">
                  </dd>
                </dl>
                <div class="mt10">
                <dl class="mt15">
                  <dt>手机号码：</dt>
                  <dd>
                    <input type="text" id="tel" name="tel" class="text" tipmsg="输入常用手机号作为验证及找回密码使用" value="输入常用手机号作为验证及找回密码使用" style="color: rgb(187, 187, 187);">
                  </dd>
                </dl>
                                  <div class="code-div">
                  <dl>
                    <dt>验证码：</dt>
                    <dd>
                      <input type="text" id="captcha" name="captcha" class="text w80" size="10" autocomplete="off" tipmsg="输入验证码" value="输入验证码" style="color: rgb(187, 187, 187);">
                    </dd>
                  </dl>
                  <span><img src="./嫩海淘 - 用户注册_files/index.php" name="codeimage" id="codeimage_1"> <a class="makecode" href="javascript:void(0)" onclick="javascript:document.getElementById(&#39;codeimage_1&#39;).src=&#39;index.php?act=seccode&amp;op=makecode&amp;type=50,120&amp;nchash=1096ec3c&amp;t=&#39; + Math.random();">看不清，换一张</a></span></div>
                </div>
                <div class="tiptext" id="sms_text_1">确保上方手机号及验证码输入正确，点击<span><a href="javascript:void(0);" onclick="get_sms_captcha_1(&#39;1&#39;)"><i class="icon-mobile-phone"></i>发送短信验证</a></span>，并将您手机短信所接收到的“6位动态码”输入到下方短信验证，再点击“立即注册”。</div>
                <dl>
                  <dt>短信验证：</dt>
                  <dd>
                    <input type="text" name="sms_captcha_1" autocomplete="off" tipmsg="输入6位短信验证码" class="text" id="sms_captcha_1" size="15" value="输入6位短信验证码" style="color: rgb(187, 187, 187);">
                  </dd>
                </dl>
      
                <dl class="clause-div">
                  <dd>
                    <input name="agree" type="checkbox" class="checkbox" id="clause" value="1" checked="checked">
                    阅读并同意<a href="http://www.nenhaitao.com/shop/index.php?act=document&amp;op=index&amp;code=agreement" target="_blank" class="agreement" title="阅读并同意">《服务协议》</a></dd>
                </dl>
                <div class="submit-div">
                  <input type="submit" id="Submit" value="立即注册" class="submit">
                </div>
                <input type="hidden" value="http://www.nenhaitao.com/" name="ref_url">
                <input name="nchash" type="hidden" value="1096ec3c">
                <input type="hidden" name="form_submit" value="ok">
				<input type="hidden" id="is_card_checked" value="0">
              </form>
            </div>
              
              
            <div id="register_company" class="tabs-content" style="position: absolute; top: 0px; display: none;">
              <form id="register_form" class="nc-login-form" method="post" action="http://www.nenhaitao.com/shop/index.php?act=login&amp;op=usersave">
              	<input type="hidden" name="reg_source" id="reg_source" value="">
                <input type="hidden" name="formhash" value="SeE4QaPk_WXkD4E5Q7aEhBmG4Dmz7dU">                <dl>
                  <dt>用户名11：</dt>
                  <dd>
                    <input type="text" id="user_name" name="user_name" class="text" tipmsg="请使用3-15个中、英文、数字及“-”符号组成，不能为纯数字，不能以“CBT”开头" value="请使用3-15个中、英文、数字及“-”符号组成，不能为纯数字，不能以“CBT”开头" style="color: rgb(187, 187, 187);">
                  </dd>
                </dl>
                <dl>
                  <dt>设置密码：</dt>
                  <dd>
                    <input type="text" id="password" name="password" class="text" tipmsg="6-20个大小写英文字母、符号或数字" value="6-20个大小写英文字母、符号或数字" style="color: rgb(187, 187, 187);">
                  </dd>
                </dl>
                <dl>
                  <dt>确认密码：</dt>
                  <dd>
                    <input type="text" id="password_confirm" name="password_confirm" class="text" tipmsg="请再次输入密码" value="请再次输入密码" style="color: rgb(187, 187, 187);">
                  </dd>
                </dl>
                <div class="mt10">
                <dl class="mt15">
                  <dt>手机号码：</dt>
                  <dd>
                    <input type="text" id="tel" name="tel" class="text" tipmsg="输入常用手机号作为验证及找回密码使用" value="输入常用手机号作为验证及找回密码使用" style="color: rgb(187, 187, 187);">
                  </dd>
                </dl>
                                  <div class="code-div">
                  <dl>
                    <dt>验证码：</dt>
                    <dd>
                      <input type="text" id="captcha" name="captcha" class="text w80" size="10" autocomplete="off" tipmsg="输入验证码" value="输入验证码" style="color: rgb(187, 187, 187);">
                    </dd>
                  </dl>
                  <span><img src="./嫩海淘 - 用户注册_files/index.php" name="codeimage" id="codeimage_1"> <a class="makecode" href="javascript:void(0)" onclick="javascript:document.getElementById(&#39;codeimage_1&#39;).src=&#39;index.php?act=seccode&amp;op=makecode&amp;type=50,120&amp;nchash=1096ec3c&amp;t=&#39; + Math.random();">看不清，换一张</a></span></div>
                </div>
                <div class="tiptext" id="sms_text_1">确保上方手机号及验证码输入正确，点击<span><a href="javascript:void(0);" onclick="get_sms_captcha_1(&#39;1&#39;)"><i class="icon-mobile-phone"></i>发送短信验证</a></span>，并将您手机短信所接收到的“6位动态码”输入到下方短信验证，再点击“立即注册”。</div>
                <dl>
                  <dt>短信验证：</dt>
                  <dd>
                    <input type="text" name="sms_captcha_1" autocomplete="off" tipmsg="输入6位短信验证码" class="text" id="sms_captcha_1" size="15" value="输入6位短信验证码" style="color: rgb(187, 187, 187);">
                  </dd>
                </dl>
                <dl class="clause-div">
        	       <dd style="font-weight: bold;"><input type="checkbox" name="card_check" id="card_check" value="1" class="checkbox"> 同时绑定会员卡</dd>
                </dl>
                <div class="mt10" id="card_reg" style="display: none;">
                    <dl class="">
                        <dt>会员卡号：</dt>
                        <dd>
                            <input type="text" name="card_num" id="card_num" class="text" tipmsg="在您的会员卡上，例如CBTA666666，无空格" value="在您的会员卡上，例如CBTA666666，无空格" style="color: rgb(187, 187, 187);">
                        </dd>
                    </dl>
                    <dl class="">
                        <dt>卡密码：</dt>
                        <dd>
                            <input type="text" id="card_pwd" name="card_pwd" class="text" tipmsg="请输入您在办理会员卡时设置的密码" value="请输入您在办理会员卡时设置的密码" style="color: rgb(187, 187, 187);">
                        </dd>
                    </dl>
                </div>
                <dl class="clause-div">
                  <dd>
                    <input name="agree" type="checkbox" class="checkbox" id="clause" value="1" checked="checked">
                    阅读并同意<a href="http://www.nenhaitao.com/shop/index.php?act=document&amp;op=index&amp;code=agreement" target="_blank" class="agreement" title="阅读并同意">《服务协议》</a></dd>
                </dl>
                <div class="submit-div">
                  <input type="submit" id="Submit" value="立即注册" class="submit">
                </div>
                <input type="hidden" value="http://www.nenhaitao.com/" name="ref_url">
                <input name="nchash" type="hidden" value="1096ec3c">
                <input type="hidden" name="form_submit" value="ok">
				<input type="hidden" id="is_card_checked" value="0">
              </form>
            </div>
              
              
         </div>
        </div>
      </div>
      <div class="right">
        <?php if (C('qq_isuse') == 1 || C('sina_isuse') == 1 || C('weixin_isuse') == 1){?>
        <div class="api-login">
          <h4>使用合作网站账号直接登录</h4>
          <?php if (C('qq_isuse') == 1){?>
          <a href="<?php echo MEMBER_SITE_URL;?>/api.php?act=toqq" title="QQ账号登录" class="qq"><i></i></a>
          <?php } ?>
          <?php if (C('sina_isuse') == 1){?>
          <a href="<?php echo MEMBER_SITE_URL;?>/api.php?act=tosina" title="<?php echo $lang['nc_otherlogintip_sina']; ?>" class="sina"><i></i></a>
          <?php } ?>
          <?php if (C('weixin_isuse') == 1){?>
          <a href="javascript:void(0);" onclick="ajax_form('weixin_form', '微信账号登录', '<?php echo urlLogin('connect_wx', 'index');?>', 360);" title="微信账号登录" class="wx"><i></i></a>
          <?php } ?>
        </div>
        <?php } ?>
        <div class="reister-after">
          <h4><?php echo $lang['login_register_after_regist'];?></h4>
          <ol>
            <li class="ico01"><i></i><?php echo $lang['login_register_buy_info'];?></li>
            <li class="ico02"><i></i><?php echo $lang['login_register_collect_info'];?></li>
            <li class="ico03"><i></i><?php echo $lang['login_register_honest_info'];?></li>
            <li class="ico04"><i></i><?php echo $lang['login_register_openstore_info'];?></li>
            <li class="ico05"><i></i><?php echo $lang['login_register_talk_info'];?></li>
            <li class="ico06"><i></i><?php echo $lang['login_register_sns_info'];?></li>
          </ol>
        </div>
      </div>
    </div>
  </div>
</div>










<style type="text/css">
.public-top-layout, .head-app, .head-search-bar, .head-user-menu, .public-nav-layout, .nch-breadcrumb-layout, #faq {
	display: none !important;
}
.public-head-layout {
	margin: 10px auto -10px auto;
}
.wrapper {
	width: 1000px;
}
#footer {
    border-top: none!important;
}
#footer_container
{
    position: fixed;
    bottom: 0;
    z-index: 99;
}
</style>
<div class="nc-login-layout" style="margin-top: 30px;">
  <div class="nc-login">
    <div class="nc-login-title">
      <h3><?php echo $lang['login_register_join_us'];?></h3>
    </div>
    <div class="nc-login-content">
      <form id="register_form" method="post" action="<?php echo SHOP_SITE_URL;?>/index.php?act=login&op=usersave">
      <?php Security::getToken();?>
        <dl>
          <dt><?php echo $lang['login_register_username'];?></dt>
          <dd style="min-height:54px;">
            <input type="text" id="user_name" name="user_name" class="text tip" title="<?php echo $lang['login_register_username_to_login'];?>" autofocus />
            <label></label>
          </dd>
        </dl>
        <dl>
          <dt><?php echo $lang['login_register_pwd'];?></dt>
          <dd style="min-height:54px;">
            <input type="password" id="password" name="password" class="text tip" title="<?php echo $lang['login_register_password_to_login'];?>" />
            <label></label>
          </dd>
        </dl>
        <dl>
          <dt><?php echo $lang['login_register_ensure_password'];?></dt>
          <dd style="min-height:54px;">
            <input type="password" id="password_confirm" name="password_confirm" class="text tip" title="<?php echo $lang['login_register_input_password_again'];?>"/>
            <label></label>
          </dd>
        </dl>
        <dl>
          <dt><?php echo $lang['login_register_email'];?></dt>
          <dd style="min-height:54px;">
            <input type="text" id="email" name="email" class="text tip" title="<?php echo $lang['login_register_input_valid_email'];?>" />
            <label></label>
          </dd>
        </dl>
        <?php if(C('captcha_status_register') == '1') { ?>
        <dl>
          <dt><?php echo $lang['login_register_code'];?></dt>
          <dd style="min-height:54px;">
            <input type="text" id="captcha" name="captcha" class="text w50 fl tip" maxlength="4" size="10" title="<?php echo $lang['login_register_input_code'];?>" />
            <img src="index.php?act=seccode&op=makecode&nchash=<?php echo getNchash();?>" title="" name="codeimage" border="0" id="codeimage" class="fl ml5"/> <a href="javascript:void(0)" class="ml5" onclick="javascript:document.getElementById('codeimage').src='index.php?act=seccode&op=makecode&nchash=<?php echo getNchash();?>&t=' + Math.random();"><?php echo $lang['login_register_click_to_change_code'];?></a>
            <label></label>
          </dd>
        </dl>
        <?php } ?>
		<!---互亿无线  手机验证 开始代码---> 
         <dl>
          <dt>手机号码</dt>
          <dd style="min-height:54px;">
            <input type="text" id="user_mobile" name="user_mobile" class="text tip" title="请输入手机号" autofocus />
           
          </dd>
        </dl>
         <dl>
          <dt>手机验证码</dt>
          <dd style="min-height:54px;">
          <input type="text" id="mobile_code" name="mobile_code" class="text w50 fl tip"  title="请输入手机验证码" />
          <label></label>
         	 <a class="register"  id="getCode" onclick="register_code()" >获取</a>
          </dd>
        </dl>
        
        <script  type="text/javascript">
        	
			<?php //生成PHP随机数，请求时发送到后台，匹配是否存在和正确。防止恶意请求和站外调用。
				$_SESSION['send_code']=rand(10000,99999);
			 ?>
			function register_code(){
				var mobile = $("#user_mobile").val();//获取手机号
				getCode(mobile);
			}
			 
			//获取验证码
			function getCode(mobile){
				if($.trim(mobile)==""){
					alert("请输入手机号");	
					return false; 
				}
			  RemainTime("getCode",60);
		
				$.ajax({
						type:"POST",
						url:"index.php", 
						cache:false,
						data:{'act':'ihuyi','op':'register','send_code':<?php echo $_SESSION['send_code'];//防止恶意请求 ?>,'mobile':mobile},          
						success:function(data){
							if(data=="2"){
								//倒计时
								//RemainTime("getCode",20);  //发送成功   getCode ： 发送的按钮ID  ，20：倒计时时间
							}else if(data=="-1"){
								clearTimeout(timeid);
								RemainTime("getCode",1);
								alert("发送失败"); 
								
								
							}
						}       
				});
			}

		//倒计时itime =秒
		function RemainTime(id,iTime){
		
			iTime=iTime-1;
			if(iTime!=0){
			  timeid=setTimeout("RemainTime('"+id+"',"+iTime+")",1000);
				$("#"+id).removeAttr("onclick");
				$("#"+id).text(iTime+"秒");
			}else if(iTime<=0){
				$("#"+id).attr("onclick","register_code();");
				$("#"+id).text("获取")
			}
		}
		
		//验证码是否正确
		function bool_code(){
		
			var user_mobile = $("#user_mobile").val();
			var mobile_code = $("#mobile_code").val();
			
			if(user_mobile ==""){
				alert ("请出入手机号码");
				return false;
			}
			if(mobile_code ==""){
				alert ("请输出手机验证码");
				return false;
			}
			
			$.ajax({
						type:"POST",
						url:"<?php echo ADMIN_SITE_URL;?>/index.php", 
						cache:false,
						data:{'act':'ihuyi','op':'boolReg','mobile_code':mobile_code,'mobile':mobile},          
						success:function(data){
							 if(data=="1"){
								 return true;
							}else{
								 return false;
							}
							
						}       
			});
				
				
			return false;
			
		}
		
		
		</script>

      <!---互亿无线  手机验证 结束代码--->  
        <dl>
          <dt>&nbsp;</dt>
          <dd>
            <input type="submit" id="Submit" value="<?php echo $lang['login_register_regist_now'];?>" class="submit" title="<?php echo $lang['login_register_regist_now'];?>" />
            <input name="agree" type="checkbox" class="vm ml10" id="clause" value="1" checked="checked" />
            <span for="clause" class="ml5"><?php echo $lang['login_register_agreed'];?><a href="<?php echo urlShop('document', 'index',array('code'=>'agreement'));?>" target="_blank" class="agreement" title="<?php echo $lang['login_register_agreed'];?>"><?php echo $lang['login_register_agreement'];?></a></span>
            <label></label>
          </dd>
        </dl>
        <input type="hidden" value="<?php echo $_GET['ref_url']?>" name="ref_url">
        <input name="nchash" type="hidden" value="<?php echo getNchash();?>" />
		<input type="hidden" name="form_submit" value="ok" />
      </form>
      <div class="clear"></div>
    </div>
    <div class="nc-login-bottom"></div>
  </div>
<!--  <div class="nc-login-left">
    <h3><?php echo $lang['login_register_after_regist'];?></h3>
    <ol>
      <li class="ico05"><i></i><?php echo $lang['login_register_buy_info'];?></li>
      <li class="ico01"><i></i><?php echo $lang['login_register_openstore_info'];?></li>
      <li class="ico03"><i></i><?php echo $lang['login_register_sns_info'];?></li>
      <li class="ico02"><i></i><?php echo $lang['login_register_collect_info'];?></li>
      <li class="ico06"><i></i><?php echo $lang['login_register_talk_info'];?></li>
      <li class="ico04"><i></i><?php echo $lang['login_register_honest_info'];?></li>
      <div class="clear"></div>
    </ol>
    <h3 class="mt20"><?php echo $lang['login_register_already_have_account'];?></h3>
    <div class="nc-login-now mt10"><span class="ml20"><?php echo $lang['login_register_login_now_1'];?><a href="index.php?act=login&ref_url=<?php echo urlencode($output['ref_url']); ?>" title="<?php echo $lang['login_register_login_now'];?>" class="register"><?php echo $lang['login_register_login_now_2'];?></a></span><span><?php echo $lang['login_register_login_now_3'];?><a class="forget" href="index.php?act=login&op=forget_password"><?php echo $lang['login_register_login_forget'];?></a></span></div>
  </div>-->
</div>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/jquery.poshytip.min.js" charset="utf-8"></script> 
<script>
//注册表单提示
$('.tip').poshytip({
	className: 'tip-yellowsimple',
	showOn: 'focus',
	alignTo: 'target',
	alignX: 'center',
	alignY: 'top',
	offsetX: 0,
	offsetY: 5,
	allowTipHover: false
});

//注册表单验证
$(function(){
		jQuery.validator.addMethod("lettersonly", function(value, element) {
			return this.optional(element) || /^[^:%,'\*\"\s\<\>\&]+$/i.test(value);
		}, "Letters only please"); 
		jQuery.validator.addMethod("lettersmin", function(value, element) {
			return this.optional(element) || ($.trim(value.replace(/[^\u0000-\u00ff]/g,"aa")).length>=3);
		}, "Letters min please"); 
		jQuery.validator.addMethod("lettersmax", function(value, element) {
			return this.optional(element) || ($.trim(value.replace(/[^\u0000-\u00ff]/g,"aa")).length<=15);
		}, "Letters max please");
    $("#register_form").validate({
        errorPlacement: function(error, element){
            var error_td = element.parent('dd');
            error_td.find('label').hide();
            error_td.append(error);
        },
        onkeyup: false,
        rules : {
            user_name : {
                required : true,
                lettersmin : true,
                lettersmax : true,
                lettersonly : true,
                remote   : {
                    url :'index.php?act=login&op=check_member&column=ok',
                    type:'get',
                    data:{
                        user_name : function(){
                            return $('#user_name').val();
                        }
                    }
                }
            },
			<!---互亿无线  手机验证 开始代码--->
		 user_mobile : {
            required : true,
            minlength: 11,
        },
		mobile_code : {
            required : true,
			remote   : {
            url :'index.php?act=ihuyi&op=boolReg',
            type:'get',
            data:{
            	mobile_code : function(){
                     return $('#mobile_code').val();
                 	},
				 mobile : function(){
                      return $("#user_mobile").val();
                    }
                 }
             }     
         },
						
		 <!---互亿无线  手机验证 结束代码--->
            password : {
                required : true,
                minlength: 6,
				maxlength: 20
            },
            password_confirm : {
                required : true,
                equalTo  : '#password'
            },
            email : {
                required : true,
                email    : true,
                remote   : {
                    url : 'index.php?act=login&op=check_email',
                    type: 'get',
                    data:{
                        email : function(){
                            return $('#email').val();
                        }
                    }
                }
            },
			<?php if(C('captcha_status_register') == '1') { ?>
            captcha : {
                required : true,
                remote   : {
                    url : 'index.php?act=seccode&op=check&nchash=<?php echo getNchash();?>',
                    type: 'get',
                    data:{
                        captcha : function(){
                            return $('#captcha').val();
                        }
                    },
                    complete: function(data) {
                        if(data.responseText == 'false') {
                        	document.getElementById('codeimage').src='<?php echo SHOP_SITE_URL?>/index.php?act=seccode&op=makecode&nchash=<?php echo getNchash();?>&t=' + Math.random();
                        }
                    }
                }
            },
			<?php } ?>
            agree : {
                required : true
            }
        },
        messages : {
            user_name : {
                required : '<?php echo $lang['login_register_input_username'];?>',
                lettersmin : '<?php echo $lang['login_register_username_range'];?>',
                lettersmax : '<?php echo $lang['login_register_username_range'];?>',
				lettersonly: '<?php echo $lang['login_register_username_lettersonly'];?>',
				remote	 : '<?php echo $lang['login_register_username_exists'];?>'
            },
			<!---互亿无线  手机验证 开始代码---> 
			 user_mobile : {
                required : '请输入手机号',
              	minlength : '手机号长度为11位' 
            },
			 mobile_code : {
                required : '请输入验证码',
				remote : '验证码错误'
     
            },
		  <!---互亿无线  手机验证 结束代码---> 
            password  : {
                required : '<?php echo $lang['login_register_input_password'];?>',
                minlength: '<?php echo $lang['login_register_password_range'];?>',
				maxlength: '<?php echo $lang['login_register_password_range'];?>'
            },
            password_confirm : {
                required : '<?php echo $lang['login_register_input_password_again'];?>',
                equalTo  : '<?php echo $lang['login_register_password_not_same'];?>'
            },
            email : {
                required : '<?php echo $lang['login_register_input_email'];?>',
                email    : '<?php echo $lang['login_register_invalid_email'];?>',
				remote	 : '<?php echo $lang['login_register_email_exists'];?>'
            },
			<?php if(C('captcha_status_register') == '1') { ?>
            captcha : {
                required : '<?php echo $lang['login_register_input_text_in_image'];?>',
				remote	 : '<?php echo $lang['login_register_code_wrong'];?>'
            },
			<?php } ?>
            agree : {
                required : '<?php echo $lang['login_register_must_agree'];?>'
            }
        }
    });
});
</script>