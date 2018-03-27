<?php

class ctl_eduintro extends cmsPage
{

	function index_action() {
		$infoclass = $this->loadModel('infoClass');
		$info = $this->loadModel('info');
		$this->setData('insHeader','insHeader');
		$this->setData('eduintro','active');
		$language = $this->getLangStr();
		if($language == 'en'){
			$intro = $info->getInfoById(101);
		}else if($language == 'zh-cn'){
			$intro = $info->getInfoById(196);
		}
		$this->setData($intro,'intro');
		//seo
		$this->setData($this->site['pageTitle'], 'pageTitle');
		$this->setData($this->site['description'], 'pageDescription');
		$this->setData( 'default', 'menu' );
		$this->display('eduintro');
	}

	function error404_action() {
		header( 'HTTP/1.1 404 Not Found' );
		header( 'Status: 404 Not Found' );
		$this->display( '404' );
		exit;
	}

}