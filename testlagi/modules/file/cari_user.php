<option value="" selected disabled>Choose Option</option>
<?php
	require_once '../../cores/db_function.php';
	$db = new Db_Function();
	$idcompany = $_POST['idcompany'];
	$result = $db->showUserByIdCompany($idcompany);
	 while($data = $result->fetch_array()){
?>
<option value="<?php echo $data['iduser']; ?>"><?php echo $data['email']; ?></option>
<?php
	}
?>