<?php

class ctl_eduList extends cmsPage
{

	function index_action() {
		$infoclass = $this->loadModel('infoClass');
		$info = $this->loadModel('info');
		$this->setData('insHeader','insHeader');
		$this->setData('eduList','active');
		//$edulist = $info->getListByClassSortOrdinal(107);
		$count = $info->getTotalCount(107);
		$page = ceil(intval($count)/6);
		$this->setData($count,'count');
		$this->setData($page,'page');

		//$loadUrl = str_replace("?ajax=", "/", $this->parseUrl()->set( 'page'  )->set( 'ajax', 1 ));
		$loadUrl = $this->parseUrl()->set( 'page'  )->set( 'ajax', 1 );
		$loadUrl = str_replace("?ajax=", "/", $loadUrl);
		$loadUrl = str_replace("&", "/", $loadUrl);
		$this->setData( $loadUrl , 'ajaxUrl' );
		//var_dump($loadUrl);exit;
		if($_GET['ajax'] == 1){
			$edulist = $info->getListByClass(107,6,"ordinal desc",($_GET['page']-1)*6);
			$this->setData($edulist,'edulist');
			$this->display('loadMore');
			exit;
		}else{
			$edulist = $info->getListByClass(107,6,"ordinal desc",0);	
		}
		$this->setData($info->getListByClassId(111),'notice');
		$this->setData($edulist,'edulist');
		//seo
		$this->setData($this->site['pageTitle'], 'pageTitle');
		$this->setData($this->site['description'], 'pageDescription');
		$this->setData( 'default', 'menu' );
		$this->display('eduList');
	}

	function error404_action() {
		header( 'HTTP/1.1 404 Not Found' );
		header( 'Status: 404 Not Found' );
		$this->display( '404' );
		exit;
	}

}