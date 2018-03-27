<?php

/*
 @ctl_name = subscribe@
*/

class ctl_subscribe extends adminPage
{

	protected $validates = array(
		'firstName' => array( 'message' => '' ),
		'lastName' => array( 'message' => '' ),
		'email' => array( 'method' => 'email', 'message' => '' )
	);

	private $admin_email = '';
	private $site;

	function ctl_subscribe() {
		parent::adminPage();
		$this->validates['firstName']['message'] = $this->lang->first_name_can_not_empty;
		$this->validates['lastName']['message'] = $this->lang->last_name_can_not_empty;
		$this->validates['email']['message'] = $this->lang->email_can_not_empty;
	}

	public function index_action () #act_name = index#
	{
		$search		= array();
		$search['classId'] 		= (int)get2('classId');
		$search['fullname'] 	= get2('fullname');
		$search['companyname'] 	= get2('companyname');
		$bllLink	= $this->loadModel('subscribe');
		$where		= "1=1";
		if ( $search['classId'] > 0 ) {
			$where .= " and classId='".$search['classId']."'";
		}
		if ( $search['fullname'] ) {
			$where .= " and (firstName like '%".$search['fullname']."%' or lastName like '%".$search['fullname']."%')";
		}
		if ( $search['companyname'] ) {
			$where .= " and companyName like '%".$search['companyname']."%'";
		}
		$order		= "submit_time desc";
		$pageSql	= $bllLink->getListSql(null, $where, $order);
		$pageUrl	= '?con=admin&ctl=adv/subscribe&';
		$pageSize	= 20;
		$maxPage	= 10;
		$page		= $this->page($pageSql, $pageUrl, $pageSize, $maxPage);
		$data		= $bllLink->getListBySql($page['outSql']);

		$mdl_class = $this->loadModel('subscribeclass');
		foreach ( $data as $key => $val ) {
			if ( $val['classId'] > 0 ) {
				$category = $mdl_class->get( $val['classId'] );
				if ( $category ) {
					$data[$key]['category_name'] = $category['name'];
				}
				else {
					$data[$key]['category_name'] = $this->lang->has_been_deleted;
				}
			}
			else {
				$data[$key]['category_name'] = $this->lang->unallocated;
			}
			$data[$key]['submit_time'] = date( 'Y-m-d H:i:s', $val['submit_time'] );
		}

		$this->setData($data, 'data');
		$this->setData($search, 'search');
		$this->setData($page['pageStr'], 'pager');
		$mdl_class = $this->loadModel('subscribeclass');
		$this->setData( $mdl_class->getList(), 'classList' );
		$this->display();
	}

	public function add_action() #act_name = add#
	{
		$bllLink	= $this->loadModel('subscribe');
		if (is_post())
		{
			$data = post('data');
			$this->cookie->setCookie( 'subscribe_create', $data );
			$this->validate( $data );

			if ( preg_match( '/http:\/\//', $data['website'] ) ) {
				$data['website'] = 'http://'.$data['website'];
			}
			$data['submit_time'] = time();
			$data['submit_ip'] = ip();
			if ( ! $bllLink->add( $data ) )
			{
				$this->sheader(null, $this->lang->create_email_failed);
			}
			$this->cookie->clearArrayCookie( 'subscribe_create', $data );
			$this->sheader('?con=admin&ctl=adv/subscribe');
		}
		else
		{
			$mdl_class = $this->loadModel('subscribeclass');
			$this->setData( $mdl_class->getList(), 'classlist' );
			$this->setData( $this->cookie->getCookie( 'subscribe_create' ), 'form' );
			$this->display();
		}
	}

	public function edit_action () #act_name = edit#
	{
		$id			= (int)get2('id');
		$bllLink	= $this->loadModel('subscribe');
		$data		= $bllLink->get($id);
		if (!$data) $this->sheader(null, $this->lang->current_record_not_exists);
		if (is_post())
		{
			$data = post('data');
			$this->cookie->setCookie( 'subscribe_edit_'.$id, $data );
			$this->validate( $data );

			if ($bllLink->update($data, $id))
			{
				$this->cookie->clearArrayCookie( 'subscribe_edit_'.$id, $data );
				$this->sheader('?con=admin&ctl=adv/subscribe');
			}
			else
			{
				$this->sheader(null, $this->lang->edit_email_failed);
			}
		}
		else
		{
			$mdl_class = $this->loadModel('subscribeclass');
			$this->setData( $mdl_class->getList(), 'classlist' );
			$this->setData($data, 'data');
			$this->setData( $this->cookie->getCookie( 'subscribe_edit_'.$id ), 'form' );
			$this->display();
		}
	}

	public function view_action () #act_name = view#
	{
		$id			= (int)get2('id');
		$bllLink	= $this->loadModel('subscribe');
		$data		= $bllLink->get($id);
		if (!$data) $this->sheader(null, $this->lang->current_record_not_exists);
		$data['memo'] = str_replace( "\n", '<br />', $data['memo'] );
		$mdl_class = $this->loadModel('subscribeclass');
		if ( $data['classId'] > 0 ) {
			$category = $mdl_class->get( $data['classId'] );
			if ( $category ) {
				$data['category_name'] = $category['name'];
			}
			else {
				$data['category_name'] = 'Has been deleted';
			}
		}
		else {
			$data['category_name'] = 'Unallocated';
		}
		$this->setData($data, 'data');
		$this->display();
	}

	public function send_action () #act_name = send#
	{
		$bllLink		= $this->loadModel('subscribe');
		$mdl_adminemail = $this->loadModel( 'adminemail' );
		$admin_email	= $mdl_adminemail->get();
		$mdl_site = $this->loadModel( 'site' );
		$site = $mdl_site->get();

		$this->site = $site;
		$this->admin_email = $admin_email['email'];

		if ( is_post() ) {
			$mail_from = post( 'mail_from' );
			$mail_title = post( 'mail_title' );
			$mail_content = post( 'mail_content' );
			$mail_addr = explode(';', post( 'mail_addr' ) );
			$mail_addr = array_unique( $mail_addr );
			$mail_addr_tmp = array();
			$exclude_mails = post( 'exclude_mails' );
			if ( count( $exclude_mails ) > 0 ) {
				foreach ( $mail_addr as $mail_a ) {
					if ( ! in_array( $mail_a, $exclude_mails ) ) {
						$mail_addr_tmp[] = $mail_a;
					}
				}
				$mail_addr = $mail_addr_tmp;
			}
			//print_r($mail_addr);exit;
			if ( count( $mail_addr ) > 0 ) {
				//$this->setTpl( false, 'mail/', DATA_DIR.'tpl_compile/web', DATA_DIR.'tpl_cache/web' );
				foreach ( $mail_addr as $key => $val ) {
					$this->sendEmailForMarketing( $mail_from, $val, $mail_title, $this->initMailContent( $mail_content ), 'admin' );
					
					
					//send_mail( $val, 'An e-mail from '.$site['name'], nl2br( $mail_content ) );
				}
			}
			$this->sheader( '?con=admin&ctl=adv/subscribe', $this->lang->bulk_send_mail_success );
		}
		else {
			$classId = (int)get2( 'classId' );
			$mdl_class = $this->loadModel('subscribeclass');
			$mail_addr = $admin_email['email'];
			$default_sender_email = $admin_email['email'];
			if ( $classId != 0 ) {
				$where = '';
				if ( $classId > 0 ) {
					$where = "classId='$classId'";
				}
				$mails = $bllLink->getList( $where, 'submit_time desc' );
			}
			$this->_defaultMailContent();
			$this->setData( $mdl_class->getList(), 'classlist' );
			$this->setData( $mails, 'mails' );
			$this->setData( $mail_addr, 'mail_addr' );
			$this->setData( $default_sender_email, 'default_sender_email' );
			$this->setData( $classId, 'classId' );
			$this->display();
		}
	}

	public function sendone_action () #act_name = send one#
	{
		$email			= get2('email');
		$mdl_adminemail = $this->loadModel( 'adminemail' );
		$admin_email	= $mdl_adminemail->get();
		$mdl_site = $this->loadModel( 'site' );
		$site = $mdl_site->get();

		$this->site = $site;
		$this->admin_email = $admin_email['email'];

		if ( is_post() ) {
			$email	= post('mail_addr');
			$mail_from = post( 'mail_from' );
			$mail_title = post( 'mail_title' );
			$mail_content = post( 'mail_content' );
			$this->sendEmailForMarketing( $mail_from, $email, $mail_title, $this->initMailContent( $mail_content ), 'admin' );
			$this->sheader( '?con=admin&ctl=adv/subscribe', $this->lang->send_mail_success );
		}
		else {
			$this->_defaultMailContent();
			$mail_addr = $email;
			$default_sender_email = $admin_email['email'];
			$this->setData( $mail_addr, 'mail_addr' );
			$this->setData( $mail_addr, 'default_sender_email' );
			$this->display();
		}
	}

	public function delete_action () #act_name = delete#
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
		$this->sheader('?con=admin&ctl=adv/subscribe');
	}

	private function _delete ($id)
	{
		$id			= (int)$id;
		$bllLink	= $this->loadModel('subscribe');
		$link		= $bllLink->get($id);
		if (!$link)
		{
			$this->sheader(null, $this->lang->current_record_not_exists."<br />id:$id");
		}
		if (!$bllLink->delete($id))
		{
			$this->sheader(null, $this->lang->delete_failed."<br />id:$id");
		}
	}

	private function _defaultMailContent() {
		$str = '';
		$this->setData( $str, 'default_mail_content' );
	}

	private function initMail( $body ) {
		$this->setData( HTTP_ROOT, 'http_root' );

		//处理被转义的符号
		$body = str_replace( '\\"', '"', $body );
		$body = str_replace( '\\\'', '\'', $body );

		//处理上传的图片路径
		$exp = '/<img\b[^<>]*?\bsrc[\s\t\r\n]*=[\s\t\r\n]*["\']?[\s\t\r\n]*(?<imgUrl>[^\s\t\r\n"\'<>]*)[^<>]*?\/?[\s\t\r\n]*>/iu';
		if ( preg_match_all( $exp, $body, $matches ) ) {
			foreach ( $matches[1] as $key => $val ) {
				if ( left( $val, 1 ) == '/' ) {
					$body = str_replace( $val, HTTP_ROOT.$val, $body );
				}
			}
		}

		return $body;
	}

	private function sendEmailForMarketing( $from, $email, $subject, $body, $app = 'web' ) {
		//$this->setTpl( false, 'mail/', DATA_DIR.'tpl_compile/web', DATA_DIR.'tpl_cache/web' );

		$email = trim( $email );
		if ( empty( $email ) ) return false;

		$senderEmail = $from ? $from : $this->admin_email;
		//$template = 'marketing';
		$subject = $subject ? $subject : 'An email from '.$this->site['name'];
		//$this->setData( $subject, 'subject' );
		//$this->setData( $body, 'body' );
		//$content = $this->fetch( $template );
		$content = $body;
		//if ( $app == 'web' ) $this->setTpl( false, TPL_DIR, DATA_DIR.'tpl_compile', DATA_DIR.'tpl_cache' );
		//elseif ( $app == 'admin' ) $this->setTpl( false, CORE_DIR.'common/skin/admin', DATA_DIR.'tpl_compile/admin', DATA_DIR.'tpl_cache/admin' );

		$headers = "Content-Type: text/html; charset=UTF-8;\nFrom:$senderEmail\nReply-To:$senderEmail\nX-Mailer:PHP/5.2.13";
		$status = mail( $email, $subject, $content, $headers );

		//log
		$fp = fopen( 'logs/mail/'.date( 'YmdHis' ).'.log', 'a' );
		fwrite( $fp, $email.' Time:'.date( 'Y-m-d H:i:s' ).' Status:'.$status."\r\n" );
		fclose( $fp );
	}

}

?>