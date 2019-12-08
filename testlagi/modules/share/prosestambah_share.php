<?php if($_SESSION['level'] != 'Administrator'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{

	require_once '../cores/db_function.php';
	$db = new Db_Function();
	$idfile = $_GET['id'];

	
	$result = $db->showShareByIdFile($idfile);
	
	$getidusershare = array();
	while($data = $result->fetch_array()){
		$getidusershare[] = $data['iduser_share'];
	}
	$result1 = count($getidusershare);

	$iduser = $_POST['idusertoshare'];


	$length = count($iduser);

	$allresult = $result1+$length;

	if($allresult < 3){
	    	echo "<script>
	        	alert('Minimal share 3 orang, Coba Lagi !!!');
	        	history.back();
	    	 </script>";
	}else{
		$queries = array();
		for($i=0; $i < $length; $i++) {

		$numberofshare = $i+$result1+1;
		$iduser_share = $iduser[$i];

	    $queries[] = $db->insertShare($idfile, $numberofshare, $iduser_share);
		}
		if($queries){
		echo "<script>
	        	alert('Tambah share sukses');
	        	window.location.href='?page=master_share&id=$idfile';
	    	 </script>";
	    }else{
	    	echo "<script>
	        	alert('Tambah share gagal, Coba Lagi !!!');
	        	history.back();
	    	 </script>";
	    }
	}
}
		
?>