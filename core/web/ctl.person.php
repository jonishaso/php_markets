<?php

class ctl_person extends cmsPage
{
// http://10.0.0.44:8000/index.php?lang=en&ctl=person&time1=2018-02-15%2015:36:12&time2=2018-02-15%2015:36:12
// http://10.0.0.44:8000/index.php?lang=en&ctl=person&name=kook
	function index_action() {
        $sale = $this->loadModel('sale');
        
        $name = $_GET['person'];
        $time_1 = $_GET['time1'];
        $time_2 = $_GET['time2'];
        $select = 'select * from #@_sale where `time` between ';
        $insert = "insert into #@_sale ('name') value ('var');";
        if(empty($name) && !empty($time_1) && !empty($time_2)){
            echo 'time';
            
        }elseif(empty($time_1) && empty($time_2) && !empty($name)){
            $real_insert = str_replace('var',$name,$insert);
            $sqlstr = $sale->db->execute($real_insert); 
            // header('locatcion:/'.$_GET['lang']);
            // echo $real_insert;

        }else{
            header( 'HTTP/1.1 404 Not Found' );
            header( 'Status: 404 Not Found' );
            $this->display( '404' );
        }




        // $sqlstr = $sale->db->getSelectSql(null, '#@_sale',array('name'=>'Jord'));
        // $sqlstr = $sale->db->query('select * from #@_sale where `time` between "2018-02-15 15:35:00" and "2018-02-15 15:37:18"');        
      
        // echo  mysqli_real_escape_string( $sale->db->link,$time_1);
        // echo empty($time_2);
        // print_r($sale->db->toArray($sqlstr));
        // header('locatcion:/'.$_GET['lang']);
	}

	function error404_action() {
		header( 'HTTP/1.1 404 Not Found' );
		header( 'Status: 404 Not Found' );
        // $this->display( '404' );
        echo '404';            
        
		exit;
	}

}