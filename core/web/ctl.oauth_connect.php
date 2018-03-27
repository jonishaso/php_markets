<?php

class ctl_oauth_connect extends cmsPage
{

	function facebook_action() {
		require_once 'core/v2.1/Facebook.php';

		$c = trim( get2( 'c' ) );
		switch ( $c ) {
			case 'login':
				$this->session( 'facebook_access_token', '' );
				$fb = new MyFacebook;
				$this->sheader( $fb->getLoginUrl( $this->returnUrl ) );
				break;
			case 'login_callback':
				$fb = new MyFacebook( $this );
				$result = $fb->getLoginCallback();

				//https://developers.facebook.com/docs/graph-api/reference/user
				//https://developers.facebook.com/docs/graph-api/using-graph-api/v2.4#fieldexpansion
				//https://developers.facebook.com/tools/explorer/145634995501895/
				if ( !$result['user'] ) {
					echo 'Facebook Login failed. ';
					echo $result['msg'];
					exit;
				}

				$ocUid = (string)$result['user']->getId();
				$ocUserDisplayName = (string)$result['user']->getName();
				$ocUserFirstName = (string)$result['user']->getFirstName();
				$ocUserLastName = (string)$result['user']->getLastName();
				$ocUserGender = (string)$result['user']->getGender();
				$ocUserBirthday = (string)$result['user']->getBirthday();
				$ocUserEmail = (string)$result['user']->getField('email');

				$mdl_user = $this->loadModel( 'user' );
				$user = $mdl_user->getByWhere( array( 'facebook_connect_id' => $ocUid ) );
				if ( ! $user ) {
					$ocUserAvatar = $this->saveAvatar( (string)$result['user']->getPicture()->getUrl() );

					$data = array(
						'isApproved' => 1,
						'isAdmin' => 0,
						'name' => $ocUserEmail,
						'firstname' => $ocUserFirstName,
						'lastname' => $ocUserLastName,
						'displayName' => $ocUserDisplayName,
						'dob' => $ocUserBirthday,
						'sex' => $ocUserGender,
						'avatar' => $ocUserAvatar,
						'email' => $ocUserEmail,
						'emailConfirm' => $ocUserEmail,
						'password' => '',
						'role' => 3,
						'groupid' => 1,
						'createdDate' => time(),
						'lastLoginIp' => ip(),
						'lastLoginDate' => time(),
						'loginCount' => 1,
						'facebook_connect_id' => $ocUid
					);
					if ( $uid = $mdl_user->insert( $data ) ) {
						$user = $mdl_user->getByWhere( array( 'facebook_connect_id' => $ocUid ) );
						$this->sendConfirmMail_Email( $user );
					}
					else {
						if ( $ocUserAvatar ) $this->file->deletefile( UPDATE_DIR.$ocUserAvatar );
						echo 'Facebook Login failed.'; exit;
					}
				}
				else {
					$data = array(
						//'firstname' => $ocUserFirstName,
						//'lastname' => $ocUserLastName,
						//'displayName' => $ocUserDisplayName,
						//'dob' => $ocUserBirthday,
						//'sex' => $ocUserGender,
						//'avatar' => $ocUserAvatar,
						//'email' => $ocUserEmail,
						'lastLoginIp' => ip(),
						'lastLoginDate' => time(),
						'loginCount' => $user['loginCount'] + 1
					);
					$mdl_user->update( $data, $user['id'] );
				}

				$this->session( 'member_user_id', $user['id'] );
				$this->session( 'member_user_shell_facebook', $this->md5( $user['id'].$user['facebook_connect_id'] ) );
				if ( $this->returnUrl ) $this->sheader( $this->returnUrl );
				$this->sheader( HTTP_ROOT_WWW.'member/index' );

				break;
		}
	}

	function google_action() {
		require_once 'core/v2.1/Google.php';

		$c = trim( get2( 'c' ) );
		switch ( $c ) {
			case 'login':
				$this->session( 'google_access_token', '' );
				$gg = new MyGoogle;
				$this->sheader( $gg->getLoginUrl( $this->returnUrl ) );
				break;
			case 'login_callback':
				$gg = new MyGoogle( $this );
				$result = $gg->getLoginCallback();

				//Google/Service/Oauth2.php/Google_Service_Oauth2_Userinfoplus
				if ( !$result['user'] ) {
					echo 'Google Login failed.'; exit;
				}

				$ocUid = (string)$result['user']->getId();
				$ocUserDisplayName = (string)$result['user']->getName();
				$ocUserFirstName = (string)$result['user']->getGivenName();
				$ocUserLastName = (string)$result['user']->getFamilyName();
				$ocUserGender = (string)$result['user']->getGender();
				$ocUserEmail = (string)$result['user']->getEmail();

				$mdl_user = $this->loadModel( 'user' );
				$user = $mdl_user->getByWhere( array( 'google_connect_id' => $ocUid ) );
				if ( ! $user ) {
					$ocUserAvatar = $this->saveAvatar( (string)$result['user']->getPicture() );

					$data = array(
						'isApproved' => 1,
						'isAdmin' => 0,
						'name' => '',
						'firstname' => $ocUserFirstName,
						'lastname' => $ocUserLastName,
						'displayName' => $ocUserDisplayName,
						'dob' => '',
						'sex' => $ocUserGender,
						'avatar' => $ocUserAvatar,
						'email' => $ocUserEmail,
						'password' => '',
						'role' => 3,
						'groupid' => 1,
						'createdDate' => time(),
						'lastLoginIp' => ip(),
						'lastLoginDate' => time(),
						'loginCount' => 1,
						'google_connect_id' => $ocUid
					);
					if ( $uid = $mdl_user->insert( $data ) ) {
						$user = $mdl_user->getByWhere( array( 'google_connect_id' => $ocUid ) );
						$this->sendConfirmMail_Email( $user );
					}
					else {
						if ( $ocUserAvatar ) $this->file->deletefile( UPDATE_DIR.$ocUserAvatar );
						echo 'Google Login failed.'; exit;
					}
				}
				else {
					$data = array(
						//'firstname' => $ocUserFirstName,
						//'lastname' => $ocUserLastName,
						//'displayName' => $ocUserDisplayName,
						//'dob' => $ocUserBirthday,
						//'sex' => $ocUserGender,
						//'avatar' => $ocUserAvatar,
						//'email' => $ocUserEmail,
						'lastLoginIp' => ip(),
						'lastLoginDate' => time(),
						'loginCount' => $user['loginCount'] + 1
					);
					$mdl_user->update( $data, $user['id'] );
				}

				$this->session( 'member_user_id', $user['id'] );
				$this->session( 'member_user_shell_google', $this->md5( $user['id'].$user['google_connect_id'] ) );
				if ( empty( $this->returnUrl ) ) $this->returnUrl = $_SESSION['return_url'];
				if ( $this->returnUrl ) $this->sheader( $this->returnUrl );
				$this->sheader( HTTP_ROOT_WWW.'member/index' );

				break;
		}
	}

	function wechat_action() {
		require_once 'core/v2.1/Wechat.php';

		$wechat = new Wechat( $this );

		$c = trim( get2( 'c' ) );
		switch ( $c ) {
			case 'login':
				$ua = getUserDevice();
				if ( $ua != 'wechat' && ! get2( 'code' ) ) {
					echo '<html><head><meta charset="UTF-8"></head><body>请在微信客户端打开链接</body></html>';
					exit;

					//回调网址必须区分www和不带www
					$url = $wechat->getUserInforForQRConnect( 'http://www.auhhome.com/oauth_connect/wechat?c=login' );
					$this->sheader( $url );
					exit;
				}

				//回调网址必须区分www和不带www
				$ocUser = $wechat->getUserInforForAuth20( '', false, 'http://www.auhhome.com/oauth_connect/wechat?c=login' );

				$ocUid = $ocUser['OpenID'];
				$ocUserDisplayName = $ocUser['nickname'];
				$ocUserFirstName = $ocUser['nickname'];
				//$ocUserLastName = $ocUser['OpenID'];
				$ocUserGender = $ocUser['sex'];
				//$ocUserBirthday = $ocUser['OpenID'];
				//$ocUserEmail = $ocUser['OpenID'];

				$mdl_user = $this->loadModel( 'user' );
				$user = $mdl_user->getByWhere( array( 'wechat_connect_id' => $ocUid ) );
				if ( ! $user ) {
					$ocUserAvatar = $this->saveAvatar( $ocUser['headimgurl'] );

					$data = array(
						'isApproved' => 1,
						'isAdmin' => 0,
						'name' => '',
						'firstname' => $ocUserFirstName,
						'lastname' => $ocUserLastName,
						'displayName' => $ocUserDisplayName,
						'dob' => $ocUserBirthday,
						'sex' => $ocUserGender,
						'avatar' => $ocUserAvatar,
						'email' => '',
						'emailConfirm' => '',
						'password' => '',
						'role' => 3,
						'groupid' => 1,
						'createdDate' => time(),
						'lastLoginIp' => ip(),
						'lastLoginDate' => time(),
						'loginCount' => 1,
						'wechat_connect_id' => $ocUid
					);
					if ( $uid = $mdl_user->insert( $data ) ) {
						$user = $mdl_user->getByWhere( array( 'wechat_connect_id' => $ocUid ) );
						//$this->sendConfirmMail_Email( $user );
					}
					else {
						if ( $ocUserAvatar ) $this->file->deletefile( UPDATE_DIR.$ocUserAvatar );
						echo 'Wechat Login failed.'; exit;
					}
				}
				else {
					$data = array(
						//'firstname' => $ocUserFirstName,
						//'lastname' => $ocUserLastName,
						//'displayName' => $ocUserDisplayName,
						//'dob' => $ocUserBirthday,
						//'sex' => $ocUserGender,
						//'avatar' => $ocUserAvatar,
						//'email' => $ocUserEmail,
						'lastLoginIp' => ip(),
						'lastLoginDate' => time(),
						'loginCount' => $user['loginCount'] + 1
					);
					$mdl_user->update( $data, $user['id'] );
				}

				$this->session( 'member_user_id', $user['id'] );
				$this->session( 'member_user_shell_wechat', $this->md5( $user['id'].$user['wechat_connect_id'] ) );
				if ( $this->returnUrl ) $this->sheader( $this->returnUrl );
				$this->sheader( HTTP_ROOT_WWW.'member/index' );

				break;
		}
	}

	private function saveAvatar( $url ) {
		if ( empty( $url ) ) return '';
		$data = https_request( $url );
		if ( empty( $data ) ) return '';
		$filepath = date( 'Y-m' );
		$this->file->createdir( 'data/upload/'.$filepath );
		$avatar = $filepath.'/'.date( 'YmdHis' ).$this->createRnd().'.jpg';
		file_put_contents( UPDATE_DIR.$avatar, $data );
		return $avatar;
	}

}