<?php
	session_start();
	require_once 'cores/db_function.php';
	$db = new DB_Function();

	if (!isset($_SESSION['user_session'])) {
	 	header("Location: index.php");
	}elseif (isset($_SESSION['userSession'])!="") {
	 	header("Location: modules/index.php");
	}

	if (isset($_GET['logout'])) {
		 session_destroy();
		 unset($_SESSION['user_session']);
		 header("Location: index.php");
	}

?>