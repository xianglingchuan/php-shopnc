// JavaScript Document
(function($){
	
	$.fn.extend({
		
		guangda_ud : function(op){
			
			if(!op) op = {};
			
			var dop = {
				height : 300,
				m_height : 100,
				count : 6,
				speed : 200,
				pagesize : 1
			};
			
			$.each(op,function(i){
				dop[i] = op[i];
			});
			
			var shown = $( '.show_n' ,$(this) );
			var showmask = $( '.show_mask' ,$(this) );
			var count_height = dop.count * dop.m_height;
			
			var current_top = 0;
			//var current_
			
			var effect = function(){
				
				shown.animate({
					'top' : current_top
				},dop.speed);
			};
			
			showmask.height( dop.height ).css('overflow','hidden').css('position','relative');
			shown.css('position','relative');
			
			$( '.show_up' ,$(this) ).bind('click',function(){
				if(current_top < 0){
					current_top += dop.pagesize * dop.m_height;
				}
				effect();				
			});
			
			$( '.show_down' ,$(this) ).bind('click',function(){
				if(current_top > -count_height + dop.m_height ){
					current_top -= dop.pagesize * dop.m_height;
				}
				effect();
			});
			
				
		}
			
	});
		
})(jQuery);