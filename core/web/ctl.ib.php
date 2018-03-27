<?php

class ctl_ib extends cmsPage
{

	function index_action() {
		$infoclass = $this->loadModel('infoClass');
		$info = $this->loadModel('info');
		$this->setData('insHeader','insHeader');
		$this->setData('ib','active');
		$filename = STATIC_DIR."ruizeanTrader/country.csv";
		$language = $this->getLangStr();	
		$countriesArr = array();
		$fh=fopen($filename,"r");
		while ($line=fgetcsv($fh,1000,",")){
    		$Name=$line[1];
    		if($language == 'en'){
    			$Name=iconv('gb2312','utf-8',$line[2]);
    		}else if($language == 'zh-cn'){
    			$Name=iconv('gb2312','utf-8',$line[1]);
    		}   
			$countriesArr[$line[2]] = $Name;
			//array_push($countriesArr, $Name);
		}
		$this->setData($countriesArr,'countriesArr');
		//seo
		$this->setData($this->site['pageTitle'], 'pageTitle');
		$this->setData($this->site['description'], 'pageDescription');
		$this->setData( 'default', 'menu' );
		$this->display('ib');
	}

	function error404_action() {
		header( 'HTTP/1.1 404 Not Found' );
		header( 'Status: 404 Not Found' );
		$this->display( '404' );
		exit;
	}

}