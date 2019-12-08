<?php if($_SESSION['level'] != 'Data Owner'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{

	require_once '../cores/db_function.php';
	$db = new Db_Function();
	$idrecovery	= $_GET['id'];
	$idfile 		= $_GET['idfile'];

	$result = $db->showRecoveryById($idrecovery);
	$iduser_recovery = $result['iduser_recovery'];
	$kunci_recovery = $result['kunci_recovery'];
	$idtransaction = $result['idtransaction'];

	$kunci_recovery = $_POST['kunci'];
	$password	= $_POST['passlogin'];

	$checkPassword = $db->checkPassword($iduser_recovery, $password);
	if($checkPassword == FALSE){
		echo "<script>
        	alert('Ini bukan anda ??? Jika anda, Masukkan password dengan benar !!!');
        	history.back();
    	 </script>";
	}else{
		$checkKunci = $db->checkKunciWithIduserOwnerAndIdFile($kunci_recovery, $iduser_recovery, $idfile);

		if($checkKunci == FALSE){
			echo "<script>
	        	alert('Key yang dimasukkan salah, Coba Lagi !!!');
	        	history.back();
	    	 </script>";
		}else{

			$editRecovery = $db->updateRecoveryWithIdRecovery($kunci_recovery, $idrecovery);
			if($editRecovery){
				echo "<script>
			    	alert('Proses edit recovery sukses');
			    	window.location.href='?page=o_master_recovery&id=$idtransaction';
				 </script>";
			}else{
				echo "<script>
	        	alert('Proses recovery gagal, Coba lagi !!!');
	        	history.back();
	    	 </script>";
			}
		}
	}

	}	
?>