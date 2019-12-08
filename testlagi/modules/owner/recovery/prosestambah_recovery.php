<?php if($_SESSION['level'] != 'Data Owner'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{

	require_once '../cores/db_function.php';
	$db = new Db_Function();
	$idtransaction 	= $_GET['id'];
	$result1 = $db->showTransactionById($idtransaction);
	$idfile = $result1['idfile'];
	$iduser_recovery= $_GET['iduser'];
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
			$checkRecovery = $db->checkRecoveryWithIdTransactionAndIdUserOwner($idtransaction, $iduser_recovery);
			if($checkRecovery){
				echo "<script>
		        	alert('Anda sudah merecovery transaksi ini');
		        	window.location.href='?page=o_master_recovery&id=$idtransaction';
		    	 </script>"; 
			}else{

				$result = $db->showRecoveryByIdTransaction($idtransaction);
				$getiduserrecovery = array();
				while($data = $result->fetch_array()){
					$getiduserrecovery[] = $data['numberofrecovery'];
				}
				$numberofrecovery = count($getiduserrecovery)+1;

				$insertRecovery = $db->insertRecovery($idtransaction, $iduser_recovery, $numberofrecovery, $kunci_recovery);
				if($insertRecovery){
					echo "<script>
				    	alert('Proses recovery sukses');
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


	
}
?>