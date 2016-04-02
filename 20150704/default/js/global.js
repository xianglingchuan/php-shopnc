if (typeof (GoHomepageLink) == "undefined") {
    GoHomepageLink = "http://www.zg03.com/wap";
}
if (typeof (GoChiChiTuanLink) == "undefined") {
    GoChiChiTuanLink = "http://www.zg03.com/wap";
}
$.format = function (source, params) {
    if (arguments.length == 1)
        return function () {
            var args = $.makeArray(arguments);
            args.unshift(source);
            return $.format.apply(this, args);
        };
    if (arguments.length > 2 && params.constructor != Array) {
        params = $.makeArray(arguments).slice(1);
    }
    if (params.constructor != Array) {
        params = [params];
    }
    $.each(params, function (i, n) {
        source = source.replace(new RegExp("\\{" + i + "\\}", "g"), n);
    });
    return source;
};

$.hasElement = function (eleId) {
    return typeof ($("#" + eleId).get(0)) != "undefined";
}

PRODUCTLINK = '/product/{0}.html';
POINTPRODUCTLINK = '/point/{0}.html';
CATEGORYLINK = '/category/{0}.html';
PRODUCTFULLLINK = "http://{0}/product/{1}.html";
COOKIEDOMAIN = window.location.host.replace(/\w+\.(\w+\.\w+)/g, "$1");
COOKIEFULLDOMAIN = COOKIEDOMAIN;

//增加浙江分站，分站内容写死了，暂时不用下面配置
//SITENAMES = ["上海","苏州","浙江"];

String.prototype.getProductLink = function () {
    return $.format(PRODUCTLINK, this);
}
String.prototype.getPointProductLink = function () {
    return $.format(POINTPRODUCTLINK, this);
}
String.prototype.getCategoryLink = function () {
    return $.format(CATEGORYLINK, this);
}

Array.prototype.remove = function (index) {
    return this.slice(0, index - 1).concat(this.slice(index));
}

var _customerName = null;
USER = {
    isAuthenticated: function () {
        //        if ($.cookie("IsAuthenticated") == "1")
        //            return true;
        //        return false;
        //return $("#lilogon").attr("_n") != undefined && $("#lilogon").attr("_n") != "";
        if (!_customerName) {
            $.ajax({
                url: "/account/getuserinfo?" + (new Date()).getMilliseconds(),
                async: false,
                type: "POST",
                success: function (data) {
                    if (data.IsAuthenticated) {
                        _customerName = data.CustomerName;
                        return true;
                    }
                    else {
                        _customerName = "";
                        return false;
                    }
                }
            });
        }
        return _customerName > "";
    },
    getCustomerName: function () {
        //        if ($.cookie("IsAuthenticated") == "1" && $.cookie("CustomerName")) {
        //            return $.cookie("CustomerName");
        //        }
        //        return null;
        //return $("#lilogon").attr("_n");
        if (!_customerName) {
            $.ajax({
                url: "/account/getuserinfo?" + (new Date()).getMilliseconds(),
                async: false,
                type: "POST",
                success: function (data) {
                    if (data.IsAuthenticated) {
                        _customerName = data.CustomerName;
                        return _customerName;
                    }
                    else {
                        _customerName = "";
                        return _customerName;
                    }
                }
            });
        }
        else
            return _customerName;

    }
};
function getCell(tbody, row, col) {
    var row = tbody.children("tr:eq(" + row + ")");
    var cell = row.children("td:eq(" + col + ")");
    return cell;
}

function SubTabManager() {
    var _bindTabClickEvent = function (tabId) {
        var tabs = $("#" + tabId + ">li");
        var content = $("#" + tabId + "_content");
        tabs.each(function (i) {
            var currentTab = $(this);
            currentTab.click(function () {
                tabs.removeClass("currentTab");
                currentTab.addClass("currentTab");
                content.children().each(function (j) {
                    var tc = $(this);
                    i == j ? tc.show() : tc.hide();
                });
                //                $(document).scrollTop(getY(tabs.get(0)));
            })
        })
    }
    this.AutoBind = function () {
        var subTabs = $(".subTab");
        subTabs.each(function () {
            _bindTabClickEvent(this.id);
        })
    }
    var getY = function (elem) {
        var y = 0;
        while (elem) {
            y = y + elem.offsetTop;
            elem = elem.offsetParent;
        }
        return y;
    }
}

function changeValidateCode(eleId) {
    var timeout = setTimeout(function () {
        if (eleId) {
            $("#" + eleId).attr("src", "/data/validatecode?" + (new Date()).getTime())
        }
        else {
            $("#valCode").attr("src", "/data/validatecode?" + (new Date()).getTime())
        }
        clearTimeout(timeout);
    }, 1);
}

DelayedTask = function (fn, scope, args) {
    var me = this,
       id,
       call = function () {
           clearInterval(id);
           id = null;
           fn.apply(scope, args || []);
       };
    me.delay = function (delay, newFn, newScope, newArgs) {
        me.cancel();
        fn = newFn || fn;
        scope = newScope || scope;
        args = newArgs || args;
        id = setInterval(call, delay);
    };
    me.cancel = function () {
        if (id) {
            clearInterval(id);
            id = null;
        }
    };
};

function MasterPage() {
    var currentCartContent = null;
    var self = this;

    var init = function () {
        $("#cic").mouseenter(function () {
            //            getcart();
            var maxWidth = 0;
            $("#cartbarItems").show().children().each(function () {
                if (this.offsetWidth > maxWidth) {
                    maxWidth = this.offsetWidth;
                }
            })
            $("#cartbarItems").width(maxWidth);
        }).mouseleave(function () {
            $("#cartbarItems").slideUp();
        })
        //        getcart();

        $("#langLink").click(function () {
            $.cookie('lang', $(this).attr("value"));
            var href = window.location.href;
            if (href.indexOf("lang=changed") == -1) {
                if (href.indexOf("?") != -1) {
                    href = href + "&lang=changed";
                }
                else {
                    href = href + "?lang=changed";
                }
            }
            else {
                href = href.replace("&lang=changed", "").replace("?lang=changed", "");
            }
            window.location = href;
        })

        $(document).ready(function () {            
            addSearchAutoComplete();
        })

        if ($("#searchButton").get(0)) {
            $("#searchButton").bind("click", function () {
                if ($("#key").get(0)) {
                    if ($.trim($("#key").get(0).value).length == 0) {
                        alert("请输入您要搜索的产品关键字，谢谢！");
                        return false;
                    }
                }
            })
        }
        $("input[type=text]").addClass("input");
        $("input[type=password]").addClass("input");
    }

    var getcart = function () {
        if (!currentCartContent) {
            $.ajax({
                url: "/shopping/mycart",
                data: { random: (new Date()).getTime() },
                async: false,
                success: function (data) {
                    $("#cartbarItems").html(data);
                    currentCartContent = data;
                    $("#cicount").html($("#cartItemCountHidden").val());
                    $(".removeCartBtn").click(function () {
                        var ele = $(this);
                        var parent = ele.parent();
                        parent.css({ "border-bottom": "dashed 1px red", "border-top": "dashed 1px red" });
                        self.removeItem(ele.attr("_id"), function () {
                            if (window.location.pathname == "/shopping/cart") {
                                window.location = window.location;
                            }
                        }, function () {
                            parent.css({ "border-bottom": "dashed 0px red", "border-top": "dashed 0px red" });
                        });
                    })
                }
            })
        }
    }

    var addSearchAutoComplete = function () {
        if ($("#key").get(0)) {
            var a = $('#key').autocomplete({
                serviceUrl: '/product/autocomplete',
                //            minChars: 1,
                //            delimiter: /(,|;)\s*/, // regex or character
                maxHeight: 298,
                width: 250,
                zIndex: 9999,
                //            deferRequestBy: 0, //miliseconds
                //            params: { country: 'Yes' }, //aditional parameters
                noCache: false, //default is false, set to true to disable caching
                //            // callback function:
                onSelect: function (value, data) {
                    window.location.href = "/product/search?key=" + encodeURIComponent(value);
                }
            });
        }
    }

    this.refresh = function () {
        $.ajax({
            url: "/shopping/mycart",
            data: { random: (new Date()).getTime() },
            async: false,
            success: function (data) {
                $("#cartbarItems").html(data);
                currentCartContent = data;
                $("#cicount").html($("#cartItemCountHidden").val());
            }
        })
    }

    //    this.updateItem = function (id, q) {
    //        $("#cartbarItems>div").each(function () {
    //            var ele = $(this);
    //            if (ele.attr("_id") == id) {
    //                var oldQ = ele.attr("_q");
    //                var newQ = $("#cartItemCountHidden").val() - oldQ + q;
    //                ele.attr("_q", q);
    //                $("#cartItemCountHidden").val(newQ);
    //                $("#cicount").html($("#cartItemCountHidden").val());
    //            }
    //        })
    //    }

    this.removeItem = function (id, quantity, successCallback, failedCallback) {
        var mask = $(document).mask('正在删除货物<img src="/images/loading.gif" />');
        $.post("/shopping/cartpartial", { id: id, Quantity: quantity, random: (new Date()).getTime() }, function (json) {
            if (json.Success) {
                mask.find("div.maskmsg").html("删除数据成功");
                successCallback && successCallback();
                $("#cartbarItems>div").each(function () {
                    var ele = $(this);
                    if (ele.attr("_id") == id) {
                        var q = ele.attr("_q");
                        $("#cartItemCountHidden").val($("#cartItemCountHidden").val() - q);
                        $("#cicount").html($("#cartItemCountHidden").val());
                        ele.remove();
                        if ($("#cartbarItems>div").length == 0) {
                            $("<div>暂时您还没有添加任何商品到采购平台</div>").appendTo("#cartbarItems");
                        }
                    }
                })
            }
            else {
                mask.find("div.maskmsg").html(json.Message);
                failedCallback && failedCallback();
            }
            var timer = setTimeout(function () {
                $(document).unmask();
                clearTimeout(timer);
            }, 1500);
        }, "json");
    }

    init();

    $(".rightdiv .titlediv li").not(".noaction").hover(function () {
        var _this = $(this);
        if (_this.hasClass("current")) {
            return;
        }
        var clsName = _this.find("b").attr("class");
        _this.addClass("current").siblings().removeClass("current");
        $(".infodiv li").hide().filter("li[class=" + clsName + "]").show();
        $(".infodiv .arrow").attr("class", "b" + clsName + " arrow ");
        $(".infodiv").show();
    }, function () {
        $(this).removeClass("current");
        $(".rightdiv .infodiv").hide();
    });
    $(".rightdiv .infodiv").hover(function () {
        $(this).show();
    }, function () {
        $(this).hide();
    })
}
var master = new MasterPage();

function QueryString() {
    var name, value, i;
    var str = location.href;
    var num = str.indexOf("?")
    str = str.substr(num + 1);
    var arrtmp = str.split("&");
    for (i = 0; i < arrtmp.length; i++) {
        num = arrtmp[i].indexOf("=");
        if (num > 0) {
            name = arrtmp[i].substring(0, num);
            value = arrtmp[i].substr(num + 1);
            this[name] = value;
        }
    }
}

function PartnerActivityView() {
    var init = function () {
        var activityLink = $("#activityLink");
        var querystr = new QueryString();
        var oldHref = activityLink.get(0).getAttribute("href", 2);
        var str = location.href;
        var num = str.indexOf("?")
        str = str.substr(num + 1);
        var newHref = oldHref + str + "&to=" + escape("http://www.yummy77.com/partner/activity");
        activityLink.attr("href", newHref);
    }

    init();
}
/* 浏览记录不用了
function ViewHistory(options) {

//浏览记录显示条数
var viewNum = 8;


var getContentHTML = function (Products) {
var returnHTML = "";
if (Products && Products.length > 0) {
for (var i = 0; i < Products.length && i < viewNum; i++) {
if (Products[i].ProductPrice != "undefined") {
returnHTML += "<li>";
returnHTML += "<div><a href=\"" + Products[i].ProductId.getProductLink() + "\"><img src=\"" + Products[i].ImagePath + "\" /></a></div>";
returnHTML += "<div class='price'><b>￥</b><span><b class='specolor'>" + Products[i].ProductPrice + "</b></span></div>";
returnHTML += "</li>";
}
}
}
else
returnHTML = "<li class=\"norecord\">暂无记录</li>";
return returnHTML;
};

var getClearHTML = function () { return "<a href=\"javascript:void(0);\">清空</a>"; }


var init = function (options) {
if (!options || !options.ContentDiv || !$("#" + options.ContentDiv))
return;

var strViewHistory = $.cookie("ViewHistory");
strViewHistory = !strViewHistory ? "" : strViewHistory;

var Products = eval("([" + strViewHistory + "])");

$("#" + options.ContentDiv).html(getContentHTML(Products));

if (options.ClearDiv) {
var objClear = $("#" + options.ClearDiv);
objClear.html(getClearHTML());

objClear.click(function () {
$.cookie("ViewHistory", null, { expires: 30, path: "/", domain: COOKIEDOMAIN });
$("#" + options.ContentDiv).html("<li class=\"norecord\">暂无记录</li>");
});
}
}

init(options);
}
*/
//function TopN(ulContainer) {
//    $.each(ulContainer, function () {
//        var ulid = this;
//        $("#" + ulid + " [name=viewme]").click(function () {
//            $("#" + ulid + " .rankingdetail").removeClass("currentd");
//            $("#" + ulid + " .rankname").removeClass("hide");
//            $(this).parent().next().addClass("currentd");
//            $(this).parent().addClass("hide");
//        });
//    });
//}

/* topmenu 不用了
function TopMenu() {
_this = this;
var tabs = $("#topMenu").find("li");
var tabLeft = [];
var SetMenuSelected = function () {
var bread = $(".bread");
if (bread.get(0)) {
var subbread = bread.find("a");
if (subbread.length >= 3) {
var currentMenuName = $.trim(subbread.eq(2).text());
tabs.not(":first").each(function () {
var link = $(this).children(":first-child");
if ($.trim(link.text()) == currentMenuName) {
var oldLinkColor = link.css("color");
link.addClass("selecteda");
tabs.first().find("a").css("color", oldLinkColor);
}
})
}
}
}

var getCookieCart = function () {
$("#topcartitems").html(setCookieCartHTML(_this.ShoppingCart.getCartData()));
}
var setCookieCartHTML = function (item) {
var returnHTML = "";
var bottomHTML = "";
var topHTML = "";
var quantity = 0;
var totalprices = 0;
try {
if (item && iteyummlength > 0 && item[0].length > 0) {
for (var i = 0; i < item.length; i++) {
if (item[i] != "undefined") {
returnHTML += "<div class=\"item\">";
returnHTML += "<span class=\"img\"><img alt='" + item[i][1] + "' src='" + item[i][5] + "' />";

var price = item[i][2];
var priceview = price;
var priceType = "现价";
var type = item[i][6];

if (type == 2) {
var promoType = item[i][10];
if (promoType == "满额换购") {
returnHTML += "<span class=\"rep_mark\"></span>";
} else if (promoType == "满额赠送" || promoType == "买赠" || promoType == "满额赠送(商品组合)") {
returnHTML += "<span class=\"gift_mark\"></span>";
priceType = "促销价";
}
}
else if (type == 3) {

price = item[i][9];
priceview = price + "+" + item[i][8] + "积分";
priceType = "积分价格"

}
else {
if (item[i][4] == "1") {
priceType = "促销价";
}
}
returnHTML += "</span>"
returnHTML += "<span class=\"pname\"><font><a href='" + item[i][0].getProductLink() + "' title='" + item[i][1] + "' target=\"_blank\">" + item[i][1] + "</a></font>";
returnHTML += "<font class=\"specolor b\">" + priceType + "：￥" + priceview + "</font></span>";
returnHTML += "<span class=\"count specolor b\">X" + item[i][3] + "</span>";
//returnHTML += "<span class=\"func\"><a href=\"javascript:void('0');\" _productid=\"" + item[i][0] + "\" _quantity=\"" + item[i][3] + "\" _promotionid=\"" + item[i][6] + "\">删除</a></span>";
returnHTML += "</div>";
quantity += item[i][3] * 1;
totalprices += price * item[i][3];
}
}
returnHTML += "<div class=\"clearfix\" style=\"height:10px;overflow:hidden; width:100%; display:block;\"></div>";
topHTML = " <span id=\"spanquantity\" class=\"left\" style=\"cursor:pointer;\">采购平台中<b>" + quantity + "</b>吨煤炭</span><span id=\"goClearing1\" class=\"right\" style=\"cursor:pointer;\">去结算</span>";
bottomHTML = "<div>" +
"<span class=\"left\">共<font class=\"specolor b\">" + quantity + "</font>吨煤炭</span>" +
"<span class=\"right\">金额总计约：<font class=\"specolor b\">￥" + totalprices.toFixed(2) + "</font></span>" +
"</div>" +
"<div><span class=\"left red pointer clearCart\">清空采购平台</span><span id=\"goClearing\" class=\"right specolor b balance\">去结算</span></div>";
$("#bgshoppingcart").html(topHTML);
$("#statdata").html(bottomHTML);
}
else {
returnHTML = "<div class=\"norecord\">暂无记录</div>";
topHTML = " <span id=\"spanquantity\" class=\"left\" style=\"cursor:pointer;\">采购平台中<b>0</b>吨煤炭</span><span id=\"goClearing1\" class=\"right\" style=\"cursor:pointer;\">去结算</span>";
bottomHTML = "<div>" +
"<span class=\"left\">共<font class=\"specolor b\">0</font>吨煤炭</span>" +
"<span class=\"right\">金额总计约：<font class=\"specolor b\">￥0</font></span>" +
"</div>" +
"<div><span id=\"goClearing\" class=\"right specolor b balance\">去结算</span></div>";
$("#bgshoppingcart").html(topHTML);
$("#statdata").html(bottomHTML);
}
}
catch (e) {
returnHTML = "<div class=\"norecord\">暂无记录</div>";
topHTML = " <span id=\"spanquantity\" class=\"left\" style=\"cursor:pointer;\">采购平台中<b>0</b>吨煤炭</span><span id=\"goClearing1\" class=\"right\" style=\"cursor:pointer;\">去结算</span>";
bottomHTML = "<div>" +
"<span class=\"left\">共<font class=\"specolor b\">0</font>吨煤炭</span>" +
"<span class=\"right\">金额总计约：<font class=\"specolor b\">￥0</font></span>" +
"</div>" +
"<div><span id=\"goClearing\" class=\"right specolor b balance\">去结算</span></div>";
$("#bgshoppingcart").html(topHTML);
$("#statdata").html(bottomHTML);
}
return returnHTML;
};
var topCartInit = function () {
getCookieCart();
$("#spanquantity").mouseenter(function () {
$("#divShoppingCart").css("z-index", "103").show();
})
.mouseleave(function () {
window.CartHide = true;
setTimeout(function () {
if (window.CartHide) {
$("#divShoppingCart").hide();
}
}, 100);
})
$("#divShoppingCart").mouseenter(function () {
window.CartHide = false;
})
.mouseleave(function () {
$("#divShoppingCart").hide();
})

$("#goClearing").click(function () {
window.location = "/shopping/cart";
});
$("#goClearing1").click(function () {
window.location = "/shopping/cart";
});
$(".clearCart").click(function () {
$.post("/shopping/removeallcart", function (data) {
if (data.IsSuccess) {
topCartInit();
$("#divShoppingCart").hide();
} else {
jAlert("服务器繁忙，请刷新后再试...");
}
});
});
}

var Init = function () {
tabLeft["美食美酒"] = { left: 161, width: 495, last: [4] };
tabLeft["粮油特产"] = { left: 241, width: 400, last: [3] };
tabLeft["水果生鲜"] = { left: 81, width: 400, last: [3] };
tabLeft["鲜花蛋糕"] = { left: 321, width: 200, last: [1] };
tabLeft["美容保健"] = { left: 401, width: 300, last: [2] };
tabLeft["家居生活"] = { left: 481, width: 200, last: [1] };
tabLeft["特惠专区"] = { left: 561, width: 129, last: [0] };

tabs.not(":first").not(".liCart").each(function () {
var link = $(this).children(":first-child");
var menuP = link.next();
var menuConfig = tabLeft[$.trim(link.text())];
menuP.css("left", menuConfig.left).width(menuConfig.width);

var dl = menuP.find("dl");
for (var i in menuConfig.last) {
dl.eq(menuConfig.last[i]).addClass("lastcol");
}
})

$(".mnav_sub>dl>dd>a").hover(function () {
$(this).addClass("ahover");
}, function () { $(this).removeClass("ahover"); })

tabs.not(":first").not(".liCart").mouseenter(function () {
var link = $(this).children(":first-child");
var menuP = link.next();
menuP.show();
link.addClass("currenta");
$(this).prev().find(".rightLine").hide();
})
.mouseleave(function () {
var link = $(this).children(":first-child");
var menuP = link.next();
menuP.hide();
link.removeClass("currenta");
menuP.find("dt").removeClass("currentdt");
$(this).prev().find(".rightLine").show();
})

SetMenuSelected();

topCartInit();
}

//导航栏采购平台
this.ShoppingCart = new ShoppingCartView(topCartInit);

Init();
}
*/

//============================================================
/*
string 扩展方法，可以持续增加
*/
//获取字符数组
String.prototype.ToCharArray = function () {
    return this.split("");
}
//扩展string，获取string的字符长度，其中一个汉字等于两个字符
String.prototype.getCharLength = function () {
    var l = 0;
    var a = this.ToCharArray();
    for (var i = 0; i < a.length; i++) {
        if (a[i].charCodeAt(0) < 299) {
            l++;
        } else {
            l += 2;
        }
    }
    return l;
}
//LTrim 去左空格
String.prototype.LTrim = function () {
    return this.replace(/^s+/g, "");
}
//RTrim 去右空格
String.prototype.RTrim = function () {
    return this.replace(/s+$/g, "");
}
//Trim 去两边空格
String.prototype.trim = function () {
    return this.replace(/(^s+)|(s+$)/g, "");
}
//截取超长字符串用指定符号代替
String.prototype.sublong = function (length, relapce) {
    return (this.length > length ? this.substring(0, length) + relapce : this);
}

String.prototype.date = function () {
    var re = /-?\d+/;
    var m = re.exec(this);
    return new Date(parseInt(m[0]));
}
Date.prototype.format = function (format) //author: meizz
{
    var o = {
        "M+": this.getMonth() + 1, //month
        "d+": this.getDate(),    //day
        "h+": this.getHours(),   //hour
        "m+": this.getMinutes(), //minute
        "s+": this.getSeconds(), //second
        "q+": Math.floor((this.getMonth() + 3) / 3),  //quarter
        "S": this.getMilliseconds() //millisecond
    }

    if (/(y+)/.test(format)) format = format.replace(RegExp.$1,
    (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o) if (new RegExp("(" + k + ")").test(format))
        format = format.replace(RegExp.$1,
      RegExp.$1.length == 1 ? o[k] :
        ("00" + o[k]).substr(("" + o[k]).length));
    return format;
}
Date.prototype.ymd = function () {
    return this.format("yyyyMMdd");
}

function NewPImageSlider(panel, leftBtnId, rightBtnId, timeinterval, stoptime) {
    var leftBtn = $("#" + leftBtnId);
    var rightBtn = $("#" + rightBtnId);
    var liElement = panel.find("li");

    var steppx = liElement.width();
    var panelWidth = steppx * liElement.length;

    var IsStop = false;

    panel.width(panelWidth);
    var panel1Left = 0;
    var panel2Left = panel.width();

    var clonedpanel = panel.clone();
    clonedpanel.css("margin-left", panel2Left);
    panel.after(clonedpanel);

    leftBtn.data("on", false);
    rightBtn.data("on", false);

    timeinterval = timeinterval || 600;
    stoptime = stoptime || 20;
    var isSliding = false;
    var previousBtn = null;
    var checkFlag = 0;
    var currentFn = null;
    var waiting = function (btn, currentBtnName) {
        checkFlag = setInterval(function () {
            if (!previousBtn) {
                if (currentFn) {
                    currentFn(btn);
                }
                clearInterval(checkFlag);
                checkFlag = 0;
            }
        }, 100);
    }

    var startRunLeft = function (btn) {
        if (IsStop) {
            return;
        }
        if (isSliding) {
            waiting(btn, startRunLeft, "right");
            return;
        }
        previousBtn = btn;
        isSliding = true;
        panel.stop(true, true);
        clonedpanel.stop(true, true);
        if (panel1Left <= panelWidth * -1) {
            panel1Left = panelWidth;
            panel.css({ "margin-left": panel1Left });
        }
        if (panel2Left <= panelWidth * -1) {
            panel2Left = panelWidth;
            clonedpanel.css({ "margin-left": panel2Left });
        }

        panel1Left -= steppx;
        panel.animate({ "margin-left": panel1Left }, timeinterval);
        panel2Left -= steppx;
        clonedpanel.animate({ "margin-left": panel2Left }, timeinterval);
        var timeout = setTimeout(function () {
            isSliding = false;
            previousBtn = null;
            var btnOn = btn.data("on");
            if (btnOn) {
                startRunLeft(btn);
            }
            clearTimeout(timeout);
        }, timeinterval + stoptime);
    }

    var startRunRight = function (btn) {
        if (IsStop) {
            return;
        }
        if (isSliding) {
            waiting(btn, startRunRight, "left");
            return;
        }
        previousBtn = btn;
        isSliding = true;
        panel.stop(true, true);
        clonedpanel.stop(true, true);
        if (panel1Left >= panelWidth) {
            panel1Left = panelWidth * -1;
            panel.css({ "margin-left": panel1Left });
        }
        if (panel2Left >= panelWidth) {
            panel2Left = panelWidth * -1;
            clonedpanel.css({ "margin-left": panel2Left });
        }

        panel1Left += steppx;
        panel.animate({ "margin-left": panel1Left }, timeinterval);
        panel2Left += steppx;
        clonedpanel.animate({ "margin-left": panel2Left }, timeinterval);
        var timeout = setTimeout(function () {
            isSliding = false;
            previousBtn = null;
            var btnOn = btn.data("on");
            if (btnOn) {
                startRunRight(btn);
            }
            clearTimeout(timeout);
        }, timeinterval + stoptime);
    }

    var init = function () {
        leftBtn.mouseenter(function () {
            $(this).data("on", true);
            currentFn = startRunRight;
            startRunRight($(this));
        }).mouseleave(function () {
            $(this).data("on", false);
            clearInterval(checkFlag);
            currentFn = null;
        });
        rightBtn.mouseenter(function () {
            $(this).data("on", true);
            currentFn = startRunLeft;
            startRunLeft($(this));
        }).mouseleave(function () {
            $(this).data("on", false);
            clearInterval(checkFlag);
            currentFn = null;
        });
    }

    this.Stop = function () {
        IsStop = true;
        panel1Left = 0;
        panel2Left = panel.width();
        panel.css("margin-left", panel1Left);
        clonedpanel.css("margin-left", panel2Left);
    }

    this.Start = function () {
        IsStop = false;
    }

    init();
}

function HomepageView(totalSeconds) {
    var topBannerAdCarousel = function () {
        //        var ismark = true;
        //        $("#hrefBigPromo1").show();
        //        $("#hrefBigPromo2").hide();
        //        setInterval(function () {
        //            if (ismark) {
        //                $("#hrefBigPromo1").hide();
        //                $("#hrefBigPromo2").show();
        //                ismark = false;
        //            } else {
        //                $("#hrefBigPromo2").hide();
        //                $("#hrefBigPromo1").show();
        //                ismark = true;
        //            }
        //        }, 4000);

        var topbanners = $(".bigpromo");
        var count = $(topbanners).length;
        var index = 0;
        if (count > 0) {
            $(topbanners[0]).show();
            setInterval(function () {
                $(topbanners[index]).show().siblings(".bigpromo").hide();
                if (index ==count-1) {
                    index = -1;
                }
                index++;
            }, 4000);
        }
    }

    var Init = function () {
        //        if ($(".qianggou .empty").length == 0 && totalSeconds > 0) {
        //            if ($(".qianggou").attr("_hasstock").toLowerCase() == "false") {    //没库存了
        //                $(".qianggou .product .btn").unbind("click").html("").addClass("over");
        //            } else {
        //                BindRushToCartEvent();
        //            }
        //            CountDown(totalSeconds, 1, cdOperation, setRushExpire);
        //        }
        NewPImageSlider($(".tjproSlider"), "tjproSliderLeft", "tjproSliderRight", 1000, 700);
        //        $(".tuijian div.content").hover(function () {
        //            $("#tjproSliderLeft").fadeIn();
        //            $("#tjproSliderRight").fadeIn();
        //        }, function () {
        //            $("#tjproSliderLeft").fadeOut();
        //            $("#tjproSliderRight").fadeOut();
        //        });

        $(".tabregion .titles span").mouseenter(function () {
            var thisIndex = $(this).attr("_index");
            $(".tabregion .titles span").removeClass("selected");
            $(this).addClass("selected");
            $(".tabregion .contents ul").hide();
            $("#regioncontent" + thisIndex).show();
        });

        $("#notice span").mouseover(function () {
            $(this).addClass("current").siblings().removeClass("current");
            $("#notice div[_pn=" + $(this).attr("_pn") + "]").show().siblings().hide();
        });
        AddToCartTrackView("categoryProList", "pro_item");

        staticView.ShowMenuSelected(GoHomepageLink);
        topBannerAdCarousel();
    }
    var BindRushToCartEvent = function () {
        $(".qianggou .product .btn").unbind("click").click(function () {
            var productId = $(this).attr("_pid");
            UpdateSmallDivCartView(productId, 1, "qianggou", false, false, false, false, false, $(".qianggou .product .pimg a").attr("href"), false);
        });
    }
    //限时抢购倒计时处理
    var cdOperation = function (years, months, days, hours, minutes, seconds) {
        var _hours = $(".countdown .hour");
        var _minutes = $(".countdown .minute");
        var _seconds = $(".countdown .second");

        var fm_h = _format(hours), fm_m = _format(minutes), fm_s = _format(seconds);
        $(_hours[0]).text(fm_h[0]);
        $(_hours[1]).text(fm_h[1]);
        $(_minutes[0]).text(fm_m[0]);
        $(_minutes[1]).text(fm_m[1]);
        $(_seconds[0]).text(fm_s[0]);
        $(_seconds[1]).text(fm_s[1]);
    }

    var setRushExpire = function () {
        $(".qianggou .product .btn").unbind("click").html("").addClass("over");
    };

    var _format = function (val) {
        var _val = parseInt(val) + "";
        if (parseInt(val) < 10)
            return ["0", _val];
        return [_val.substr(0, 1), _val.substr(1)];
    }

    Init();

}

var ShowBigImageAD = function (isManager) {
    this.t = 0;
    this.n = 0;
    this.count = 0;
    $(document).ready(function () {
        showobj.t = setInterval("showobj.showAuto();", 7000);
        showobj.count = $("#banner_list a").length;
        $("#banner_list .bitem:not(:first-child)").hide();
        $("#banner li").mouseenter(function (e) {
            clearInterval(showobj.t);
            shiftimg($(this), true);
        });
        $("#banner").hover(function () { clearInterval(showobj.t) }, function () { showobj.t = setInterval("showobj.showAuto();", 7000); });

    })

    this.showAuto = function () {
        if (!isManager) {
            showobj.n = showobj.n >= (showobj.count - 1) ? 0 : ++showobj.n;
            shiftimg($("#banner li").eq(showobj.n)); //.trigger('mouseenter');
        }
    }

    var shiftimg = function (_this, nofade) {
        if (_this.hasClass("on"))
            return;
        var i = _this.text() - 1; //获取Li元素内的值，即1，2，3，4
        showobj.n = i;
        if (i > showobj.count) return;
        if (nofade) {
            $("#banner_list .bitem").filter(":visible").hide().parent().children().eq(i).show();
        }
        else {
            $("#banner_list .bitem").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000);
        }
        //document.getElementById("banner").style.background = "";
        _this.toggleClass("on");
        _this.siblings().removeAttr("class");
    }
}

var noRefreshParas = new Array("SiteName");
function StaticView(isShow, isShowCategories) {
    //isShow = false;
    this.CartView = {};
    _this = this;
    var speUser = "aabbcc|yummy77_test|yhl_asp";
    var getHomepageLink = function () {
        if ($(".gohomepagelink").get(0)) {
            return $(".gohomepagelink").attr("href");
        }
        return GoHomepageLink;
    }

    var bindGohomepageLink = function () {
        // 静态页面不会绑定这个值
        if (typeof ($(".gohomepagelink").get(0)) == "undefined") {
            try {
                $("#header").children(".left").find("a").eq(0).attr("href", GoHomepageLink).addClass("gohomepagelink");
            }
            catch (err) { }
        }
    }
    bindGohomepageLink();

    var keyWordsDict =
        [
            { k: "上海", v: "奇异果,脐橙,石榴,牛奶,苹果,红西柚,三文鱼,鸡,牛排,牛腩,牛尾,梨,北极贝,鳕鱼,虾,鸭,巧克力,炒货" },
            { k: "江浙站", v: "奇异果,脐橙,石榴,牛奶,苹果,红西柚,三文鱼,鸡,牛排,牛腩,牛尾,梨,北极贝,鳕鱼,虾,鸭,巧克力,炒货" }
        ];

    var channelDict =
    [
        {
            k: { name: "首页", link: getHomepageLink() },
            v: ",上海,江浙站,"
        },
        {
            k: { name: "吃吃团", link: GoChiChiTuanLink },
            v: ",上海,江浙站,"
        },
        {
            k: { name: "每日菜场", link: "/activity/promotion/1-203.html" },
            v: ",上海,"
        },
        {
            k: { name: "十元尝鲜", link: "/activity/promotion/1-7.html" },
            v: ",上海,江浙站,"
        },
        {
            k: { name: "环球美食", link: "/activity/promotion/1-441.html" },
            v: ",上海,江浙站,"
        },
        {
            k: { name: "新品85折", link: "/activity/promotion/1-237.html" },
            v: ",上海,江浙站,"
        }
    ]

        var Init = function () {
            LoadLogonInfo();
            //locateRegion(); //切换站点
            IsSwitchSite();
            AllCategories();
            LoadKeyWords();
            LoadChannels();
            //SwitchCategories();
            _this.CartView = new MenuCartView();

            $("a[href*=/category/95.html]").attr("href", "/product/listchannel/95");
            $("a[href*=/category/98.html]").attr("href", "/product/listchannel/98");
            $("a[href*=/category/97.html]").attr("href", "/product/listchannel/97");
            $("a[href*=/category/96.html]").attr("href", "/product/listchannel/96");
            $("a[href*=/category/88.html]").attr("href", "/product/listchannel/88");
            $("a[href*=/category/89.html]").attr("href", "/product/listchannel/89");
            $("a[href*=/category/87.html]").attr("href", "/product/listchannel/87");
            $("a[href*=/category/93.html]").attr("href", "/product/listchannel/93");
            $("a[href*=/category/94.html]").attr("href", "/product/listchannel/94");
            //$("a[href*=/category/91.html]").attr("href", "/product/listchannel/91");
            $("#favoritecptrue").click(function () {
                var ctrl = (navigator.userAgent.toLowerCase()).indexOf('mac') != -1 ? 'Command/Cmd' : 'Ctrl';
                if (document.all) {
                    window.external.addFavorite("http://www.yummy77.com", "美味七七");
                }
                else if (window.sidebar) {
                    window.sidebar.addPanel("美味七七", "http://www.yummy77.com", "");
                }
                else {
                    alert('对不起，您的浏览器不支持自动添加\r\n请通过菜单栏或者用快捷键Ctrl+D进行添加');
                }
            });
        }

    var LoadLogonInfo = function () {
        if (!USER.isAuthenticated()) {
            var title = '';

            title = QQLogonInfo();
            if (title != '') {
                $("#lilogon").attr("_n", title).html(title + ' <a class="ml10" href="/account/signout">[ 退出 ]</a> <b class="barLine"></b>');
            }
            //            else {
            //                $(".atopBar .logon").attr("_n", USER.getCustomerName()).html('您好，' + USER.getCustomerName() + ' <a id="SQiLogoff" class="ml10" href="/account/signout">[ 退出 ]</a> <b class="barLine"></b>');
            //            }
        }
        else {
            $("#lilogon").attr("_n", USER.getCustomerName()).html('您好，' + USER.getCustomerName() + ' <a id="SQiLogoff" class="ml10" href="/account/signout">[ 退出 ]</a> <b class="barLine"></b>');
            //debugger;
        }
    }
    var QQLogonInfo = function () {
        var title = '';
        if ($.cookie("CP_QQCB") != null) {
            //alert($.cookie("CP_QQCB"));
            title = $.cookie("CP_QQCB").split('&')[0].replace("QQ_showmsg=", "");
            if (title == '') {
                title = '您好，' + $.cookie("CP_QQCB").split('&')[4].replace("QQ_NickName=", "");
            }
            title = title.replace(/</g, "&lt").replace(/>/g, "&gt").replace(/%25/g, "%").replace(/%2F/g, "/").replace(/%26/g, "&").replace(/%3D/g, "=").replace(/%2B/g, "+").replace(/%20/g, " ").replace(/%2F/g, "/").replace(/%23/g, "#").replace(/ /g, "&nbsp;");
        }
        //alert(title);
        return title;
    }

    var locateRegion = function () {
        var d = $("#i_region");
        if (d.length == 0) {
            return;
        }
        PromptChangeSite(); //返回值为true则用户确认跳转

        if ($.cookie("HasNewSiteCookie3") == null) {
            ShowSiteChoicePanel();
            return;
        } else {
            $.cookie("HasNewSiteCookie3", "1", { expires: 365, path: "/", domain: COOKIEDOMAIN });
        }
        SetHtml($.cookie("SiteCookie"));
    }

    var ShowSiteChoicePanel = function () {
        var tishiMask = $("#tishimask");
        if (tishiMask.length == 0) {
            $("body").append('<div id="tishimask" class="hide"></div>');
            //var customerName = $.cookie("CustomerName"); //特殊账号
            //var islogin = USER.isAuthenticated();
            if (1==1) {
                var splstr = '<div id="switchSitePanel" class="p_sswitch">' +
                                '<div class="title clearfix"><span class="log"></span><span class="txt">欢迎来到美味七七</span></div>' +
                                '<div class="ctc">' +
                                '<div class="ht">请根据您的收货地址选择站点</div>' +
                                    '<ul class="ssul"><li class="siteTitle">上海</li><li title="上海">上海市</li></ul>' +
                                    '<ul class="ssul"><li class="siteTitle">江苏</li><li title="苏州">苏州市</li><li title="南京">南京市</li>' +
                                    '<li title="无锡">无锡市</li><li title="常州">常州市</li><li title="南通">南通市</li><li title="扬州">扬州市</li><li title="镇江">镇江市</li></ul>' +
                                    '<ul class="ssul"><li class="siteTitle">浙江</li><li title="杭州">杭州市</li><li title="宁波">宁波市</li><li title="温州">温州市</li><li title="嘉兴">嘉兴市</li>' +
                                    '<li title="湖州">湖州市</li><li title="绍兴">绍兴市</li><li title="金华">金华市</li><li title="台州">台州市</li></ul>' +
                                '</div>' +
                            '</div>';
                $(splstr).appendTo($("body"));
            } else {
                var splstr = '<div id="switchSitePanel" class="p_sswitch">' +
                                '<div class="title clearfix"><span class="log"></span><span class="txt">欢迎来到美味七七</span></div>' +
                                '<div class="ctc">' +
                                '<div class="ht">请根据您的收货地址选择站点</div>' +
                                    '<ul class="ssul spe2"><li title="上海">上海市</li><li title="苏州">苏州市</li></ul>' +
                                    '</div></div>';
                $(splstr).appendTo($("body"));
            }


            $("#switchSitePanel .ssul li").unbind("click").bind("click", function () {
                var s_n = $(this).attr("title");
                if (s_n == "") {
                    return;
                } else {
                    $.cookie("HasNewSiteCookie3", "1", { expires: 365, path: "/", domain: COOKIEDOMAIN });
                    RefreshSiteCookie(s_n);
                }
            });
        }
        var pageSize = $.getPageSize();
        $("#tishimask").css({ width: pageSize[0], height: pageSize[1] }).show();
    }

    var IsSwitchSite = function () {
        updateSiteCookieBySuZhou();
        $.ajax({
            url: "/home/IsSwitchSite?" + (new Date()).getMilliseconds(),
            async: false,
            type: "POST",
            success: function (data) {
                if (data.IsSwitchSite) {
                    locateRegion();
                }
                else {
                    $(".cityregion_hd").text("上海");
                    $.cookie("SiteCookie", "上海", { expires: 30, path: "/", domain: COOKIEDOMAIN });
                }
            }
        });
    }
    //撤销苏州站后，如果客户本地存储的是苏州站就将站点改成江浙站点
    var updateSiteCookieBySuZhou = function () {
        if ($.cookie("SiteCookie") == "苏州") {
            $.cookie("SiteCookie", "江浙站", { expires: 30, path: "/", domain: COOKIEDOMAIN });
        }
    }
    var SetHtml = function (City) {
        var li = "";
        var SiteCookieName = $.cookie("SiteCityName");
        //var customerName = $.cookie("CustomerName"); //特殊账号
        //var islogin = USER.isAuthenticated();
        $("span.cityregion_hd").text(SiteCookieName);
        if (isShow) {
            if (1 == 1) {
                li += "<li class='liSiteCity'><span>上海</span><a href=\"###\" w='上海' >上海市</a></li>";
                li += "<li class='liSiteCity'><span>江苏</span><a href=\"###\" w='苏州' >苏州市</a><a href=\"###\" w='南京' >南京市</a><a href=\"###\" w='无锡' >无锡市</a><a href=\"###\" w='常州' >常州市</a><a href=\"###\" w='南通' >南通市</a><a href=\"###\" w='扬州' >扬州市</a><a href=\"###\" w='镇江' >镇江市</a></li>";
                li += "<li class='liSiteCity'><span>浙江</span><a href=\"###\" w='杭州' >杭州市</a><a href=\"###\" w='宁波' >宁波市</a><a href=\"###\" w='温州' >温州市</a><a href=\"###\" w='嘉兴' >嘉兴市</a><a href=\"###\" w='湖州' >湖州市</a><a href=\"###\" w='绍兴' >绍兴市</a><a href=\"###\" w='金华' >金华市</a><a href=\"###\" w='台州' >台州市</a></li>";
                li += "<li>&nbsp;</li>";
                var html = '<div class="jump_city"><ul class="city">' + li + '<br /></ul></div>';
                $("#regionpannel").append(html);
            } else {
                li += "<li class='liSiteCity'><span>上海</span><a href=\"###\" w='上海' >上海市</a></li>";
                li += "<li class='liSiteCity'><span>江苏</span><a href=\"###\" w='苏州' >苏州市</a></li>";
                li += "<li>&nbsp;</li>";
                var html = '<div class="jump_city"><ul class="city spe">' + li + '<br /></ul></div>';
                $("#regionpannel").append(html);
            }

            $("#regionpannel").mouseenter(function () {
                $(this).find("span").addClass("selected");
                $("#i_region .jump_city").show();
            }).mouseleave(function () {
                $(this).find("span").removeClass("selected");
                $("#i_region .jump_city").hide();
            });
            $(".liSiteCity a").click(function () {
                var wval = $(this).attr("w");
                var CurSite = "上海";
                if (wval != "上海") {
                    CurSite = "江浙站";
                } else {
                    CurSite = wval;
                }

                if ($.cookie("SiteCookie") == CurSite) {
                    $.cookie("SiteCityName", wval, { expires: 365, path: "/", domain: COOKIEDOMAIN });
                    if (noRefreshParas.length > 0) {
                        var href = window.location.href.toLowerCase().replace(new RegExp("(" + noRefreshParas.join("|").toLowerCase() + ")=[^&]*[&]?", "g"), "").replace(window.location.hash, "").replace("###", "");
                        window.location.href = href;
                        return;
                    } else {
                        window.location.href = window.location.href.replace(window.location.hash, "");
                        return;
                    }
                    return;
                }
                $.ajax({ type: "POST", async: false, url: "/Shopping/CheckCartProduct", data: { AreaName: CurSite },
                    success: function (json) {
                        var isRefresh = false;
                        if (json.IsSuccess) {
                            var ddEvl = window.eval("(" + json.delData + ")");
                            var upEvl = window.eval("(" + json.upData + ")");
                            if (ddEvl.length > 0) {
                                var proNames = "<ul class='ccp'>";
                                for (var i = 0; i < ddEvl.length; i++) {
                                    var pitem = ddEvl[i];
                                    var tempStr = "<li title='" + pitem.ProductName + "'>" + pitem.ProductName + "</li>";
                                    if (proNames.indexOf(tempStr) == -1) {
                                        proNames += tempStr;
                                    }
                                }
                                proNames += "</ul>";
                                jConfirm("您正在切换分站，以下商品由于暂不销售，将从采购平台里移除<br/>" + proNames, null, function (result) {
                                    if (result) {
                                        $.cookie("SiteCityName", wval, { expires: 365, path: "/", domain: COOKIEDOMAIN });
                                        SwtichSiteAction(json.delData, true);
                                        if (upEvl.length > 0) {
                                            SwtichSiteAction(json.upData, false);
                                        }
                                        RefreshSiteCookie(wval);
                                    }
                                });
                            } else {
                                jConfirm("尊敬的会员，由于不同站点的商品优惠信息不同，您在切换站点时采购平台内商品价格可能会有变化，敬请谅解！", null, function (result) {
                                    if (result) {
                                        $.cookie("SiteCityName", wval, { expires: 365, path: "/", domain: COOKIEDOMAIN });
                                        if (upEvl.length > 0) {
                                            SwtichSiteAction(json.upData, false);
                                        }
                                        RefreshSiteCookie(wval);
                                    }
                                });
                            }
                        } else {
                            $.cookie("SiteCityName", wval, { expires: 365, path: "/", domain: COOKIEDOMAIN });
                            RefreshSiteCookie(wval);
                        }
                    }
                });
            });
            $.cookie("SiteCookie", City, { expires: 30, path: "/", domain: COOKIEDOMAIN });
        }
        else {
            $("span.cityregion_hd").removeClass("specolor").addClass("disabled").css("padding-right", "5px");
            $(".cityregion_icon").hide();
        }
    }
    var SwtichSiteAction = function (dataStr, isDel) {
        $.ajax({ type: "POST", async: false, url: "/Shopping/SwitchSiteOpt", data: { dataStr: dataStr, isDel: isDel },
            success: function (json) {
                if (!json.IsSuccess) {
                    alert(json.ErrorMessage);
                    return false;
                }
            }
        });
    }
    var RefreshSiteCookie = function (wval) {
        $.cookie("SiteCityName", wval, { expires: 365, path: "/", domain: COOKIEDOMAIN });
        $.cookie("ShoppingCart", "", { expires: -1, path: "/", domain: COOKIEDOMAIN });
		var cSite = wval;
        if (wval != "上海") {
            cSite = "江浙站";
        }
        $.cookie("SiteCookie", cSite, { expires: 30, path: "/", domain: COOKIEDOMAIN });
        if (noRefreshParas.length > 0) {
            window.location.href = window.location.href.toLowerCase().replace(new RegExp("(" + noRefreshParas.join("|").toLowerCase() + ")=[^&]*[&]?", "g"), "").replace(window.location.hash, "").replace("###", "");
        } else {
            window.location.reload();
        }
    }

    var PromptChangeSite = function () {   //切换站点提示
        var queryValue = new QueryString()["sitename"];
        if (typeof (queryValue) != "undefined") {
            switch (decodeURI(queryValue)) {
                //                case "杭州": 
                //                    { 
                //                        queryValue = "杭州"; 
                //                        break; 
                //                    } 
                //                case "广东": 
                //                    { 
                //                        queryValue = "广东"; 
                //                        break; 
                //                    } 
                //                case "苏州": 
                //                    { 
                //                        queryValue = "苏州"; 
                //                        break; 
                //                    }  
                case "江浙站":
                    {
                        queryValue = "江浙站";
                        break;
                    }
                default:
                    {
                        queryValue = "上海";
                        break;
                    }
            }
            if ($.cookie("SiteCookie") != null) {
                if ($.cookie("SiteCookie") != queryValue) {
                    jConfirm("您正在前往【" + queryValue + "】站，需要切换您当前默认的站点！您确定前往吗？", null, function (result) {
                        if (result) {
                            $.cookie("SiteCookie", queryValue, { expires: 30, path: "/", domain: COOKIEDOMAIN });
                            //                            window.location.reload();
                            if (noRefreshParas.length > 0) {
                                window.location = location.href.toLowerCase().replace(new RegExp("(" + noRefreshParas.join("|").toLowerCase() + ")=[^&]*[&]?", "g"), "");
                            } else {
                                window.location.reload();
                            }
                        } else {
                            if (noRefreshParas.length > 0) {
                                window.location = location.href.toLowerCase().replace(new RegExp("(" + noRefreshParas.join("|").toLowerCase() + ")=[^&]*[&]?", "g"), "");
                            } else {
                                window.location.reload();
                            }
                        }
                    });
                }
            } else {
                $.cookie("SiteCookie", queryValue, { expires: 30, path: "/", domain: COOKIEDOMAIN });
                if (location.href.toLowerCase().indexOf("sitename") != -1) {
                    window.location = location.href.toLowerCase().replace(/sitename=[^&]*[&]?/g, "");
                } else {
                    window.location.reload();
                }
            }
        }
    }

    var AllCategories = function () {
        if (isShowCategories) {
            $("#categories").show();
        }
        else {
            $("#topchannel li.firstli").mouseenter(function () {
                $("#categories").show();
            }).mouseleave(function () {
                $("#categories").hide();
            });
        }
        $("#categories li").mouseover(function () {
            $(this).css("background-color", "#be000e");
            $(this).find("div.mnav").css("border-bottom-color", "#be000e");
            $(this).find(".mnav a").css("color", "#fffbbb");
            //            var top = (39 * ($(this).attr("_index") - 1)) + "px";
            var _mnav_c = $(this).find(".mnav_c");
            if ($.browser.msie && ($.browser.version == "6.0")) {
                if (_mnav_c.find(".DivShim").length == 0) {
                    _mnav_c.append("<div style=\"z-index:0;\"><iframe class=\"DivShim\" src=\"javascript:;\" style=\"width:290px; height:" + _mnav_c.height() + "px;\"></iframe></div>");
                }
            }
            _mnav_c.show();

        }).mouseleave(function () {
            $(this).css("background-color", "");
            $(this).find("div.mnav").css("border-bottom-color", "#e9e9e9");
            $(this).find(".mnav a").css("color", "#515151");
            $(this).find(".mnav_c").hide();
        });
    }

    var LoadKeyWords = function () {
        var currSiteName = $.cookie("SiteCookie") || "上海";
        $.each(keyWordsDict, function () {
            if (this.k == currSiteName) {
                var kwLinkStr = "";
                var keywords = this.v.split(',');
                var start = 0;
                if (keywords.length > 7) {
                    start = Math.floor(Math.random() * (keywords.length - 7 + 1));
                }
                $.each(this.v.split(','), function (i) {
                    if (i < start) {
                        return;
                    }
                    kwLinkStr += '<a href="/product/search?key=' + encodeURIComponent(this) + '">' + this + '</a>';
                });
                //$(".hotkeywords #keyspan").html(kwLinkStr);
                return;
            }
        });
    }

    var LoadChannels = function () {
        var currSiteName = $.cookie("SiteCookie") || "上海";
        var channelStr = "";
        var i = 0;

        $.ajax({ type: "POST", async: false, url: "/home/GetcurrentDateweek", data: { random: new Date().getTime() },
            success: function (data) {
                var channelDict_key, channelDict_link, currentDateweek = data.currentDate;
       
                    channelDict_key = "淘便宜";
                    channelDict_link = "/activity/promotion/1-353.html";
                

                channelDict.push({
                    k: { name: channelDict_key, link: channelDict_link },
                    v: ",上海,江浙站,"
                });
            }
        });
        channelDict.push({
            k: { name: "七七烘焙馆", link: "http://www.yummy77.com/product/listchannel/94" },
            v: ",江浙站,"
        });
        channelDict.push({
            k: { name: "七七烘焙馆", link: "http://www.yummy77.com/product/listchannel/94" },
            v: ",上海,"
        });
        $.each(channelDict, function () {
            if (this.v.indexOf("," + currSiteName + ",") > -1) {
              
                channelStr += '<li class="lichannel"><a href="' + this.k.link + '">' + this.k.name + '</a></li>';
            }
        });
        if (channelStr != "") {
            var lsp = channelStr.lastIndexOf("lichannel") + 9;
            $("#topchannel .lichannel").not(":first").not(":last").remove();
            channelStr = channelStr.substr(0, lsp) + ' nobar' + channelStr.substr(lsp);
            //$("#topchannel li.firstli").after(channelStr);
            $("#topchannel li a").each(function () {
                var ele = $(this);
                //                if (ele.attr("href").indexOf("/product/ssdlist/1-1-0") > -1) {
                //                    ele.after("<span class='ch_sp_tag new'></span>");
                //                }
                //                else if (ele.attr("href").indexOf("/activity/rushingfree") > -1) {
                //                    ele.after("<span class='ch_sp_tag new'></span>");
                //                }
                //                if (ele.attr("href").indexOf("/activity/promotion/1-192.html") > -1) {
                //                    ele.after("<span class='ch_sp_tag new'></span>");
                //                }
                /*                if (ele.attr("href").indexOf("/cookbook/index") > -1) {
                ele.after("<span class='ch_sp_tag new'></span>");
                }*/

                if (ele.attr("href").indexOf("/activity/promotion/1-203.html") > -1) {
                    ele.after("<span class='ch_sp_tag new1'></span>");
                }
                if (ele.attr("href").indexOf("/activity/promotion/1-353.html") > -1) {
                    ele.after("<span class='ch_sp_tag new'></span>");
                }
                if (ele.attr("href").indexOf("/activity/promotion/1-387.html") > -1) {
                    ele.after("<span class='ch_sp_tag new2'></span>");
                }
                if (ele.attr("href").indexOf("/activity/promotion/1-410.html") > -1) {
                    ele.after("<span class='ch_sp_tag new2'></span>");
                }
            })
            //            $("#topchannel li a[href='/product/ssdlist/1-1-0']").after("<span class='ch_sp_tag new'></span>");
            //            $("#topchannel li a[href='/activity/promotion/1-130.html']").after("<span class='ch_sp_tag new'></span>");
        }
    }

    var SwitchCategories = function () {
        if (ABTesting.Beta && ABTesting.BetaKind == "B") {
            $("#catlistul").removeClass("sfua").addClass("sfub");
            var moveDict = [
                { From: 6, To: 1 },
                { From: 7, To: 6 },
                { From: 2, To: 7 },
                { From: 4, To: 2 },
                { From: 3, To: 4 },
                { From: 5, To: 3 }
            ];
            $.each(moveDict, function () {
                $("#catlistul li[_index=" + this.To + "]").after($("#catlistul li[_index=" + this.From + "]"));
            });
        }
    }
    Init();

    this.ShowMenuSelected = function (link) {
        $("#topchannel .lichannel").removeClass("liindex");
        $("#topchannel a[href=http://" + window.location.host + link + "]").parent("li").addClass("liindex");
        $("#topchannel a[href=" + link + "]").parent("li").addClass("liindex");
    }

    this.RefreshShipSameCartPartial = function () {
        this.IsRefreshOrderInfo = null;
        $.post("/shopping/cartpartial", { IsShipSameDay: true, random: new Date().getTime() }, function (_html) {
            $("#ssdCartPanel").html(_html);
            setTimeout(function () {
                if (typeof (window.ssdDeleteItem) != "undefined" && window.ssdDeleteItem && !window.listVisible() && $("#ssdcart .prolist .miniproitem").length == 0) {
                    loadingOrderPage = false;
                    $("#btnsubmit").click();
                    $("#ShipSameDayOrderPage").hide().html("数据加载中...");
                    window.loadedCart = false;
                    window.ssdDeleteItem = false;
                }
                bindProductLinkClickEvent(".miniproitem");
            }, 10);
            if (cartPartialInit)
                cartPartialInit();

            if (typeof (orderview) != 'undefined') {
                orderview.RefreshOrderInfo();
            }
        });
    }
}

function MenuCartView() {
    this.RefreshCount = function () {
        if ($.cookie("ShoppingCart_Count") != null) {
            $("#fontqty").html($.cookie("ShoppingCart_Count"));
        }
    }

    var Init = function () {
        var mouseOverWaitTime; //停留时间的定时器
        $("#menuCart").mouseenter(function () {
            var waitTime = 0;
            if ($.cookie("ShoppingCart_Seed") == null || !$("#refreshSeed").val() || $("#refreshSeed").val() != $.cookie("ShoppingCart_Seed")) {
                waitTime = 1000;
            }
            mouseOverWaitTime = setTimeout(function () {
                $(".cartinfo").show();
                getCartView();
            }, waitTime); //停留1秒显示采购平台
        })
        .mouseleave(
        function () {
            $(".cartinfo").hide();
        });

        if ($.cookie("ShoppingCart_Count") != null) {
            $(".cartdesc .count").html($.cookie("ShoppingCart_Count"));
        }
    }

    var getCartView = function () {
        if ($.cookie("ShoppingCart_Seed") == null || !$("#refreshSeed").val() || $("#refreshSeed").val() != $.cookie("ShoppingCart_Seed")) {
            $("#cartContent").html("<img style='margin:auto;' src='/skin/df3/images/waiting.gif' />");
            $.post("/shopping/mycart?" + (new Date()).getMilliseconds(), function (data) {
                if (data.IsSuccess) {
                    if (data.Cart && data.Cart.length > 0) {
                        if (data.Cart.length > 5) {
                            $("#cartContent").css("overflow-y", "scroll");
                        }
                        var list = createList(data.Cart);
                        $("#cartContent").html(list);
                        $(".clearcart").click(clearCart);
                    }
                    else {
                        $("#cartContent").html("暂无记录");
                    }
                    $(".cartdesc .count").html(data.CartCount);
                    $(".cartdesc .orderinfo font.amount").html("￥" + data.CartAmount.toFixed(2));
                }
                else {
                    $(".cartdesc .count").html(data.CartCount);
                    $("#cartContent").html("暂无记录");
                    $(".cartdesc .orderinfo font.amount").html("￥0.00");
                }
                $("#refreshSeed").val($.cookie("ShoppingCart_Seed"));
            });
        }
    }

    var createList = function (data) {
        var list = '';
        for (var i = 0; i < data.length; i++) {
            var price = data[i].Price.toFixed(2);
            //var priceType = "现价";
            var priceType = data[i].PromoType;
            var type = data[i].Type;
            if (type == 3) {
                priceType = "换购价";
                price += "+" + data[i].SourceValue + "积分"
            }

            //            else {
            //                if (data[i].IsPromotion) {
            //                    price = data[i].PromotionPrice.toFixed(2);
            //                    priceType = "促销价";
            //                }
            //            }

            var link = "/product/" + data[i].ProductId + ".html";
            if (data[i].SourceId > 0 && data[i].Type == "2") {
                link = "/group/" + data[i].SourceId + "_" + data[i].ProductId + ".html";
            }
            var thtml = '<div class="car_p">'
                        + ' <div class="car_p_img">'
                        + '<a href="' + link + '" target="_blank"><img src="' + data[i].ImagePath + '" width="65px" height="59px"/></a>'
                        + '</div>'
                        + '<div class="car_p_det"><span class="car_p_name">'
                        + '<a href="' + link + '" title="' + data[i].ProductName + '">' + data[i].ProductName + '</a></span>'
            // + '<span class="car_p_price">' + priceType + '：￥' + price + '</span></div>'
                        + '<span class="car_p_price">' + '￥' + price + '</span></div>'
                        + '<div class="car_p_num">x' + data[i].Quantity + '</div>'
                        + '</div>'
            list += thtml;
        }


        return list;
    }

    var clearCart = function () {
        $("#cartContent").html("<img style='margin:auto;' src='/skin/df2/images/waiting.gif' />");
        $("#refreshSeed").val("");
        $.ajax({ type: "POST", async: false, url: "/shopping/RemoveAllCart",
            success: function (data) {
                if (data.IsSuccess);
                {
                    $("#fontqty").html("0");
                    $(".cartdesc .orderinfo font.amount").html("￥0")
                    $(".cartdesc .count").html("0");
                    $("#cartContent").html("暂无记录");
                    $("#refreshSeed").val($.cookie("ShoppingCart_Seed"));
                }
            }
        });
    }

    Init();
}



function endWithEllipsis(control) {
    if (control.get(0).scrollHeight > control.get(0).clientHeight) {
        var cp = control.css("position").toLowerCase();
        if (cp == "absolute" || cp == "relative") { }
        else {
            control.css("position", "relative");
        }
        control.addClass("ellipsis").attr("title", control.text()).append($("<b style='position:absolute;width:15px; top:0px;right:1px'>…</b>"));
    }
}

function addGotoTopBar(apdcallback) {
    var bodyTemp = $("#body");
    var backToTopBtn = $("#backToTopBtn");
    var onscroll = function () {
        if ($(document).scrollTop() > 2) {
            var winWidth = $(window).width();
            if (winWidth > 1190) {
                backToTopBtn.css("right", (winWidth / 2 - 655) + "px").fadeIn();
            } else {
                backToTopBtn.fadeOut();
            }
        }
        else {
            backToTopBtn.fadeOut();
        }
        if (apdcallback) {
            apdcallback();
        }
    }
    var init = function () {
        backToTopBtn.unbind("click").click(function () {
            $.goto("topBar");
        })
        $(window).resize(function () {
            onscroll();
        }).scroll(function () {
            onscroll();
        });
        onscroll();
    }
    init();
}

// md5
// 用法 hex_md5(s)
var hexcase = 0, b64pad = "", chrsz = 8; function hex_md5(a) { return binl2hex(core_md5(str2binl(a), a.length * chrsz)) } function b64_md5(a) { return binl2b64(core_md5(str2binl(a), a.length * chrsz)) } function str_md5(a) { return binl2str(core_md5(str2binl(a), a.length * chrsz)) } function hex_hmac_md5(b, a) { return binl2hex(core_hmac_md5(b, a)) } function b64_hmac_md5(b, a) { return binl2b64(core_hmac_md5(b, a)) } function str_hmac_md5(b, a) { return binl2str(core_hmac_md5(b, a)) } function md5_vm_test() { return hex_md5("abc") == "900150983cd24fb0d6963f7d28e17f72" } function core_md5(e, g) { e[g >> 5] |= 128 << g % 32; e[(g + 64 >>> 9 << 4) + 14] = g; for (var a = 1732584193, b = -271733879, c = -1732584194, d = 271733878, f = 0; f < e.length; f += 16) { var h = a, i = b, j = c, k = d; a = md5_ff(a, b, c, d, e[f + 0], 7, -680876936); d = md5_ff(d, a, b, c, e[f + 1], 12, -389564586); c = md5_ff(c, d, a, b, e[f + 2], 17, 606105819); b = md5_ff(b, c, d, a, e[f + 3], 22, -1044525330); a = md5_ff(a, b, c, d, e[f + 4], 7, -176418897); d = md5_ff(d, a, b, c, e[f + 5], 12, 1200080426); c = md5_ff(c, d, a, b, e[f + 6], 17, -1473231341); b = md5_ff(b, c, d, a, e[f + 7], 22, -45705983); a = md5_ff(a, b, c, d, e[f + 8], 7, 1770035416); d = md5_ff(d, a, b, c, e[f + 9], 12, -1958414417); c = md5_ff(c, d, a, b, e[f + 10], 17, -42063); b = md5_ff(b, c, d, a, e[f + 11], 22, -1990404162); a = md5_ff(a, b, c, d, e[f + 12], 7, 1804603682); d = md5_ff(d, a, b, c, e[f + 13], 12, -40341101); c = md5_ff(c, d, a, b, e[f + 14], 17, -1502002290); b = md5_ff(b, c, d, a, e[f + 15], 22, 1236535329); a = md5_gg(a, b, c, d, e[f + 1], 5, -165796510); d = md5_gg(d, a, b, c, e[f + 6], 9, -1069501632); c = md5_gg(c, d, a, b, e[f + 11], 14, 643717713); b = md5_gg(b, c, d, a, e[f + 0], 20, -373897302); a = md5_gg(a, b, c, d, e[f + 5], 5, -701558691); d = md5_gg(d, a, b, c, e[f + 10], 9, 38016083); c = md5_gg(c, d, a, b, e[f + 15], 14, -660478335); b = md5_gg(b, c, d, a, e[f + 4], 20, -405537848); a = md5_gg(a, b, c, d, e[f + 9], 5, 568446438); d = md5_gg(d, a, b, c, e[f + 14], 9, -1019803690); c = md5_gg(c, d, a, b, e[f + 3], 14, -187363961); b = md5_gg(b, c, d, a, e[f + 8], 20, 1163531501); a = md5_gg(a, b, c, d, e[f + 13], 5, -1444681467); d = md5_gg(d, a, b, c, e[f + 2], 9, -51403784); c = md5_gg(c, d, a, b, e[f + 7], 14, 1735328473); b = md5_gg(b, c, d, a, e[f + 12], 20, -1926607734); a = md5_hh(a, b, c, d, e[f + 5], 4, -378558); d = md5_hh(d, a, b, c, e[f + 8], 11, -2022574463); c = md5_hh(c, d, a, b, e[f + 11], 16, 1839030562); b = md5_hh(b, c, d, a, e[f + 14], 23, -35309556); a = md5_hh(a, b, c, d, e[f + 1], 4, -1530992060); d = md5_hh(d, a, b, c, e[f + 4], 11, 1272893353); c = md5_hh(c, d, a, b, e[f + 7], 16, -155497632); b = md5_hh(b, c, d, a, e[f + 10], 23, -1094730640); a = md5_hh(a, b, c, d, e[f + 13], 4, 681279174); d = md5_hh(d, a, b, c, e[f + 0], 11, -358537222); c = md5_hh(c, d, a, b, e[f + 3], 16, -722521979); b = md5_hh(b, c, d, a, e[f + 6], 23, 76029189); a = md5_hh(a, b, c, d, e[f + 9], 4, -640364487); d = md5_hh(d, a, b, c, e[f + 12], 11, -421815835); c = md5_hh(c, d, a, b, e[f + 15], 16, 530742520); b = md5_hh(b, c, d, a, e[f + 2], 23, -995338651); a = md5_ii(a, b, c, d, e[f + 0], 6, -198630844); d = md5_ii(d, a, b, c, e[f + 7], 10, 1126891415); c = md5_ii(c, d, a, b, e[f + 14], 15, -1416354905); b = md5_ii(b, c, d, a, e[f + 5], 21, -57434055); a = md5_ii(a, b, c, d, e[f + 12], 6, 1700485571); d = md5_ii(d, a, b, c, e[f + 3], 10, -1894986606); c = md5_ii(c, d, a, b, e[f + 10], 15, -1051523); b = md5_ii(b, c, d, a, e[f + 1], 21, -2054922799); a = md5_ii(a, b, c, d, e[f + 8], 6, 1873313359); d = md5_ii(d, a, b, c, e[f + 15], 10, -30611744); c = md5_ii(c, d, a, b, e[f + 6], 15, -1560198380); b = md5_ii(b, c, d, a, e[f + 13], 21, 1309151649); a = md5_ii(a, b, c, d, e[f + 4], 6, -145523070); d = md5_ii(d, a, b, c, e[f + 11], 10, -1120210379); c = md5_ii(c, d, a, b, e[f + 2], 15, 718787259); b = md5_ii(b, c, d, a, e[f + 9], 21, -343485551); a = safe_add(a, h); b = safe_add(b, i); c = safe_add(c, j); d = safe_add(d, k) } return Array(a, b, c, d) } function md5_cmn(c, a, b, f, d, e) { return safe_add(bit_rol(safe_add(safe_add(a, c), safe_add(f, e)), d), b) } function md5_ff(b, a, c, d, g, e, f) { return md5_cmn(a & c | ~a & d, b, a, g, e, f) } function md5_gg(c, a, d, b, g, e, f) { return md5_cmn(a & b | d & ~b, c, a, g, e, f) } function md5_hh(b, a, c, d, g, e, f) { return md5_cmn(a ^ c ^ d, b, a, g, e, f) } function md5_ii(b, a, c, d, g, e, f) { return md5_cmn(c ^ (a | ~d), b, a, g, e, f) } function core_hmac_md5(f, c) { var b = str2binl(f); if (b.length > 16) b = core_md5(b, f.length * chrsz); for (var d = Array(16), e = Array(16), a = 0; a < 16; a++) { d[a] = b[a] ^ 909522486; e[a] = b[a] ^ 1549556828 } var g = core_md5(d.concat(str2binl(c)), 512 + c.length * chrsz); return core_md5(e.concat(g), 512 + 128) } function safe_add(b, c) { var a = (b & 65535) + (c & 65535), d = (b >> 16) + (c >> 16) + (a >> 16); return d << 16 | a & 65535 } function bit_rol(b, a) { return b << a | b >>> 32 - a } function str2binl(c) { for (var b = Array(), d = (1 << chrsz) - 1, a = 0; a < c.length * chrsz; a += chrsz) b[a >> 5] |= (c.charCodeAt(a / chrsz) & d) << a % 32; return b } function binl2str(b) { for (var c = "", d = (1 << chrsz) - 1, a = 0; a < b.length * 32; a += chrsz) c += String.fromCharCode(b[a >> 5] >>> a % 32 & d); return c } function binl2hex(b) { for (var c = hexcase ? "0123456789ABCDEF" : "0123456789abcdef", d = "", a = 0; a < b.length * 4; a++) d += c.charAt(b[a >> 2] >> a % 4 * 8 + 4 & 15) + c.charAt(b[a >> 2] >> a % 4 * 8 & 15); return d } function binl2b64(b) { for (var f = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", d = "", a = 0; a < b.length * 4; a += 3) for (var e = (b[a >> 2] >> 8 * (a % 4) & 255) << 16 | (b[a + 1 >> 2] >> 8 * ((a + 1) % 4) & 255) << 8 | b[a + 2 >> 2] >> 8 * ((a + 2) % 4) & 255, c = 0; c < 4; c++) if (a * 8 + c * 6 > b.length * 32) d += b64pad; else d += f.charAt(e >> 6 * (3 - c) & 63); return d }


/**
函数说明：产品列表中，提供[加入采购平台]快捷入口
@params
proListId   产品列表的 element id
proListItemClassName   列表项的 element class
注意：1. 在css中指定 [proListId].divToCartTrack 的宽度与高度
2. 在页面中指定[proListItem] 的_trackproid = productId
*/
function AddToCartTrackView(proListId, proListItemClassName) {
    var toCartTrackHTML = "<div class=\"divToCartTrack\" _hasstock=\"\"  _productid=\"\"><div class=\"textbg\"></div></div>";
    $("#" + proListId).append([toCartTrackHTML, GenSmallAddToCartHTML()].join(''));

    $(["#", proListId, " ", ".", proListItemClassName].join('')).hover(function () {
        var _this = $(this);
        if (_this.attr("_trackproid").substr(0, 6) == "911010") {
            return;
        }
        var godetail = "false";
        if (_this.attr("godetail") == "true") {
            godetail = "true";
            return;
        }
        var pos = _this.offset();
        var _toCartTrackDiv = $(".divToCartTrack");
        if (_this.attr("_hasstock") == "False") {
            _toCartTrackDiv.find("div").attr("class", "textbg_nostock");
        } else {
            _toCartTrackDiv.find("div").attr("class", "textbg");
        }
        _toCartTrackDiv.find("div").attr("_hasstock", _this.attr("_hasstock"));
        var pdTop = parseInt(_this.css("padding-top").replace(/[^\d]/g, ""));
        var pdBottom = parseInt(_this.css("padding-bottom").replace(/[^\d]/g, ""));
        var topPos = pos.top + _this.height() - _toCartTrackDiv.height() + (pdTop + pdBottom) + 1;

        _toCartTrackDiv.css({
            left: pos.left,
            top: topPos
        }).show().attr({
            "_productid": _this.attr("_trackproid"),
            "_hasstock": _this.attr("_hasstock"),
            "godetail": godetail,
            "_plink": (_this.attr("_plink") ? _this.attr("_plink") : ""),
            "_type": (_this.attr("_type") ? _this.attr("_type") : ""),
            "_isshipsameday": (_this.attr("_isshipsameday") ? true : false)
        });
    }, function () {
        //$(".divToCartTrack").hide();
    });

    $(".divToCartTrack").click(function () {
       
        var _this = $(this);
        var hasstock = _this.attr("_hasstock");
        if (hasstock == "False")
            return;
        var productId = _this.attr("_productid");
        var plink = _this.attr("_plink");
        if (_this.attr("godetail") == "true") {
            window.location = productId.getProductLink();
            return false;
        }
        var type = false;
        if (_this.attr("_type")) {
            type = _this.attr("_type");
        }
        var isshipsameday = (_this.attr("_isshipsameday") == "true" || _this.attr("_isshipsameday") == true);
        UpdateSmallDivCartView(productId, 1, proListItemClassName, type, false, false, false, false, plink, isshipsameday);
        setTimeout(function () { $("#smallDivAddToCart").fadeOut(); }, 3000); //间隔三秒自动关闭成功加入采购平台提示框
    }).hover(function () {
        $(this).show();
    }, function () {
        $(this).hide();
    });
    $("#smallDivAddToCart .close").click(function () {
        $("#smallDivAddToCart").fadeOut();
    });
}

/**
函数说明：自定义加入采购平台按钮
@params
btnClassName   加入采购平台按钮的class name
proListItemClassName   列表项的 element class
注意：2. 在自定义按钮中加入属性_trackproid = productId
*/
function AddToCartTrackView2(btnClassName, proListItemClassName) {
    if ($("#smallDivAddToCart").length == 0) {
        $("body").append([GenSmallAddToCartHTML()].join(''));
    }
    $("." + btnClassName).click(function () {
        var _this = $(this);
        var productId = _this.attr("_productid");
        var plink = _this.attr("_plink");
        var isshipsameday = _this.attr("_isshipsameday") == "true";
        //UpdateSmallDivCartView(productId, 1, proListItemClassName);
        var quantity = _this.attr("_qty") || 1;
        UpdateSmallDivCartView(productId, quantity, proListItemClassName, false, false, false, false, false, plink, isshipsameday);
    });

    $("#smallDivAddToCart .close").click(function () {
        $("#smallDivAddToCart").fadeOut();
    });
}

/**
函数说明：自定义加入采购平台按钮
@params
btnSelector   加入采购平台按钮的筛选器
proListItemClassName   列表项的 element class
注意：2. 在自定义按钮中加入属性_trackproid = productId
*/
function AddToCartTrackView3(containerid, btnSelector, proListItemClassName) {
    if ($("#smallDivAddToCart").length == 0) {
        $("#" + containerid).append([GenSmallAddToCartHTML()].join(''));
    }
    $(btnSelector).click(function () {
        var _this = $(this);
        var productId = _this.attr("_productid");
        var isPackage = _this.attr("_ispackage") == "true";
        var plink = _this.attr("_plink");
        var isshipsameday = _this.attr("_isshipsameday") == "true";
        var quantity = _this.attr("_qty") || 1;
        UpdateSmallDivCartView(productId, quantity, proListItemClassName, _this.attr("_type"), _this.attr("_sourceid"), _this.attr("_sourcevalue"), _this.attr("_promotionprice"), isPackage, plink, isshipsameday);
    });

    $("#smallDivAddToCart .close").click(function () {
        $("#smallDivAddToCart").fadeOut();
    });
}
/**
函数说明：自定义加入采购平台按钮
@params
btnSelector   加入采购平台按钮的筛选器
proListItemClassName   列表项的 element class
注意：2. 在自定义按钮中加入属性_trackproid = productId
*/
function AddToCartTrackView4(containerid, btnSelector, proListItemClassName) {
    if ($("#smallDivAddToCart").length == 0) {
        $("#" + containerid).append([GenSmallAddToCartHTML()].join(''));
    }
    $(btnSelector).click(function () {
        var _this = $(this);
        var productId = _this.attr("_productid");
        var isPackage = _this.attr("_ispackage") == "true";
        var plink = _this.attr("_plink");
        var isshipsameday = _this.attr("_isshipsameday") == "true";
        var quantity = _this.attr("_qty") || 1;
        GetCouponRequest(proListItemClassName);
        UpdateSmallDivCartView(productId, quantity, proListItemClassName, _this.attr("_type"), _this.attr("_sourceid"), _this.attr("_sourcevalue"), _this.attr("_promotionprice"), isPackage, plink, isshipsameday);
    });

    $("#smallDivAddToCart .close").click(function () {
        $("#smallDivAddToCart").fadeOut();
    });
}
function GetCouponRequest(divID) {
    var couponId = $("#" + divID).html();
    if (couponId == "" || couponId == null) {
        alert("优惠券领取失败！");
    } else {
        $.ajax({
            url: "/activity/PostCouponRequest", type: "POST", data: { "activityId": 3, couponId: couponId, Random: (new Date()).getMilliseconds() }, dataType: "jsonp", jsonp: "callback", async: false,
            success: function (data) {
                if (data.IsSuccess) {
                    alert("优惠券领取成功！");
                }
                else {
                    if (data.State == 6) {//未登录
                        window.location ="/account/signin";
                        return;
                    }
                    showToast(data.Message);
                }
            }
        });
    }
 }
//function AddToCartTrackView4(btnClassName, proListItemClassName, containerid) {
//    if ($("#smallDivAddToCart").length == 0) {
//        $("#" + containerid).append([GenSmallAddToCartHTML()].join(''));
//    }
//    $("." + btnClassName).click(function () {
//        var _this = $(this);
//        var productId = _this.attr("_productid");
//        var plink = _this.attr("_plink");
//        var isshipsameday = _this.attr("_isshipsameday") == "true";
//        var quantity = _this.attr("_qty") || 1;
//        UpdateSmallDivCartView(productId, quantity, proListItemClassName, false, false, false, false, false, plink, isshipsameday);
//    });

//    $("#smallDivAddToCart .close").click(function () {
//        $("#smallDivAddToCart").fadeOut();
//    });
//}

function AddToCartTrackViewForAct(actId) {
    if ($("#activitypromotion" + actId + " #smallDivAddToCart").length == 0) {
        $("#activitypromotion" + actId).append(GenSmallAddToCartHTML());
    }
    $("#activitypromotion" + actId + " .btn.instock").unbind("click").click(function () {
        var _this = $(this);
        var productId = _this.attr("_productid");
        var ispoint = _this.attr("_ispoint") == "True";
        var plink = ""; //暂无用
        if (ispoint) {
            UpdateSmallDivCartView(productId, 1, "pitem", _this.attr("_type"), _this.attr("_sourceid"), false, false, false, plink, false);
            //window.open(productId.getPointProductLink());
        } else {
            UpdateSmallDivCartView(productId, 1, "pitem", _this.attr("_type"), _this.attr("_sourceid"), false, false, false, plink, false);
        }
    });
    $("#smallDivAddToCart .close").unbind("click").click(function () {
        $("#smallDivAddToCart").fadeOut();
    });
}
function GenSmallAddToCartHTML() {
    var _html = "<div id=\"smallDivAddToCart\">" +
                "<div><span class=\"close\"></span></div>" +
                "<div class=\"left datainfo\">" +
                "<div class=\"row1\">该商品已成功放入采购平台中</div>" +
                "<div class=\"row2\"><span class=\"left\">共 <font class=\"specolor b\" id=\"tempQuantity\"></font> 吨煤炭</span><span class=\"right\">约计 <font class=\"specolor b subtotal\"></font> 元</span>" +
                "</div>" +
                "<div class=\"row3\">" +
                    "<a class=\"btnGoOn\" href=\"javascript:void('0');\" onclick=\"$('#smallDivAddToCart .close').click();\"></a>" +
                    "<a class=\"btnToPay\" href=\"/shopping/cart\"></a>" +
                "</div>" +
                "</div>" +
                "";
    if ($.browser.msie && ($.browser.version == "6.0")) {
        _html += "<iframe class=\"DivShim\" src=\"about:blank\" scrolling=\"no\" frameborder=\"0\" style=\"width:274px; height:140px;\"></iframe>";
    }
    return (_html + "</div>");
}

function UpdateSmallDivCartView(productId, quantity, proListItemClassName, type, sourceId, sourceValue, promotionPrice, isPackage, productLink, isshipsameday, extfield, _callback) {
    if ($("#smallDivAddToCart").length == 0) {
        $("body").append(GenSmallAddToCartHTML());
        $("#smallDivAddToCart .close").unbind("click").click(function () {
            $("#smallDivAddToCart").fadeOut();
        });
    }
    if (productId != '') {
        $.post("/shopping/checkcartquantity", { "ProductId": productId, "Quantity": quantity, IsShipSameDay: isshipsameday }, function (data) {
            if (data.Success) {
                if (!productLink) {
                    productLink = "";
                }
                var log4cpHelper = new Log4CPHelper(productId, productLink);
                var postparams = { "ProductId": productId, "Quantity": quantity, "IsShipSameDay": isshipsameday, curpagelink: escape(log4cpHelper.adlink), cpil: escape(log4cpHelper.plink), "ExtField": extfield };
                if (type) {
                    postparams.Type = type;
                }
                if (isPackage) {
                    postparams.PackagePromotionId = sourceId;
                }
                else {
                    if (sourceId) {
                        postparams.SourceId = sourceId;
                    }
                    if (sourceValue) {
                        postparams.SourceValue = sourceValue;
                    }
                    if (promotionPrice) {
                        postparams.PromotionPrice = promotionPrice;
                    }
                }
                $.post("/shopping/additem", postparams, function (data) {
                    if (data.IsSuccess) {
                        var p_itemDiv = $("." + proListItemClassName + "[_trackproid=" + productId + "]");
                        var pos = p_itemDiv.offset();
                        var smd = $("#smallDivAddToCart");
                        var pdTop = parseInt(p_itemDiv.css("padding-top").replace(/[^\d]/g, ""));
                        var pdBottom = parseInt(p_itemDiv.css("padding-bottom").replace(/[^\d]/g, ""));

                        staticView.CartView.RefreshCount();

                        if (isshipsameday) {
                            staticView.RefreshShipSameCartPartial();
                            $(".btnToPay").attr("href", "javascript:void(0);").click(function () { $("#btnsubmit").click(); });
                        }
                        smd.css({
                            left: pos.left - ((smd.width() - p_itemDiv.width()) / 2) - 10,
                            top: pos.top + p_itemDiv.height() + (pdTop + pdBottom) + 1
                        }).fadeIn();
                        smd.find("#tempQuantity").text(data.QuantityCount);
                        smd.find(".subtotal").text(data.TotalAmount.toFixed(2));

                        if (_callback) {
                            _callback();
                        }
                    }
                    else {
                        //从0元抢加入采购平台的商品 
                        if (data.ErrorType == 10) {
                            if (confirm(data.ErrorMessage)) {
                                UpdateSmallDivCartView(productId, quantity, proListItemClassName, type, sourceId, sourceValue, promotionPrice, isPackage, productLink, isshipsameday, "freerush_continue", _callback);
                            }
                        } else if (data.ErrorType == 20) {
                            if (confirm(data.ErrorMessage)) {
                                window.location = "/activity/rushingfree";
                            }
                        } else {
                            alert(data.ErrorMessage);
                        }
                    }
//                    if ($(".maskdivgen").is(":visible")) {
//                        $(document).unmask();
//                    }
                })
                return true;
            }
            alert("抱歉，该商品库存不足！");
            return false;
        });
    }
}

function GenCnExpCards(tmplsel, targetsel) {
    $.ajax({
        type: "post",
        url: "/trade/getcnexpprepaid",
        async: false,
        data: { random: new Date().getTime() },
        success: function (data) {
            if (data && data != "" && data.result == 1) {
                $(tmplsel).tmpl(data).appendTo(targetsel);
            }
        }
    });
}
function ReSortDougouCards(imgType) {
    var dougouChannelId = $("#dougouChannelId").val();
    var dougouChannelImages_str = $("#dougouChannelImages").val();
    var dougouChannelImages = window.eval("(" + dougouChannelImages_str + ")");

    if (imgType == "small") {
        var dougouLi = $("input[_channel=" + dougouChannelId + "]").parents("li");
        var channelUL = dougouLi.parents("ul");
        dougouLi.addClass("singleLine").prepend('<div class="clearfix"><span class="arrowOnline"></span>上海导购各类预付卡</div>');

        if (dougouChannelImages.small.length > 0) {
            dougouLi.find(".for img").remove();
            $.each(dougouChannelImages.small, function () {
                dougouLi.find(".for").append('<img src="' + this + '" align="absmiddle">');
            })
        }

        channelUL.find("li:last").after(dougouLi);

    } else if (imgType == "big") {
        var dougouSpan = $("span[_channel=" + dougouChannelId + "]");
        var channelUL = dougouSpan.parents("ul");
        channelUL.append('<li><span class="tips">上海导购各类预付卡</span></li>');
        channelUL.append('<li class="payType singleLine"></li>');

        if (dougouChannelImages.small.length > 0) {
            dougouSpan.find("img").remove();
            $.each(dougouChannelImages.small, function () {
                dougouSpan.append('<img alt="上海导购预付卡" title="上海导购预付卡" src="' + this + '" height="36" width="136" />');
            })
        }

        channelUL.find("li.payType.singleLine").append(dougouSpan);
    }
}

function PresentHintView(proClassName, proIdAttrName) {
    $(".p-csttag.ctag-zeng").hover(function () {
        var curr_pro_item = $(this).parent();
        var curr_hint_pid = curr_pro_item.attr(proIdAttrName);
        var _count = $(this).attr("_count");
        var ppos = curr_pro_item.offset();
        $(".presenthintdiv[_phproid=" + curr_hint_pid + "]").css({
            left: ppos.left - 20,
            top: ppos.top - _count * 82 - 18
        }).show();
    }, function () {
        $(".presenthintdiv").hide();
    });
    $(".presenthintdiv").hover(function () {
        $(this).show();
    }, function () {
        $(this).hide();
    })

    //for ie6
    if ($.browser.msie && ($.browser.version == "6.0")) {
        $(".presenthintdiv").each(function (k, v) {
            var _el = $(v);
            if (_el.find(".DivShim").length == 0) {
                _el.append('<div style="z-index:0;"><iframe class="DivShim" frameborder="0" style="width:238px; height:' + _el.height() + 'px;"></iframe></div>');
            }
        });
    }
}
function RecommendProductsView() {
    var Init = function () {
        var fullPageUrl = window.location.href;
        var tmpArrs = fullPageUrl.split("?");
        var pageUrl = tmpArrs[0];
        var name = pageUrl.replace(/http:[\/]{2}[^\/]*/, "").replace(/[\w-_]+[.]html([?]\S+)?/, "");
        $(".prorecommend li a").each(function () {
            var srcUrl = $(this).attr("_href");
            if (srcUrl) {
                if (srcUrl.indexOf("?") > -1) {
                    srcUrl += "&cpic=recommend&cpin=" + escape(name);
                }
                else {
                    srcUrl += "?cpic=recommend&cpin=" + escape(name);
                }
                $(this).attr("href", srcUrl);
            }
        });
        if (name.indexOf("shopping/cart") > 0) {
            var sd = new CartManager();
            $(".btnReBuy").unbind("click").click(function () { sd.GiftAndRebuyAction($(this)); });
        }
    }

    //if (ABTesting.Beta) {
    $(".prorecommend").show();
    Init();
    //}
}

function ABTesting(isDebug, value) {
    if (isDebug) {
        ABTesting.Beta = value;
    }
    else {
        var abtest_page_cookie_tmp_key = "__vpt__";
        var betaVal_tmp = $.cookie(abtest_page_cookie_tmp_key);
        if (betaVal_tmp != null) {
            ABTesting.initBeta(betaVal_tmp);
        }
        else {
            var abtest_page_cookie_key = "__vp__";
            var betaVal = $.cookie(abtest_page_cookie_key);
            if (betaVal == null) {
                $.ajax({
                    url: "/data/getabtestingtoken",
                    async: false,
                    success: function (data) {
                        if (data) {
                            data = eval(data);
                            var now = new Date();
                            if (data.expires > now) {
                                $.cookie(abtest_page_cookie_key, data.val, { expires: data.expires, path: '/' });
                                betaVal = data.val;
                            }
                            else {
                                // 当ab测试结束, session cookie，并且值为非beta
                                $.cookie(abtest_page_cookie_tmp_key, "A");
                                betaVal = "A";
                            }
                        }
                    },
                    error: function () {
                        $.cookie(abtest_page_cookie_tmp_key, "A");
                        betaVal = "A";
                    }
                });
            }
            ABTesting.initBeta(betaVal);
        }
    }
}

ABTesting.initBeta = function (cookieVal) {
    ABTesting.Beta = (cookieVal != null && cookieVal != "A");
    ABTesting.BetaKind = cookieVal;
}

function RecommendData() {
    var self = this;
    this.show = function (_html, _source) {
        var _rct = $(".recommendContainer");
        _rct.html(_html);
        RecommendProductsView();
        switch (_source) {
            case "bfd":
                $(".prorecommend .title").append("<a class='bfd_img_tag' href='http://www.baifendian.com' target='_blank'></a>");
                _rct.addClass("bfd_recommend_box");
                break;
        }
    }

    this.showdefault = function (_recommendParams) {
        // ajax get data
        $.post("/product/recommendproducts", _recommendParams, function (_html) { self.show(_html, "local"); })
    }

    this.showbfd = function (_data) {
        // show bfd data
        if (!ABTesting.Beta) {
            var recommendParams =
            {
                RecommendPage: "ShoppingCart",
                TopN: 6,
                Title: "猜你喜欢"
            }

            recommendtool.showdefault(recommendParams);
        }
        else {
            if (_data && _data.length > 0) {
                $.post("/product/getassignproducts", { data: _data }, function (_html) { self.show(_html, "bfd"); });
            }
        }
    }
}

ABTesting();
window.recommendtool = new RecommendData();

function Log4CPHelper(pid, link) {
    var _this = this;
    this.getLocation = function () {
        return window.location.href.toLowerCase();
    };

    this.getReferrer = function () {
        return document.referrer.toLowerCase();
    };

    this.parsePID = function (l) {
        var link = (l == "" ? _this.getLocation() : l);
        var reg = new RegExp("^http:\\/\\/" + window.location.host + "\\/product\\/([0-9]+?)\\.html.*", "ig");
        var result = reg.exec(link);
        if (result) {
            return "" + result[1];
        }
        return null;
    };

    this.getBaseUrl = function () {
        var l = window.location;
        if (!l.origin) {
            l.origin = l.protocol + "//" + l.host;
        }
        return window.location.origin
    }

    this.adlink = "";
    this.plink = "";

    var Init = function () {
        try {
            var adlink, plink;
            var l = _this.getLocation();
            if (link && link != "") {
                //
                // 当传递link参数时，那么ad link就为当前页地址，plink就为传进来的link参数值。link参数意味着追踪广告链接。
                //
                if (link.indexOf("http") != 0) {
                    link = _this.getBaseUrl() + link;
                }
                adlink = l;
                plink = link;
            } else {
                var l_pid = _this.parsePID(l);
                if (l_pid) {
                    //
                    // 当前页是商品详情页
                    //
                    if (l_pid == ("" + pid)) {
                        //
                        // 增加当前页所对应的商品到采购平台中
                        //
                        adlink = _this.getReferrer();
                        plink = '@' + l;
                    } else {
                        //
                        // 增加商品页中的其他商品到采购平台中
                        //
                        adlink = l;
                        plink = "";
                    }
                } else {
                    //
                    // 非商品页，增加商品到采购平台中
                    //
                    adlink = l;
                    plink = "";
                }
            }
            _this.adlink = adlink;
            _this.plink = plink;
        }
        catch (e) {
            _this.adlink = window.location.href;
            _this.plink = productlink;
        }
    }

    Init();

}

var share = {
    qqweibo: function (content, _url) {
        content = document.title + (content || "");
        window.open('http://v.t.qq.com/share/share.php?title=' + encodeURIComponent(content) + '&url=' + encodeURIComponent(_url || location.href) + '&source=bookmark', '_blank', 'width=610,height=350');
    },
    weibo: function (content, _url, customization) {
        var s = screen, d = document, e = encodeURIComponent, sinaAppKey = 0000000;
        if (customization) {
            content = content || "";
            content = (content.length == 0) ? d.title : content;
        }
        else {
            content = d.title + (content || "");
        }

        var f = 'http://v.t.sina.com.cn/share/share.php?', u = _url || d.location.href, p = ['url=', e(u), '&title=', e(content), '&appkey=', sinaAppKey].join('');
        function a() {
            if (!window.open([f, p].join(''), 'mb', ['toolbar=0,status=0,resizable=1,width=620,height=450,left=', (s.width - 620) / 2, ',top=', (s.height - 450) / 2].join('')))
                u.href = [f, p].join('');
        };
        if (/Firefox/.test(navigator.userAgent)) {
            setTimeout(a, 0)
        }
        else { a() };
    },
    renren: function (content, _url) {
        void ((function (s, d, e) {
            if (/renren\.com/.test(d.location))
                return;
            content = d.title + (content || "");
            var f = 'http://share.renren.com/share/buttonshare.do?link=', u =
		 _url || d.location, l = content, p = [
		 e(u), '&title=', e(l)].join('');
            function a() {
                window.open([f, p].join(''), 'renren', ['toolbar=0,status=0,resizable=1,width=626,height=436,left=', (s.width - 626) / 2, ',top=', (s.height - 436) / 2].join(''))
            };
            if (/Firefox/.test(navigator.userAgent))
                setTimeout(a, 0);
            else {
                a();
            }
        })(screen, document, encodeURIComponent));
    },
    douban: function (content, _url) {
        content = document.title + (content || "");
        var d = document, e = encodeURIComponent, r = 'http://www.douban.com/recommend/?url=' + e(_url || d.location.href) + '&title=' + e(content) + '&sel=' + e(content) + '&v=1',
        x = function () {
            window.open(r, 'douban', 'toolbar=0,resizable=1,scrollbars=yes,status=1,width=450,height=355,left='
									+ (screen.width - 450) / 2 + ',top='
									+ (screen.height - 330) / 2)
        };
        if (/Firefox/.test(navigator.userAgent)) {
            setTimeout(x, 0)
        } else {
            x()
        }
    },
    kaixin001: function (content, _url) {
        var kw = window.open('', 'kaixin001', 'toolbar=no,titlebar=no,status=no,menubar=no,scrollbars=no,location:no,directories:no,width=570,height=350,left='
								+ (screen.width - 570) / 2 + ',top=' + (screen.height - 420) / 2);
        function openPostWindow(url, data, name, w) {
            var tempForm = w.document.createElement('form');
            tempForm.id = 'tempForm1';
            tempForm.method = 'post';
            tempForm.action = url;
            tempForm.target = 'kaixin001';
            var hideInput = w.document.createElement('input');
            hideInput.type = 'hidden';
            hideInput.name = 'rcontent';
            hideInput.value = data;
            tempForm.appendChild(hideInput);
            w.document.body.appendChild(tempForm);
            tempForm.submit();
            w.document.body.removeChild(tempForm);
        }
        function add2Kaixin001(w) {
            var u = _url || document.location.href;
            var t = document.title + (content || "");
            var c = t;
            var url = 'http://www.kaixin001.com/repaste/bshare.php?rtitle=' + encodeURIComponent(t) + '&rurl=' + encodeURIComponent(u) + '&from=ie';
            var data = encodeURIComponent(c);
            openPostWindow(url, c, '_blank', w)
        }
        add2Kaixin001(kw);
    }
}

function copy_clip(copy) {
    if (window.clipboardData) {
        window.clipboardData.setData("Text", copy);
    } else if (window.netscape) {
        try {
            netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
        } catch (e) {
            alert("被浏览器拒绝！\n请在浏览器地址栏输入[about:config]并回车\n然后将[signed.applets.codebase_principal_support]属性设置为[true]");
        }
        var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
        if (!clip) {
            return;
        }
        var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
        if (!trans) {
            return;
        }
        trans.addDataFlavor('text/unicode');
        var str = new Object();
        var len = new Object();
        var str = Components.classes['@mozilla.org/supports-string;1'].createInstance(Components.interfaces.nsISupportsString);
        var copytext = copy;
        str.data = copytext;
        trans.setTransferData("text/unicode", str, copytext.length * 2);
        var clipid = Components.interfaces.nsIClipboard;
        if (!clip) {
            return false;
        }
        clip.setData(trans, null, clipid.kGlobalClipboard);
    }
    return false;
}



$(function () {
    $(".s_num li").mouseover(function () {
        var index = $(".s_num li").eq($(this).index()).text();
        $(this).addClass("on").siblings().removeClass("on");
        showImg(index - 1);
    })
    function showImg(index) {
        $(".main_img a").eq(index).fadeIn(0).siblings().css("display", "none");
    }

    $(".tab_tit li").mouseover(function () {
        $(this).addClass("on").siblings().removeClass("on");
        var index = $(this).index();
        $(".tab_cont .contents ul").eq(index).css("display", "block").siblings().css("display", "none");
    })

    $(".tit").mouseover(function () {
        $(".i_trends .imgli").hide();
        $(this).addClass("on").siblings().removeClass("on");
        var index = $(this).index();
       
        $(".i_trends").children().eq(index).css("display", "block").siblings().css("display", "none");
        if (index == 1) {

            $(".i_trends .imgli").show();
        }
    })

})

//是否自动切换头部分类导航
function CategoryShow(isshow) {
    if (isshow) {
        $(".i_category").css("display", "none");
        $(".nav .firstli").hover(function () {
            $(this).find(".i_category").css("display", "block");
        }, function () {
            $(this).find(".i_category").css("display", "none");
        })
    }

    $(".i_category").find("li").hover(function () {
        $(this).addClass("current").find(".cat_menu").css("display", "block");
    }, function () {
        $(this).removeClass("current").find(".cat_menu").css("display", "none");
    })
}

//首页左侧广告切换
$(function () {
    var silders = $(".l_silder");
    $(silders).each(function (index) {
        var licount = $(this).find("ul").find("li").length;
        if (licount < 2) {
            $(this).find(".dots").remove();
        }
    })
    //首页右侧活动专区图片切换
    var _itcounts = 0;
    var _itcount = $(".Imagead li").length;

    if ($(".Imagead li").length % 2 == 1) {
        _itcounts = (_itcount + 1) / 2;
    }
    else {
        _itcounts = _itcount / 2
    }
    
    var _Id = "";
    for (var i = 0; i < $(".Imagead li").length; i++) {
        if (i / 2 == 0) {
            _Id = i.toString() / 2;

        }

        if (i >= 2 && i % 2 == 0) {
            _Id = i.toString() / 2;

        }
        $(".Imagead li:eq(" + i + ")").attr("name", _Id);
        if (i == 0 || i == 1) {
            $(".Imagead li:eq(" + i + ")").attr("class", "isshow");
        }
        else {
            $(".Imagead li:eq(" + i + ")").attr("class", "isnotshow");
        }
    }

    $("#imgead_prev").click(function () {

        var Array = $(".Imagead li");
        var tid1 = parseInt($(".Imagead li[class=isshow]").attr("name"));
        var tid2 = parseInt($(".Imagead li[class=isshow]").attr("name")) - 1;
        if (tid2 < _itcounts && tid2 >= 0) {
            //删除现有的
            $(".Imagead li[name=" + tid1 + "]").addClass("isnotshow").removeClass("isshow");
            //更改前一个
            $(".Imagead li[name=" + tid2 + "]").addClass("isshow").removeClass("isnotshow");
        }
        else {
            $(".Imagead li[name=" + tid1 + "]").addClass("isnotshow").removeClass("isshow");
            if (_itcounts - 1 >= 0) {
                var _count = _itcounts - 1;

                $(".Imagead li[name=" + _count + "]").addClass("isshow").removeClass("isnotshow");
            }
        }

    })

    $("#imgead_next").click(function () {
        var Array = $(".Imagead li");
        var tid1 = parseInt($(".Imagead li[class=isshow]").attr("name"));
        var tid2 = parseInt($(".Imagead li[class=isshow]").attr("name")) + 1;
        if (tid2 < _itcounts && tid2 >= 0) {
            //删除现有的
            $(".Imagead li[name=" + tid1 + "]").addClass("isnotshow").removeClass("isshow");
            //更改下一个
            $(".Imagead li[name=" + tid2 + "]").addClass("isshow").removeClass("isnotshow");
        }
        else {
            $(".Imagead li[name=" + tid1 + "]").addClass("isnotshow").removeClass("isshow");
          

            $(".Imagead li[name=0]").addClass("isshow").removeClass("isnotshow");
         
        }

    })


    $(".more").hover(function () {
        $(this).addClass("hover-li").find(".hover-list").css("display", "block")
    }, function () {
        $(this).removeClass("hover-li").find(".hover-list").css("display", "none")
    })

    $("#productListLevel3,#searchProList").find("ul li").mouseover(function () {
        $(this).addClass("hover").siblings().removeClass("hover");
    })

    $(".r_banner li").hover(function () {
        var img = $(this).find(".banner_img");
        var imgwidth = $(img).width();
        if ($(this).hasClass("first")) {
            $(this).addClass("on").css("background-image", "url(/skin/df3/images/rad_on_.gif)").siblings().not(".first").not(".last").css("background-image", "url(/skin/df3/images/r_ad_noon.gif)").parent().find(".last").css("background-image", "url(/skin/df3/images/r_ad_noon_1.gif)");
        } else if ($(this).hasClass("last")) {
            $(this).addClass("on").css("background-image", "url(/skin/df3/images/rad_on_1.gif)").siblings().not(".first").not(".last").css("background-image", "url(/skin/df3/images/r_ad_noon.gif)").parent().find(".first").css("background-image", "url(/skin/df3/images/r_ad_noon_.gif)");
        } else {
            $(this).addClass("on").css("background-image", "url(/skin/df3/images/rad_on.gif)").siblings().not(".first").not(".last").css("background-image", "url(/skin/df3/images/r_ad_noon.gif)").parent().find(".first").css("background-image", "url(/skin/df3/images/r_ad_noon_.gif)").parent().find(".last").css("background-image", "url(/skin/df3/images/r_ad_noon_1.gif)");
        }
        $(img).show();
        $(img).css("left", -imgwidth - 9);
        $(img).css("top", -40);
        $(this).find("b").css("display", "inline-block");
    }, function () {
        var img = $(this).find(".banner_img");
        $(img).hide();
        $(this).find("b").css("display", "none");
    })
})
/**
手动循环当前元素
firstelement:左边按钮
lastelement：右边按钮
element：需要应用动画的元素
count：子元素个数
width：移动宽度
speed：动画速度
**/
function cir_element(firstelement, lastelement, element, count, width, speed) {
    lastelement.click(function () {
        //        var _left = parseInt(element.css("left"));
        //        if (_left > -(count - 1) * width) {
        //            if (!element.is(":animated")) {
        //                element.stop(false, true).animate({ left: _left - width + "px" }, speed);
        //            }
        //        }

        var prevElement = element.find("li:first-child");

        element.append(prevElement);
    })
    firstelement.click(function () {
        //        var _left = parseInt(element.css("left"));
        //        if (_left < 0) {
        //            if (!element.is(":animated")) {
        //                element.stop(false, true).animate({ left: _left + width + "px" }, speed);
        //            }
        //        }

        var nextElement = element.find("li:eq(" + (count - 1) + ")");

        element.prepend(nextElement);
    })
}
function Printpart(idstr) {//idstr 要打印内容中的id

    var el = document.getElementById(idstr);

    var iframe = document.createElement('IFRAME');

    var doc = null;

    iframe.setAttribute('style', 'position:absolute;width:0px;height:0px;left:-500px;top:-500px;');

    document.body.appendChild(iframe);

    doc = iframe.contentWindow.document;

    doc.write('<div>' + el.innerHTML + '</div>');

    doc.close();

    iframe.contentWindow.focus();

    iframe.contentWindow.print();

    if (navigator.userAgent.indexOf("MSIE") > 0) {
        document.body.removeChild(iframe);
    }
}
///过滤特殊字符
function stripscript(s) {
    var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）&mdash;—_+%《》|{}【】‘；：”“'。，、？]")
    var rs = "";
    for (var i = 0; i < s.length; i++) {
        rs = rs + s.substr(i, 1).replace(pattern, '');
    }
    return rs;
}
function SearchVali() {
    var value = $(".research").closest(".research").find("#key").val();
    if ($.trim(value).length == 0) {
        alert("请输入您要搜索的产品关键字，谢谢！");
        return false;
    }

}
function cookbookmanager() {

    $("#ben_pinglun").unbind("click").click(function () {
        var value = $("#comment_content").val();
        value = $("<div/>").text(value).html();
        var myDate = new Date();
        var datenow = myDate.format("yyyy-MM-dd hh:mm:ss");
        var commenttype = $(".comm_list").attr("_commenttype");
        if ($.trim(value) == "") {
            jAlert("请输入内容！")
            return false;
        }
        if ($.trim(value).length < 5) {
            jAlert("内容最小长度为5个字符！");
            return false;
        }
        $.ajax({
            type: "POST",
            url: "/cookbook/Comment",
            data: { random: (new Date()).getTime(), id: _referId, commenttype: commenttype, content: value, replyid: 0 },
            success: function (data) {
                if (!data) {
                    jAlert("评论失败，请重试");
                    return;
                }
                if (data.RtnCode == 0) {
                    var html = "<div class=\"comm\"><div class=\"left\"><img src=\"/skin/df2/images/cookbook/photo.jpg\" width=\"60px\" height=\"60px\" /><div class=\"neirong\"><span class=\"u_name\">" + USER.getCustomerName() + "</span><p>" + value + "</p></div></div> <div class=\"right\"><span class=\"c_time\">" + datenow + "</span> <span class=\"tt\"><span class=\"ding\"><font class=\"btn_ding\">顶</font> <font class=\"supportcount\"></font></span><span class=\"huifu\" >回复</span></span></div></div>";
                    $(".comm_list").prepend(html);
                    //alert("评论成功！");
                    $("#comment_content").val("");
                    return;
                }
                if (data.RtnCode == 2) {//需登录
                    //alert(data.Msg);
                    $.cookie("ReturnUrl", window.location, { path: "/", domain: COOKIEDOMAIN });
                    document.location.href = data.Url;
                    return;
                }
                if (data.Msg && data.Msg.length != 0) {
                    jAlert(data.Msg)
                }
            }
        }); //ajax
    })

    //回复评论
    $(".huifu").unbind("click").click(function () {
        $(this).closest(".comm").append($("#com_rep"));
        $("#com_rep").css("display", "inline-block");
        $("#ReplyContent").focus();
        var commentid = $(this).attr("_commentid");
        $("#replysubmit").attr("replyid", commentid);
    })
    $("#replysubmit").unbind("click").click(function () {
        var _this = $(this);
        var commenttype = $(".comm_list").attr("_commenttype");
        var myDate = new Date();
        var datenow = myDate.format("yyyy-MM-dd hh:mm:ss");
        var value = $("#ReplyContent").val();
        value = $("<div/>").text(value).html();
        var id = $(this).attr("replyid");
        if ($.trim(value) == "") {
            jAlert("内容不能为空");
            return false;
        }
        if ($.trim(value).length < 5) {
            jAlert("内容最小长度为5个字符！");
            return false;
        }
        $.ajax({
            type: "POST",
            url: "/cookbook/Comment",
            data: { random: (new Date()).getTime(), id: _referId, commenttype: commenttype, content: value, replyid: id },
            success: function (data) {
                if (!data) {
                    jAlert("评论失败，请重试");
                    return;
                }
                if (data.RtnCode == 0) {
                    _this.closest(".comm").find(".rep_list").show();
                    var html = "<li><div><font><b>" + USER.getCustomerName() + " 回复：</b></font>" + datenow + "</div><div class=\"rep_content\">" + value + "</div></li>";
                    _this.closest(".comm").find(".rep_list").find("ul").prepend(html);
                    $("#ReplyContent").val("");
                    $("#com_rep").hide();
                    //alert("回复成功！");
                    return;
                }
                if (data.RtnCode == 2) {//需登录
                    //alert(data.Msg);
                    $.cookie("ReturnUrl", window.location, { path: "/", domain: COOKIEDOMAIN });
                    document.location.href = data.Url;
                    return;
                }
                if (data.Msg && data.Msg.length != 0) {
                    jAlert(data.Msg)
                }
            }
        }); //ajax
    })

    //顶
    $(".ding").unbind("click").click(function () {
        var commentid = $(this).attr("_commentid");
        var _this = $(this);
        $.ajax({
            type: "POST",
            url: "/cookbook/Support",
            data: { random: (new Date()).getTime(), id: commentid },
            success: function (data) {
                if (!data) {
                    jAlert("评论失败，请重试");
                    return;
                }
                if (data.RtnCode == 1) {
                    jAlert("已顶过！");
                }
                if (data.RtnCode == 0) {
                    var supportcount = _this.children(".supportcount").html();
                    if (!supportcount || supportcount == "null") {
                        _this.children(".supportcount").html("1");
                    } else {
                        _this.children(".supportcount").html(parseInt(supportcount, 10) + 1);
                    }
                    _this.unbind("click");
                    return;

                }
                if (data.RtnCode == 2) {//需登录
                    //alert(data.Msg);
                    $.cookie("ReturnUrl", window.location, { path: "/", domain: COOKIEDOMAIN });
                    document.location.href = data.Url;
                    return;
                }
                if (data.Msg && data.Msg.length != 0) {
                    jAlert(data.Msg)
                }
            }
        }); //ajax
    })
}
//浏览器检测
var browser = {
    versions: function () {
        var u = navigator.userAgent, app = navigator.appVersion;
        return {
            trident: u.indexOf('Trident') > -1, //IE内核 
            presto: u.indexOf('Presto') > -1, //opera内核 
            webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核 
            gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核 
            mobile: u.indexOf('Mobile') > -1, //是否为移动终端 
            ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端 
            android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器 
            iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者QQHD浏览器 
            iPad: u.indexOf('iPad') > -1, //是否iPad 
            webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部 
        };
    } ()
}
//检测是否是移动端
var isMobile = function () {
    if (browser.versions.mobile) {
        if ($.cookie("isgowap") == null) {
            if (confirm("切换到触屏版浏览更友好，是否切换？")) {
                window.location.href = "http://www.zg03.com/wap";
            } else {
                $.cookie("isgowap", "1", { expires: 1, path: "/", domain: COOKIEDOMAIN }); //随便设置一个值 标记当日已提醒过
            }
        }
    }
}
//页面加载完成各种检测开始
$(function () {
    isMobile();
});
