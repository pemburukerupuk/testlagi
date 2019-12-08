<?php if($_SESSION['level'] != 'Data Warehouse'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{


	require_once '../cores/db_function.php';
	$db = new Db_Function();

	$idfile = $_GET['id'];

	//delete folder email
	$result = $db->showFileById($idfile);
	$pathfile = $result['pathfile'];
	$iduser = $result['iduser_owner'];
	$result1 = $db->showUserById($iduser);
	$email = $result1['email'];
	$removeFile = "../file storage/".$email."/".$pathfile;
	//end delete
	if(unlink($removeFile)){
		$delete = $db->removeFile($idfile);
		if($delete){
			echo "<script>
	    	alert('Proses delete file sukses');
	    	window.location.href='?page=w_master_file';
		 </script>";
		}else{
			echo "<script>
	    	alert('Proses delete file gagal, Coba lagi !!!');
	    	history.back();
		 </script>";
		}
	}else{
		echo "<script>
	    	alert('Proses delete file gagal, Coba lagi !!!');
	    	history.back();
		 </script>";
	}
}
?>