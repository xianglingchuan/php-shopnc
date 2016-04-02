(function ($) {
    $.fn.fullScreen = function (settings) {//首页焦点区满屏背景广告切换
        var defaults = {
            time: 5000,
            css: 'full-screen-slides-pagination'
        };
        var settings = $.extend(defaults, settings);
        return this.each(function () {
            var $this = $(this);
            var size = $this.find("li").size();
            var now = 0;
            var enter = 0;
            var speed = settings.time;
            $this.find("li:gt(0)").hide();
            var btn = '<ul class="' + settings.css + '">';
            for (var i = 0; i < size; i++) {
                btn += '<li>' + '<a href="javascript:void(0)">' + (i + 1) + '</a>' + '</li>';
            }
            btn += "</ul>";
            $this.after(btn);
            var $pagination = $this.next();
            $pagination.find("li").first().addClass('current');
            $pagination.find("li").click(function () {
                var change = $(this).index();
                $(this).addClass('current').siblings('li').removeClass('current');
                $this.find("li").eq(change).css('z-index', '800').show();
                $this.find("li").eq(now).css('z-index', '900').fadeOut(400,
                    function () {
                        $this.find("li").eq(change).fadeIn(500);
                    });
                now = change;
            }).mouseenter(function () {
                enter = 1;
            }).mouseleave(function () {
                enter = 0;
            });
            function slide() {
                var change = now + 1;
                if (enter == 0) {
                    if (change == size) {
                        change = 0;
                    }
                    $pagination.find("li").eq(change).trigger("click");
                }
                setTimeout(slide, speed);
            }

            setTimeout(slide, speed);
        });
    }
    $.fn.jfocus = function (settings) {//首页焦点广告图切换
        var defaults = {
            time: 5000
        };
        var settings = $.extend(defaults, settings);
        return this.each(function () {
            var $this = $(this);
            var sWidth = $this.width();
            var len = $this.find("ul li").length;
            var index = 0;
            var picTimer;
            var btn = "<div class='pagination'>";
            for (var i = 0; i < len; i++) {
                btn += "<span></span>";
            }
            btn += "</div><div class='arrow pre'></div><div class='arrow next'></div>";
            $this.append(btn);
            $this.find(".pagination span").css("opacity", 0.4).mouseenter(function () {
                index = $this.find(".pagination span").index(this);
                showPics(index);
            }).eq(0).trigger("mouseenter");
            $this.find(".arrow").css("opacity", 0.0).hover(function () {
                    $(this).stop(true, false).animate({
                            "opacity": "0.5"
                        },
                        300);
                },
                function () {
                    $(this).stop(true, false).animate({
                            "opacity": "0"
                        },
                        300);
                });
            $this.find(".pre").click(function () {
                index -= 1;
                if (index == -1) {
                    index = len - 1;
                }
                showPics(index);
            });
            $this.find(".next").click(function () {
                index += 1;
                if (index == len) {
                    index = 0;
                }
                showPics(index);
            });
            $this.find("ul").css("width", sWidth * (len));
            $this.hover(function () {
                    clearInterval(picTimer);
                },
                function () {
                    picTimer = setInterval(function () {
                            showPics(index);
                            index++;
                            if (index == len) {
                                index = 0;
                            }
                        },
                        settings.time);
                }).trigger("mouseleave");
            function showPics(index) {
                var nowLeft = -index * sWidth;
                $this.find("ul").stop(true, false).animate({
                        "left": nowLeft
                    },
                    300);
                $this.find(".pagination span").stop(true, false).animate({
                        "opacity": "0.4"
                    },
                    300).eq(index).stop(true, false).animate({
                        "opacity": "1"
                    },
                    300);
            }
        });
    }
    $.fn.jfade = function (settings) {//首页标准模块中间多图广告鼠标触及凸显
        var defaults = {
            start_opacity: "1",
            high_opacity: "1",
            low_opacity: ".1",
            timing: "500"
        };
        var settings = $.extend(defaults, settings);
        settings.element = $(this);
        //set opacity to start
        $(settings.element).css("opacity", settings.start_opacity);
        //mouse over
        $(settings.element).hover(
            //mouse in
            function () {
                $(this).stop().animate({
                        opacity: settings.high_opacity
                    },
                    settings.timing); //100% opacity for hovered object
                $(this).siblings().stop().animate({
                        opacity: settings.low_opacity
                    },
                    settings.timing); //dimmed opacity for other objects
            },
            //mouse out
            function () {
                $(this).stop().animate({
                        opacity: settings.start_opacity
                    },
                    settings.timing); //return hovered object to start opacity
                $(this).siblings().stop().animate({
                        opacity: settings.start_opacity
                    },
                    settings.timing); // return other objects to start opacity
            });
        return this;
    }
})(jQuery);
function takeCount() {
    setTimeout("takeCount()", 1000);
    $(".time-remain").each(function () {
        var obj = $(this);
        var tms = obj.attr("count_down");
        if (tms > 0) {
            tms = parseInt(tms) - 1;
            var days = Math.floor(tms / (1 * 60 * 60 * 24));
            var hours = Math.floor(tms / (1 * 60 * 60)) % 24;
            var minutes = Math.floor(tms / (1 * 60)) % 60;
            var seconds = Math.floor(tms / 1) % 60;

            if (days < 0) days = 0;
            if (hours < 0) hours = 0;
            if (minutes < 0) minutes = 0;
            if (seconds < 0) seconds = 0;
            obj.find("[time_id='d']").html(days);
            obj.find("[time_id='h']").html(hours);
            obj.find("[time_id='m']").html(minutes);
            obj.find("[time_id='s']").html(seconds);
            obj.attr("count_down", tms);
        }
    });
}
function update_screen_focus() {
    var ap_ids = '';//广告位编号
    $(".full-screen-slides li[ap_id]").each(function () {
        var ap_id = $(this).attr("ap_id");
        ap_ids += '&ap_ids[]=' + ap_id;
    });
    $(".jfocus-trigeminy a[ap_id]").each(function () {
        var ap_id = $(this).attr("ap_id");
        ap_ids += '&ap_ids[]=' + ap_id;
    });
    if (ap_ids != '') {
        $.ajax({
            type: "GET",
            url: SHOP_SITE_URL + '/index.php?act=adv&op=get_adv_list' + ap_ids,
            dataType: "jsonp",
            async: true,
            success: function (adv_list) {
                $(".full-screen-slides li[ap_id]").each(function () {
                    var obj = $(this);
                    var ap_id = obj.attr("ap_id");
                    var color = obj.attr("color");
                    if (typeof adv_list[ap_id] !== "undefined") {
                        var adv = adv_list[ap_id];
                        obj.css("background", color + ' url(' + adv['adv_img'] + ') no-repeat center top');
                        obj.find("a").attr("title", adv['adv_title']);
                        obj.find("a").attr("href", adv['adv_url']);
                    }
                });
                $(".jfocus-trigeminy a[ap_id]").each(function () {
                    var obj = $(this);
                    var ap_id = obj.attr("ap_id");
                    if (typeof adv_list[ap_id] !== "undefined") {
                        var adv = adv_list[ap_id];
                        obj.attr("title", adv['adv_title']);
                        obj.attr("href", adv['adv_url']);
                        obj.find("img").attr("alt", adv['adv_title']);
                        obj.find("img").attr("src", adv['adv_img']);
                    }
                });
            }
        });
    }
}
$(function () {
    /*setTimeout("takeCount()", 1000);*/


    $(".tab_cont tr").click(function () {
        var id = $(this).attr("data-cid");
        window.open("http://www.zg03.com/shop/item-" + id + ".html");
    });

    $(".list").kxbdMarquee({direction: "down", scrollDelay: 40});


    var isIE = /msie/i.test(navigator.userAgent);
    if (isIE) {

        $('.swiper-button-prev').hide();
        $('.swiper-button-next').hide();

        $('.adv_banner_2').slick({
            infinite: true,
            fade: true,
            speed: 1000,
            autoplay: true,
            autoplaySpeed: 3000,
            pauseOnHover: false
        });

        var option = {
            infinite: true,
            speed: 1000,
            autoplay: true,
            autoplaySpeed: 4000,
            pauseOnHover: false
        };
        $('.autobanner1 .swiper-wrapper').slick(option);
        $('.autobanner2 .swiper-wrapper').slick(option);
        $('.autobanner3 .swiper-wrapper').slick(option);
        $('.autobanner4 .swiper-wrapper').slick(option);
        $('.autobanner5 .swiper-wrapper').slick(option);

        return;
    }


    var adv_banner = new Swiper('.adv_banner', {
        pagination: '.noway',
        slidesPerView: 1,
        autoplayDisableOnInteraction: false,
        paginationClickable: true,
        speed: 2000,
        fade: {
            crossFade: true
        },
        loop: true,
        /*	lazyLoading : true,*/
        autoplay: 3000,
        effect: 'fade'
    });

    var swiper = new Swiper('.autobanner1', {
        /*pagination: '.swiper-pagination',*/
        nextButton: '.swiper-button-next1',
        prevButton: '.swiper-button-prev1',
        slidesPerView: 1,
        autoplayDisableOnInteraction: false,
        paginationClickable: true,
        spaceBetween: 30,
        loop: true,
        preventClicks: false,
        autoplay: 4000
    });

    var swiper = new Swiper('.autobanner2', {
        /*	pagination: '.swiper-pagination',*/
        nextButton: '.swiper-button-next2',
        prevButton: '.swiper-button-prev2',
        slidesPerView: 1,
        autoplayDisableOnInteraction: false,
        paginationClickable: true,
        spaceBetween: 30,
        preventClicks: false,
        loop: true,
        autoplay: 5000
    });


    var swiper = new Swiper('.autobanner3', {
        /*pagination: '.swiper-pagination',*/
        nextButton: '.swiper-button-next3',
        prevButton: '.swiper-button-prev3',
        slidesPerView: 1,
        autoplayDisableOnInteraction: false,
        paginationClickable: true,
        spaceBetween: 30,
        preventClicks: false,
        loop: true,
        autoplay: 4000
    });


    var swiper = new Swiper('.autobanner4', {
        /*	pagination: '.swiper-pagination',*/
        nextButton: '.swiper-button-next4',
        prevButton: '.swiper-button-prev4',
        slidesPerView: 1,
        autoplayDisableOnInteraction: false,
        paginationClickable: true,
        preventClicks: false,
        spaceBetween: 30,
        loop: true,
        autoplay: 5000
    });
    var swiper = new Swiper('.autobanner5', {
        /*	pagination: '.swiper-pagination',*/
        nextButton: '.swiper-button-next5',
        prevButton: '.swiper-button-prev5',
        slidesPerView: 1,
        autoplayDisableOnInteraction: false,
        paginationClickable: true,
        preventClicks: false,
        spaceBetween: 30,
        loop: true,
        autoplay: 4000

    });

    var companyBanner = new Swiper('.companybanner', {
        slidesPerView: 5,
        autoplayDisableOnInteraction: false,
        paginationClickable: true,
        loop: true,
        autoplay: 5000,
        height: 560,
        spaceBetween: 20,
        slidesPerGroup: 5,
        preventClicks: false,
        preventClicksPropagation: true,
        speed: 1500,
        direction: 'vertical',
        grabCursor: true

    });


    //首页Tab标签卡滑门切换
    $(".tabs-nav > li > h3").bind('mouseover', (function (e) {
        if (e.target == this) {
            var tabs = $(this).parent().parent().children("li");
            var panels = $(this).parent().parent().parent().children(".tabs-panel");
            var index = $.inArray(this, $(this).parent().parent().find("h3"));
            if (panels.eq(index)[0]) {
                tabs.removeClass("tabs-selected").eq(index).addClass("tabs-selected");
                panels.addClass("tabs-hide").eq(index).removeClass("tabs-hide");
            }
        }
    }));

    /*$('.jfocus-trigeminy > ul > li > a').jfade({
     start_opacity: "1",
     high_opacity: "1",
     low_opacity: ".5",
     timing: "200"
     });
     $('.fade-img > a').jfade({
     start_opacity: "1",
     high_opacity: "1",
     low_opacity: ".5",
     timing: "500"
     });
     $('.middle-goods-list > ul > li').jfade({
     start_opacity: "0.9",
     high_opacity: "1",
     low_opacity: ".25",
     timing: "500"
     });
     $('.recommend-brand > ul > li').jfade({
     start_opacity: "1",
     high_opacity: "1",
     low_opacity: ".5",
     timing: "500"
     });*/

    /*    $(".full-screen-slides").fullScreen();
     $(".jfocus-trigeminy").jfocus();
     $(".right-side-focus").jfocus();
     $(".groupbuy").jfocus({time:8000});
     $("#saleDiscount").jfocus({time:8000});*/
})