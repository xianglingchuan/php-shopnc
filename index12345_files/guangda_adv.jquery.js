// JavaScript Document
(function($){
	$.fn.extend({
		
		guangda_adv : function(times,arrow,opacity){
			var times = times || 5000;
			var arrow = arrow || 0;
			if(typeof opacity == 'undefined')
				opacity = .3;
			var advshow = $('.adv2show',$(this));
			var advbtns = $('.adv2btns',$(this));
			var advfont = $('.adv2font',$(this));
			var num = advshow.find('div').size();
			var current = 0;
			var timeout;
			var lock = false;
	
			if(arrow == 0){
				advshow.find('img').attr('height',advshow.height());
				advshow.find('img').width(0);
			}else if(arrow == 1){
				advshow.find('img').attr('width',advshow.width());
				advshow.find('img').height(0);
			}
			
			advshow.find('img').bind('mouseenter',function(){
				lock = true;
			}).bind('mouseleave',function(){
				lock = false;	
			});
			
			var adv2Shows =  function(index){
				advbtns.find('a').removeClass('selected');
				advbtns.find('a').eq(index).addClass('selected');
				
				advshow.find('img').each(function(i){
					if(arrow == 0){
						if(index == i){
							if(opacity){
								$(this).animate({width:advshow.width(),'opacity':1},300);
							}else{
								$(this).animate({width:advshow.width()});
							}
							if( advfont.size() > 0 ){	
								advfont.html( '<a href="'+($(this).parent('a').attr('href')||'#')+'">'+$(this).attr('alt')+'</a>' );
							}
						}else{
							if(opacity){
								$(this).animate({width:0,'opacity':.3},300);
							}else{
								$(this).animate({width:0})	
							}
						}
					}else if(arrow == 1){
						if(index == i){
							$(this).animate({height:advshow.height(),'opacity':1},300);
						}else{
							$(this).animate({height:0,'opacity':.3},300);
						}
					}
				});
				
				
				
				
				current = index;
				
				if(times !== true){
					window.clearInterval(timeout);
					timeout = window.setTimeout(function(){
						if(!lock){
							current++;
							if(current>num-1) current=0;
						}
						adv2Shows(current);
					},times);
				}
			}
			
			if(num>0){
				if(advbtns.find('li').size() == 0){
					for(var i =0; i<num; i++){
						advbtns.append($('<li><a href="javascript:">&nbsp;</a></li>'));
					}
				}
				adv2Shows(0);
				advbtns.find('a').each(function(i){
					$(this).bind('click',function(){
						adv2Shows(i);	
					});
				});
			}
				
		}
			
	});	
})(jQuery);