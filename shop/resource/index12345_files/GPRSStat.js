var flag = 1;
//卡登录
function cardLogin(){
    if(flag == 0){
        try{
        idgTracker._setTKV("用户中心_卡号登录",  $('#card_value').attr('value')+'');
        idgTracker._trackPV ("/virtual/yhzxdl/khdl");
        }catch(e){

        }
    }
}
//证件号登录
function creditLogin(){
    if(flag == 0){
        try{
	        idgTracker._setTKV("用户中心_身份证号登录",  $('#pid_value').attr('value')+'');
	        idgTracker._trackPV ("/virtual/yhzxdl/sfzhdl");
        }catch(e){

        }
    }
}

//银行服务区卡登录
function fzCardLogin(){
    if(flag == 0){
        try{
            idgTracker._setTKV("信用卡网银_卡号登录",  $('#card_value').attr('value')+'');
            idgTracker._trackPV ("/virtual/xykwydl/khdl");
        }catch(e){

        }
    }
}
//银行服务区证件号登录
function fzCreditLogin(){
    if(flag == 0){
        try{
            idgTracker._setTKV("信用卡网银_身份证号登录", $('#pid_value').attr('value')+'');
            idgTracker._trackPV ("/virtual/xykwydl/sfzhdl");
        }catch(e){

        }
    }
}


//商城现货购买
function gprsNowBuy(){
    if(flag == 0){
        try{
        idgTracker._trackEvent('商城兑换流程','煤炭页面','现货购买');
        }catch(e){

        }
    }
}
//商城加入采购平台
function gprsAddCart(){
    if(flag == 0){
        try{
        idgTracker._trackEvent('商城兑换流程','煤炭页面','加入采购平台');
        }catch(e){

        }
    }
}


//积分商城立即兑换
function gprsJfNowBuy(){
    if(flag == 0){
        try{
        idgTracker._trackEvent('积分_商城兑换流程','煤炭页面','现货购买');
        }catch(e){

        }
    }
}
//积分加入采购平台
function gprsJfAddCard(){
    if(flag == 0){
        try{
        idgTracker._trackEvent('积分_商城兑换流程','煤炭页面','加入采购平台');
        }catch(e){

        }
    }
}
//继续购买
function gprsContinueBuy(){
    if(flag == 0){
        try{
       idgTracker._trackEvent('积分_商城兑换流程','购买流程','继续购买');
        }catch(e){

        }
    }
}
//积分加入采购平台
function gprsClearCart(){
    if(flag == 0){
        try{
        idgTracker._trackEvent('积分_商城兑换流程','购买流程','清空采购平台');
        }catch(e){

        }
    }
}
//确认订单
function gprsMakeOrder(){
    if(flag == 0){
        try{
        idgTracker._trackEvent('积分_商城兑换流程','确认订单信息','确认订单下一步');
        }catch(e){

        }
    }
}


//确认订单
function gprsSubmitOrder(){
    if(flag == 0){
        try{
       idgTracker._trackEvent('积分_商城兑换流程','确认订单信息','提交订单');
        }catch(e){

        }
    }
}


//支付订单
function gprsOrder(){
    if(flag == 0){
        try{
       idgTracker._trackEvent('积分_商城兑换流程','订单支付','支付订单');
        }catch(e){

        }
    }
}


//支付成功
function gprsOrderSuccess(){
    if(flag == 0){
        try{
            idgTracker._trackEvent('积分_商城兑换流程','订单支付','支付成功');
        }catch(e){

        }
    }
}

//大转盘初始化
function turntableinit(){
    if(flag == 0){
        try{
            idgTracker._trackEvent('积分大转盘','游戏首页','游戏页面初始化');
        }catch(e){

        }
    }
}

//大转盘实物奖配送信息填写
function turntabledeliveryform(){
    if(flag == 0){
        try{
            idgTracker._trackEvent('积分大转盘','实物奖领取','填写配送信息');
        }catch(e){

        }
    }
}

//大转盘实物奖配送信息确认
function turntabledeliveryconfirm(){
    if(flag == 0){
        try{
            idgTracker._trackEvent('积分大转盘','实物奖领取','配送信息确认');
        }catch(e){

        }
    }
}

//大转盘实物奖零积分交易
function turntabledeliveryzeropoint(){
    if(flag == 0){
        try{
            idgTracker._trackEvent('积分大转盘','实物奖领取','零积分交易');
        }catch(e){

        }
    }
}

//欢乐摇钱树
function jfmoneytree(){
    if(flag == 0){
        try{
            idgTracker._trackEvent('欢乐摇钱树','游戏页面','游戏页面');
        }catch(e){

        }
    }
}

//新用户信用卡申请
function psCardReqNew(){
    if(flag == 0){
        try{
            idgTracker._trackEvent('新用户信用卡申请','信用卡申请页面','信用卡申请页面');
        }catch(e){

        }
    }
}

//老用户信用卡申请
function psCardReqOld(){
    if(flag == 0){
        try{
            idgTracker._trackEvent('老用户信用卡申请','信用卡申请页面','信用卡申请页面');
        }catch(e){

        }
    }
}

// 乐视瞬时贷流量分析
function letvEvent(pro_code,serialnum,msg){
	try{
		idgTracker._trackEvent(pro_code+'_'+serialnum+'_'+msg);
	}catch(e){

	}
}



