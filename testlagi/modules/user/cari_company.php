<option value="" selected disabled>Choose Option</option>
<?php
	require_once '../../cores/db_function.php';
	$db = new Db_Function();
	$idlevel = $_POST['id'];
	$result = $db->showCompanyByIdLevel($idlevel);
	 while($data = $result->fetch_array()){
?>
<option value="<?php echo $data['idcompany']; ?>"><?php echo $data['company']; ?></option>
<?php
	}
?>