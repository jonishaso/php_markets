<?php

class ctl_vpsContactForHosting extends cmsPage
{

	function index_action() {
		if ( is_post() ) {
			$firstname = trim( post( 'firstName' ) );
			$lastname = trim( post( 'lastName' ) );
			$email = trim( post( 'email' ) );
			$telephone = trim( post( 'telephone' ) );

			require_once 'core/phpmailer/class.phpmailer.php';
			require_once 'core/phpmailer/class.smtp.php';

			$mail = new PHPMailer(true);                              
			try {
				
				$mail->SMTPDebug = 2;                             
				$mail->isSMTP();                                     
				$mail->Host = 'smtp.office365.com';  				  
				$mail->SMTPAuth = true;                               
				$mail->Username = 'notifications@ruizean.com';        
				$mail->Password = 'Xam76569';                         
				$mail->SMTPSecure = 'tls';                            
				$mail->Port = 587;                               

				//Recipients
				$mail->setFrom('notifications@ruizean.com', 'Ruizean Notification');
				// $mail->addAddress('joe@example.net', 'Joe User');     // Add a recipient
				$mail->addAddress('bruce.xu@ruizean.com','Bruce Xu');               // Name is optional
				// $mail->addReplyTo('info@example.com', 'Information');
				// $mail->addCC('cc@example.com');
				// $mail->addBCC('bcc@example.com');

				//Attachments
				// $mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
				// $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name

				//Content
				$mail->isHTML(true);                                  // Set email format to HTML
				$mail->Subject = 'New Message From '.$this->site['name'].' VPS Hosting';
				$mail->Body    = "<ul style='font_size:20px; color:red'><li> First Name:".$firstname."</li>"."<li>".$lastname."</li>"."<li>".$email."</li>"."<li>".$telephone."</li></ul>";
				$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

				$mail->send();
				echo 'Message has been sent';
			} catch (Exception $e) {
				echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
			}
		}
	}

}