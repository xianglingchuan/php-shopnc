// JavaScript Document
(function($){
	
	$.fn.extend({
		
		downList : function(inputStyle,listStyle,btnStyle,tlistStyle){
			$(this).each(function(){
				//初始化
				var inputname = $(this).attr('name') || '';
				var inputid = $(this).attr('id') || '';
				var inputvalue = $(this).val() || '';
				var spans = $('<span id="'+inputid+'"></span>');
				var input = $('<input type="text" class="sepFriendLink_input" readonly />');
				var inputv = $('<input name="'+inputname+'" type="hidden" />');
				var listbtn  = $('<a href="javascript:" class="sepFriendLink_list_btn">&nbsp;</a>');
				var list = $('<div class="sepFriendLink_list"></div>');
				var sel = $(this);
				var d = '';
				var onchange = $(this).attr('onchange');
				var k = 0;
				var inputWidth;
				
				if(inputStyle){
					$.each(inputStyle,function(i){
						input.css(i,inputStyle[i]);
					});		
				}
				if(listStyle){
					$.each(listStyle,function(i){
						list.css(i,listStyle[i]);
					});
				}
				if(btnStyle){
					$.each(btnStyle,function(i){
						listbtn.css(i,btnStyle[i]);	
					});
				}
				
				
				if($(this).get(0).style.width)
					inputWidth = Math.floor( parseInt( $(this).get(0).style.width )  );
				else
					inputWidth = $(this).width();
				
				//alert(inputWidth)
				input.width( inputWidth );
				input.height($(this).height());
				
				
				
				
				sel.find('option').each(function(i){
					var s = $(this).text();
					var v = $(this).val();
					var op;
					if( k % 2 == 0 ){
						op = $('<div><a href="javascript:">'+s+'</a></div>');
					}else{
						op = $('<div><a href="javascript:" class="step">'+s+'</a></div>');
					}
					op.bind('click',function(){
						value = v;
						input.val(s);
						inputv.val(v);
						$(sel).find('option').eq(i).attr('selected',true);
						if(typeof onchange == 'function'){
							onchange.apply(sel.get(0));
						}
					});
					list.append(op);
					k++;
				});
				spans.append(input).append(listbtn).append(inputv);
				sel.attr('name','');
				sel.hide();
				sel.after(spans);
				//sel.replaceWith(spans);
				
				$(document.body).append(list);
				
				$('option',$(this)).each(function(i){
					if($(this).attr('selected')){
						input.val( $(this).text() );
						inputv.val( $(this).val() );	
					}
				});
				
				
				var positionList = function(){
					
					var clienHeight,scrollTop,inputTop,inputBottom,listHeight,inputHeight,nInputHeight;
					//if($.browser.msie || $.browser.mozilla){
	//					clienHeight = document.documentElement.clientHeight ;
	//					scrollTop = document.documentElement.scrollTop ;
	//					
	//				}else{
	//					clienHeight = document.body.clientHeight;
	//					scrollTop = document.body.scrollTop;
	//				}
					scrollTop = $(window).scrollTop();
					clienHeight = $(window).height();
					
					
					
					if(!listStyle || !listStyle.width){
						if($.browser.msie){
							list.css('width',inputWidth + listbtn.width());
						}else{
							list.css('width',inputWidth + listbtn.width());
						}
					}
					list.css('left',input.offset().left);
					
					inputTop = input.offset().top;
					inputHeight = input.height();
					inputBottom = clienHeight - (inputTop - scrollTop) - input.height();
					listItemHeight = list.find('div').height();
					listItemSize = list.find('div').size();
					
					listHeight = listItemSize * listItemHeight;
					nInputHeight = listHeight;
					
					
					if(clienHeight > inputTop + inputHeight + listHeight || inputBottom > inputTop - scrollTop  ){
						if(listHeight > inputBottom){
							nInputHeight = (parseInt( inputBottom  / listItemHeight -1 ) ) * listItemHeight ;
							list.css('overflow','auto');
						}else{
							list.css('overflow','hidden');
						}
						
						list.height(nInputHeight);
						list.css('top',inputTop + inputHeight + 2);
						list.css('border-bottom-width',1);
						list.css('border-top-width',0);
						list.removeClass('t');
					}else{
							
						if(listHeight > inputTop){
							nInputHeight = (parseInt( ( inputTop - scrollTop ) / listItemHeight ) - 1 ) * listItemHeight;
							list.css('overflow','auto');
						}else{
							list.css('overflow','hidden');
						}
						
						list.height(nInputHeight);
						
						list.css('top',inputTop - list.height() + 2);
						list.css('border-bottom-width',0);
						list.css('border-top-width',1);
						list.addClass('t');
					}
	
				}
				
				//$(window).bind('resize',function(){
					//alert('resize')
					//positionList();	
				//});
				
				list.hide();
				
				
				//处理事件
				listbtn.bind('click',function(e){
					//alert('btnclick')
					list.fadeIn('fast');
					positionList();
					e.stopPropagation();
				});
				
				input.bind('click',function(e){
					//alert('inputclick')
					list.fadeIn('fast');	
					positionList();
					e.stopPropagation();
				});
				
				
				$(document.body).bind('click',function(e){
					//alert('bodyclick')
					list.fadeOut('fast');	
					e.stopPropagation();							   
				});
			
			});
			
		}
		
	});
	
})(jQuery);