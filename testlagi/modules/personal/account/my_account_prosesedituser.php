<?php
	require_once '../cores/db_function.php';
	$db = new Db_Function();
	$iduser = $_GET['id'];
	$result = $db->showUserById($iduser);
	$idcompany = $result['idcompany'];
	$info = $result['info'];
	$username = $_POST['username'];
	$password = $_POST['password'];
	$c_password = $_POST['c_password'];

	if($password != $c_password){
		echo 
		"<script> 
			alert('Password tidak sama, Coba lagi !!!');
	    	history.back();
	    </script>";
	}else{
		if(isset($_POST['ubahemail'])){
		$email = $_POST['emailbaru'];
		$checkemail = $db->isEmailExisted($email);	
		if($checkemail){
			echo "<script>
	        	alert('Email sudah ada, Coba Lagi !!!');
	        	history.back();
	    	 </script>"; 
	        
		}else{
			$user = $db->updateUserWithEmail($email, $username, $password, $info, $idcompany, $iduser);
			if($user){
				echo "<script>
	        	alert('Proses update account dengan email sukses');
	        	window.location.href='?page=my_account';
	    	 </script>";
			}else{
				echo "<script>
	        	alert('Proses update account dengan email gagal, Coba lagi !!!');
	        	history.back();
	    	 </script>";
			}
		}
	}else{

		$user1 = $db->updateUserWOEmail($username, $password, $info, $idcompany, $iduser);
		if($user1){
			echo "<script>
        	alert('Proses update account tanpa email sukses');
        	window.location.href='?page=my_account';
    	 </script>";
		}else{
			echo "<script>
        	alert('Proses update account tanpa email gagal, Coba lagi !!!');
        	history.back();
    	 </script>";
		}
	}
	}
?>