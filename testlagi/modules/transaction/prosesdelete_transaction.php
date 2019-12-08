<?php if($_SESSION['level'] != 'Administrator'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{

	require_once '../cores/db_function.php';
	$db = new Db_Function();

	$idtransaction = $_GET['id'];

	$delete= $db->removeTransaction($idtransaction);
	
	if($delete){	
		echo "<script>
	    	alert('Proses delete transaksi sukses');
	    	window.location.href='?page=master_transaction';
		 </script>";
	}else{
		echo "<script>
    	alert('Proses delete transaksi gagal, Coba lagi !!!');
    	history.back();
	 </script>";
	}
}


?>