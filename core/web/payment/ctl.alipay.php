<?php

require_once 'core/Alipay/create_forex_trade/classs.alipay.forex_trade.php';

class ctl_alipay extends cmsPage
{

	function notify_action() {
		file_put_contents( 'test_alipay.txt', serialize( $_POST ) );
		$alipay = new Alipay_ForexTrade();
		if ( $alipay->verifyNotify() ) {
			//$orderId = $_GET['orderId'];
			$orderId = $_POST['out_trade_no'];
			$mdl_order = $this->loadModel( 'order' );
			$order = $mdl_order->getByWhere( array( 'orderId' => $orderId ) );
			if ( $order ) {
				if ( $order['payment'] == 'alipay_forex_trade' ) {
					if ( $order['isPay'] == 0 ) {
						$payTime = time();
						if ( $mdl_order->updateByWhere( array( 'status' => 1, 'isPay' => 1, 'payTime' => $payTime, 'payId' => $_POST['trade_no'], 'payResult' => serialize( $_POST ) ), array( 'orderId' => $orderId ) ) ) {
							
						}
					}
				}
			}

			echo 'success'; exit;
		}
		else {
			echo 'fail';exit;
		}
	}

	function return_action() {
		//print_r($_GET);exit;
		unset( $_GET['ctl'] );
		unset( $_GET['act'] );
		$alipay = new Alipay_ForexTrade();
		$payResult = $alipay->verifyReturn();
		$this->setData( $payResult, 'payResult' );
		//$orderId = trim( get2( 'orderId' ) );
		$orderId = trim( $_GET['out_trade_no'] );
		$mdl_order = $this->loadModel( 'order' );
		$order = $mdl_order->getByWhere( array( 'orderId' => $orderId ) );
		$this->setData( $order, 'order' );

		$this->display( 'payment/alipay/return' );
	}

}