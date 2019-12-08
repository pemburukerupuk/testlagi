<?php if($_SESSION['level'] != 'Administrator'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{

	require_once '../cores/db_function.php';
	$db = new Db_Function();
	$idcompany = $_GET['id'];
	$address = $_POST['address'];
	$noextension = $_POST['noextension'];
	$idlevel = $_POST['idlevel'];

	if(isset($_POST['ubahnamacompany'])){
		$company = $_POST['newcompany'];
		$checknewcompany = $db->isCompanyExisted($company);	
		if($checknewcompany){
			echo "<script>
	        	alert('Nama perusahaan sudah ada, Coba Lagi !!!');
	        	history.back();
	    	 </script>"; 
	        
		}else{

			$company = $db->updateCompanyWithNama($company, $address, $noextension, $idlevel, $idcompany);

			if($company){
				echo "<script>
	        	alert('Proses update perusahaan dengan nama perusahaan sukses');
	        	window.location.href='?page=master_company';
	    	 	</script>";
	    		

			}else{
				echo "<script>
	        	alert('Proses update perusahaan dengan nama perusahaan gagal, Coba lagi !!!');
	        	history.back();
	    	 </script>";
			}
		}
	}else{

		$company1 = $db->updatecompanyWONama($address, $noextension, $idlevel, $idcompany);
		if($company1){
			echo "<script>
        	alert('Proses update perusahaan tanpa nama perusahaan sukses');
        	window.location.href='?page=master_company';
    	 </script>";
		}else{
			echo "<script>
        	alert('Proses update perusahaan tanpa nama perusahaan gagal, Coba lagi !!!');
        	history.back();
    	 </script>";
		}
	}
}
?>