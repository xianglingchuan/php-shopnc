/*#region 渠道相关公共变量 */
var _mvq = _mvq || [];  //MVQ
var _gaq = _gaq || [];  //谷歌
window["_BFD"] = window["_BFD"] || {};  //百分点
var pkBaseURL = "";     //智云众
var host = "";     //智云众
var _hmt = _hmt || [];  //百度
/*#endregion */

var ExtTrackManager = {

    BFDTrack: {
        //首页
        HomeIndex: function (_params) {
            return;
            _BFD.BFD_INFO = {
                "user_id": _params.UserId, //当前用户的user_id，string类型。注意：user_id不是用户的真实注册名，而是其注册名的编号,如果匿名用户为0或者为空‘’；
                "client": _params.ClientId  			//百分点技术人员使用的帐号，请您不要修改这句代码！
            };
            append_bfd_script(('https:' == document.location.protocol ? 'https://ssl-static1' : 'http://static1') + '.baifendian.com/service/zhengdatiandi/zdtd_home.js');
        },
        //搜索结果页
        SearchResult: function (_params) {
            return;
            _BFD.BFD_INFO = {
                "search_word": _params.Keyword, // 搜索关键词，有无结果均需要部署代码；
                "result": _params.HasResult, //搜索结果，无结果为false，有结果为true；
                "user_id": _params.UserId,
                "client": _params.ClientId
            };
            append_bfd_script(('https:' == document.location.protocol ? 'https://ssl-static1' : 'http://static1') + '.baifendian.com/service/zhengdatiandi/zdtd_search.js');
        },
        //一级列表页
        Categories: function (_params) {
            return;
            _BFD.BFD_INFO = {
                "category_tree": _params.CategoryTree, // [["时鲜蔬果", "http://yummy77.yummy77.com/category/98.html"], ["水果", "http://yummy77.yummy77.com/category/9804.html"]], //当前类别目录树，第一个元素为类别id，第二个元素为类别名称，2维数组，类别从大范围到小范围排列；
                "user_id": _params.UserId,
                "client": _params.ClientId
            };
            append_bfd_script(('https:' == document.location.protocol ? 'https://ssl-static1' : 'http://static1') + '.baifendian.com/service/zhengdatiandi/zdtd_list.js');
        },
        //产品详情页
        ProductDetail: function (_params) {
            return;
            _BFD.BFD_INFO = {
                "pid": _params.PId,   //同一商品不同规格，款式的父级ID，string类型；
                "id": _params.ProductId,   //这里需要获取的是您网站商品id号，string类型；
                "name": _params.ProductName,  //当前商品的名称,string类型；
                "subname": _params.ProductName,  //当前商品的副标题,string类型；
                "item_link": "http://www.yummy77.com/product/" + _params.ProductId + ".html", // 当前商品的完整链接url，string类型	
                "small_image_link": _params.SmallImgPath, // 当前商品的小图片的完整链接url，string类型
                "big_image_link": _params.BigImgPath, // 当前商品的大图片的完整链接url，string类型
                "market_price": _params.MarketPrice, //市场价
                "price": _params.CurrPrice, //现价；
                "vip_price": _params.PromoPrice, //促销价,如果没有促销请为0
                "category_id": _params.Category, // ["箱包","旅行包"], //当前商品的类别名称，数组
                "category_tree": _params.CategoryTree, //[["箱包","http://www.ihush.com/list_177.html"],["旅行包","http://www.ihush.com/list_191.html"]], // 当前商品的类别详细信息，第一个元素为类别名称，第二个元素为类别地址，2维数组；
                "brand": _params.Brand, //当前商品所属企业名称；
                "store": _params.HasStore, //当前商品的库存数,只有当所有尺寸都售完，此值才为0；
                "del": _params.IsOffSale, //判断商品是否在架，在架为false，下架为true，布尔类型；
                "location": _params.Location,
                "salesite": _params.SaleSite,
                "currentsite": $.cookie("SiteCookie"),
                "isgroup": _params.IsGroup,
                "user_id": _params.UserId,
                "client": _params.ClientId
            };
            append_bfd_script(('https:' == document.location.protocol ? 'https://ssl-static1' : 'http://static1') + '.baifendian.com/service/zhengdatiandi/zdtd_goods.js');
        },
        //产品未找到页
        ProductNoBeFound: function (_params) {
            return;
            _BFD.BFD_INFO = {
                "id": _params.ProductId,   //这里需要获取的是您网站商品id号；此页面如果能取到商品id就好，取不到请向实施人员说明
                "client": _params.ClientId
            };
            append_bfd_script(('https:' == document.location.protocol ? 'https://ssl-static1' : 'http://static1') + '.baifendian.com/service/zhengdatiandi/zdtd_delete.js');
        },
        //采购平台页
        ShoppingCart: function (_params) {
            return;
            var evItems = window.eval("(" + _params.JsonItems + ")");
            if (!evItems) return;
            var rItems = [];
            var p_ids = "";
            $.each(evItems, function (k, v) {
                rItems.push([v.ProductId, v.Quantity, v.PromotionPrice]);
                p_ids += v.ProductId + ",";
            });
            var catinfo = "";
            $.ajax({ url: "/product/getassignlastcategoryinfo", async: false, type: "post", data: { data: p_ids, random: (new Date()).getTime() }, success: function (_cont) { catinfo = _cont } });

            _BFD.BFD_INFO = {
                "items": rItems, //[['10987',2,12.00],['10987',1,6.00],['10987',3,120.00]],// 2维数组，参数分别是['商品id号','采购平台中该商品的数量','该商品的单价']
                "category": catinfo,
                "user_id": _params.UserId,
                "location": _params.CurrSite,
                "client": _params.ClientId
            };
            append_bfd_script(('https:' == document.location.protocol ? 'https://ssl-static1' : 'http://static1') + '.baifendian.com/service/zhengdatiandi/zdtd_cart.js');
        },
        //订单提交成功页
        OrderSuccess: function (_params) {
            return;
            $.post("/data/getorderdata", { orderId: _params.OrderId, random: new Date().getTime() }, function (_orderRes) {
                if (_orderRes.IsSuccess) {
                    var _oitems = [];
                    $.each(_orderRes.OrderItems, function (k, v) {
                        _oitems.push([v.ProductId, v.OrderQty, v.DiscountPrice]);
                    });

                    _BFD.BFD_INFO = {
                        "order_id": _params.OrderId, //当前订单号，如果有拆单等特殊情况现象（一次购买中出现多个订单号）此页面代码不可用，请联系我修改；
                        "order_list": _oitems, //[["43254324", 2, 986.00], ["11111", 3, 66.00]], //参数具体含义为【商品id号，商品数量，商品单价】
                        "order_sumprice": _orderRes.ShouldPayAmount, //用户实际支付的价格
                        "order_payName": get_cp_payment_name(_orderRes.PayName), //支付方式，string类型
                        "order_shippingName": get_cp_shipment_name(_orderRes.ShipmentName), //快递方式，string类型
                        "user_id": _params.UserId,
                        "client": _params.ClientId
                    };
                    append_bfd_script(('https:' == document.location.protocol ? 'https://ssl-static1' : 'http://static1') + '.baifendian.com/service/zhengdatiandi/zdtd_order.js');
                }
            });
        },
        //支付成功页
        PaySuccess: function (_params) {
            return;
            $.post("/data/getorderdata", { orderId: _params.OrderId, random: new Date().getTime() }, function (_orderRes) {
                if (_orderRes.IsSuccess) {
                    PreOrderProcess({ OrderType: _orderRes.OrderType, IsDeposit: _orderRes.IsDeposit });
                    var _oitems = [];
                    $.each(_orderRes.OrderItems, function (k, v) {
                        _oitems.push([v.ProductId, v.OrderQty, v.DiscountPrice]);
                    });

                    _BFD.BFD_INFO = {
                        "order_id": _params.OrderId, //当前订单号，如果有拆单等特殊情况现象（一次购买中出现多个订单号）此页面代码不可用，请联系我修改；
                        "order_list": _oitems, //[["43254324", 2, 986.00], ["11111", 3, 66.00]], //参数具体含义为【商品id号，商品数量，商品单价】
                        "order_sumprice": _orderRes.ShouldPayAmount, //用户实际支付的价格
                        "order_payName": get_cp_payment_name(_orderRes.PayName), //支付方式，string类型
                        "order_shippingName": get_cp_shipment_name(_orderRes.ShipmentName), //快递方式，string类型
                        "user_id": _params.UserId,
                        "client": _params.ClientId
                    };
                    append_bfd_script(('https:' == document.location.protocol ? 'https://ssl-static1' : 'http://static1') + '.baifendian.com/service/zhengdatiandi/zdtd_buy.js');
                }
            });
        }
    },
    //由集奥DSP渠道带到着陆页的到达量、采购平台订单数/订单金额、提交成功订单数/订单金额
    JADSPTrack: {
        //商品详情页
        ProductDetail: function () {
            dsp_append_script(('https:' == document.location.protocol ? 'https://sslcdn.geotmt.com' : 'http://ga.istreamsche.com') + 'CPA/GEO_REACH.js');
            
        },
        //加入采购平台
        ShoppingCart: function (_params) {
            var userid = _params;
          
            dsp_append_script(('https:' == document.location.protocol ? 'https://sslcdn.geotmt.com' : 'http://ga.istreamsche.com') + 'CPA/GEO_REGISTER.js');
          
        },
        //订单提交成功页
        OrderSuccess: function (_params) {
            var userid = _params;
         
            dsp_append_script(('https:' == document.location.protocol ? 'https://sslcdn.geotmt.com' : 'http://ga.istreamsche.com') + 'CPA/GEO_REGISTER.js');
          
        }

    },
    MVQTrack: {
        Common: function () {
            _mvq.push(['$setAccount', 'm-336-0']);
            _mvq.push(['$logConversion']);
            (function () {
                var mvl = document.createElement('script');
                mvl.type = 'text/javascript'; mvl.async = true;
                mvl.src = ('https:' == document.location.protocol ? 'https://secure' : 'http://static') + '.mediav.com/mvl.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(mvl, s);
            })();
        },
        OrderSuccess: function (_params) {
            try {
                _mvq.push(['$setGeneral', 'ordercreate', '', /*用户名*/'', /*用户id*/'']);
                _mvq.push(['$logConversion']);
                _mvq.push(['$addOrder', _params.OrderId, _params.TotalAmount]);
                var _items = window.eval("(" + _params.OrderItems + ")");
                $.each(_items, function (k, v) {
                    _mvq.push(['$addItem',
                        _params.OrderId, // 订单号
                        v.ProductId, // 商品Id
                        v.Name, // 商品名称
                        v.DiscountPrice, // 商品价格
                        v.OrderQty, // 商品数量
                        'http://www.yummy77.com/product/' + v.ProductId + '.html', //商品页url
                        '' //商品页图片url
                    ]);
                });
                _mvq.push(['$logData']);
            } catch (err) { }
        },
        ProductDetail: function (_params) {
            _mvq.push(['$setGeneral', 'goodsdetail', '', /*用户名*/'', /*用户id*/'']);
            _mvq.push(['$logConversion']);
            _mvq.push(['$addGoods', /*分类id*/_params.CategoryId, /*企业id*/'0', /*商品名称*/_params.ProductName, /*商品ID*/_params.Id,
            /*商品售价*/_params.Price, /*商品图片url*/_params.Image, /*分类名*/_params.CategoryName, /*企业名*/_params.BrandName,
            /*商品库存状态1或是0*/_params.HasStore, /*网络价*/_params.MarketPrice, /*收藏人数*/0, /*商品下架时间*/'']);
            _mvq.push(['$logData']);
        },
        SignupSuccess: function (uid) {
            _mvq.push(['$setGeneral', 'registered', '', /*用户名*/'', /*用户id*/uid]);
        },
        ShoppingCart: function (uid) {
            var cidlist = $("#hf_cart_pro_ids").val();
            if ($.trim(cidlist) == "") {
                return;
            }
            cidlist = cidlist.replace('-', ',')
            _mvq.push(['$setGeneral', 'cartview', '', /*用户名*/'', /*用户id*/uid]);
            _mvq.push(['$addItem', '', /*商品id*/cidlist, '', '']);
            _mvq.push(['$logData']);
        }
    },
    GoogleTrack: {
        //公共代码
        Common: function () {
            google_conversion_id = 986533477;
            google_conversion_label = "bEjtCPu0ugYQ5Zy11gM";
            google_custom_params = window.google_tag_params;
            google_remarketing_only = true;
            _gaq.push(['_setAccount', 'UA-40230782-1']);
            _gaq.push(['_trackPageview']);

            (function () {
                var ga1 = document.createElement('script'); ga1.type = 'text/javascript'; ga1.async = true;
                //                ga1.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                ga1.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga1, s);
            })();


            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
            })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

            ga('create', 'UA-40230782-2', 'yummy77.com');
            ga('send', 'pageview');

        },
        //订单提交成功页
        OrderSuccess: function (_params) {
            /* <![CDATA[ */
            google_conversion_id = 986533477;
            google_conversion_language = "en";
            google_conversion_format = "3";
            google_conversion_color = "ffffff";
            google_conversion_label = "NUXLCKulvwYQ5Zy11gM";
            google_conversion_value = 0;
            google_custom_params = window.google_tag_params;
            google_remarketing_only = false;

            _gaq.push(['_setAccount', 'UA-40230782-1']);
            _gaq.push(['_trackPageview']);
            _gaq.push(['_addTrans',
                _params.OrderId, //订单号 –必填
                '', //商店名，非必填，留空即可
                _params.TotalAmount, // 订单总金额 – 必填
                '', // 税，非必填，留空即可
                '', // 运费，非必填，留空即可，如果有相应参数，可作跟踪
                '', // 城市，非必填，留空即可
                '', // 省，非必填，留空即可
                '' // 国家，非必填，留空即可
                ]);

            //因为一个订单里可能包含有多种商品，每种商品的数量可以是多个，_addItem应调用采购平台中的每一个商品的相关信息，需要编写一个循环应用程序loop调用采购平台中的所有商品的信息，将每一个产品的信息输出为一个_addItem。
            var _items = window.eval("(" + _params.OrderItems + ")");
            $.each(_items, function (k, v) {
                _gaq.push(['_addItem',
                    _params.OrderId, // 订单号 – 必填,用于关联交易与订单，和上边所调用的'{订单号}'参数是一样的
                    v.ProductId, // 产品编号（SKU） - 必填，可用特定的参数来表示产品的编号
                    v.Name, // 产品名称-可不填写，但强烈建议填写
                    '', // 类别或版本，非必填，留空即可
                    v.DiscountPrice, // 单价 – 必填
                    v.OrderQty // 数量 – 必填
                ]);
            });
            _gaq.push(['_trackTrans']); //将交易数据提交给GA服务器
            /* ]]> */

            // UA order track
            ga('require', 'ecommerce', 'ecommerce.js');
            ga('ecommerce:addTransaction', {
                'id': _params.OrderId,                     // Transaction ID. Required.
                'affiliation': 'yummy77 website',   // Affiliation or store name.
                'revenue': _params.TotalAmount,               // Grand Total.
                'shipping': '0',                  // Shipping.
                'tax': '0'                     // Tax.
            });

            $.each(_items, function (k, v) {
                ga('ecommerce:addItem', {
                    'id': _params.OrderId,          // Transaction ID. Required.
                    'name': v.Name,                 // Product name. Required.
                    'sku': v.ProductId,             // SKU/code.
                    'category': '',                 // Category or variation.
                    'price': v.DiscountPrice,       // Unit price.
                    'quantity': v.OrderQty          // Quantity.
                });
            });
            ga('ecommerce:send');
            // end UA order
        }
    },
    ZYZTrack: {
        Common: function () {
            return;
            host = "tk.optaim.com/";
            pkBaseURL = (("https:" == document.location.protocol) ? ("https://" + host) : ("http://" + host));
            document.write(unescape("%3Cscript src='" + pkBaseURL + "zyztk.js' type='text/javascript'%3E%3C/script%3E"));
        },
        OrderSuccess: function (_params) {
            return;
            var zyzt = Ziwik.init(pkBaseURL + "j", "itruelife");

            var _items = window.eval("(" + _params.Data.OrderItems + ")");

            //Get categories name by id
            var tmpCatIds = "";
            $.each(_items, function (k, v) {
                tmpCatIds += v.WebCategoryId + ",";
            });

            if (tmpCatIds != "") {
                tmpCatIds = tmpCatIds.substr(0, tmpCatIds.length - 1);
            }

            var catNames = get_cat_names(tmpCatIds);
            if (catNames != null) {
                $.each(_items, function (k, v) {
                    zyzt.addProduct("", v.Name, v.ProductId, catNames[k], v.WebCategoryId, v.DiscountPrice, v.OrderQty);
                });

                zyzt.setUserName(_params.UserId);
                zyzt.trackOrderView(_params.Data.OrderId, _params.Data.TotalAmount);
                try { } catch (err) { }
            }

        }
    },
    VRMTrack: {
        Common: function () {
            try {
                var viz = document.createElement("script");
                viz.type = "text/javascript";
                viz.async = true;
                viz.src = ("https:" == document.location.protocol ? "https://ssl.vizury.com" : "http://serv3.vizury.com") + "/analyze/pixel.php?account_id=VIZVRM1020";

                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(viz, s);
                viz.onload = function () {
                    try {
                        pixel.parse();
                    } catch (i) {
                    }
                };
                viz.onreadystatechange = function () {
                    if (viz.readyState == "complete" || viz.readyState == "loaded") {
                        try {
                            pixel.parse();
                        } catch (i) {
                        }
                    }
                };
            } catch (i) { }
        },
        OrderSuccess: function (_params) {
            try {
                var baseURL = $.format("http://serv3.vizury.com/analyze/analyze.php?account_id={0}&param={1}&orderid={2}&orderprice={3}",
                    "VIZVRM1020", "e500", _params.OrderId, _params.TotalAmount);

                var _items = window.eval("(" + _params.OrderItems + ")");
                var append_param_str = "";
                $.each(_items, function (k, v) {
                    append_param_str += $.format("&pid{0}={1}&catid{0}={2}&quantity{0}={3}&price{0}={4}", (k + 1), v.ProductId, v.WebCategoryId, v.OrderQty, v.DiscountPrice);
                });
                baseURL = baseURL + append_param_str;

                var analyze = document.createElement("iframe");
                analyze.src = baseURL;
                analyze.scrolling = "no";
                analyze.width = 1;
                analyze.height = 1;
                analyze.marginheight = 0;
                analyze.marginwidth = 0;
                analyze.frameborder = 0;
                var node = document.getElementsByTagName("script")[0];
                node.parentNode.insertBefore(analyze, node);
            } catch (i) { }
        }
    },
    BaiduTrack: {
        Common: function () {
            (function () {
                var hm = document.createElement("script");
                hm.src = "//hm.baidu.com/hm.js?ff98c880ec6f1d733b664520efe25070";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();
        }
    },
    DSPTrack: {
        Common: function () {
            return;
            ym_append_script("http://aw.kejet.net/t?p=d2&c=Hp&er=1&kd=1&sid=2398466657669353473&zid=2398466657669353472")
        },
        OrderSuccess: function (_params) {
            return;
            _zzOrderId = _params.OrderId;
            _zzOrderTotal = _params.TotalAmount;
            _zzOrderDetails = [];
            var _items = window.eval("(" + _params.OrderItems + ")");
            $.each(_items, function () {
                _zzOrderDetails.push($.format("{0}:{1}:{2}", this.ProductId, this.OrderQty, this.DiscountPrice));
            });

            //_zzsiteid = "2398466657669353473";
            //_zzid = "2398466657669353472";

            var _src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'ec.kejet.net/api/order_kejet.js';
            ym_append_script(_src);
        }
    },
    MicroAdTrack: {
        Watch: function () {
            $("#microad_common_script").remove();
            $("#microad_common_noscript").remove();
            $("#microad_script_frame").remove();
        }
    },
    WSKJAdTrack: {
        Common: function () {
            return;
            try {
                ym_append_script("http://cm.agrantsem.com/CookieMapping/js/gcm.js");
            } catch (ed) { }
        },
        SignupSuccess: function (uid) {
            return;
            try {
                _agt.push(['_atsev', '101']);
                _agt.push(['_atsusr', uid]); /* 请将$用户名$替换为真实的用户名*/
            } catch (e) { }
        },
        OrderSuccess: function (_params) {
            return;
            _agt.push(['_atsev', '102']);
            _agt.push(['_atssum', _params.TotalAmount]); /* 请将$订单金额$替换为真实的订单金额*/
            _agt.push(['_atsnum', _params.OrderId]); /* 请将$订单号$替换为真实的订单号*/
        },
        ShoppingCart: function (url) {
            return;
            _agt.push(['_atsev', '104']);
            _agt.push(['_atsbas', url]); /* 请将$URL$替换为真实的URL*/
        }
    },
    LKTAdTrack: {
        OrderSuccess: function (_params) {
            return;
            try {
                if (_params.pcode == "linktech" && _params.ispush == "True") {
                    var baseURL = $.format("http://service.linktech.cn/purchase_cps.php?a_id={0}&m_id={1}&mbr_id={2}&o_cd={3}",
                    _params.extparam, "yummy77", window.encodeURIComponent(_params.UserId), _params.Data.OrderId);
                    var _items = window.eval("(" + _params.Data.OrderItems + ")");
                    var append_param_str = "";
                    if (_items.length == 1) {
                        var v = _items[0];
                        //ad v.OrderQty
                        append_param_str += $.format("&p_cd={0}&it_cnt={1}&price={2}&c_cd={3}", v.ProductId, 1, v.DiscountPrice, v.WebCategoryId);
                    } else {
                        var pid = "";
                        var pnum = "";
                        var pprize = "";
                        var pcid = "";
                        $.each(_items, function (k, v) {
                            if (pid == "") {
                                pid = v.ProductId;
                                pnum = 1;
                                pprize = v.DiscountPrice;
                                pcid = v.WebCategoryId;
                            } else {
                                pid = pid + "||" + v.ProductId;
                                pnum = pnum + "||" + 1;
                                pprize = pprize + "||" + v.DiscountPrice;
                                pcid = pcid + "||" + v.WebCategoryId;
                            }
                        });
                        append_param_str += $.format("&p_cd={0}&it_cnt={1}&price={2}&c_cd={3}", pid, pnum, pprize, pcid);
                    }
                    baseURL = baseURL + append_param_str;
                    var analyze = document.createElement("iframe");
                    analyze.src = baseURL;
                    analyze.scrolling = "no";
                    analyze.width = 1;
                    analyze.height = 1;
                    analyze.marginheight = 0;
                    analyze.marginwidth = 0;
                    analyze.frameborder = 0;
                    var node = document.getElementsByTagName("script")[0];
                    node.parentNode.insertBefore(analyze, node);
                }
            } catch (i) { }
        }
    },
    YCMAdTrack: {
        OrderSuccess: function (_params) {
            return;
            try {
                //http://convertion.acs86.com/GroupPerformanceByRequest/Purchase/广告主id?aelinfo=adchina&amt=10&c_cd=CCD&comm=100&hhmiss=153030&it_cnt=2&m_id=dangdang&mbr_id=1&o_cd=test12345&p_cd=PCD&pm=1&price=100&u_id=uid123&yyyymmdd=20130831&sign=2f4438a14b2200de6887efce9696f905
                if (_params.pcode == "adchina" && _params.ispush == "True") {
                    //var myDate = new Date();
                    //var year = myDate.getFullYear();
                    //var month = myDate.getMonth() + 1;
                    //month = month < 10 ? "0" + month : month;s
                    //var day = myDate.getDate();
                    //day = day < 10 ? "0" + day : day;
                    var mcode = "yummy77"; //合作者商户id
                    var aelinfo = _params.extparam; //合作伙伴参数数据
                    var it_cnt = 1; //商品数量
                    var price = _params.Data.YcmPrice; //商品单价
                    var c_cd = "A"; //商品分类id
                    // var ss = myDate.getTime() % 60000; //获取时间，因为系统中时间是以毫秒计算的， 
                    //ss = (ss - (ss % 1000)) / 1000;
                    //ss = ss < 10 ? "0" + ss : ss;
                    //var minutes = myDate.getMinutes();
                    // minutes = minutes < 10 ? "0" + minutes : minutes;
                    //var hours = myDate.getHours();
                    // hours = hours < 10 ? "0" + hours : hours;
                    // var hhmiss = "" + hours + "" + minutes + "" + ss.toString();
                    var m_id = "yummy77";
                    var mbr_id = window.encodeURIComponent(_params.UserId);
                    var o_cd = _params.Data.OrderId;
                    var p_cd = _params.Data.OrderId;
                    // var yyyymmdd = "" + year + "" + month + "" + day;
                    var yyyymmdd = _params.Data.Date;
                    var hhmiss = _params.Data.Time;
                    var sinstring = "aelinfo=" + aelinfo + "&c_cd=" + c_cd + "&hhmiss=" + hhmiss + "&it_cnt=" + it_cnt + "&m_id=" + m_id + "&mbr_id=" + mbr_id + "&o_cd=" + o_cd + "&p_cd=" + p_cd + "&price=" + price + "&yyyymmdd=" + yyyymmdd;
                    var sign = ("" + $.md5(sinstring));
                    var baseURL = "http://convertion.acs86.com/GroupPerformanceByRequest/Purchase/" + mcode;
                    var url = baseURL + "?" + sinstring + "&sign=" + sign;
                    var analyze = document.createElement("iframe");
                    analyze.src = url;
                    analyze.scrolling = "no";
                    analyze.width = 1;
                    analyze.height = 1;
                    analyze.marginheight = 0;
                    analyze.marginwidth = 0;
                    analyze.frameborder = 0;
                    var node = document.getElementsByTagName("script")[0];
                    node.parentNode.insertBefore(analyze, node);
                }
            } catch (i) { }
        }
    },
    ZZYTrack: {
        Common: function () {
            _zzsiteid = "2398466657669353473";
            _zzid = "2398466657669353472";
            (function () {
                var zz = document.createElement('script');
                zz.type = 'text/javascript';
                zz.async = true;
                zz.src = ('https:' == document.location.protocol ? 'https://ssl.trace.zhiziyun.com' : 'http://static.zhiziyun.com/trace') + '/api/trace.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(zz, s);
            })();
        }
    }
};

function get_cat_names(catIds) {
    var catNames = null;
    $.ajax({
        type: "post",
        url: "/data/pint0n-un6-1uyt3uehtjeiwqujg?t=" + (new Date()).getMilliseconds(),
        data: { catIds: catIds },
        async: false,
        success: function (_res) {
            if (_res.IsSuccess) {
                catNames = _res.CatNames;
            }
        }
    });
    return catNames;
}

function dsp_append_script(_src) {
    var _sc = document.createElement("script");
    _sc.type = 'text/javascript';
    _sc.async = 'async';
    _sc.charset = 'utf-8';
    _sc.src = (_src);
    document.getElementsByTagName("head")[0].appendChild(_sc);
}

function ym_append_script(_src) {
    var _sc = document.createElement("script");
    _sc.type = 'text/javascript';
    _sc.async = true;
    _sc.charset = 'utf-8';
    _sc.src = (_src);
    document.getElementsByTagName("head")[0].appendChild(_sc);
}

function append_bfd_script(_src) {
    _BFD.script = document.createElement("script");
    _BFD.script.type = 'text/javascript';
    _BFD.script.async = true;
    _BFD.script.charset = 'utf-8';
    _BFD.script.src = (_src);
    document.getElementsByTagName("head")[0].appendChild(_BFD.script);
}

function get_cp_payment_name(p_code) {
    switch (p_code) {
        case "PAY_WEB":
            return "在线支付";
        case "PAY_GIFTCARD":
            return "礼品卡支付";
        case "PAY_ACCOUNT":
            return "帐户余额支付";
        case "PAY_COMPANY":
            return "企业支付";
        case "PAY_COD":
            return "货到付款";
    }
}
function get_cp_shipment_name(s_code) {
    switch (s_code) {
        case "SHIP_CPTRUE":
            return "自配送";
        case "SHIP_SELF":
            return "自提";
        default:
            return "其他快递";
    }
}