<?php

class ctl_accountType extends cmsPage
{

	function index_action() {
		$infoclass = $this->loadModel('infoClass');
		$info = $this->loadModel('info');
		$this->setData('insHeader','insHeader');
		$this->setData('accountType','active');
		$basic = $info->getInfoById(1);
		$jigou = $info->getInfoById(2);
		$accounttype = array();
		array_push($accounttype, unserialize($basic['content']));
		array_push($accounttype, unserialize($jigou['content']));
		$this->setData($accounttype,'accounttype');
		//seo
		$this->setData($this->site['pageTitle'], 'pageTitle');
		$this->setData($this->site['description'], 'pageDescription');
		$this->setData( 'default', 'menu' );
		$this->display('account-type');
	}

	function error404_action() {
		header( 'HTTP/1.1 404 Not Found' );
		header( 'Status: 404 Not Found' );
		$this->display( '404' );
		exit;
	}

}