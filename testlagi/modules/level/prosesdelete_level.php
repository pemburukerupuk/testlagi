<?php if($_SESSION['level'] != 'Administrator'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{
	require_once '../cores/db_function.php';
	$db = new Db_Function();

	$idlevel = $_GET['id'];
	$level = $_GET['level'];

	$deletelevel = $db->removeLevel($idlevel);
	
	if($deletelevel){	
		echo "<script>
	    	alert('Proses delete level sukses');
	    	window.location.href='?page=master_level';
		 </script>";
	}else{
		echo "<script>
    	alert('Proses delete level gagal, Coba lagi !!!');
    	history.back();
	 </script>";
	}
}


?>