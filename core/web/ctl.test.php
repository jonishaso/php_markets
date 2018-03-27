<?php

class ctl_test extends cmsPage
{
	function index_action() {
		require_once 'core/v2.1/AliYun_OSS.php';

		$result = AliYun_OSS::uploadFile( 'aolaibao', 'product/1/test_by_today.txt', 'README.md' );
		print_r($result);exit;
	}

}