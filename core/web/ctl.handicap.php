<?php

class ctl_handicap extends cmsPage
{

	function index_action() {
		$infoclass = $this->loadModel('infoClass');
		$info = $this->loadModel('info');
		$this->setData('insHeader','insHeader');
		$this->setData('handicap','active');
		//seo
		$this->setData($this->site['pageTitle'], 'pageTitle');
		$this->setData($this->site['description'], 'pageDescription');
		$this->setData( 'default', 'menu' );
		$this->display('handicap');
	}

	function error404_action() {
		header( 'HTTP/1.1 404 Not Found' );
		header( 'Status: 404 Not Found' );
		$this->display( '404' );
		exit;
	}

}