











if(typeof doyoo=='undefined' || !doyoo)
	var doyoo={		
		env:{
			server:{
				monitor:'http://sc.ecoalchina.com:80/monitor',
				chat:'http://sc.ecoalchina.com:80/looyu',
				file:'http://sc.ecoalchina.com:80/file'
			},
			compId:1,
			confId:64,
			vId:'61eea8c3-f4c6-11e4-8d7f-07fc33fc03ac',
			uId:'',
			pId:0,
			mId:'',
			lang:'null'
		},
		config:{
			monitor:true,
			panel:true			
		},
		monitor:{},	panel:{},win:{},icon:{},text:{},
		init:function(){
			document.write('<div id="doyoo_panel"></div>');
			document.write('<link rel="stylesheet" type="text/css" href="http://sc.ecoalchina.com:80/file/css/doyoo.css"></link>');
			document.write('<scr'+'ipt type="text/javascript" src="http://sc.ecoalchina.com:80/file/js/doyoo.js"></scr'+'ipt>');
		}		
	};

doyoo.monitor.config={
	index:1,
	title:'\u4e50\u8bed\u5728\u7ebf\u5ba2\u670d',
	text:'\u5c0a\u656c\u7684\u5ba2\u6237\u60a8\u597d\uff0c\u6b22\u8fce\u5149\u4e34\u672c\u516c\u53f8\u7f51\u7ad9\uff01\u6211\u662f\u4eca\u5929\u7684\u5728\u7ebf\u503c\u73ed\u5ba2\u670d\uff0c\u70b9\u51fb\u201c\u5f00\u59cb\u4ea4\u8c08\u201d\u5373\u53ef\u4e0e\u6211\u5bf9\u8bdd\u3002',
	auto:-1,
	group:'',
	start:'00:00',
	end:'24:00',
	mask:false
	
};


doyoo.panel.config={
	category:'icon',	
	position:-1,
	vertical:150,
	horizon:5	
};



doyoo.icon.config={
	mode:1,
	target:'57',
	online:'http://sc.ecoalchina.com/file/images/floaticon/on_line_100.png',
	offline:'http://sc.ecoalchina.com/file/images/floaticon/off_line_100.png',
	width:27,
	height:26,
	status:0
};




doyoo.init();
