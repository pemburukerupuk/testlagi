<?php if($_SESSION['level'] != 'Administrator'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{

	require_once '../cores/db_function.php';
	$db = new Db_Function();
	$idfile = $_GET['id'];
	$barcode = $_POST['newbarcode'];
	$title = $_POST['title'];
	$sendpassword = $_POST['sendpassword'];


	if(isset($_POST['ubahbarcode'])){
		$checkbarcode = $db->isBarcodeExisted($barcode);
		if($checkbarcode){
		echo "<script>
	        	alert('Barcode sudah digunakan, Coba Lagi !!!');
	        	history.back();
	    	 </script>";
		}else{
			$update = $db->updateFileWithBarcode($barcode, $title, $sendpassword, $idfile);
			if($update){
				echo "<script>
			        	alert('Update file with barcode sukses');
			        	window.location.href='?page=master_file';
			    	 </script>";
			}else{
				echo "<script>
		        	alert('Update file with barcode gagal, Coba Lagi !!!');
		        	history.back();
		    	 </script>";
			}
		}	
	}else{
		$update1 = $db->updateFileWOBarcode($title, $sendpassword, $idfile);
			if($update1){
					echo "<script>
			        	alert('Update file without barcode sukses');
			        	window.location.href='?page=master_file';
			    	 </script>";
			}else{
				echo "<script>
		        	alert('Update file without barcode gagal, Coba Lagi !!!');
		        	history.back();
		    	 </script>";
			}
	}
}
?>