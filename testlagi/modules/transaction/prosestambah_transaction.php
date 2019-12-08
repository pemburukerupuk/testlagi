<?php if($_SESSION['level'] != 'Administrator'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{

	require_once '../cores/db_function.php';
	$db = new Db_Function();
	
	$idfile = $_POST['idfile'];
	$iduser_req = $_POST['iduser'];

	date_default_timezone_set('Asia/Jakarta');				
	$transactioncode = "PO-".date('Ymd')."_".$idfile."_".$iduser_req;


	$checktransaction= $db->isCodeTransactionExisted($transactioncode);
	if($checktransaction){
		echo "<script>
	        	alert('Kode Transaksi sudah ada, Coba Lagi !!!');
	        	history.back();
	    	 </script>";
	}else{
		$insert = $db->insertTransaction($transactioncode, $idfile, $iduser_req);
		if ($insert) {
			echo "<script>
		        	alert('Tambah transaksi sukses');
		        	window.location.href='?page=master_transaction';
		    	 </script>";
		}else{
			echo "<script>
	        	alert('Tambah transaksi gagal, Coba Lagi !!!');
	        	history.back();
	    	 </script>";
		}
	}
}
		
		
?>