<?php

class ctl_paypal extends cmsPage
{

	function notify_action() {
		$req = 'cmd=_notify-validate';
		foreach ( $_POST as $key => $val ) {
			$val = urlencode( stripslashes( $val ) );
			$req .= "&$key=$val";
		}

		$service_url = $this->payments['paypal']['config']['sandmode'] ? 'https://www.sandbox.paypal.com/cgi-bin/webscr' : 'https://www.paypal.com/cgi-bin/webscr';

		$service_result = file_get_contents( $service_url, false, stream_context_create( array(
			'http' => array(
				'method' => 'POST',
				'content' => $req
			)
		) ) );
//$this->file->createfile(DOC_DIR.'log.txt', $_GET['orderId'], true);
//$this->file->createfile(DOC_DIR.'log.txt', $service_result, true);
		if ( strcmp( $service_result, 'VERIFIED' ) == 0 ) {
			//sucess
			//$this->file->createfile(DOC_DIR.'log.txt', 'VERIFIED', true);
			$orderId = $_GET['orderId'];
			$mdl_order = $this->loadModel( 'order' );
			$order = $mdl_order->getByWhere( array( 'orderId' => $orderId ) );
			if ( $order ) {
				if ( ( $_POST['payment_status'] != 'Completed' && $_POST['payment_status'] != 'Pending' ) || ( $_POST['receiver_email'] != $this->payments['paypal']['config']['business'] ) || ( (float)$_POST['mc_gross'] != (float)$order['total'] ) || ( $_POST['mc_currency'] != 'CAD' ) ) {
					//mc_gross 交易的支付金额
					//txn_id 交易ID
					//txn_type 交易类型  如果等于recurring_payment经常性支付
					echo 'error';
					exit;
				}
				if ( $order['isPay'] == 0 ) {
					$payTime = time();
					if ( $mdl_order->updateByWhere( array( 'status' => 1, 'isPay' => 1, 'payTime' => $payTime, 'payId' => $_POST['txn_id'], 'payResult' => serialize( $_POST ) ), array( 'orderId' => $orderId ) ) ) {
						
					}
				}
			}
		}
		else if ( strcmp( $service_result, 'INVALID' ) == 0 ) {
			//$this->file->createfile(DOC_DIR.'log.txt', 'INVALID', true);
		}
	}

	function return_action() {
		$orderId = trim( get2( 'orderId' ) );
		$mdl_order = $this->loadModel( 'order' );
		$order = $mdl_order->getByWhere( array( 'orderId' => $orderId ) );
		$this->setData( $order, 'order' );
		$this->display( 'payment/paypal/return' );
	}

}