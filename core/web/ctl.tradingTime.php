<?php

class ctl_tradingTime extends cmsPage
{

	function index_action() {
		$infoclass = $this->loadModel('infoClass');
		$info = $this->loadModel('info');
		$this->setData('insHeader','insHeader');
		$this->setData('tradingTime','active');
		//
		date_default_timezone_set('Australia/Melbourne');
		$language = $this->getLangStr();
		if($language == 'en'){
			if(date("I") == 1){
				$beijing = 'Beijing time from 6 am to 2 pm';
			}else{
				$beijing = 'Beijing time from 7 am to 3 pm';
			}
		}else if($language == 'zh-cn'){
			if(date("I") == 1){
				$beijing = '北京时间上午6点至下午2点';
			}else{
				$beijing = '北京时间上午7点至下午3点';
			}
		}
		if($language == 'en'){
			$pdf = $info->getInfoById(7);
		}else if($language == 'zh-cn'){
			$pdf = $info->getInfoById(111);
		}
		$this->setData($beijing,'beijing');
		$this->setData($pdf,'pdf');
		
		//seo
		$this->setData($this->site['pageTitle'], 'pageTitle');
		$this->setData($this->site['description'], 'pageDescription');
		$this->setData( 'default', 'menu' );
		$this->display('tradingTime');
	}

	function error404_action() {
		header( 'HTTP/1.1 404 Not Found' );
		header( 'Status: 404 Not Found' );
		$this->display( '404' );
		exit;
	}

}