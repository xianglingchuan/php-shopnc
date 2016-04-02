<?php
// ini_set('date.timezone','Asia/Shanghai');
// error_reporting(E_ERROR);

defined('InShopNC') or exit('Access Invalid!');

require_once BASE_PATH.'/api/payment/wxpay/lib/WxPay.Api.php';
require_once BASE_PATH.'/api/payment/wxpay/lib/WxPay.Notify.php';
require_once BASE_PATH.'/api/payment/wxpay/log.php';

//初始化日志
$logHandler= new CLogFileHandler(BASE_DATA_PATH.'/log/wxpay/'.date('Y-m-d').'.log');
$log = Log::Init($logHandler, 15);

class PayNotifyCallBack extends WxPayNotify
{
	//查询订单
	public function Queryorder($transaction_id)
	{
		$input = new WxPayOrderQuery();
		$input->SetTransaction_id($transaction_id);
		$result = WxPayApi::orderQuery($input);
		Log::DEBUG("query:" . json_encode($result));
		if(array_key_exists("return_code", $result)
			&& array_key_exists("result_code", $result)
			&& $result["return_code"] == "SUCCESS"
			&& $result["result_code"] == "SUCCESS")
		{
			return true;
		}
		return false;
	}
	
	//重写回调处理函数
	public function NotifyProcess($data, &$msg)
	{
		Log::DEBUG("call back:" . json_encode($data));
		$notfiyOutput = array();
		
		if(!array_key_exists("transaction_id", $data)){
			$msg = "输入参数不正确";
			return false;
		}
		//查询订单，判断订单真实性
		if(!$this->Queryorder($data["transaction_id"])){
			$msg = "订单查询失败";
			return false;
		}

		if (in_array($data['attach'],array('v','r'))) {
		    $order_type = $data['attach'];
		} else {
		    $order_pay_info = Model('order')->getOrderPayInfo(array('pay_sn'=> $data['out_trade_no']));
		    if(empty($order_pay_info)){
		        $order_type = 'v';
		    } else {
		        $order_type = 'r';
		    }
		}

		$logic_payment = Logic('payment');

		if ($order_type == 'r') {
		    $result = $logic_payment->getRealOrderInfo($data['out_trade_no']);
		    if(!$result['state']) {
		        return false;
		    }
		    if ($result['data']['api_pay_state']) {
		        return true;
		    }
		    $order_list = $result['data']['order_list'];
		    $result = $logic_payment->updateRealOrder($data['out_trade_no'], 'wxpay', $order_list, $data["transaction_id"]);
		    if (!$result['state']) {
		        return false;
		    }
		} else {
		    $result = $logic_payment->getVrOrderInfo($data['out_trade_no']);
		    if (!in_array($result['data']['order_state'],array(ORDER_STATE_NEW,ORDER_STATE_CANCEL))) {
		        return true;
		    }
		    $order_info = $result['data'];
		    $result = $logic_payment->updateVrOrder($data['out_trade_no'], 'wxpay', $order_info, $data["transaction_id"]);
		    if (!$result['state']) {
		        return false;
		    }
		}
		return true;
	}
}

Log::DEBUG("begin notify");
$notify = new PayNotifyCallBack();
$notify->Handle(false);
