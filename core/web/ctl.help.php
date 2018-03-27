<?php

class ctl_help extends cmsPage
{

	function index_action() {
		$infoclass = $this->loadModel('infoClass');
		$info = $this->loadModel('info');
		$this->setData('insHeader','insHeader');
		$this->setData('help','active');
		$helpCategory = $infoclass->getChild(110);
		$help = array();
		foreach ($helpCategory as $key => $value) {
			array_push($help, $info->getListByClassSortOrdinal($value['id']));
		}
		$this->setData($helpCategory,'helpCategory');
		$this->setData($help,'help');
		//seo
		$this->setData($this->site['pageTitle'], 'pageTitle');
		$this->setData($this->site['description'], 'pageDescription');
		$this->setData( 'default', 'menu' );
		$this->display('help');
	}

	function error404_action() {
		header( 'HTTP/1.1 404 Not Found' );
		header( 'Status: 404 Not Found' );
		$this->display( '404' );
		exit;
	}

}