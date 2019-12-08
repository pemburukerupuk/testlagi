<?php
	$password = $_POST['password'];
	require_once '../cores/db_function.php';
	$db = new Db_Function();
	$secret = $_POST['password'];
	$number = 5;
	$quorum = 4;
	$idfile = 0; //dummy
	$parts = $db->share($secret, $number, $quorum=NULL, $idfile);
	echo "Chipper Code yang dibagikan : ";
	echo "<pre>";
	print_r($parts);
	echo "</pre>";

	$bahan = array();
	$bahan1 = count($parts);
	for ($i=0; $i < $bahan1-1; $i++) { 
		
		$bahan[] = $parts[$i];
		
	}
	echo "Chipper Code yang digunakan : ";
	echo "<pre>";
	print_r($bahan);
	echo "</pre>";
	

	echo "<pre>";
	echo "Secret Semula : " . $db->recover(array_slice($parts,0,$quorum),$idfile);
	echo "</pre>";
?>