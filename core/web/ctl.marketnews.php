<?php

class ctl_marketnews extends cmsPage
{

	function index_action() {
		$infoclass = $this->loadModel('infoClass');
		$info = $this->loadModel('info');
		$this->setData('insHeader','insHeader');
		$this->setData('marketnews','active');
		//$wlinks = $info->getMarketNewsListByClass(106101);
		$links = $info->getMarketNewsLinksListByClass(106102);

		$count = $info->getMarketTotalCount(106101);
		$page = ceil(intval($count)/5);
		$this->setData($count,'count');
		$this->setData($page,'page');

		//$loadUrl = str_replace("?ajax=", "/", $this->parseUrl()->set( 'page'  )->set( 'ajax', 1 ));
		$loadUrl = $this->parseUrl()->set( 'page'  )->set( 'ajax', 1 );
		$loadUrl = str_replace("?ajax=", "/", $loadUrl);
		$loadUrl = str_replace("&", "/", $loadUrl);
		$this->setData( $loadUrl , 'ajaxUrl' );
		//var_dump($loadUrl);exit;
		if($_GET['ajax'] == 1){
			$wlinks = $info->getMarketNewsListByClass(106101,5,"ordinal desc",($_GET['page']-1)*5);
			$this->setData($wlinks,'wlinks');
			$this->setData($links,'links');
			$this->display('loadMoreMarketnews');
			exit;
		}else{
			$wlinks = $info->getMarketNewsListByClass(106101,5,"ordinal desc",0);	
		}

		$this->setData($wlinks,'wlinks');
		$this->setData($links,'links');
		//seo
		$this->setData($this->site['pageTitle'], 'pageTitle');
		$this->setData($this->site['description'], 'pageDescription');
		$this->setData( 'default', 'menu' );
		$this->display('marketnews');
	}

	function error404_action() {
		header( 'HTTP/1.1 404 Not Found' );
		header( 'Status: 404 Not Found' );
		$this->display( '404' );
		exit;
	}

}