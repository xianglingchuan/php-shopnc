<?php defined('InShopNC') or exit('Access Invalid!');?>

<link type="text/css" rel="stylesheet" media="screen" href="<?php echo SHOP_TEMPLATES_URL; ?>/2016/css/register/base.css"/>
<link type="text/css" rel="stylesheet" media="screen" href="<?php echo SHOP_TEMPLATES_URL; ?>/2016/css/register/home_header.css"/>
<link type="text/css" rel="stylesheet" media="screen" href="<?php echo SHOP_TEMPLATES_URL; ?>/2016/css/register/member_login.css"/>
<link type="text/css" rel="stylesheet" media="screen" href="<?php echo SHOP_TEMPLATES_URL; ?>/2016/css/register/font-awesome.min.css"/>
<script type="text/javascript" src="<?php echo SHOP_TEMPLATES_URL; ?>/2016/js/jquery.inputDefault.js" charset="utf-8"></script> 
<script>
var isCompanyDefault = false;    
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
        if(isCompanyDefault == false){
            var options = {attrName: 'cfs', size:0, bold: false, italic:false, color:'#CCC'};
            $('[cfs]').inputDefault(options);  
            isCompanyDefault = true;
        }        
    }
    $(_this).attr("class","tabulous_active");
}
</script>
<style>
</style>
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
              <form id="register_form" class="nc-login-form" method="post" action="<?php echo SHOP_SITE_URL;?>/index.php?act=login&op=usersave">
              	<input type="hidden" name="reg_source" id="reg_source" value="">
                <?php Security::getToken();?>
                <dl>
                  <dt><?php echo $lang['login_register_username'];?>：</dt>
                  <dd>
                    <input type="text" fs="<?php echo $lang['login_register_username_to_login'];?>" id="user_name" name="user_name" class="text" title=""  style="color: rgb(187, 187, 187);" autofocus>
                  </dd>
                </dl>
                <dl>
                  <dt><?php echo $lang['login_register_pwd'];?>：</dt>
                  <dd>
                      <input type="password" id="password" name="password" fs="<?php echo $lang['login_register_input_password_again'];?>" class="text" title="<?php echo $lang['login_register_password_to_login'];?>"  value="" style="color: rgb(187, 187, 187);">
                  </dd>
                </dl>                
                <dl>
                  <dt><?php echo $lang['login_register_ensure_password'];?>：</dt>
                  <dd>
                    <input type="password" id="password_confirm" name="password_confirm" class="text" fs="<?php echo $lang['login_register_input_password_again'];?>" value="" style="color: rgb(187, 187, 187);">
                  </dd>
                </dl>
                <?php if(C('captcha_status_register') == '1') { ?>   
                <div class="mt10">
                    <div class="code-div">
                  <dl>
                    <dt>验证码：</dt>
                    <dd>
                      <input type="text" id="captcha" name="captcha" class="text w80" size="10" fs="<?php echo $lang['login_register_input_code'];?>" autocomplete="off" value="" style="color: rgb(187, 187, 187);">
                    </dd>
                  </dl>
                  <span><img src="index.php?act=seccode&op=makecode&nchash=<?php echo getNchash();?>" name="codeimage" id="codeimage"> <a class="makecode" href="javascript:void(0)" onclick="javascript:document.getElementById('codeimage').src='index.php?act=seccode&op=makecode&nchash=<?php echo getNchash();?>&t=' + Math.random();"><?php echo $lang['login_register_click_to_change_code'];?></a></span></div>
                </div>
                <?php } ?>   
                <dl class="mt15">
                  <dt>手机号码：</dt>
                  <dd>
                    <input type="text" id="user_mobile" name="user_mobile" class="text" fs="请输入手机号" value="" style="color: rgb(187, 187, 187);">
                  </dd>
                </dl>              
                <div class="tiptext" id="sms_text_1">确保上方手机号及验证码输入正确，点击<span><a href="javascript:void(0);"  id="getCode" onclick="register_code()"><i class="icon-mobile-phone"></i>发送短信验证</a></span>，并将您手机短信所接收到的“动态码”输入到下方短信验证，再点击“立即注册”。</div>  
                <dl>
                  <dt>短信验证：</dt>
                  <dd>
                    <input type="text" name="mobile_code" id="mobile_code" fs="请输入手机验证码" autocomplete="off"  class="text"  size="15" value="" style="color: rgb(187, 187, 187);">
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
					data:{'act':'ihuyi','op':'register', 'type':'user', 'send_code':<?php echo $_SESSION['send_code'];//防止恶意请求 ?>,'mobile':mobile},          
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
                                alert("bool_code.....");
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
                
                
                             <dl class="clause-div">
                             <dd><input name="agree" type="checkbox" class="checkbox" id="clause" value="1" checked="checked">
                              <?php echo $lang['login_register_agreed'];?><a href="<?php echo urlShop('document', 'index',array('code'=>'agreement'));?>" target="_blank" class="agreement" title="<?php echo $lang['login_register_agreed'];?>"><?php echo $lang['login_register_agreement'];?></a></dd>
                            </dl>
                            <div class="submit-div"><input type="submit" id="Submit" value="<?php echo $lang['login_register_regist_now'];?>" class="submit"></div>

                            <input type="hidden" value="<?php echo $_GET['ref_url']?>" name="ref_url">
                            <input name="nchash" type="hidden" value="<?php echo getNchash();?>" />
                            <input type="hidden" name="form_submit" value="ok" />
              </form>
            </div>
            <div id="register_company" class="tabs-content" style="position: absolute; top: 0px; display: none;">
              <form id="register_company_form" class="nc-login-form" method="post" action="<?php echo SHOP_SITE_URL;?>/index.php?act=login&op=companysave">
              	<input type="hidden" name="reg_source" id="reg_source" value="">
                <?php Security::getToken();?>
                <dl>
                  <dt>企业名称：</dt>
                  <dd>
                    <input type="text" cfs="<?php echo $lang['login_register_username_to_login'];?>"  id="company_user_name" name="company_user_name" class="text" title=""  style="color: rgb(187, 187, 187);">
                  </dd>
                </dl>
                <dl>
                  <dt><?php echo $lang['login_register_pwd'];?>：</dt>
                  <dd>
                      <input type="password" cfs="<?php echo $lang['login_register_input_password_again'];?>" id="company_password" name="company_password"  class="text" title="<?php echo $lang['login_register_password_to_login'];?>"  value="" style="color: rgb(187, 187, 187);">
                  </dd>
                </dl>                
                <dl>
                  <dt><?php echo $lang['login_register_ensure_password'];?>：</dt>
                  <dd>
                    <input type="password" cfs="<?php echo $lang['login_register_input_password_again'];?>" id="company_password_confirm" name="company_password_confirm" class="text"  value="" style="color: rgb(187, 187, 187);">
                  </dd>
                </dl>
                
                
                <dl>
                  <dt>公司电话：</dt>
                  <dd>
                    <input type="text" cfs="<?php echo $lang['login_register_input_tel_again'];?>" id="company_tel" name="company_tel" class="text" value="" style="color: rgb(187, 187, 187);">
                  </dd>
                </dl>
                
                <dl>
                  <dt>公司邮箱：</dt>
                  <dd>
                    <input type="text" cfs="<?php echo $lang['login_register_input_email_again'];?>" id="company_email" name="company_email" class="text"  value="" style="color: rgb(187, 187, 187);">
                  </dd>
                </dl>
                <?php if(C('captcha_status_register') == '1') { ?>   
                <div class="mt10">
                    <div class="code-div">
                  <dl>
                    <dt>验证码：</dt>
                    <dd>
                      <input cfs="<?php echo $lang['login_register_input_code'];?>" type="text" id="company_captcha" name="company_captcha" class="text w80" size="10" autocomplete="off" value="" style="color: rgb(187, 187, 187);">
                    </dd>
                  </dl>
                  <span><img src="index.php?act=seccode&op=makecodecompany&nchash=<?php echo getNchashCompany('register','companyusersave');?>" name="company_codeimage" id="company_codeimage"> <a class="makecode" href="javascript:void(0)" onclick="javascript:document.getElementById('company_codeimage').src='index.php?act=seccode&op=makecodecompany&nchash=<?php echo getNchashCompany('register','companyusersave');?>&t=' + Math.random();"><?php echo $lang['login_register_click_to_change_code'];?></a></span></div>
                </div>
                <?php } ?>   
                
                
                
                <dl class="mt15">
                  <dt>手机号码：</dt>
                  <dd>
                    <input type="text" cfs="请输入手机号" id="company_user_mobile" name="company_user_mobile" class="text"  value="" style="color: rgb(187, 187, 187);">
                  </dd>
                </dl>              
                <div class="tiptext" id="sms_text_1">确保上方手机号及验证码输入正确，点击<span><a href="javascript:void(0);"  id="company_getCode" onclick="company_register_code()"><i class="icon-mobile-phone"></i>发送短信验证</a></span>，并将您手机短信所接收到的“动态码”输入到下方短信验证，再点击“立即注册”。</div>  
                <dl>
                  <dt>短信验证：</dt>
                  <dd>
                    <input type="text" cfs="请输入手机验证码" name="company_mobile_code"  id="company_mobile_code" autocomplete="off"  class="text"  size="15" value="" style="color: rgb(187, 187, 187);">
                  </dd>
                </dl>
                <script  type="text/javascript">
        	<?php //生成PHP随机数，请求时发送到后台，匹配是否存在和正确。防止恶意请求和站外调用。
		$_SESSION['company_send_code']=rand(10000,99999);
		?>
		function company_register_code(){
		    var mobile = $("#company_user_mobile").val();//获取手机号
		    company_getCode(mobile);
		}			 
		//获取验证码
		function company_getCode(mobile){
		    if($.trim(mobile)==""){
			alert("请输入手机号");	
			return false; 
		    }
		    company_RemainTime("company_getCode",60);
				$.ajax({
				type:"POST",
				url:"index.php", 
				cache:false,
				data:{'act':'ihuyi','op':'register','type':'company','send_code':<?php echo $_SESSION['company_send_code'];//防止恶意请求 ?>,'mobile':mobile},          
				success:function(data){
				if(data=="2"){
				//倒计时
				//RemainTime("getCode",20);  //发送成功   getCode ： 发送的按钮ID  ，20：倒计时时间
				}else if(data=="-1"){
				clearTimeout(timeid);
				company_RemainTime("company_getCode",1);
				alert("发送失败"); 
				}
			}       
		});
		}

		//倒计时itime =秒
		function company_RemainTime(id,iTime){
		
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
		function company_bool_code(){
			var user_mobile = $("#company_user_mobile").val();
			var mobile_code = $("#company_mobile_code").val();
			
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
                
                
                             <dl class="clause-div">
                             <dd><input name="agree" type="checkbox" class="checkbox" id="clause" value="1" checked="checked">
                              <?php echo $lang['login_register_agreed'];?><a href="<?php echo urlShop('document', 'index',array('code'=>'agreement'));?>" target="_blank" class="agreement" title="<?php echo $lang['login_register_agreed'];?>"><?php echo $lang['login_register_agreement'];?></a></dd>
                            </dl>
                            <div class="submit-div"><input type="submit" id="Submit" value="<?php echo $lang['login_register_regist_now'];?>" class="submit"></div>

                            <input type="hidden" value="<?php echo $_GET['ref_url']?>" name="ref_url">
                            <input name="nchash" type="hidden" value="<?php echo getNchashCompany('register','companyusersave');?>" />
                            <input type="hidden" name="form_submit" value="ok" />              
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
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/jquery.poshytip.min.js" charset="utf-8"></script> 
<script>
$(function() {
    $('[fs]').inputDefault();
});


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



$("#register_company_form").validate({
        errorPlacement: function(error, element){
            var error_td = element.parent('dd');
            error_td.find('label').hide();
            error_td.append(error);
        },
        onkeyup: false,
        rules : {
            company_user_name : {
                required : true,
                lettersmin : true,
                lettersmax : true,
                lettersonly : true,
                remote   : {
                    url :'index.php?act=login&op=check_member&column=ok',
                    type:'get',
                    data:{
                        user_name : function(){
                            return $('#company_user_name').val();
                        }
                    }
                }
            },
	<!---互亿无线  手机验证 开始代码--->
	company_user_mobile : {
            required : true,
            minlength: 11,
        },
	company_mobile_code : {
            required : true,
	    remote   : {
                url :'index.php?act=ihuyi&op=boolReg',
                type:'get',
                data:{
                    mobile_code : function(){
                         return $('#company_mobile_code').val();
                            },
                    mobile : function(){
                          return $("#company_user_mobile").val();
                        }
                }
            }     
         },						
		 <!---互亿无线  手机验证 结束代码--->
            company_password : {
                required : true,
                minlength: 6,
		maxlength: 20
            },
            company_password_confirm : {
                required : true,
                equalTo  : '#company_password'
            },
            company_email : {
                required : true,
                email    : true,
                remote   : {
                    url : 'index.php?act=login&op=check_email',
                    type: 'get',
                    data:{
                        email : function(){
                            return $('#company_email').val();
                        }
                    }
                }
            },
	   <?php if(C('captcha_status_register') == '1') { ?>
            company_captcha : {
                required : true,
                remote   : {
                    url : 'index.php?act=seccode&op=checkcompany&nchash=<?php echo getNchash();?>',
                    type: 'get',
                    data:{
                        captcha : function(){
                            return $('#company_captcha').val();
                        }
                    },
                    complete: function(data) {
                        if(data.responseText == 'false') {
                        	document.getElementById('company_codeimage').src='<?php echo SHOP_SITE_URL?>/index.php?act=seccode&op=makecodecompany&nchash=<?php echo getNchash();?>&t=' + Math.random();
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
            company_user_name : {
                required : '<?php echo $lang['login_register_input_company_username'];?>',
                lettersmin : '<?php echo $lang['login_register_company_username_range'];?>',
                lettersmax : '<?php echo $lang['login_register_company_username_range'];?>',
		lettersonly: '<?php echo $lang['login_register_company_username_lettersonly'];?>',
		remote	 : '<?php echo $lang['login_register_company_username_exists'];?>'
            },
	    <!---互亿无线  手机验证 开始代码---> 
	    company_user_mobile : {
                required : '请输入手机号',
              	minlength : '手机号长度为11位' 
            },
            company_mobile_code : {
                required : '请输入验证码',
		remote : '验证码错误'
            },
	    <!---互亿无线  手机验证 结束代码---> 
            company_password  : {
                required : '<?php echo $lang['login_register_input_password'];?>',
                minlength: '<?php echo $lang['login_register_password_range'];?>',
				maxlength: '<?php echo $lang['login_register_password_range'];?>'
            },
            company_password_confirm : {
                required : '<?php echo $lang['login_register_input_password_again'];?>',
                equalTo  : '<?php echo $lang['login_register_password_not_same'];?>'
            },
            company_email : {
                required : '<?php echo $lang['login_register_input_email'];?>',
                email    : '<?php echo $lang['login_register_invalid_email'];?>',
				remote	 : '<?php echo $lang['login_register_email_exists'];?>'
            },
	    <?php if(C('captcha_status_register') == '1') { ?>
            company_captcha : {
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