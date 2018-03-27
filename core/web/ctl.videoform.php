<?php

class ctl_videoform extends cmsPage
{

	function index_action() {
		if ( is_post() ) {
			$firstName = trim( post( 'firstName' ) );
			$lastName = trim( post( 'lastName' ) );
			$name = $firstName.' '.$lastName;
			$email = trim( post( 'email' ) );
			$telephone = trim( post( 'telephone' ) );
			//$subscribe = (int)post( 'subscribe' );
			$message = trim( post( 'message' ) );
			$country = trim( post( 'country' ) );
			if($country == 'country')
				$country = '';
			$area = trim( post( 'area' ) );

			$mdl_adminemail = $this->loadModel( 'adminemail' );
			$admin_email = $mdl_adminemail->get();
			//发送邮件
			$email_content = "new message:\n";
			$email_content .= "Name: {$name}\n";
			$email_content .= "Telephone: {$telephone}\n";
			$email_content .= "Email Address: {$email}\n";
			$email_content .= "from which country: {$country} {$area}\n";
			$email_content .= "Message: ".$message."\n";

			$headers = "Content-Type: text/html; charset=UTF-8;\nFrom:$email\nReply-To:$email\nX-Mailer:PHP/5.2.13";

			//@mail( "".$admin_email['email']."", "New Message From ".$this->site['name'], nl2br( $email_content ), null );
			send_mail( $admin_email['email'], "New Message From ".$this->site['name'], nl2br($email_content), $headers );

			$mdl_contact = $this->loadModel( 'videoform' );
			if ( $mdl_contact->insert( array( 'name' => $name, 'email' => $email, 'telephone' => $telephone, 'message' => $message, 'subscribe' => $subscribe, 'state'=>$country.' '.$area, 'createtime' => time() ) ) ) {
				/*if ( $subscribe == 1 ) {  //subscribe
					$mdl_subscribe = $this->loadModel( 'subscribe' );
					$mdl_subscribe->insert( array( 'classId' => 1, 'firstName' => $name, 'lastName' => '', 'email' => $email, 'phone' => $telephone, 'submit_time' => time(), 'submit_ip' => ip() ) );
				}*/
				//echo "<script>alert('Message sent! Thank you for your enquiry, we will contact you soon.');</script>"; 
				echo 1;
				//$this->display('videos');
				//$this->sheader('?ctl=videos');
				//exit;
			}
			else {
				//$this->display('videos'); exit;
				echo 0;
				//$this->sheader('?ctl=videos');
			}
		}
	}

}