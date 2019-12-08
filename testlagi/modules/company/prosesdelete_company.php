<?php if($_SESSION['level'] != 'Administrator'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{

	require_once '../cores/db_function.php';
	$db = new Db_Function();
	$idcompany = $_GET['id'];

	$perusahaan = $db->removeCompany($idcompany);
	if($perusahaan){

		echo "<script>
    	alert('Proses delete perusahaan sukses');
    	window.location.href='?page=master_company';
	 </script>";

	 		
	}else{
		echo "<script>
    	alert('Proses delete perusahaan gagal, Coba lagi !!!');
    	history.back();
	 </script>";
	}
}

?>