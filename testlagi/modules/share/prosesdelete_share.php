<?php if($_SESSION['level'] != 'Administrator'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{

	require_once '../cores/db_function.php';
	$db = new Db_Function();

	$idshare = $_GET['id'];
	$result = $db->showShareById($idshare);
	$idshare= $result['idshare'];

	$idfile = $result['idfile'];
	$result1 = $db->showShareByIdFile($idfile);
	
	$getidusershare = array();
	while($data = $result1->fetch_array()){
		$getidusershare[] = $data['iduser_share'];
	}
	$result2 = count($getidusershare);

	if($result2 <= 3){
		echo "<script>
	    	alert('Minimal sisa share 3 orang, tidak bisa dihapus !!!');
	    	history.back();
		 </script>";
	}else{
		$delete = $db->removeShare($idshare);
		if($delete){
			echo "<script>
	    	alert('Proses delete share sukses');
	    	window.location.href='?page=master_share&id=$idfile';
		 </script>";
		}else{
			echo "<script>
	    	alert('Proses delete share gagal, Coba lagi !!!');
	    	history.back();
		 </script>";
		}
	}
}
?>