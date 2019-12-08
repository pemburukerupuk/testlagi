<?php if($_SESSION['level'] != 'Data Owner'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{

	require_once '../cores/db_function.php';
	$db = new Db_Function();
	$idfile = $_GET['id'];

	$result = $db->showShareByIdFile($idfile);


	$idshare = array();
	$iduser_share = array();
	$numberofshare = array();
	while($data = $result->fetch_array()){
		$idshare[] = $data['idshare'];
		$iduser_share[] = $data['iduser_share'];
		$numberofshare[] = $data['numberofshare'];
	}

	$number = count($idshare);
	$ids = $idshare;
	$idus = $iduser_share;
	$nos = $numberofshare;

	
	$secret = $_POST['password'];

    $quorum = 3;

    $parts = $db->share($secret, $number, $quorum, $idfile);
    
    	$queries = array();
		for($i=0; $i < $number; $i++) {

		$kunci 		 	= $parts[$i];
		$idshare         = $ids[$i];
		$iduser_share	= $idus[$i];
		$numberofshare	= $nos[$i];
	    $queries[] 		= $db->updateShareWithIdShare($kunci, $idshare, $iduser_share, $numberofshare);  

		}

		if($queries){
		echo "<script>
	        	alert('Security key share file sukses');
	        	window.location.href='?page=o_master_file';
	    	 </script>";
	    }else{
	    	echo "<script>
	        	alert('Security key share gagal, Coba Lagi !!!');
	        	history.back();
	    	 </script>";
	    }
	}
?>
	
