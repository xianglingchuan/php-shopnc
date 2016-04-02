// JavaScript Document
(function($){
	$.fn.extend({
		guangda_tab : function(index,loaded_callback){
			
			var index = index || 0;
			var self = $(this);
			var hrefarr = new Array;
			var loaded = new Array;
			self.find('.tab_container').eq(0).children('li').hide();
			
			var selectFunc = function(i){
				
				self.find('.tab_title').eq(0).children('li.selected').removeClass('selected');
				
				self.find('.tab_title').eq(0).children('li').eq(i).addClass('selected');
				self.find('.tab_container').eq(0).children('li:visible').hide();
				self.find('.tab_container').eq(0).children('li').eq(i).fadeIn();
				
				var href = hrefarr[i];
				if(href != 'javascritp:' && href != '#' && !loaded[i]){
					self.find('.tab_container').eq(0).children('li').eq(i).load(href,null,function(){
						loaded[i] = true;
						if(loaded_callback && typeof loaded_callback == 'function'){
							loaded_callback(i);	
						}
					});
				}
			}
			
			self.find('.tab_title').eq(0).children('li').children('a').each(function(i){
				var href = $(this).attr('href');
				if(href.indexOf('?')==-1){
					href = href+'?_'+Math.random();
				}else{
					href = href+'&_'+Math.random();	
				}
				hrefarr[i] = href;
				$(this).attr('href','javascript:');
				$(this).bind('click',function(){
					selectFunc(i);
				});
			});
			selectFunc(index);
		}
	});	
})(jQuery);