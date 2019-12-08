<?php
	class Db_Connect{
		private $connect;

		public function connect(){
			require_once 'config.php';
			$this->con = new mysqli(db_host, db_user, db_pass, db_name);
			return $this->con;
		}
	}
?>