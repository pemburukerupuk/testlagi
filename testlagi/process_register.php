<?php
	require_once 'cores/db_function.php';
	$db = new Db_Function();

	$username = $_POST['username'];
	$email = $_POST['email'];
	$password = $_POST['password'];
	$c_password = $_POST['c_password'];
	if($password != $c_password){
		echo 
		"<script> 
			alert('Password tidak sama, Coba lagi !!!');
	    	history.back();
	    </script>";
	}else{
		$checkemail = $db->isEmailExisted($email);	
		if($checkemail){
			echo "<script>
	        	alert('Email = [ $email ] sudah digunakan, Coba Lagi !!!');
	        	history.back();
	    	 </script>"; 
	        
		}else{

			$user = $db->registerUser($username, $email, $password);
			if($user){
				echo "<script>
	        	alert('Proses register sukses, Silahkan login !!!');
	        	window.location.href='index.php#login';
	    	 </script>";
			}else{
				echo "<script>
	        	alert('Proses register gagal, Coba lagi !!!');
	        	window.location.href='index.php#login';
	    	 </script>";
			}
		}
	}	

?>