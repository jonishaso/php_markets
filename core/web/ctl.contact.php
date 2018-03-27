<?php

class ctl_contact extends cmsPage
{

	function index_action() {
		if ( is_post() ) {
			$name = trim( post( 'name' ) );
			$email = trim( post( 'email' ) );
			$telephone = trim( post( 'telephone' ) );
			//$subscribe = (int)post( 'subscribe' );
			$message = trim( post( 'message' ) );

			/*if ( empty( $name ) || empty( $email ) || empty( $telephone ) || empty( $message ) ) {
				echo 'PLEASE FILL IN REQUIRED FIELDS'; exit;
			}

			if ( ! preg_match( "/^[a-z0-9]+([_\\.-][a-z0-9]+)*" ."@"."([a-z0-9]+([\.-][a-z0-9]+)*)+"."\\.[a-z]{2,}$/i", $email ) ) {
				echo "Invalid email address entered"; exit;
			}*/

			$mdl_adminemail = $this->loadModel( 'adminemail' );
			$admin_email = $mdl_adminemail->get();
			//发送邮件
			$email_content = "new message:\n";
			$email_content .= "Name: {$name}\n";
			$email_content .= "Telephone: {$telephone}\n";
			$email_content .= "Email Address: {$email}\n";
			$email_content .= "Message: ".$message."\n";

			$headers = "Content-Type: text/html; charset=UTF-8;\nFrom:$email\nReply-To:$email\nX-Mailer:PHP/5.2.13";

			//@mail( "".$admin_email['email']."", "New Message From ".$this->site['name'], nl2br( $email_content ), null );
			send_mail( $admin_email['email'], "New Message From ".$this->site['name'], nl2br($email_content), $headers );

			$mdl_contact = $this->loadModel( 'contact' );
			if ( $mdl_contact->insert( array( 'name' => $name, 'email' => $email, 'telephone' => $telephone, 'message' => $message, 'subscribe' => $subscribe, 'createtime' => time() ) ) ) {
				/*if ( $subscribe == 1 ) {  //subscribe
					$mdl_subscribe = $this->loadModel( 'subscribe' );
					$mdl_subscribe->insert( array( 'classId' => 1, 'firstName' => $name, 'lastName' => '', 'email' => $email, 'phone' => $telephone, 'submit_time' => time(), 'submit_ip' => ip() ) );
				}*/
				echo "<script>alert('Message sent! Thank you for your enquiry, we will contact you soon.');</script>"; 
				
				$this->display('contactus');
				//$this->sheader('?con=web&ctl=contactus#res');
				exit;
			}
			else {
				$this->display('contactus'); exit;
			}
		}
	}

}