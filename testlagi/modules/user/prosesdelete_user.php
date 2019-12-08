<?php if($_SESSION['level'] != 'Administrator'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{
	require_once '../cores/db_function.php';
	$db = new Db_Function();

	$iduser = $_GET['id'];

	//delete folder email
	$result = $db->showUserById($iduser);
	$email = $result['email'];
	$removePathUser = "../file storage/".$email;
	$db->deletepathUser($removePathUser);
	//end delete

	$user = $db->removeUser($iduser);
	if($user){
		echo "<script>
    	alert('Proses delete user sukses');
    	window.location.href='?page=master_user';
	 </script>";


	}else{
		echo "<script>
    	alert('Proses delete user gagal, Coba lagi !!!');
    	history.back();
	 </script>";
	}
}


?>