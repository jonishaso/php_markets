<?php

class ctl_updateHomeMt4 extends cmsPage
{

	function index_action() {
		$infoclass = $this->loadModel('infoClass');
		$info = $this->loadModel('info');
		$this->setData('insHeader','insHeader');

		//mt4 start
		$ptr=fsockopen('mt4demomaster.rztrader.com',443);
		// error check
		if(!$ptr){
			//echo "Connection error";
			//load data
			$myfile = fopen("data/mt4.txt", "r") or die("Unable to open file!");
			$filecontent = fread($myfile,filesize("data/mt4.txt"));
			fclose($myfile);
			if($filecontent != null){
				$old = explode("*", $filecontent);
				$oldData = array();
				$oldArr = array();
				foreach ($old as $key => $value) {
					$each = explode("|", $value);
					$oldData['symbol'] = $each[0];
					$oldData['bid'] = $each[1];
					$oldData['ask'] = $each[2];
					$oldData['bidarrow'] = $each[3];
					$oldData['askarrow'] = $each[4];
					array_push($oldArr, $oldData);
				}
			}
			$symbol = array();
			$symbols = array();
			foreach ($oldArr as $key => $value) {
				$symbol['symbol'] = $value['symbol'];
				$symbol['bid'] = $value['bid'];
				$symbol['ask'] = $value['ask'];
				//$symbol['spread'] = abs(number_format((doubleval($arr[0]) - doubleval($new.$arr[1])) * 10000,1));
				$symbol['bidarrow'] = $value['bidarrow'];
				$symbol['askarrow'] = $value['askarrow'];
				array_push($symbols, $symbol);
			}
			
			$this->setData($symbols,'symbols');
			//seo
			$this->setData($this->site['pageTitle'], 'pageTitle');
			$this->setData($this->site['description'], 'pageDescription');
			$this->setData( 'default', 'menu' );
			$this->display('updateHomeMt4');
			exit;
		}
		fputs($ptr,'W');
		fputs($ptr,"WAPQUOTES-EURUSD.mf,GBPUSD.mf,USDCHF.mf,AUDUSD.mf,USDJPY.mf,XAUUSD.mf,XAGUSD.mf,XAGUSD.mf\n");
		$buf ="";
		$symbol = array();
		$symbols = array();
		while(!feof($ptr))
		{
			// read line of symbols
			$line=fgets($ptr,128);
			// the symbol of the end of result transfer
			if($line=="end\r\n") break;
			// process
			//echo $line;
			$buf .= $line;

		}
		fputs($ptr,"WWAPQUOTES-EURUSD,GBPUSD,USDCHF,AUDUSD,USDJPY,XAUUSD,XAGUSD,XAGUSD\nQUOT\n");
		//mt4 end

		//load data
		$myfile = fopen("data/mt4.txt", "r") or die("Unable to open file!");
		$filecontent = fread($myfile,filesize("data/mt4.txt"));
		fclose($myfile);
		if($filecontent != null){
			$old = explode("*", $filecontent);
			$oldData = array();
			$oldArr = array();
			foreach ($old as $key => $value) {
				$each = explode("|", $value);
				$oldData['symbol'] = $each[0];
				$oldData['bid'] = $each[1];
				$oldData['ask'] = $each[2];
				array_push($oldArr, $oldData);
			}
		}else{
			//no load data
			//don't need compare
			$flag = 1;
		}
		
		$myfile = fopen("data/mt4.txt", "w") or die("Unable to open file!");
		$parts = preg_split('/\s+/', $buf);
		for ($i=0,$j = 0; $i < 14; $i++,$j++) {
			$key = $parts[$i]; 
			$combine = str_replace("<br/>","",$parts[++$i]);
			$arr = explode('/', $combine);
			$new = substr($arr[0],0,-strlen($arr[1]));
			$symbol['symbol'] = explode('.',$key)[0];
			$symbol['bid'] = $arr[0];
			$symbol['ask'] = $new.$arr[1];
			$symbol['spread'] = abs(number_format((doubleval($arr[0]) - doubleval($new.$arr[1])) * 10000,1));
			
			if($flag == 1){
				$symbol['bidarrow'] = 1;
				$symbol['askarrow'] = 1;
			}else{
				//compare				
				if(doubleval($arr[0]) <= doubleval($oldArr[$j]['bid'])){
					$symbol['bidarrow'] = 0;
				}else{
					$symbol['bidarrow'] = 1;
				}

				if(doubleval($new.$arr[1]) <= doubleval($oldArr[$j]['ask'])){
					$symbol['askarrow'] = 0;
				}else{
					$symbol['askarrow'] = 1;
				}
			}
			//update data
			fwrite($myfile, $key."|".$symbol['bid']."|".$symbol['ask']."|".$symbol['bidarrow']."|".$symbol['askarrow']."*");
			array_push($symbols, $symbol);
		}

		$stat = fstat($myfile);
		ftruncate($myfile, $stat['size']-1);
		fclose($myfile);
		$this->setData($symbols,'symbols');
		//seo
		$this->setData($this->site['pageTitle'], 'pageTitle');
		$this->setData($this->site['description'], 'pageDescription');
		$this->setData( 'default', 'menu' );
		$this->display('updateHomeMt4');
		
	}

	function error404_action() {
		header( 'HTTP/1.1 404 Not Found' );
		header( 'Status: 404 Not Found' );
		$this->display( '404' );
		exit;
	}

}