 /**自定义弹出框**/
var GDjs = {
	
	showWin:function (divName,data,id){
			GDWIN.disabledWindow(divName);
			var fdiv = jQuery(divName);
			fdiv.find("#wantId").val(id);
			fdiv.find("#buyerOrders").html(data.NUM+1);
			fdiv.find("#wantNum").text(data.SUMA==0?'--':data.SUMA);
			fdiv.find("#maxPrice").text(data.MAXP==0?'--':data.MAXP);
			fdiv.find("#minPrice").text(data.MINP==0?'--':data.MINP);
			fdiv.find("input[id='wantSl']").unbind("blur").bind("blur",function (){
				var sl = jQuery(this).val();
				if(sl == "" || !Regtor.isPositive(sl)){
					jQuery(this).css("border-color","#f00");
					return ;
				}else{
					jQuery(this).css("border-color","#ccc");
				}
			});
			fdiv.find("input[id='wantTell']").unbind("blur").bind("blur",function (){
				
				tell = jQuery.trim(jQuery(this).val());
				if(!regBox.regMobile.test(tell) && !regBox.regTel.test(tell)){
					jQuery(this).css("border-color","#f00");
					return ;
				}else{
					jQuery(this).css("border-color","#ccc");
				}
			});
		jQuery(divName).find("input[id='wantOk']").unbind('click').bind('click',function (){
			var fdiv = jQuery(divName);
			var sl = fdiv.find("input[id='wantSl']").val();
			if(sl == "" || !Regtor.isPositive(sl)){
				fdiv.find("input[id='wantSl']").focus();
				fdiv.find("input[id='wantSl']").css("border-color","#f00");
				return ;
			}
			var price = fdiv.find("input[id='wantPrice']").val();
			if(price !="" && !Regtor.isPositive(price)){
				alert("价格填写有误");
				fdiv.find("input[id='wantPrice']").focus();
				return ;
			}
			var tell = fdiv.find("input[id='wantTell']").val();
			tell = jQuery.trim(tell);
			if(!regBox.regMobile.test(tell) && !regBox.regTel.test(tell)){
				alert("联系方式不能为空或填写有误");
				fdiv.find("input[id='wantTell']").focus();
				fdiv.find("input[id='wantTell']").css("border-color","#f00");
				return ;
			}
			var content = fdiv.find("#wantContent").val();
			var id = fdiv.find("input[id='wantId']").val();
			var wantContact = fdiv.find("#wantContact").val();
			jQuery.post(baseUrl+"/dcx.do?method=saveWantBuy",{'id':id,'sl':sl,'price':price,'tell':tell,'contact':wantContact,'content':content},function(data){
				if(data==="0000"){
					alert("提交成功");
				}else{
					alert("保存失败,请稍后再试!");
				}
				GDWIN.enableWindow();
				GDjs.cleanWin(divName);
			},"text");
		});
		jQuery(".wantCancel").unbind('click').bind('click',function (){
			GDWIN.enableWindow();
			GDjs.cleanWin(divName);
		});
		
		jQuery(divName).show();
		
		GDWIN.setDivCenter(divName);
	},
	cleanWin:function (divName){
		var fdiv = jQuery(divName);
		fdiv.hide();
		fdiv.find("#buyerOrders").html("");
		fdiv.find("input[id='wantSl']").val("");
		fdiv.find("input[id='wantSl']").css("border-color","#ccc");
		fdiv.find("input[id='wantPrice']").val("");
		fdiv.find("input[id='wantContact']").val("");
		fdiv.find("input[id='wantTell']").val("");
		fdiv.find("input[id='wantTell']").css("border-color","#ccc");
		fdiv.find("#wantContent").val("");
		fdiv.find("#wantNum").text("");
		fdiv.find("#maxPrice").text("");
		fdiv.find("#minPrice").text("");
	}
}
/**自定义锁屏**/
var GDWIN ={
	/** 锁屏 **/
	disabledWindow: function(){
	    var parentdiv = jQuery('<div id="disDiv" class="wantCancel" title="点击其他区域关闭"></div>');
	    parentdiv.css({
		   'position':'fixed',
		   'left':'0',
		   'top':'0',
		   'width':'100%',
		   'height':'100%',
		   'background':'#000',
		   'filter':'alpha(opacity=70)',
		   'z-index': '100',
		   'opacity': '0.7'
		}); //添加css样式	
	    jQuery('body').append(parentdiv);//将父div添加到body中
	},
	disabledWhiteWindow: function(){
	    var parentdiv = jQuery('<div></div>');
	    parentdiv.css({
		   'position':'fixed',
		   'left':'0',
		   'top':'0',
		   'width':'100%',
		   'height':'100%',
		   'background':'#000',
		   'filter':'alpha(opacity=70)',
		   'z-index': '100',
		   'opacity': '0.7'
		}); //添加css样式	
	    parentdiv.append('<div id="showLoading" style=""><img src="/webdocs/images/dcx_loading.gif"/></div>');
	    jQuery('body').append(parentdiv);//将父div添加到body中
	    var top = (jQuery(window).height() - 108)/2;
        var left = (jQuery(window).width() - 208)/2;
        jQuery("#showLoading").css({'position':'fixed','top':top,'left':left}).show();
	},
	/** 锁屏 解禁**/
	enableWindow : function () {
		jQuery("#disDiv").remove();
	},
	/** 设置DIV在屏幕中间 **/
	setDivCenter:function(divName){
		var top = (jQuery(window).height() - jQuery(divName).children().eq(0).height())/2;
        var left = (jQuery(window).width() - jQuery(divName).children().eq(0).width())/2;
        jQuery(divName).css({'position':'fixed','top':1,'left':left}).show();
	}
}
regBox = {
    regEmail : /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/,
    regMobile : /^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/,
    regTel : /^0\d{2,3}-?\d{7,8}$/,
	intege1:/^[1-9]\d*$/,//正整数
	decmal1:/^[1-9]?[0-9]+\.?[0-9]?[0-9]?$/
}
var Regtor = {
	isPositive:function (val){
		if(regBox.intege1.test(val) 
					|| regBox.decmal1.test(val)){
			//判断是否为正整数，正浮点数
			return true
		}else{
			return false;
		}
	}
}