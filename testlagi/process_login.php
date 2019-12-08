<?php
	require_once 'cores/db_function.php';
	$db = new Db_Function();

	$email = $_POST['email'];
	$password = $_POST['password'];

	$user = $db->loginUser($email, $password);
	if($user != FALSE){
		echo "<script>
	        	alert('Login Success');
	        	window.location.href='modules/index.php';
	    	 </script>";
	}else{
		echo "<script>
	        	alert('Email or Password Incorrect , Try Again !!!');
	        	alert('If Your Account is New, Contact Administrator For Verify'); 
	        	history.back();
	    	 </script>";
	}

?>
