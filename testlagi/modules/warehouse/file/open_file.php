<?php if($_SESSION['level'] != 'Data Warehouse'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{

	require_once '../cores/db_function.php';
	$db = new Db_Function();
	$idtransaction = $_GET['id'];
	$result = $db->showTransactionById($idtransaction);
	$idfile = $result['idfile'];
	$result1 = $db->showFileById($idfile);
	$title = $result1['title'];
	$iduser = $result1['iduser_owner'];
	$pathfile = $result1['pathfile'];
	$result2 = $db->showUserById($iduser);
	$email = $result2['email'];

	$path = "../file storage/".$email."/".$pathfile;


?>
<div class="col-md-12 col-sm-12 col-xs-12">
  <div class="x_panel">
	<embed src="<?php echo $path; ?>#toolbar=0&navpanes=0&scrollbar=0" type="application/pdf" width="100%" height="600px" />
  </div>
</div>
<?php
}
?>