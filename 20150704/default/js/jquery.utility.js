$.htmlEncode = function (str) {
    var s = "";
    if (str.length == 0) return "";
    s = str.replace(/&/g, "&amp;");
    s = s.replace(/</g, "&lt;");
    s = s.replace(/>/g, "&gt;");
    s = s.replace(/ /g, "&nbsp;");
    s = s.replace(/\'/g, "&#39;");
    s = s.replace(/\"/g, "&quot;");
    s = s.replace(/\n/g, "<br />");
    return s; 
}


$.htmlDecode = function (input) {
    var converter = document.createElement("DIV");
    converter.innerHTML = input;
    var output = converter.innerText || converter.textContent; // add by ben for FF
    converter = null;
    return output;
}

$.getPageSize = function () {
    var xScroll, yScroll;
    if (window.innerHeight && window.scrollMaxY) {
        xScroll = window.innerWidth + window.scrollMaxX;
        yScroll = window.innerHeight + window.scrollMaxY;
    } else if (document.body.scrollHeight > document.body.offsetHeight) { // all but Explorer Mac  
        xScroll = document.body.scrollWidth;
        yScroll = document.body.scrollHeight;
    } else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari  
        xScroll = document.body.offsetWidth;
        yScroll = document.body.offsetHeight;
    }
    var windowWidth, windowHeight;
    if (self.innerHeight) { // all except Explorer  
        if (document.documentElement.clientWidth) {
            windowWidth = document.documentElement.clientWidth;
        } else {
            windowWidth = self.innerWidth;
        }
        windowHeight = self.innerHeight;
    } else if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode  
        windowWidth = document.documentElement.clientWidth;
        windowHeight = document.documentElement.clientHeight;
    } else if (document.body) { // other Explorers  
        windowWidth = document.body.clientWidth;
        windowHeight = document.body.clientHeight;
    }
    // for small pages with total height less then height of the viewport  
    if (yScroll < windowHeight) {
        pageHeight = windowHeight;
    } else {
        pageHeight = yScroll;
    }
    // for small pages with total width less then width of the viewport  
    if (xScroll < windowWidth) {
        pageWidth = xScroll;
    } else {
        pageWidth = windowWidth;
    }
    arrayPageSize = new Array(pageWidth, pageHeight, windowWidth, windowHeight);
    return arrayPageSize;
}

jQuery.fn.extend({
    textCursor: function () {
        // set cursor
        this.focus();
        var r = this.get(0).createTextRange();
        r.moveStart("character", this.val().length);
        r.collapse(true);
        r.select();
    }
})

//
// Used like: $("input:checkbox").check();
//            $("input:radio").uncheck();
//

jQuery.fn.extend({
    check: function () {
        return this.each(function () { this.checked = true; });
    },
    uncheck: function () {
        return this.each(function () { this.checked = false; });
    },
    ischeck: function () {
        return this.get(0).checked;
    }
});

jQuery.fn.extend({
    spinner: function (changeEvent) {
        changeEvent = changeEvent || function () { }
        this.each(function () {
            var ele = $(this);
            var upBtn = $('<input type="button" class="spinner-up"/>');
            var downBtn = $('<input type="button" class="spinner-down" />');
            //downBtn.insertBefore(ele);
            var btnPannel = $("<span id='divSpinnerBtn'></span>")
            upBtn.appendTo(btnPannel);
            downBtn.appendTo(btnPannel);
            btnPannel.insertAfter(ele);
            //downBtn.insertAfter(upBtn);
            upBtn.bind("click", function () {
                var val = parseInt(ele.val(), 10);
                ele.val(++val).focus();
                changeEvent(ele);
            })
            downBtn.bind("click", function () {
                var val = parseInt(ele.val(), 10);
                --val;
                val > 0 && ele.val(val).focus();
                changeEvent(ele);
            })
            ele.bind("keypress", function (e) {
                var keynum
                var keychar
                var numcheck
                if (window.event) // IE
                {
                    keynum = e.keyCode
                }
                else if (e.which) // Netscape/Firefox/Opera
                {
                    keynum = e.which
                }

                keychar = String.fromCharCode(keynum);
                numcheck = /\d/;
                var isValid = numcheck.test(keychar);
                if (e.keyCode == 8 || e.keyCode == 46) isValid = true;
                isValid && setTimeout(function () {
                    changeEvent(ele);
                }, 50);
                if (37 <= e.keyCode && e.keyCode <= 40) isValid = true;
                return isValid;
            }).bind("paste", function () {
                var isValid = /\d/.test(window.clipboardData.getData("Text"));
                isValid && setTimeout(function () {
                    changeEvent(ele);
                }, 50);
                return isValid
            }).bind("blur", function () {
                if ($.trim(ele.val()).length == 0 || ele.val() < 1) {
                    ele.val(1); //.textCursor();
                    setTimeout(function () {
                        changeEvent(ele);
                    }, 10);
                }
            }).bind("keydown", function (e) {
                if (window.event) // IE
                {
                    if (e.which == 8 || e.which == 46) {
                        setTimeout(function () {
                            changeEvent(ele);
                        }, 50);
                    }
                }
            })
        })
        return this;
    }
})

jQuery.fn.extend({
    spinner1: function (changeEvent) {
        changeEvent = changeEvent || function () { }
        this.each(function () {
            var ele = $(this);
            var upBtn = $(".spinner-up");
            var downBtn = $(".spinner-down");
            //downBtn.insertBefore(ele);
            //var btnPannel = $("<span id='divSpinnerBtn'></span>")
            //upBtn.appendTo(btnPannel);
            //downBtn.appendTo(btnPannel);
            //btnPannel.insertAfter(ele);
            //downBtn.insertAfter(upBtn);
            upBtn.bind("click", function () {
                var val = parseInt(ele.val(), 10);
                ele.val(++val).focus();
                changeEvent(ele);
            })
            downBtn.bind("click", function () {
                var val = parseInt(ele.val(), 10);
                --val;
                val > 0 && ele.val(val).focus();
                changeEvent(ele);
            })
            ele.bind("keypress", function (e) {
                var keynum
                var keychar
                var numcheck
                if (window.event) // IE
                {
                    keynum = e.keyCode
                }
                else if (e.which) // Netscape/Firefox/Opera
                {
                    keynum = e.which
                }

                keychar = String.fromCharCode(keynum);
                numcheck = /\d/;
                var isValid = numcheck.test(keychar);
                if (e.keyCode == 8 || e.keyCode == 46) isValid = true;
                isValid && setTimeout(function () {
                    changeEvent(ele);
                }, 50);
                if (37 <= e.keyCode && e.keyCode <= 40) isValid = true;
                return isValid;
            }).bind("paste", function () {
                var isValid = /\d/.test(window.clipboardData.getData("Text"));
                isValid && setTimeout(function () {
                    changeEvent(ele);
                }, 50);
                return isValid
            }).bind("blur", function () {
                if ($.trim(ele.val()).length == 0 || ele.val() < 1) {
                    ele.val(1); //.textCursor();
                    setTimeout(function () {
                        changeEvent(ele);
                    }, 10);
                }
            }).bind("keydown", function (e) {
                if (window.event) // IE
                {
                    if (e.which == 8 || e.which == 46) {
                        setTimeout(function () {
                            changeEvent(ele);
                        }, 50);
                    }
                }
            })
        })
        return this;
    }
})

jQuery.fn.extend({
    addHelp: function (text) {
        text = text + "\t";
        $(this).data("fontC", $(this).css("color"));
        $(this).focus(function () {
            if ($(this).val() == text) {
                $(this).val('').css("color", $(this).data("fontC"));
            }
        })
        $(this).blur(function () {
            if ($(this).val() == '')
                $(this).val(text).css("color", "gray");
        }).blur();
    }
});

(function ($) {
    $.extend($.fn, {
        mask: function (msg, maskDivClass) {
            this.unmask();
            // 参数
            var op = {
                opacity: 0.8,
                z: 90000,
                bgcolor: '#ccc'
            };
            // 创建一个 Mask 层，追加到对象中
            var maskDiv = $('<div class="maskdivgen">&nbsp;</div>');

            if (this[0] && this[0] !== window.document) {
                maskDiv.appendTo(this[0]);
            }
            else {
                maskDiv.appendTo(document.body);
            }
            maskDiv.css({
                position: 'absolute',
                'z-index': op.z,
                'background-color': op.bgcolor,
                opacity: 0
            });
            if (maskDivClass) {
                maskDiv.addClass(maskDivClass);
            }
            var msgDiv = null;
            if (msg) {
                msgDiv = $('<div style="position:absolute;border:#6593cf 1px solid; padding:2px;background:white;filter: alpha(opacity=100)"><div class="maskmsg" style="line-height:24px;border:#a3bad9 1px solid;background:white;padding:2px 10px 2px 10px">' + msg + '</div></div>');
                msgDiv.appendTo(maskDiv);
                msgDiv.css({
                    cursor: 'wait'
                });
            }
            maskDiv.fadeIn('fast', function () {
                $(this).fadeTo('slow', op.opacity);
            })
            var intervalCheck = window.setInterval(function () {
                if (maskDiv.css("display") == "none") {
                    window.clearInterval(intervalCheck);
                }
                var original = $(window);
                var position = { top: 0, left: 0 };
//                if (this[0] && this[0] !== window.document) {
//                    original = this;
//                    position = original.position();
//                }
                var maskWidth = original.outerWidth();
                if (!maskWidth) {
                    maskWidth = original.width();
                }
                var maskHeight = original.outerHeight();
                if (!maskHeight) {
                    maskHeight = original.height();
                }
                var pageSize = $.getPageSize();

                maskDiv.css({
                    top: position.top,
                    left: position.left,
                    width: pageSize[0],
                    height: pageSize[1]
                });
                if (msgDiv) {
                    //获得当前IE窗口可视区域中心点  
                    var x = $(window).width() / 2;
                    var y = $(window).height() / 2;

                    //获得div的宽度一半，高度一半  
                    var div_w = msgDiv.width() / 2;
                    var div_h = msgDiv.height() / 2;

                    //获得滚动条偏移量  
                    var stop = $(document).scrollTop();
                    var sleft = $(document).scrollLeft();

                    //获得最终div显示位置  
                    var leftv = x - div_w + sleft + "px";
                    var topv = y - div_h + stop + "px";
                    msgDiv.css({
                        top: topv,
                        left: leftv
                    });
                }
            }, 300);
            return maskDiv;
        },
        unmask: function () {
            var original = $(document.body);
            if (this[0] && this[0] !== window.document) {
                original = $(this[0]);
            }
            original.find("> div.maskdivgen").fadeOut('slow', 0, function () {
                $(this).remove();
            });
        }

    })
})(jQuery)

$.goto = function (elementId) {
    var aim = $("#"+elementId);
    var aimp=aim.position();
    var currentp = parseInt($(document).scrollTop(),10);
    if(aimp.top==currentp){
        return;
    }
    var toTop=aimp.top-currentp<0;
    var stepAll=Math.abs(aimp.top-currentp);
    var step1= parseInt(stepAll*2/3,10);
    var step2=stepAll-step1;
    var perStep=100;
    var direction=(toTop?-1:1)*perStep;
    var stepN = 0;
    var isInStep2=false;
    var movedStep=0;

    var gotoStep=function(interval){
        if(movedStep>=stepAll){
            clearInterval(interval);
            return aimp.top;
        }
        if(movedStep>=step1){
            if(!isInStep2){
                perStep=parseInt(perStep*1/3, 10);
                direction=(toTop?-1:1)*perStep;
                isInStep2=true;
            }
        }
        movedStep+=perStep;
        currentp+=direction;
        stepN++;
        return currentp;
    }

    var interval=setInterval(function(){
        $(document).scrollTop(gotoStep(interval))
    }, 1);
}
