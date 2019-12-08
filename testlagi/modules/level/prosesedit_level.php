<?php if($_SESSION['level'] != 'Administrator'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{
	require_once '../cores/db_function.php';
	$db = new Db_Function();
	$idlevel = $_GET['id'];

	$level = $_POST['newlevel'];
	
	$checklevel = $db->isLevelExisted($level);	
	if($checklevel){
		echo "<script>
        	alert('Level sudah ada, Coba Lagi !!!');
        	history.back();
    	 </script>"; 
        
	}else{
		
		$user = $db->updateLevel($level, $idlevel);
		if($user){

		echo "<script>
        	alert('Proses update level sukses');
        	window.location.href='?page=master_level';
    	 </script>";

		}else{
			echo "<script>
        	alert('Proses update level gagal, Coba lagi !!!');
        	history.back();
    	 </script>";
		}
	}
}
?>