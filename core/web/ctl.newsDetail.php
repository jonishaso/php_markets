<?php

class ctl_newsDetail extends cmsPage
{

	function index_action() {
		$infoclass = $this->loadModel('infoClass');
		$info = $this->loadModel('info');
		$this->setData('insHeader','insHeader');
		$classId = $_GET['classId'];
		$id = $_GET['id'];
		$detail = $info->getInfoById($id);
		if($detail['classId'] != 107){
			if($detail['isTop']){
				//company news
				$this->setData(1,'cme');
			}elseif($detail['isRecommended']){
				//market news
				$this->setData(2,'cme');
			}
		}else{
			//edu news
			$this->setData(3,'cme');
		}
		
		$this->setData($classId,'classId');
		$this->setData($detail,'detail');
		//var_dump($detail);exit;
		//seo
		$this->setData($this->site['pageTitle'], 'pageTitle');
		$this->setData($this->site['description'], 'pageDescription');
		$this->setData( 'default', 'menu' );
		$this->display('newsDetail');
	}

	function error404_action() {
		header( 'HTTP/1.1 404 Not Found' );
		header( 'Status: 404 Not Found' );
		$this->display( '404' );
		exit;
	}

}