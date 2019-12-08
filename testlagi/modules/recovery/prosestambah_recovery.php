<?php if($_SESSION['level'] != 'Administrator'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{

	require_once '../cores/db_function.php';
	$db = new Db_Function();
	$idtransaction 	= $_GET['id'];
	$idfile 		= $_GET['idfile'];
	$iduser_recovery= $_POST['iduser'];
	$kunci_recovery = $_POST['kunci'];


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
	        	alert('User sudah merecovery transaksi, Coba Lagi !!!');
	        	history.back();
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
			    	alert('Proses tambah recovery sukses');
			    	window.location.href='?page=master_recovery&id=$idtransaction';
				 </script>";
			}else{
				echo "<script>
	        	alert('Proses tambah recovery gagal, Coba lagi !!!');
	        	history.back();
	    	 </script>";
			}
		}
	}	
}
?>