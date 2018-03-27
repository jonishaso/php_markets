<?php

/*
 @ctl_name = ibContact管理@
*/

class ctl_ibContact extends adminPage
{

	public function index_action () #act_name = ibContact列表#
	{
		date_default_timezone_set('Australia/Sydney');
		$bllLink	= $this->loadModel('ibContact');
		$where		= "";
		$order		= "createtime desc";
		$pageSql	= $bllLink->getListSql(null, $where, $order);
		$pageUrl	= $this->parseUrl()->set( 'page' );
		$pageSize	= 20;
		$maxPage	= 10;
		$page		= $this->page($pageSql, $pageUrl, $pageSize, $maxPage);
		$data		= $bllLink->getListBySql($page['outSql']);

		/**/
		if ( trim( get2( 'cmd' ) ) == 'export' ) {
			set_time_limit(0);
			$list = $data;

			if ( !$list ) {
				//echo '没有数据要导出'; exit;
				$this->sheader($this->parseUrl(),"没有数据要导出");exit;
			}

			$xls_file_name = '数据列表'.date( 'Ymd', time() );
			include_once( 'core/excel/PHPExcel.php' );
			$excel = new PHPExcel();
			$excel->getProperties()->setCreator( 'ruizean trader' )
				->setLastModifiedBy( 'ruizean trader' )
				->setTitle( $xls_file_name );
			$sheet = $excel->setActiveSheetIndex( 0 );

			$sheet->getDefaultRowDimension()->setRowHeight( 15 );

			//表头
			$colIndex = -1;
			$cols = 'cols';



		    $excel->getActiveSheet()->setCellValue('A1', "ID");
		    $excel->getActiveSheet()->setCellValue('B1', "Name");
		    $excel->getActiveSheet()->setCellValue('C1', "Email");
		    $excel->getActiveSheet()->setCellValue('D1', "Telphone");
		    $excel->getActiveSheet()->setCellValue('E1', "Country");
		    $excel->getActiveSheet()->setCellValue('F1', "Message");
		    $excel->getActiveSheet()->setCellValue('G1', "Message Time");
			/*以下就是对处理Excel里的数据， 横着取数据，主要是这一步，其他基本都不要改*/
	        foreach($data as $k => $v){
	        	$num=$k+2;
	             $excel->setActiveSheetIndex(0)

	                         //Excel的第A列，uid是你查出数组的键值，下面以此类推
	                          ->setCellValue('A'.$num, $v['id'])    
	                          ->setCellValue('B'.$num, $v['name'])
	                          ->setCellValue('C'.$num, $v['email'])
	                          ->setCellValue('D'.$num, $v['telephone'])
	                          ->setCellValue('E'.$num, $v['state'])
	                          ->setCellValue('F'.$num, $v['message'])
	                          ->setCellValue('G'.$num, date('Y-m-d H:i:s', $v['createtime']));
	        }
        
	        foreach($excel->getActiveSheet()->getColumnDimension() as $col) {
			    $col->setAutoSize(true);
			}
			$excel->getActiveSheet()->calculateColumnWidths();

			//保存 输出
			$sheet->setTitle( '数据收集' );
			//$xml_file_name_utf8 = mb_convert_encoding( $xls_file_name, 'utf-8', 'gb2312' );
			header( 'Content-Type: application/vnd.ms-excel' );
			header( "Content-Disposition: attachment;filename=$xls_file_name.xls" );
			header( 'Cache-Control: max-age=0' );

			$excelWriter = PHPExcel_IOFactory::createWriter( $excel, 'Excel5' );
			$excelWriter->save('php://output');

			exit;
		}
		/**/

		foreach ( $data as $key => $val ) {
			$data[$key]['message'] = utf8substr( $val['message'], 80, 0, '...' );
		}

		$this->setData($data, 'data');
		$this->setData($page['pageStr'], 'pager');
		$this->setData($this->parseUrl(), 'refreshUrl');
		$this->setData($this->parseUrl()->set( 'act' )->set( 'id' ), 'doUrl');
		$this->display();
	}

	public function edit_action () #act_name = ibContact回复#
	{
		$id			= (int)get2('id');
		$bllLink	= $this->loadModel('ibContact');
		$data		= $bllLink->get($id);
		if (!$data) $this->sheader(null, $this->lang->current_record_not_exists);
		if (is_post())
		{
			$email	= trim( $data['email'] );
			$data	= post('data');
			$data	= trim( $data['reply'] );
			if ( empty( $data ) ) {
				$this->sheader( null, $this->lang->enter_reply_message );
			}
			$data	= array(
				'reply' 	=> $data,
				'replytime' => time(),
				'replyuserid' => $this->user_id
			);
			if ( $bllLink->update( $data, $id ) ) {
				//send mail
				if ( ! empty( $email ) ) {
					$mdl_adminemail = $this->loadModel( 'adminemail' );
					$admin_email = $mdl_adminemail->get();
					$mdl_site = $this->loadModel( 'site' );
					$site = $mdl_site->get();

					$headers = "Content-Type: text/html; charset=UTF-8;\nFrom:".$admin_email['email']."\nReply-To:".$admin_email['email']."\nX-Mailer:PHP/5.2.13";
					send_mail( $email, "New Message From ".$site['name'], nl2br( $data['reply'] ), $headers );
				}
				$this->sheader( $this->parseUrl()->set( 'act' )->set( 'id' ) );
			}
			else {
				$this->sheader( null, $this->lang->reply_failed );
			}
		}
		else
		{
			$bllUser = $this->loadModel( 'user' );
			if ( $user = $bllUser->getUserById( $data['replyuserid'] ) ) {
				$data['replyusername'] = $user['displayName'];
			}
			else {
				$data['replyusername'] = '-';
			}
			$this->setData($data, 'data');
			$this->setData($this->parseUrl()->set( 'act' )->set( 'id' ), 'returnUrl');
			$this->display();
		}
	}

	public function delete_action () #act_name = 删除ibContact#
	{
		if (is_post())
		{
			$ids = post('ids');
			if (is_array($ids))
			{
				foreach ($ids as $k=>$v)
				{
					self::_delete((int)$v);
				}
			}
		}
		else
		{
			self::_delete((int)get2('id'));
		}
		$this->sheader($this->parseUrl()->set( 'act' )->set( 'id' ));
	}

	private function _delete ($id)
	{
		$id			= (int)$id;
		$bllLink	= $this->loadModel('ibContact');
		$link		= $bllLink->get($id);
		if (!$link)
		{
			$this->sheader(null, $this->lang->current_record_not_exists."<br />id:$id");
		}
		if ($bllLink->delete($id))
		{
			
		}
		else
		{
			$this->sheader(null, $this->lang->delete_failed."<br />id:$id");
		}
	}

}

?>