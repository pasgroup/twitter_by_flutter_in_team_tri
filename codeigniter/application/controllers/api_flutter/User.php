<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Controller {
	
	function __construct() {
        parent::__construct();
      	$this->load->database();

      	// Getting the received JSON into $json variable.
      	$this->json = file_get_contents('php://input');

      	// Decoding the received JSON and store into $obj variable.
      	$this->obj = json_decode($this->json,true);
    }

	public function index(){

	}

	public function checkLogin(){
		$email = $this->obj['email'];
		$password = $this->obj['password'];

		$query = $this->db->query('SELECT * FROM user_registration WHERE email = "' . $email . '" AND password = "'. $password .'" LIMIT 1');
		$result = $query->num_rows();
		if($result == 1){
			// Successfully Login Message.
		 	$onLoginSuccess = 'Login OK';
		 
		 	// Converting the message into JSON format.
		 	$SuccessMSG = json_encode($onLoginSuccess);
		 
		 	// Echo the message.
		 	echo $SuccessMSG ; 
		}else{
			 // If Email and Password did not Matched.
			$InvalidMSG = 'Invalid Username or Password Please Try Again' ;
			 
			// Converting the message into JSON format.
			$InvalidMSGJSon = json_encode($InvalidMSG);
			 
			// Echo the message.
			echo $InvalidMSGJSon ;
		}
	}

	public function registerUser(){
		$name = $this->obj['name'];
		$email = $this->obj['email'];
		$password = $this->obj['password'];
		$gender = $this->obj['gender'];
		$phone = $this->obj['phone'];
		$birthday = $this->obj['birthday'];

		$query = $this->db->query('SELECT * FROM user_registration WHERE email = "' . $email . '" LIMIT 1');
		$result = $query->num_rows();

		if($result == 1){
			$emailExist = 'Email Already Exist, Please Try Again With New Email Address..!';
		 	$emailExistMSG = json_encode($emailExist);
		 	echo $emailExistMSG ; 
		}else{
			$insertQuery = "insert into user_registration (name,email,password,gender,phone,birthday) values ('$name','$email','$password','$gender','$phone','$birthday')";
			if($this->db->query($insertQuery)){
				$MSG = 'Registered OK' ;
				$json = json_encode($MSG);
				echo $json;
			}else{
				$InvalidMSG = 'Try Again' ;
				$InvalidMSGJSon = json_encode($InvalidMSG);
				echo $InvalidMSGJSon ;
			}
		}
	}

	public function checkUser(){
 		$email = $this->obj['email'];
 		$query = $this->db->query('SELECT * FROM user_registration WHERE email = "' . $email . '" LIMIT 1');
 		$result = $query->num_rows();
		if($result == 1){
			 $checkSuccess = 'Check OK';
			 $SuccessMSG = json_encode($checkSuccess);
			 echo $SuccessMSG ;
	 	}else{
			$InvalidMSG = 'Email is not exist' ;
			$InvalidMSGJSon = json_encode($InvalidMSG);
			echo $InvalidMSGJSon ;
	 	}
	}

	public function checkCodeUser(){
 		$email = $this->obj['email'];
 		$code = $this->obj['code'];
 		$query = $this->db->query('SELECT * FROM user_registration WHERE email = "' . $email . '" AND code_forgot_password = ' . $code . ' LIMIT 1');
 		$result = $query->num_rows();
		if($result == 1){
			 $checkSuccess = 'Check OK';
			 $SuccessMSG = json_encode($checkSuccess);
			 echo $SuccessMSG ;
	 	}else{
			$InvalidMSG = 'The code is wrong' ;
			$InvalidMSGJSon = json_encode($InvalidMSG);
			echo $InvalidMSGJSon ;
	 	}
	}

	public function updateCodeUser(){
		$email = $this->obj['email'];
		$code = $this->obj['code'];
		$query = "Update user_registration set code_forgot_password = '$code' Where email = '$email'";
		if($this->db->query($query)){
			$MSG = 'Update OK' ;
			$json = json_encode($MSG);
		 	echo $json ;
		}else{
			echo 'Try Again';
		}
	}

	public function updatePassword(){
		$email = $this->obj['email'];
		$password = $this->obj['password'];
		$query = "Update user_registration set password = '$password', code_forgot_password = '' Where email = '$email'";
		if($this->db->query($query)){
			$MSG = 'Update OK' ;
			$json = json_encode($MSG);
		 	echo $json ;
		}else{
			echo 'Try Again';
		}
	}
}
