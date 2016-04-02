/**
	 * 欢迎使用 KinSlideshow 幻灯片『焦点图』插件
	 *
	 * jQuery KinSlideshow plugin
	 * ========================================〓说明〓========================================================
	 * jQuery幻灯片插件，基本能满足你在网页上使用幻灯片(焦点图)效果。兼容IE6/IE7/IE8/IE9,FireFox,Chrome,Opera。
   * 使用极其方便、简单，外观样式可以自定义,具体定义样式方法和设置其他参数请参见demo文件
	 * 建议在img标签里面 设置图片的宽度和高度 以防止网络太卡 JS读取不到图片真实宽、高
	 * 所有宽度和高度单位都是像素，设置参数时不需要加单位(px)
	 * ★KinSlideshow 1.2 可以在同一页面中使用多个KinSlideshow效果【2010-09-15】
	 * ★KinSlideshow 1.2.1 修复了IE8兼容模式下 标题不切换的问题，也就是IE内核浏览器（如：遨游，QQ浏览器5）在IE8环境下不切换的问题【2010-11-01】，修复了设置标题面板透明，标题也会继承透明的问题。
	 * ========================================================================================================
	 * @name jquery.KinSlideshow.js
	 * @version 1.2.1
	 * @author Mr.Kin
	 * @date 2010-11-01
	 * @Email:Mr.Kin@Foxmail.com
	 *
	 * 欲索取最新版本KinSlideshow或是报告Bug，请发送Email至 【Mr.Kin@Foxmail.com】
	 * 《实际应用时建议删除此段注释》
	 **/
	eval((function(a,b){return a.replace(/\w+/g, function(ss){ return b[parseInt(ss, 36)]; }); })("(0($) {\r$.1.2 = 0(3){\r3 = 4.5({\r6 : 7,\r8 : 9,\ra:\"b\",\rc:\"d\",\re:f,\rg:{h:i,j:\"#k\",l:m.7},\rn:f,\ro:{p:q,r:\"#s\",t:\"u\",v:\"w\"},\rx:f,\ry:{z:\"#10\",11:\"#12\",13:\"#14\",15:\"#k\",16:\"u\",17:\"#18\",19:\"#1a\",1b:1c,1d:m.1e}\r},3);\r1f 1g = {h:i,j:\"#k\",l:m.7}\r1f 1h = {p:q,r:\"#s\",t:\"u\",v:\"w\"}\r1f 1i = {z:\"#10\",11:\"#12\",13:\"#14\",15:\"#k\",16:\"u\",17:\"#18\",19:\"#1a\",1b:1c,1d:m.1e}\r1j (1f 1k 1l 1g){\r1m(3.g[1k] == 1n){\r3.g[1k] = 1g[1k];\r}\r}\r1j (1f 1k 1l 1h){\r1m(3.o[1k] == 1n){\r3.o[1k] = 1h[1k];\r}\r}\r1j (1f 1k 1l 1i){\r1m(3.y[1k] == 1n){\r3.y[1k] = 1i[1k];\r}\r}\r1f 1o = 1p;\r1f 1q = $(1o).1r;\r1f 1s = 1t 1u();\r1f 1v = m;\r1f 1w =1t 1u();\r1f 1x = m;\r1f 1y = 3.6;\r1f 1z;\r1f 20 = f;\r1f 21;\r1m(22(1y) || 1y <= 1c){\r1y = 7;\r}\r1m(3.8 > 23){\r3.8 = 23;\r}24 1m(3.8 < 25){\r3.8 = 25;\r}\r0 26(){\r$(1o).27({28:\"29\"});\r$(1q+\" 2a 2b\").27({2c:m});\r2d();\r2e();\r};\r0 2d(){\r1v = $(1q+\" 2a\").2f;\r1w.2g($(1q+\" 2a 2b\").2h());\r1w.2g($(1q+\" 2a 2b\").2i());\r$(1q+\" 2a 2b\").2j(0(2k){\r1s.2g($(1p).2l(\"2m\"));\r});\r$(1q+\" 2a\").2n(\"<2o 2p=\'2q\'><\/2o>\");\r$(1q).2r(\"#2q\").2s().2l(\"2p\",\"2t\").2u(1o);\r2v();\r2w();\r2x();\r2y();\r2z(3.c);\r$(1o).27({28:\"30\"});\r};\r0 2v(){\r$(1o).27({2h:1w[m],2i:1w[1c],31:\"29\",32:\"33\"});\r$(1o).34(\"<2o 35=\'36\'><\/2o>\");\r21 = 3.g.h;\r1m(22(21)){\r21 = i;\r}24 1m(21 < 37){\r21 = 37;\r};\r$(1q+\" .36\").27({2i:21,2h:\"25%\",32:\"38\",39:m,b:m})\r1m(3.e){\r$(1q+\" .36\").27({3a:3.g.j,3b:3.g.l})\r}\r};\r0 2w(){\r1m(3.n){\r$(1o).34(\"<2o 35=\'3c\'><3d 35=\'3e\' 3f=\'3g:3h m m 3i;3j:m;\'><\/3d><\/2o>\");\r$(1q+\" .3c\").27({2i:21,2h:\"25%\",32:\"38\",39:m,b:m})\r$(1q+\" .3c 3d\").27({3k:3.o.p,3l:3.o.r,3m:3.o.t,3n:3.o.v});\r3o(m);\r};\r};\r0 2x(){\r1m(3.y.1b > 3p){3.y.1b = 3p}\r1m(3.y.1b < m || 22(3.y.1b)){3.y.1b = m}\r1m(3.x && 1v >= 3p){\r$(1o).34(\"<2o 35=\'3q\' 3f=\'32:38;3r:3s;39:3t; 3u-3v:25\'><\/2o>\");\r1f 3w = \"\";\r1j(2k=1c;2k<=1v;2k++){\r3w+=\"<3x>\"+2k+\"<\/3x>\";\r}\r3w = \"<3y 2p=\'3z\' 3f=\'3g:m;3j:m; 31:29\'>\"+3w+\"<\/3y>\";\r$(1q+\" .3q\").34(3w);\r$(1q+\" .3q #3z 3x\").27({40:\"41\",42:\"b\",2h:43,2i:43,44:3.y.1b,45:3.y.17,46:\"47\",3a:3.y.z,48:\"49\",4a:\"4b\",4c:4d,3k:q,3m:3.y.16,4e:\"4f\",3b:3.y.1d,3l:3.y.13});\r$(1q+\" #3z 3x:4g(m)\").27({3a:3.y.11,45:3.y.19,3l:3.y.15});\r};\r};\r0 2y(){\r4h(3.a){\r4i \"b\": 4j(); 4k;\r4i \"3r\": 4l();4k;\r4i \"4m\": 4n(); 4k;\r4i \"4o\": 4p(); 4k;\r4q: 3.a = \"b\"; 4j();\r}\r};\r0 4j(){\r$(1q+\" 2o:4r(3p)\").2n(\"<2o 2p=\'4s\'><\/2o>\");\r$(1q).2r(\"#4s\").27({2h:1w[m],2i:1w[1c],31:\"29\",32:\"33\"});\r$(1q).2r(\"#2q\").27({42:\"b\"});\r$(1q).2r(\"#2t\").27({42:\"b\"});\r$(1q+\" #4s 2o\").2n(\"<2o 2p=\'4t\'><\/2o>\");\r$(1q).2r(\"#4t\").27({42:\"b\",2h:\"4u%\"});\r1z = 4v(0(){4w(3.a)},1y*4x+3.8);\r};\r0 4l(){\r$(1q+\" 2o:4r(3p)\").2n(\"<2o 2p=\'4s\'><\/2o>\");\r$(1q).2r(\"#4s\").27({2h:1w[m],2i:1w[1c],31:\"29\",32:\"33\"});\r$(1q).2r(\"#2q\").27({42:\"b\"});\r$(1q).2r(\"#2t\").27({42:\"b\"});\r$(1q+\" #4s 2o\").2n(\"<2o 2p=\'4t\'><\/2o>\");\r$(1q).2r(\"#4t\").27({42:\"b\",2h:\"4u%\"});\r$(1q).2r(\"#2t\").4y(\"\");\r$(1q+\" #2q 2a\").4z(\"<50><\/50>\")\r$(1q+\" #2q 2a\").2j(0(2k){\r$(1q).2r(\"#2t\").51($(1q+\" #2q 50:4g(\"+2k+\")\").4y());\r})\r$(1q).2r(\"#2q\").4y($(1q).2r(\"#2t\").4y());\r1f 52 = (1v-1c)*1w[m];\r$(1q).2r(\"#4s\").53(52);\r1z = 4v(0(){4w(3.a)},1y*4x+3.8);\r};\r0 4n(){\r$(1q+\" 2o:4r(3p)\").2n(\"<2o 2p=\'4s\'><\/2o>\");\r$(1q).2r(\"#4s\").27({2h:1w[m],2i:1w[1c],31:\"29\",32:\"33\"});\r$(1q).2r(\"#4s\").54({55: m}, 1c);\r1z = 4v(0(){4w(3.a)},1y*4x+3.8);\r};\r0 4p(){\r$(1q+\" 2o:4r(3p)\").2n(\"<2o 2p=\'4s\'><\/2o>\");\r$(1q).2r(\"#4s\").27({2h:1w[m],2i:1w[1c],31:\"29\",32:\"33\"});\r$(1q).2r(\"#2t\").4y(\"\");\r$(1q+\" #2q 2a\").4z(\"<50><\/50>\")\r$(1q+\" #2q 2a\").2j(0(2k){\r$(1q).2r(\"#2t\").51($(1q+\" #2q 50:4g(\"+2k+\")\").4y());\r})\r$(1q).2r(\"#2q\").4y($(1q).2r(\"#2t\").4y());\r1f 56 = (1v-1c)*1w[1c];\r$(1q).2r(\"#4s\").54({55: 56}, 1c);\r1z = 4v(0(){4w(3.a)},1y*4x+3.8);\r};\r0 4w(3f){\r4h(3f){\r4i \"b\":\r1m(1x >= 1v){\r1x = m;\r$(1q).2r(\"#4s\").53(m);\r$(1q).2r(\"#4s\").54({53:1w[m]}, 3.8);\r}24{\r57 =(1x+1c)*1w[m];\r1m ($(1q).2r(\"#4s\").58(\':59\')){\r$(1q).2r(\"#4s\").5a();\r$(1q).2r(\"#4s\").54({53: 57}, 3.8);\r}24{\r$(1q).2r(\"#4s\").54({53: 57}, 3.8);\r}\r}\r3o(1x+1c);\r4k;\r4i \"3r\":\r1f 52 = (1v-1c)*1w[m];\r1m(1x >= 1v){\r1x = m;\r$(1q).2r(\"#4s\").53(52+1w[m]);\r$(1q).2r(\"#4s\").54({53:52}, 3.8);\r}24{\r1m(20){\r1x++;\r20 = 5b;\r}\r57 =52-(1x*1w[m]);\r1m ($(1q).2r(\"#4s\").58(\':59\')){\r$(1q).2r(\"#4s\").5a();\r$(1q).2r(\"#4s\").54({53: 57}, 3.8);\r}24{\r$(1q).2r(\"#4s\").54({53: 57}, 3.8);\r}\r}\r3o(1x);\r4k;\r4i \"4m\":\r1m(1x >= 1v){\r1x = m;\r$(1q).2r(\"#4s\").55(m);\r$(1q).2r(\"#4s\").54({55:1w[1c]}, 3.8);\r}24{\r57 =(1x+1c)*1w[1c];\r1m ($(1q).2r(\"#4s\").58(\':59\')){\r$(1q).2r(\"#4s\").5a();\r$(1q).2r(\"#4s\").54({55: 57}, 3.8);\r}24{\r$(1q).2r(\"#4s\").54({55: 57}, 3.8);\r}\r}\r3o(1x+1c);\r4k;\r4i \"4o\":\r1f 52 = (1v-1c)*1w[1c];\r1m(1x >= 1v){\r1x = m;\r$(1q).2r(\"#4s\").55(52+1w[1c]);\r$(1q).2r(\"#4s\").54({55:52}, 3.8);\r}24{\r1m(20){\r1x++;\r20 = 5b;\r}\r57 =52-(1x*1w[1c]);\r1m ($(1q).2r(\"#4s\").58(\':59\')){\r$(1q).2r(\"#4s\").5a();\r$(1q).2r(\"#4s\").54({55: 57}, 3.8);\r}24{\r$(1q).2r(\"#4s\").54({55: 57}, 3.8);\r}\r}\r3o(1x);\r4k;\r}\r1x++;\r}\r0 3o(3v){\r1m(3v == 1v){3v = m};\r1m(3.n){\r$(1q+\" .3c 3d.3e\").4y(1s[3v]);\r};\r$(1q+\" #3z 3x\").2j(0(2k){\r1m(2k == 3v){\r$(1p).27({3a:3.y.11,45:3.y.19,3l:3.y.15});\r}24{\r$(1p).27({3a:3.y.z,45:3.y.17,3l:3.y.13});\r}\r})\r};\r0 2z(5c){\r4h(5c){\r4i \"5d\" : 5e(); 4k;\r4i \"d\" : 5f(); 4k;\r4q : 5f();\r}\r};\r0 5e(){\r$(1q+\" #3z 3x\").5d(0(){\r1f 5g = $(1q+\" #3z 3x\").3v($(1p));\r4h(3.a){\r4i \"b\" :\r1x = 5g-1c; 4k;\r4i \"3r\" :\r1m(20){\r1x = 5g-1c; 4k;\r}24{\r1x = 5g; 4k;\r}\r4i \"4m\" :\r1x = 5g-1c; 4k;\r4i \"4o\" :\r1m(20){\r1x = 5g-1c; 4k;\r}24{\r1x = 5g; 4k;\r}\r}\r4w(3.a);\r$(1q+\" #3z 3x\").2j(0(2k){\r1m(2k ==5g){\r$(1p).27({3a:3.y.11,45:3.y.19,3l:3.y.15});\r}24{\r$(1p).27({3a:3.y.z,45:3.y.17,3l:3.y.13});\r}\r})\r})\r};\r0 5f(){\r$(1q+\" #3z 3x\").5h(0(){\r1f 5g = $(1q+\" #3z 3x\").3v($(1p));\r4h(3.a){\r4i \"b\" :\r1x = 5g-1c; 4k;\r4i \"3r\" :\r1m(20){\r1x = 5g-1c; 4k;\r}24{\r1x = 5g; 4k;\r}\r4i \"4m\" :\r1x = 5g-1c; 4k;\r4i \"4o\" :\r1m(20){\r1x = 5g-1c; 4k;\r}24{\r1x = 5g; 4k;\r}\r};\r4w(3.a);\r$(1q+\" #3z 3x\").2j(0(2k){\r1m(2k ==5g){\r$(1p).27({3a:3.y.11,45:3.y.19,3l:3.y.15});\r}24{\r$(1p).27({3a:3.y.z,45:3.y.17,3l:3.y.13});\r}\r})\r})\r};\r0 2e(){\r$(1q+\" #3z 3x\").5d(0(){\r5i(1z);\r})\r$(1q+\" #3z 3x\").5j(0(){\r1z = 4v(0(){4w(3.a)},1y*4x+3.8);\r})\r};\r5k 26();\r};\r})(4);", "function|fn|KinSlideshow|settings|jQuery|extend|intervalTime|5|moveSpeedTime|400|moveStyle|left|mouseEvent|mouseclick|isHasTitleBar|true|titleBar|titleBar_height|40|titleBar_bgColor|000000|titleBar_alpha|0|isHasTitleFont|titleFont|TitleFont_size|12|TitleFont_color|FFFFFF|TitleFont_family|Verdana|TitleFont_weight|bold|isHasBtn|btn|btn_bgColor|666666|btn_bgHoverColor|CC0000|btn_fontColor|CCCCCC|btn_fontHoverColor|btn_fontFamily|btn_borderColor|999999|btn_borderHoverColor|FF0000|btn_borderWidth|1|btn_bgAlpha|7|var|titleBar_Bak|titleFont_Bak|btn_Bak|for|key|in|if|undefined|ksthis|this|ksbs|selector|KSS_DateArray|new|Array|KSS_imgaeLength|KSS_Size|KSS_changeFlag|KSS_IntervalTime|KSS_setInterval|KSS_firstMoveFlag|getTitleBar_Height|isNaN|500|else|100|KSS_initialize|css|visibility|hidden|a|img|border|KSS_start|KSS_mousehover|length|push|width|height|each|i|attr|alt|wrapAll|div|id|KSS_content|find|clone|KSS_contentClone|appendTo|KSS_setTitleBar|KSS_setTitleFont|KSS_setBtn|KSS_action|KSS_btnEvent|visible|overflow|position|relative|append|class|KSS_titleBar|25|absolute|bottom|background|opacity|KSS_titleBox|h2|title|style|margin|3px|6px|padding|fontSize|color|fontFamily|fontWeight|setTiltFontShow|2|KSS_btnBox|right|10px|5px|z|index|KSS_btnList|li|ul|btnlistID|listStyle|none|float|18|borderWidth|borderColor|borderStyle|solid|textAlign|center|cursor|pointer|marginLeft|3|lineHeight|18px|eq|switch|case|KSS_moveLeft|break|KSS_moveRight|up|KSS_moveUp|down|KSS_moveDown|default|lt|KSS_moveBox|KSS_XposBox|2000|setInterval|KSS_move|1000|html|wrap|span|prepend|KSS_offsetLeft|scrollLeft|animate|scrollTop|KSS_offsetTop|sp|is|animated|stop|false|Event|mouseover|KSS_btnMouseover|KSS_btnMouseclick|curLiIndex|click|clearInterval|mouseout|return".split("|")));
