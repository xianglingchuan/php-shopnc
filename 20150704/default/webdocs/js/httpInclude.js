function httpInclude(url,id){
	jQuery.ajax({
		type:"post",
		url:'/nacecweb/sns.do',
		data:{'method':'getHttpInclude','url':url},
		dataType:"text",
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		success:function(data){
			if(data != "false"){
				jQuery("#"+id).append(data);
			}
			if(id == "KinSlideshowa"){
			 	jQuery("#"+id).KinSlideshow();
				jQuery(".KSS_titleBar").hide();
			}
		}
	});
}