<?php defined('InShopNC') or exit('Access Invalid!');?>
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

    /*padding-top: 30px;*/
    /*margin-top: 30px;*/
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
  <div class="nc-login-left">
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
  </div>
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