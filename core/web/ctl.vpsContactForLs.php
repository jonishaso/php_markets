<?php

// require_once 'core/pthread/Thread.php';
// class mailtask extends Threaded
// {
// 	private $email;
// 	public $sub;
// 	public $body;
// 	function mailtask(){
// 		require_once 'core/phpmailer/class.phpmailer.php';
// 		require_once 'core/phpmailer/class.smtp.php';
		
// 		$this->email = new PHPMailer(true);
// 		$this->email->SMTPDebug = 2;                             
// 		$this->email->isSMTP();
// 		$this->email->Host = 'smtp.office365.com';  				  
// 		$this->email->SMTPAuth = true;                               
// 		$this->email->Username = 'notifications@ruizean.com';        
// 		$this->email->Password = 'Xam76569';                         
// 		$this->email->SMTPSecure = 'tls';                            
// 		$this->email->Port = 587;                               
// 		$this->email->setFrom('notifications@ruizean.com', 'Ruizean Notification');
// 		$this->email->addAddress('teng.gao@ruizean.com');               
// 		$this->email->CharSet = "utf-8";
// 		$this->email->isHTML(true);
// 	}
// 	function run(){
// 		$this->email->Subject = $this->sub;
// 		$this->email->Body = $this->body;
// 		$this->email->send();
// 	}
// }

class ctl_vpsContactForLs extends cmsPage
{	
	function index_action() {
		if ( is_post() ) {
			$firstname = trim( post( 'firstName' ) );
			$lastname = trim( post( 'lastName' ) );
			$email = trim( post( 'email' ) );
			$telephone = trim( post( 'telephone' ) );

			$subject = 'New Message From '.$this->site['name'].' VPS Hosting';
			$body    = "<ul style='font_size:20px; color:red'><li> First Name:".$firstname."</li>"."<li> Last Name: ".$lastname."</li>"."<li>Email: ".$email."</li>"."<li>Tel: ".$telephone."</li></ul>";
			if($this->sendEmail($subject,$body)){
				echo 1;
			}else{
				echo 0;
			}

			// $var = new mailtask();
			// $var->sub = $subject;
			// $var->body = $body;
			// $var->start();
		}
	}

}
