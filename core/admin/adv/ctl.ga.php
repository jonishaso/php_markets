<?php

/*
 @ctl_name = 谷歌分析@
*/

class ctl_ga extends adminPage
{

	protected $validates = array(
		'email' => array( 'method' => 'email', 'message' => '' ),
		'pwd' => array( 'message' => '' )
	);

	function ctl_ga() {
		parent::adminPage();
		$this->validates['email']['message'] = $this->lang->email_can_not_empty;
		$this->validates['pwd']['message'] = $this->lang->password_can_not_empty;
	}

	public function index_action () #act_name = 编辑#
	{
		$mdl = $this->loadModel( 'ga' );
		if ( is_post() ) {
			$data = post( 'data' );
			$this->cookie->setCookie( 'ga_edit', $data );

			$this->validate( $data );

			if ( $mdl->update( $data ) ) {
				$this->cookie->clearArrayCookie( 'ga_edit', $data );
				$this->sheader( $this->parseUrl() );
			}
			else {
				$this->sheader( null, $this->lang->google_analytics_setting_failed );
			}
		}
		else {
			$this->setData( $mdl->get() );
			$this->setData( $this->cookie->getCookie( 'ga_edit' ), 'form' );
			$this->display();
		}
	}

	public function login_action () #act_name = 登录#
	{
		$mdl = $this->loadModel( 'ga' );
		$ga = $mdl->get();
		if ( $ga ) {
			require_once( 'core/v2.1/HttpService.php' );
			$service_url = 'https://accounts.google.com/ServiceLoginAuth';
			$post_data = array( 'Email' => $ga['email'], 'Passwd' => $ga['pwd'], 'PersistentCookie' => 'yes' );
			//other data
			$post_data['service'] = 'analytics';
			$post_data['nui'] = 1;
			$post_data['dsh'] = '-5207581670216092794';
			$post_data['GALX'] = 'tZxWdxtdabA';
			$post_data['pstMsg'] = 1;
			$post_data['rmShown'] = 1;
			$httpService = new HttpService;
			$httpService->setUrl( $service_url );
			$httpService->setData( $post_data );
			$httpService->post();
			$this->sheader( 'https://www.google.com/analytics/web/', null );
		}
		exit;
	}

}

?>