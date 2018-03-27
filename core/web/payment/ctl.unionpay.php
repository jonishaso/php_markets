<?php

require_once 'core/UnionPay/GateWay/class.unionpay.gateway.php';

class ctl_unionpay extends cmsPage
{

	function notify_action() {
		file_put_contents( 'union.txt', $orderId );
		$unionpay = new Unionpay_Gateway();
		if ( $unionpay->verifyNotify() ) {
			$orderId = $_POST['orderId'];
			$respCode = $_POST ['respCode'];
			if ( $respCode == '00' || $respCode == 'A6' ) {
				$method = 'p';
				if ( substr( $orderId, 0, 1 ) == 'e' ) {
					$method = 'e';
					$orderId = substr( $orderId, 1 );
				}

				$mdl_orders = $this->loadModel( 'orders' );
				$order = $mdl_orders->getByWhere( array( 'orderId' => $orderId ) );
				$tradeNo = '201604202100100'.$this->createRnd(13);
				if ( $order ) {
					//if ( $order['payment'] == 'alipay_forex_trade' ) {
						if ( $method == 'p' ) {
							if ( $order['payState'] == 2 ) {
								$payTime = time();
								if ( $mdl_orders->updateByWhere( array( 'payState' => 1, 'payType' => 2, 'payTime' => $payTime, 'tradeNo' => $tradeNo, 'payId' => $_POST['trade_no'], 'payResult' => serialize( $_POST ) ), array( 'orderId' => $orderId ) ) ) {
									//给会员添加积分
									//$mdl_user = $this->loadModel( 'user' );
									//不在这里加积分，改到后台交易完成才加积分，要不然会员申请退款后又要减积分
								}
							}
						}
						else if ( $method == 'e' ) {
							//此流程进入不了了，但还是注释掉安全些 at 2016-4-28 by today
							/*
							if ( $order['eggIsPay'] == 0 ) {
								$eggPayTime = time();
								if ( $mdl_orders->updateByWhere( array( 'eggIsPay' => 1, 'eggPayTime' => $payTime, 'eggPayId' => $_POST['trade_no'], 'eggPayResult' => serialize( $_POST ) ), array( 'orderId' => $orderId ) ) ) {
									//把袋鼠蛋那个订单也设置为已支付
									$mdl_orders->updateByWhere( array( 'payState' => 1, 'payTime' => $payTime, 'tradeNo' => $tradeNo, 'payId' => $_POST['trade_no'], 'payResult' => serialize( $_POST ) ), array( 'orderId' => 'e'.$orderId ) );
								}
							}*/
						}
					//}
				}
			}

			echo 'success'; exit;
		}
		else {
			echo 'fail';exit;
		}
	}

	function return_action() {
		file_put_contents( 'union2.txt', $orderId );
		unset( $_GET['ctl'] );
		unset( $_GET['act'] );
		$unionpay = new Unionpay_Gateway();
		$payResult = $unionpay->verifyReturn();
		$this->setData( $payResult, 'payResult' );
		$orderId = trim( $_GET['orderId'] );
		$method = 'p';
		if ( substr( $orderId, 0, 1 ) == 'e' ) {
			$method = 'e';
			$orderId = substr( $orderId, 1 );
		}
		$mdl_orders = $this->loadModel( 'orders' );
		$order = $mdl_orders->getByWhere( array( 'orderId' => $orderId ) );
		$this->setData( $order, 'order' );
		$this->setData( $method, 'method' );

		$this->display( 'payment/unionpay/return' );
	}

}