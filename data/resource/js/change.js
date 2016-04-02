$(function(){
	$("#onedl li").click(function(){
		var li=$(this).html();
		$("#address").remove();
		$("#filter ul").append("<li id='address'><div class='chan'>&nbsp;&nbsp;区域:&nbsp;"+li+"&nbsp;&nbsp;&nbsp;&nbsp;<a name='close' href='javascript:addclick();' style='margin-right:10px;'>x</a></div></li>");
	});
	$("#twodl li").click(function(){
		var li=$(this).html();
		$("#liufen").remove();
		$("#filter ul").append("<li id='liufen'><div  class='chan'>&nbsp;&nbsp;硫份:&nbsp;"+li+"&nbsp;&nbsp;&nbsp;&nbsp;<a name='close' href='javascript:lfclick();' style='margin-right:10px;'>x</a></div></li>");
	});
	$("#thrdl li").click(function(){
		var li=$(this).html();
		$("#shuifen").remove();
		$("#filter ul").append("<li id='shuifen'><div  class='chan'>&nbsp;&nbsp;水分:&nbsp;"+li+"&nbsp;&nbsp;&nbsp;&nbsp;<a name='close' href='javascript:sfclick();' style='margin-right:10px;'>x</a></div></li>");
	});
	$("#sidl li").click(function(){
		var li=$(this).html();
		$("#nianjie").remove();
		$("#filter ul").append("<li id='nianjie'><div  class='chan'>&nbsp;&nbsp;粘结度:&nbsp;"+li+"&nbsp;&nbsp;&nbsp;&nbsp;<a name='close' href='javascript:njclick();' style='margin-right:10px;'>x</a></div></li>");
	});
	$("#fivedl li").click(function(){
		var li=$(this).html();
		$("#lidu").remove();
		$("#filter ul").append("<li id='lidu'><div  class='chan'>&nbsp;&nbsp;粒度:&nbsp;"+li+"&nbsp;&nbsp;&nbsp;&nbsp;<a name='close' href='javascript:ldclick();' style='margin-right:10px;'>x</a></div></li>");
	});
	$("#sixdl li").click(function(){
		var li=$(this).html();
		$("#hot").remove();
		$("#filter ul").append("<li id='hot'><div  class='chan'>&nbsp;&nbsp;发热量:&nbsp;"+li+"&nbsp;&nbsp;&nbsp;&nbsp;<a name='close' href='javascript:hotclick();' style='margin-right:10px;'>x</a></div></li>");
	});
	$("#sevdl li").click(function(){
		var li=$(this).html();
		$("#huifa").remove();
		$("#filter ul").append("<li id='huifa'><div  class='chan'>&nbsp;&nbsp;挥发份:&nbsp;"+li+"&nbsp;&nbsp;&nbsp;&nbsp;<a name='close' href='javascript:huifaclick();' style='margin-right:10px;'>x</a></div></li>");
	});
	$("#eighdl li").click(function(){
		var li=$(this).html();
		$("#huifen").remove();
		$("#filter ul").append("<li id='huifen'><div  class='chan'>&nbsp;&nbsp;灰份:&nbsp;"+li+"&nbsp;&nbsp;&nbsp;&nbsp;<a name='close' href='javascript:hfclick();' style='margin-right:10px;'>x</a></div></li>");
	});
});
function hfclick(){
	$("#huifen").css("display","none");
}
function huifaclick(){
	$("#huifa").css("display","none");
}
function hotclick(){
	$("#hot").css("display","none");
}
function ldclick(){
	$("#lidu").css("display","none");
}
function lfclick(){
	$("#liufen").css("display","none");
}
function njclick(){
	$("#nianjie").css("display","none");
}
function sfclick(){
	$("#shuifen").css("display","none");
}
function addclick(){
	$("#address").css("display","none");
}
function main(){
	$("#sevdl").removeClass("toggle");
	$("#eighdl").removeClass("toggle");
	$("#sixdl").removeClass("toggle");
	$("#more").html("");
	$("#more").html("<a href='javascript:main1()'>点击隐藏</a>");
	
}
function main1(){
	$("#sevdl").addClass("toggle");
	$("#eighdl").addClass("toggle");
	$("#sixdl").addClass("toggle");
	$("#more").html("");
	$("#more").html("<a href='javascript:main()'>点击查看更多</a>");
	
}