<?php

class ctl_vpsContact extends cmsPage
{

	function index_action() {
		if ( is_post() ) {
			$firstName = trim( post( 'firstName' ) );
			$lastName = trim( post( 'lastName' ) );
			$name = $firstName.' '.$lastName;
			$email = trim( post( 'email' ) );
			$telephone = trim( post( 'telephone' ) );
			$message = trim( post( 'message' ) );
			
			$mdl_adminemail = $this->loadModel( 'adminemail' );
			$admin_email = $mdl_adminemail->get();
			//发送邮件
			$email_content = "new message:\n";
			$email_content .= "Name: {$name}\n";
			$email_content .= "Telephone: {$telephone}\n";
			$email_content .= "Email Address: {$email}\n";
			$email_content .= "Company: ".$message."\n";

			$headers = "Content-Type: text/html; charset=UTF-8;\nFrom:$email\nReply-To:$email\nX-Mailer:PHP/5.2.13";

			//@mail( "".$admin_email['email']."", "New Message From ".$this->site['name'], nl2br( $email_content ), null );
			send_mail( "teng.gao@ruizean.com", "New Message From ".$this->site['name'], nl2br($email_content), $headers );
		
				// file_put_contents('./loging.txt','text');
			$mdl_contact = $this->loadModel( 'vpsContact' );
			if ( $mdl_contact->insert( array( 'name' => $name, 'email' => $email, 'telephone' => $telephone, 'message' => $message, 'subscribe' => $subscribe, 'state'=>$country.' '.$area, 'createtime' => time() ) ) ) {
				echo 1;
			}
			else {
				echo 0;
			}
		}
	}

}