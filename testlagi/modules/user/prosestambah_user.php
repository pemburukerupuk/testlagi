<?php if($_SESSION['level'] != 'Administrator'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{

	require_once '../cores/db_function.php';
	$db = new Db_Function();

	$username = $_POST['username'];
	$email = $_POST['email'];
	$password = $_POST['password'];
	$c_password = $_POST['c_password'];
	$idcompany = $_POST['idcompany'];
	$info = $_POST['info'];

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
			
			//create folder
			$createfolderbyemail = $_POST['email'];
			$pathUser = "../file storage/".$createfolderbyemail;
			$db->addpathUser($pathUser);
			//end create folder
		      
			$user = $db->insertUser($username, $email, $password, $idcompany, $info);
			if($user){
				echo "<script>
	        	alert('Proses tambah account sukses');
	        	window.location.href='?page=master_user';
	    	 </script>";
			}else{
				echo "<script>
	        	alert('Proses tambah account gagal, Coba lagi !!!');
	        	history.back();
	    	 </script>";
			}
		}
	}	
}

?>