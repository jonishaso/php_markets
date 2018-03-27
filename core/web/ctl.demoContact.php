<?php

class ctl_demoContact extends cmsPage
{
	function index_action() {
		if ( is_post() ) {
			$name = trim( post( 'Name' ) );
			$email = trim( post( 'email' ) );
			$telephone = trim( post( 'telephone' ) );
			
			$mdl_adminemail = $this->loadModel( 'adminemail' );
			$admin_email = $mdl_adminemail->get();
            
            $email_content = "new message from Register Demo Account :\n";
			$email_content .= "Name: {$name}\n";
			$email_content .= "Telephone: {$telephone}\n";
			$email_content .= "Email Address: {$email}\n";

			$headers = "Content-Type: text/html; charset=UTF-8;\nFrom:$email\nReply-To:$email\nX-Mailer:PHP/5.2.13";

			//@mail( "".$admin_email['email']."", "New Message From ".$this->site['name'], nl2br( $email_content ), null );
			if(send_mail($admin_email['email'], "New Message From ".$this->site['name']." Register Demo Account ", nl2br($email_content), $headers )){
                echo 1;
            }else{
                echo 0;
            }

		
		}else{
            echo 0;
        }
	}

}