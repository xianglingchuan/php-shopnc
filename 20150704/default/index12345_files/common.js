var Dialog = {
	current: null,
	overlay: null,
	zIndex: 99,
	show: function (args) {
		var el = $('#' + args.id),
			w = el.width(),
			h = el.height(),
			st = $(document).scrollTop();
		Dialog.current = el;

		if (!Dialog.overlay) {
			Dialog.overlay = $('<div class="overlay"></div>').appendTo('body');
		}

		var docw = $(document).width(), doch = $(document).height();
		Dialog.overlay.css({ width: docw, height: doch }).show();
		var l = ($(window).width() - w) / 2,
			t = ($(window).height() - h) / 2 + st;

		if (args.top) {
			t = args.top
		}

		if (args.left) {
			l = args.left
		}
		Dialog.zIndex++;
		el.css({ position: 'absolute', left: l, top: t, zIndex: Dialog.zIndex }).show();
	},
	close: function () {
		Dialog.current && Dialog.current.hide();
		Dialog.overlay && Dialog.overlay.hide();
	}
};

//图片滑动
var ceb={};
ceb.slide=function(boxId,listId,pointsId,pointsevent,isauto,callback,speed){
	var box=$('#'+boxId),
		list=$('#'+listId),
		lis = list.children('li'),
		points=$('#'+pointsId).children('li'),
		
		timer=0,
		index=0,
		count=lis.size(),
		w=lis.eq(0).width(),
		speed = speed || 2000;

	var select=function(){
	    points.removeClass('focus').eq(index).addClass('focus');

	    points.removeClass('focus1').eq(index).addClass('focus1');
		var left = -1*w*index;

		list.animate({'left':left},300,function(){
			if(index==count-1){
				index=-1;
			}
		});
	};

	var next=function(){
		index++;
		if(index>=count){
			index=count-1;
		}
		else{
			select();
			callback && callback(index);
		}
	};

	var auto=function(){
		timer = setInterval(next,speed);
	}

	isauto = isauto || true;
	if(isauto){
		auto();
	}
	
	pointsevent=pointsevent || 'click';
	points.bind(pointsevent,function(){
		index=points.index(this);
		select();
		timer && clearInterval(timer);
		if(isauto){
			auto();
		}
	});

	//points.hover(function(){
	//	timer && clearInterval(timer);
	//},function(){
	//	if(isauto){
	//		auto();
	//	}
	//});
};

ceb.dropselectcurrent=null;

ceb.dropselect=function(id){
	var s=$('#'+id),isShow=false;
	var input=$('<input type="text"/>').attr('id',id+'_input').addClass('dropdown_input'),
		b=$('<button></button>').attr('id',id+'_btn').addClass('dropdown_btn'),
		ul=$('<ul></ul>').attr('id',id+'_list').addClass('dropdown_list');
	//s.after(ul);
	s.after(b);
	s.after(input);
	ul.appendTo('body');
	input.attr('readonly','readonly');

	//初始化
	var vvv = s.val(),ttt=s.children('option[value='+vvv+']').html();
	input.val(ttt);

	var width = input.innerWidth()+b.innerWidth();

	b.click(function(event){
		if(isShow) return;
		
		var p=input.offset();

		var ml = input.css('margin-left').replace('px','');
		//alert(ml);
		ul.empty();
		var ops = s.children('option');
		ops.each(function(i,j){
			var aaa = $('<a></a>').html($(j).html()).attr('val',$(j).attr('value')).attr('href','javascript:;').css({'width':width-5});
			var lll = $('<li></li>').css({'width':width-5,'padding-left':'5px'});;
			aaa.appendTo(lll);
			lll.appendTo(ul);
		});
		ul.css({'left':p.left,'top':p.top+s.outerHeight(),'width':width+'px'}).show();

		ul.children('li').click(function(){
			var l = $(this).children('a');
			var v = l.attr('val'),t=l.html();
			input.val(t);
			s.val(v);
			s.trigger('change');

			ul.hide();
			isShow=false;
		});

		$(document).click(function(e){
			if(e.target==b[0]){
			}
			else{
				ul.hide();
				isShow=false;
			}
		});
		ceb.dropselectcurrent=ul;
		isShow=true;
		event.preventDefault()
		return false;
	});
	s.hide();
};

//初始化任务
(function($){
	if(typeof(menuIndex)!='undefined'){
		var lis = $('.header').find('.menu').children('li');
		lis.eq(menuIndex).addClass('focus');
	}
})(jQuery);

//加入收藏
 function addBookmark(url, title){
	if (window.sidebar)
		return window.sidebar.addPanel(title, url, "");
	else if ( window.external )
		return window.external.AddFavorite( url, title);
	else if (window.opera && window.print)
		return true;
	return true;
}

//主菜单
(function(){
	var lis = $('#menu').children('li'),submenu,
		timer,expand=false;

	lis.hover(function(){
		submenu = $(this).children('ul');
		submenu.show();
		expand=true;
	},function(){
		expand && submenu.hide();
	});
})(jQuery);

//右侧滚动
ceb.slide('slide_ct_wrap', 'slide_ct', 'slide_num', 'click', true, null, 3000);

ceb.slide('slide_ct_wrap2', 'slide_ct2', 'slide_num2', 'click', true, null, 3000);

ceb.slide('slide_ct_wrap_card','slide_ct_card','','click',true,null,3000);
//搜索
(function($){
	var k = $('#search_keywords');

	k.focus(function(){
		if(k.val()=='全站搜索'){
			k.val('');
		}
	});

//	k.blur(function(){
//		if(k.val()==''){
//			k.val('常见问题搜索');
//		}
//	});
})(jQuery);
//微信弹出
/*
(function($){
	var b = $('.right').find('.weixin'),wx=$('#weixin'),cl=wx.find('.dialog_close');;
	
	b.hover(function(){
		var l = $(this).position().left-210,t=$(this).position().top-50;
		wx.css({'position':'absolute','z-index':999,left:l,top:t}).show();
	},function(){});

	cl.click(function(){
		wx.hide();
	});
})(jQuery);
*/


function showError(id,message,c){
	var el = $('#'+id),
		errid=id+'_error',
		err=$('#'+errid);

	if(message){
		el.addClass('error');
		if(!err[0]){
			err = $('<div></div>').addClass('error_message').css({'position':'absolute'}).attr('id',errid).appendTo('body');
		}
		if(c){
			err.addClass(c);
		}

		var t = el.offset().top+el.outerHeight(),l=el.offset().left;
		err.html(message).css({'top':t,'left':l}).show();
	}
	else{
		el.removeClass('error');
		err.remove();
	}

	el.unbind('.error');
	el.bind('click.error',function(){showError(id);});
}