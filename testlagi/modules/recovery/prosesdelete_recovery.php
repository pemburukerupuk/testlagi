<?php
if($_SESSION['level'] != 'Administrator'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{

	require_once '../cores/db_function.php';
	$db = new Db_Function();
	$idrecovery = $_GET['id'];
	$idtransaction = $_GET['idtransaction'];

	$remove = $db->removeRecovery($idrecovery);
	if($remove){

		echo "<script>
    	alert('Proses delete recovery sukses');
    	window.location.href='?page=master_recovery&id=$idtransaction';
	 </script>";

	 		
	}else{
		echo "<script>
    	alert('Proses delete perusahaan gagal, Coba lagi !!!');
    	history.back();
	 </script>";
	}
}


?>