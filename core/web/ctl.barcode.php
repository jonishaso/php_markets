<?php

/**
 * 直接生成条形码
 * .htaccess中添加 RewriteRule ^barcode/([a-zA-Z0-9]+)/?$ index.php?ctl=barcode&code=$1&%{QUERY_STRING} [NC]
 * xxx.com/barcode/123456
 */

class ctl_barcode extends cmsPage
{

	function index_action() {
		$code = trim( get2( 'code' ) );
		if ( $code ) {
			require_once 'core/v2.1/Barcode.php';

			header( 'Content-Type: image/png' );
			Barcode::Create( $code );
		}
	}

}