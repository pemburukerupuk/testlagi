<?php if($_SESSION['level'] != 'Data Warehouse'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{

	require_once '../cores/db_function.php';
	$db = new Db_Function();
	$barcode = $_POST['barcode'];
	$title = $_POST['title'];
	$sendpassword = $_POST['sendpassword'];
	$iduser = $_POST['iduser'];
	

	$checkbarcode = $db->isBarcodeExisted($barcode);
	if($checkbarcode){
		echo "<script>
	        	alert('Barcode sudah digunakan, Coba Lagi !!!');
	        	history.back();
	    	 </script>";
	}else{
		if(isset($_FILES["file"])){
			$allowedExts = array("pdf");
			$temp = explode(".", $_FILES["file"]["name"]);
			$extension = end($temp);

			if ($_FILES["file"]["error"] > 0) {
				echo "<script>
		        	alert('Kesalahan membuka file, Coba Lagi !!!');
		        	history.back();
		    	 </script>";
			}elseif( $_FILES["file"]["type"] != "application/pdf" && !in_array($extension, $allowedExts)) {	
				echo "<script>
		        	alert('Type file tidak diizinkan, Coba Lagi !!!');
		        	history.back();
		    	 </script>";
			}elseif ($_FILES["file"]["size"] > 49000000) {
				echo "<script>
		        	alert('Size file harus dibawah 50 MB, Coba Lagi !!!');
		        	history.back();
		    	 </script>";
			}else{
				
				$getnamefile = $_FILES['file']['name'];
				$tmp_file = $_FILES['file']['tmp_name'];


				$namefile = date('d-m-Y')."_".$getnamefile;
				$result = $db->showUserById($iduser);
				$email = $result['email'];
				$locfile = "../file storage/".$email."/".$namefile;
				$check = move_uploaded_file($tmp_file, $locfile);
				if($check){
					$iduser_owner = $iduser;
					$insert = $db->insertFile($barcode, $title, $namefile, $sendpassword, $iduser_owner);
					if ($insert) {
						$barcode = $_POST['barcode'];
						$getidfile = $db->showFileByBarcode($barcode);
						$idfile = $getidfile['idfile'];
						echo "<script>
					        	alert('Tambah file sukses, Manage Share Now');
					        	window.location.href='?page=w_tambah_share&id=$idfile';
					    	 </script>";
					}else{
						echo "<script>
				        	alert('Tambah file gagal, Coba Lagi !!!');
				        	history.back();
				    	 </script>";
					}
				}
			}	
		}else{
			echo "<script>
		        	alert('Gagal mengambil file, Coba Lagi !!!');
		        	history.back();
		    	 </script>";
		}
	}
}
		
?>