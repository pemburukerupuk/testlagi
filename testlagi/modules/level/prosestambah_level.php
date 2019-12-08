<?php if($_SESSION['level'] != 'Administrator'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{
	require_once '../cores/db_function.php';
	$db = new Db_Function();

	$level = $_POST['level'];

	$checklevel = $db->isLevelExisted($level);	
	if($checklevel){
		echo "<script>
        	alert('Level sudah ada, Coba Lagi !!!');
        	history.back();
    	 </script>"; 
        
	}else{
	
		$level = $db->insertLevel($level);

		if($level){
			echo "<script>
		    	alert('Proses tambah level sukses');
		    	window.location.href='?page=master_level';
			 </script>";
		}else{
			echo "<script>
        	alert('Proses tambah level gagal, Coba lagi !!!');
        	history.back();
    	 </script>";
		}
	}
}

?>