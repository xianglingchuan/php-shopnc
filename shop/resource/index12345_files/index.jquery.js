// JavaScript Document

//首页用到的JS
$(function(){
  /**add towish**/
  var points = $('ul.points > li','#advshows');
  /**end of add**/
	  
  var count = points.size();//$('#advscrollbtns').find('li').size();
  var rowHeight = $('.advscrollbtn').find('li').height();
  var showHeight = $('#advshows').height();
  var current = 0;
  var pagesize = 3;
  var advtimeout;
  var pagecount = Math.ceil(count / pagesize);
  var currentPage = 0;
  

  $('#advshows').find('img').attr('width',$('#advshows').width());
  $('#advshows').find('img').height(0);
  
  
  var advscroll = function(index){
	  /*
	  $('#advscrollbtns').find('li').find('img').animate({'opacity':.3},300);
	  $('#advscrollbtns').find('li').find('img').eq(index).animate({'opacity':1},300);
	  */
	  currentPage = Math.floor(current / pagesize);
	  
	  
	  /*
	  if (!$.browser.mozilla){
		  $('#advscrollbtns').animate({'background-positionY':index * rowHeight + index * 10,top:-currentPage * 200});
	  }else{
		  $('#advscrollbtns').get(0).style.backgroundPosition = '0px '+ (index * rowHeight + index * 10) +'px';
		  $('#advscrollbtns').animate({top:-currentPage * 200},500);
	  }
	  */
	  
	  /**add towish**/
	  points.removeClass('focus');
	  $(points[index]).addClass('focus');
	  /**end of add**/
	  $('#advshows').find('img').each(function(i){
		  if(i != index){
			  $(this).animate({'height':0,'opacity':.3},300);	
		  }else{
			  $(this).animate({'height':showHeight,'opacity':1},300);
		  }
	  });
	  
	  current = index;
	  window.clearTimeout(advtimeout);
	  advtimeout = window.setTimeout(function(){
		  current++;
		  if(current>count-1) current = 0;
		  advscroll(current);	
	  },5000);
  }
  
  if(count > 0){
	  advscroll(0);
	  /*
	  $('#advscrollbtns').find('li').find('img').each(function(i){
		  $(this).bind('click',function(){
			  advscroll(i);
		  });	
	  });
	  $('#advup').bind('click',function(){
		  current--;
		  if(current<0)current=count-1;
		  advscroll(current);
	  });
	  $('#advdown').bind('click',function(){
		  current++;
		  if(current>count-1)current=0;
		  advscroll(current);
	  });*/
	  /**add towish**/
	  points.each(function(i){
		$(this).bind('click',function(){
			advscroll(i);
		});
	  });
	  /**end of add**/
  }
  
});


