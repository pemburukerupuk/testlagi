<?php if($_SESSION['level'] != 'Administrator'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{

	require_once '../cores/db_function.php';
	$db = new Db_Function();
	$idtransaction 	= $_GET['idtransaction'];
	$idfile 		= $_GET['idfile'];
	$iduser_recovery= $_GET['iduser'];
	$kunci_recovery = $_POST['kunci'];
	$idrecovery = $_GET['id'];


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
		    	window.location.href='?page=master_recovery&id=$idtransaction';
			 </script>";
		}else{
			echo "<script>
        	alert('Proses recovery gagal, Coba lagi !!!');
        	history.back();
    	 </script>";
		}
	}	
}
?>