<?php if($_SESSION['level'] != 'Administrator'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{
	require_once '../cores/db_function.php';
	$db = new Db_Function();
	$iduser = $_GET['id'];
	$username = $_POST['username'];
	$password = $_POST['password'];
	$c_password = $_POST['c_password'];
	$idcompany = $_POST['idcompany'];
	$info = 	 $_POST['info'];

	if($password != $c_password){
		echo 
		"<script> 
			alert('Password tidak sama, Coba lagi !!!');
	    	history.back();
	    </script>";
	}else{
		if(isset($_POST['ubahemail'])){
		$email = $_POST['newemail'];
		$checkemail = $db->isEmailExisted($email);	
			if($checkemail){
				echo "<script>
		        	alert('Email sudah ada, Coba Lagi !!!');
		        	history.back();
		    	 </script>"; 
		        
			}else{

			//rename folder
				//old data
				
				$result = $db->showUserById($iduser);
				$oldemail = $result['email'];
				//end old

				//new data
				$newemail = $_POST['newemail'];
				//end new
				$pathOldUser = "../file storage/".$oldemail;
				$pathNewUser = "../file storage/".$newemail;
				$db->editpathUser($pathOldUser, $pathNewUser);

			//end rename folder


				$user = $db->updateUserWithEmail($email, $username, $password, $info, $idcompany, $iduser);
				if($user){
					echo "<script>
		        	alert('Proses update account dengan email sukses');
		        	window.location.href='?page=master_user';
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
	        	window.location.href='?page=master_user';
	    	 </script>";
			}else{
				echo "<script>
	        	alert('Proses update account tanpa email gagal, Coba lagi !!!');
	        	history.back();
	    	 </script>";
			}
		}
	}
}
?>