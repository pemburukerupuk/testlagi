<?php
	class Db_Function{
		private $con;

		function __construct(){
			require_once 'db_connect.php';
			$db = new Db_Connect();
			$this->con = $db->connect();
		}

		function __destruct(){

		}

		//start crud folder

	    public function addpathUser($pathUser){
			if(!is_dir($pathUser)){
				mkdir($pathUser);
			}

			return NULL;
		}

		public function editpathUser($pathOldUser, $pathNewUser){
		
			rename($pathOldUser, $pathNewUser);

			return NULL;
		}

		public function deletepathUser($removePathUser){
		 	

		    if (substr($removePathUser, strlen($removePathUser) - 1, 1) != '/') {
		        $removePathUser .= '/';
		    }
		    $files = glob($removePathUser . '*', GLOB_MARK);
		    foreach ($files as $file) {
		        if (is_dir($file)) {
		            self::deletepathUser($file);
		        } else {
		            unlink($file);
		        }
		    }
		    rmdir($removePathUser);
		    return NULL;
	    }
	    //end crud folder

	    

	    //Start Register - Login
		public function hashSSHA($password){
			$salt = sha1(rand());
			$salt = substr($salt, 0, 11);
			$encrypted = base64_encode(sha1($password . $salt, true) . $salt);
			$hash = array("salt" => $salt, "encrypted" => $encrypted);
			return $hash;
		}
		public function checkhashSSHA($salt, $password){
			$hash = base64_encode(sha1($password . $salt, true) . $salt);
			return $hash;
		}
		public function registerUser($username, $email, $password){
			$hash = $this->hashSSHA($password);
			$encrypted_password = $hash["encrypted"];
			$salt = $hash["salt"];
			$info = "Pending";
			$stmt = $this->con->prepare("INSERT INTO tb_user(username, email, encrypted_password, salt, info, date_at) VALUES (?,?,?,?,?, NOW()) ");
			$stmt->bind_param('sssss', $username, $email, $encrypted_password, $salt, $info);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}
		public function isEmailExisted($email){
			$stmt = $this->con->prepare("SELECT email FROM tb_user WHERE email = ? ");
			$stmt->bind_param('s', $email);
			$stmt->execute();
			$stmt->store_result();
			$numRows = $stmt->num_rows;
			if($numRows > 0){
				//user existed
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}
		public function loginUser($email, $password){
			$stmt = $this->con->prepare("SELECT DISTINCT * FROM tb_user LEFT JOIN tb_company ON 
										tb_user.idcompany = tb_company.idcompany LEFT JOIN tb_level ON tb_company.idlevel = tb_level.idlevel WHERE email = ? AND info = 'Active' ");
			$stmt->bind_param('s', $email);
			if($stmt->execute()){
				$user = $stmt->get_result()->fetch_assoc();
				$stmt->close();

				$salt = $user['salt'];
				$encrypted_password = $user['encrypted_password'];
				$hash = $this->checkhashSSHA($salt, $password);

				if($encrypted_password == $hash){
					session_start();
					$_SESSION['user_session'] = $user['iduser'];
					$_SESSION['iduser'] = $user['iduser'];
					$_SESSION['username'] = $user['username'];
					$_SESSION['email'] = $user['email'];
					$_SESSION['level'] = $user['level'];
					$_SESSION['idcompany'] = $user['idcompany'];
					return $user;
				}
			}else{
				return FALSE;
			}
		}
		//End (Status = Done)

		//Start Level
		public function showLevel(){
			$stmt = $this->con->prepare("SELECT * FROM tb_level");
			if($stmt->execute()){
				$result = $stmt->get_result();
				$stmt->close();
				return $result;
			}
		}
		public function showLevelById($idlevel){
			$stmt = $this->con->prepare("SELECT * FROM tb_level WHERE idlevel = ? ");
			$stmt->bind_param('i', $idlevel);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$data = $result->fetch_array();
				$stmt->close();
				return $data;
			}
		}
		public function showLogLevelByIdLevel($idlevel){
			$stmt = $this->con->prepare("SELECT * FROM tb_loglevel LEFT JOIN tb_user ON tb_loglevel.updated_by=tb_user.iduser WHERE idlevel = ? ORDER BY updated_at DESC ");
			$stmt->bind_param('i', $idlevel);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$stmt->close();
				return $result;
			}
		}
		public function insertLevel($level){
			$iduser = $_SESSION['iduser'];
			$stmt = $this->con->prepare("INSERT INTO tb_level(level, iduser_by, date_at) VALUES (?, $iduser, NOW())");
			$stmt->bind_param('s', $level);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}
		public function updateLevel($level, $idlevel){
			$iduser = $_SESSION['iduser'];
			$stmt = $this->con->prepare("UPDATE tb_level SET level = ?, iduser_by=$iduser, date_at=NOW() WHERE idlevel = ?");
			$stmt->bind_param('si', $level, $idlevel);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}
		public function removeLevel($idlevel){
			$stmt = $this->con->prepare("DELETE FROM tb_level WHERE idlevel = ?");
			$stmt->bind_param('i', $idlevel);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}
		public function isLevelExisted($level){
			$stmt = $this->con->prepare("SELECT level FROM tb_level WHERE level = ? ");
			$stmt->bind_param('s', $level);
			$stmt->execute();
			$stmt->store_result();
			$numRows = $stmt->num_rows;
			if($numRows > 0){
				//level existed
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}
		//End (Status = Done)

		//Start Company
		public function showCompany(){
			$stmt = $this->con->prepare("SELECT * FROM tb_company");
			if($stmt->execute()){
				$result = $stmt->get_result();
				$stmt->close();
				return $result;
			}
		}

		public function showCompanyById($idcompany){
			$stmt = $this->con->prepare("SELECT * FROM tb_company WHERE idcompany = ? ");
			$stmt->bind_param('s', $idcompany);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$data = $result->fetch_array();
				$stmt->close();
				return $data;
			}
		}

		public function showCompanyByIdLevel($idlevel){
			$stmt = $this->con->prepare("SELECT * FROM tb_company WHERE idlevel = ? ");
			$stmt->bind_param("i", $idlevel);
			$stmt->execute();
			$result = $stmt->get_result();
			$stmt->close();
			return $result;
		}

		public function showLogCompanyByIdCompany($idcompany){
			$stmt = $this->con->prepare("SELECT a.idcompany, a.note, a.company, a.address, a.noextension, a.updated_by, a.updated_at, b.iduser, b.username FROM tb_logcompany AS a 
				LEFT JOIN tb_user AS b ON a.updated_by=b.iduser WHERE a.idcompany = ? ORDER BY a.updated_at DESC");
			$stmt->bind_param('i', $idcompany);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$stmt->close();
				return $result;
			}
		}

		public function insertCompany($company, $address, $noextension, $idlevel){
			$iduser = $_SESSION['iduser'];
			$stmt = $this->con->prepare("INSERT INTO tb_company(company, address, noextension, idlevel, iduser_by, date_at) VALUES (?,?,?,?, $iduser, NOW())");
			$stmt->bind_param("sssi", $company, $address, $noextension, $idlevel);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function updateCompanyWithNama($newcompany, $address, $noextension, $idlevel, $idcompany){
			$iduser = $_SESSION['iduser'];
			$stmt = $this->con->prepare("UPDATE tb_company SET company=?, address=?, noextension=?, idlevel=?, iduser_by=$iduser, date_at=NOW()  WHERE idcompany = ?");
			$stmt->bind_param("sssii", $newcompany, $address, $noextension, $idlevel, $idcompany);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function updateCompanyWONama($address, $noextension, $idlevel, $idcompany){
			$iduser = $_SESSION['iduser'];
			$stmt = $this->con->prepare("UPDATE tb_company SET address=?, noextension=?, idlevel=?, iduser_by=$iduser, date_at=NOW()  WHERE idcompany = ?");
			$stmt->bind_param("ssii", $address, $noextension, $idlevel, $idcompany);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function removeCompany($idcompany){
			$stmt = $this->con->prepare("DELETE FROM tb_company WHERE idcompany = ?");
			$stmt->bind_param("i", $idcompany);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function isCompanyExisted($company){
			$stmt = $this->con->prepare("SELECT company FROM tb_company WHERE company = ? ");
			$stmt->bind_param('s', $company);
			$stmt->execute();
			$stmt->store_result();
			$numRows = $stmt->num_rows;
			if($numRows > 0){
				//company existed
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}
		//End (Status = Done)

		//Start User
		public function insertUser($username, $email, $password, $idcompany, $info){
			$iduser = $_SESSION['iduser'];
			$hash = $this->hashSSHA($password);
			$encrypted_password = $hash["encrypted"];
			$salt = $hash["salt"];

			$stmt = $this->con->prepare("INSERT INTO tb_user(username, email, encrypted_password, salt, idcompany, info, iduser_by, date_at) VALUES (?,?,?,?,?,?, $iduser, NOW()) ");
			$stmt->bind_param('ssssis', $username, $email, $encrypted_password, $salt, $idcompany, $info);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function showUser(){
			$stmt = $this->con->prepare("SELECT * FROM tb_user ORDER BY email");
			if($stmt->execute()){
				$result = $stmt->get_result();
				$stmt->close();
				return $result;
			}
		}

		public function showUserById($iduser){
			$stmt = $this->con->prepare("SELECT * FROM tb_user WHERE iduser = ? ");
			$stmt->bind_param('i', $iduser);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$data = $result->fetch_array();
				$stmt->close();
				return $data;
			}
		}

		public function showLogUserByIdUser($iduser){
			$stmt = $this->con->prepare("SELECT a.iduser, a.note, a.email, a.username, a.info, a.updated_by, a.updated_at, b.iduser, a.idcompany FROM tb_loguser AS a RIGHT JOIN tb_user AS b ON a.updated_by=b.iduser WHERE a.iduser = ? ORDER BY a.updated_at DESC ");
			$stmt->bind_param('i', $iduser);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$stmt->close();
				return $result;
			}
		}

		public function showLogUserByIdAdministrator($iduser){
			$stmt = $this->con->prepare("SELECT * FROM tb_loguser WHERE iduser = ? ORDER BY updated_at DESC ");
			$stmt->bind_param('i', $iduser);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$stmt->close();
				return $result;
			}
		}

		public function showUserByIdCompany($idcompany){
			$stmt = $this->con->prepare("SELECT * FROM tb_user WHERE idcompany = ? ");
			$stmt->bind_param("i", $idcompany);
			$stmt->execute();
			$result = $stmt->get_result();
			$stmt->close();
			return $result;
		}

		public function updateUserWithEmail($email, $username, $password, $info, $idcompany, $iduser){
			$iduser_by = $_SESSION['user_session'];
			$hash = $this->hashSSHA($password);
			$encrypted_password = $hash["encrypted"];
			$salt = $hash["salt"];

			$stmt = $this->con->prepare("UPDATE tb_user SET email=?, username=?, encrypted_password=?, salt=?, info=?, idcompany=?,
				iduser_by=$iduser_by, date_at=NOW() WHERE iduser = ?");
			$stmt->bind_param("sssssii", $email, $username, $encrypted_password, $salt, $info, $idcompany, $iduser);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function updateUserWOEmail($username, $password, $info, $idcompany, $iduser){
			$iduser_by = $_SESSION['user_session'];
			$hash = $this->hashSSHA($password);
			$encrypted_password = $hash["encrypted"];
			$salt = $hash["salt"];

			$stmt = $this->con->prepare("UPDATE tb_user SET username=?, encrypted_password=?, salt=?, info=?, idcompany=?, 
				iduser_by=$iduser_by, date_at=NOW()  WHERE iduser = ?");
			$stmt->bind_param("ssssii", $username, $encrypted_password, $salt, $info, $idcompany, $iduser);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function removeUser($iduser){
			$stmt = $this->con->prepare("DELETE FROM tb_user WHERE iduser = ?");
			$stmt->bind_param("i", $iduser);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}
		//End (Status = Done)

		//Start File
		public function showFile(){
			$stmt = $this->con->prepare("SELECT * FROM tb_file");
			if($stmt->execute()){
				$result = $stmt->get_result();
				$stmt->close();
				return $result;
			}
		}

		public function showLogFileByIdFile($idfile){
			$stmt = $this->con->prepare("SELECT * FROM tb_logfile LEFT JOIN tb_user ON tb_logfile.updated_by=tb_user.iduser WHERE idfile = ? ORDER BY updated_at DESC ");
			$stmt->bind_param('i', $idfile);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$stmt->close();
				return $result;
			}
		}

		public function showFileById($idfile){
			$stmt = $this->con->prepare("SELECT * FROM tb_file WHERE idfile = ? ");
			$stmt->bind_param('i', $idfile);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$data = $result->fetch_array();
				$stmt->close();
				return $data;
			}
		}

		public function showFileByIdShare($idshare){
			$stmt = $this->con->prepare("SELECT * FROM tb_share WHERE idfile = ? ");
			$stmt->bind_param("i", $idshare);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$data = $result->fetch_array();
				$stmt->close();
				return $data;
			}
		}

		public function showFileByBarcode($barcode){
			$stmt = $this->con->prepare("SELECT idfile, barcode FROM tb_file WHERE barcode = ? ");
			$stmt->bind_param("s", $barcode);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$data = $result->fetch_array();
				$stmt->close();
				return $data;
			}
		}

		public function showFileByIdUser($iduser_owner){
			$stmt = $this->con->prepare("SELECT * FROM tb_file WHERE iduser_owner = ?");
			$stmt->bind_param('i', $iduser_owner);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$stmt->close();
				return $result;
			}
		}

		public function showFileByIdUserAndSendPassword($iduser_owner, $sendpassword){
			$stmt = $this->con->prepare("SELECT * FROM tb_file WHERE iduser_owner = ? AND sendpassword = ? ");
			$stmt->bind_param('is', $iduser_owner, $sendpassword);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$stmt->close();
				return $result;
			}
		}

		public function insertFile($barcode, $title, $pathfile, $sendpassword, $iduser_owner){
			$iduser = $_SESSION['iduser'];
			$stmt = $this->con->prepare("INSERT INTO tb_file(barcode, title, pathfile, sendpassword, iduser_owner, iduser_by, date_at)
					VALUES (?,?,?,?,?, $iduser, NOW())");
			$stmt->bind_param('ssssi', $barcode, $title, $pathfile, $sendpassword, $iduser_owner);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function isBarcodeExisted($barcode){
			$stmt = $this->con->prepare("SELECT barcode FROM tb_file WHERE barcode = ? ");
			$stmt->bind_param('s', $barcode);
			$stmt->execute();
			$stmt->store_result();
			$numRows = $stmt->num_rows;
			if($numRows > 0){
				//user existed
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function updateFileWithBarcode($barcode, $title, $sendpassword, $idfile){
			$iduser = $_SESSION['iduser'];
			$stmt = $this->con->prepare("UPDATE tb_file SET barcode=?, title=?, sendpassword=?, iduser_by=$iduser, date_at=NOW() WHERE idfile = ?");
			$stmt->bind_param("sssi", $barcode, $title, $sendpassword, $idfile);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function updateFileWOBarcode($title, $sendpassword, $idfile){
			$iduser = $_SESSION['iduser'];
			$stmt = $this->con->prepare("UPDATE tb_file SET title=?, sendpassword=?, iduser_by=$iduser, date_at=NOW() WHERE idfile = ?");
			$stmt->bind_param("ssi", $title, $sendpassword, $idfile);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function removeFile($idfile){
			$stmt = $this->con->prepare("DELETE FROM tb_file WHERE idfile = ?");
			$stmt->bind_param("i", $idfile);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}
		//End (Status = On Progress)


		public function showShareById($idshare){
			$stmt = $this->con->prepare("SELECT * FROM tb_share WHERE idshare = ? ");
			$stmt->bind_param('i', $idshare);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$data = $result->fetch_array();
				$stmt->close();
				return $data;
			}
		}

		public function showLogShareByIdShare($idshare, $idfile){
			$stmt = $this->con->prepare("SELECT * FROM tb_logshare LEFT JOIN tb_user ON tb_logshare.updated_by=tb_user.iduser WHERE idshare= ? AND idfile=? ORDER BY updated_at DESC ");
			$stmt->bind_param('ii', $idshare, $idfile);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$stmt->close();
				return $result;
			}
		}

		public function showShareByIdFile($idfile){
			$stmt = $this->con->prepare("SELECT * FROM tb_share WHERE idfile = ?");
			$stmt->bind_param('i', $idfile);
			$stmt->execute();
			$result = $stmt->get_result();
			$stmt->close();
			return $result;
		}

		public function showShareByIdFileAndIdUser($idfile, $iduser_share){
			$stmt = $this->con->prepare("SELECT * FROM tb_share WHERE idfile = ? AND iduser_share = ?");
			$stmt->bind_param('ii', $idfile, $iduser_share);
			$stmt->execute();
			$result = $stmt->get_result();
			$stmt->close();
			return $result;
		}

		public function showShareByIdUser($iduser_share){
			$stmt = $this->con->prepare("SELECT * FROM tb_share LEFT JOIN tb_file on tb_share.idfile=tb_file.idfile WHERE iduser_share = ?");
			$stmt->bind_param('i', $iduser_share);
			$stmt->execute();
			$result = $stmt->get_result();
			$stmt->close();
			return $result;
		}

		public function insertShare($idfile, $numberofshare, $iduser_share){
			$iduser = $_SESSION['iduser'];
			$stmt = $this->con->prepare("INSERT INTO tb_share(idfile, numberofshare, iduser_share, iduser_by, date_at) VALUES (?,?,?, $iduser, NOW())");
			$stmt->bind_param('isi', $idfile, $numberofshare, $iduser_share);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function updateShareWithIdShare($kunci, $idshare, $iduser_share, $numberofshare){
			$iduser = $_SESSION['iduser'];
			$stmt = $this->con->prepare("UPDATE tb_share SET kunci=?, iduser_by=$iduser, date_at=NOW() WHERE idshare = ? AND iduser_share = ? AND numberofshare=?");
			$stmt->bind_param("siii", $kunci, $idshare, $iduser_share, $numberofshare);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function removeShare($idshare){
			$stmt = $this->con->prepare("DELETE FROM tb_share WHERE idshare = ?");
			$stmt->bind_param("i", $idshare);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function showTransaction(){
			$stmt = $this->con->prepare("SELECT * FROM tb_file RIGHT JOIN tb_transaction ON tb_file.idfile=tb_transaction.idfile LEFT JOIN tb_user ON tb_transaction.iduser_req=tb_user.iduser");
			if($stmt->execute()){
				$result = $stmt->get_result();
				$stmt->close();
				return $result;
			}
		}

		public function showTransactionById($idtransaction){
			$stmt = $this->con->prepare("SELECT * FROM tb_transaction WHERE idtransaction = ? ");
			$stmt->bind_param('i', $idtransaction);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$data = $result->fetch_array();
				$stmt->close();
				return $data;
			}
		}

		public function showTransactionByIdUser($iduser_req){
			$stmt = $this->con->prepare("SELECT * FROM tb_transaction WHERE iduser_req = ? ");
			$stmt->bind_param("i", $iduser_req);
			$stmt->execute();
			$result = $stmt->get_result();
			$stmt->close();
			return $result;
		}

		public function showTransactionByIdCompany($idcompany){
			$stmt = $this->con->prepare("SELECT * FROM tb_transaction LEFT JOIN tb_file ON tb_transaction.idfile=tb_file.idfile LEFT JOIN tb_user ON tb_file.iduser_owner=tb_user.iduser LEFT JOIN tb_company ON tb_user.idcompany=tb_company.idcompany WHERE tb_company.idcompany = ?");
			$stmt->bind_param('i', $idcompany);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$stmt->close();
				return $result;
			}
		}

		public function showLogTransactionByIdTransaction($idtransaction){
			$stmt = $this->con->prepare("SELECT * FROM tb_logtransaction LEFT JOIN tb_user ON tb_logtransaction.updated_by=tb_user.iduser WHERE idtransaction = ? ORDER BY updated_at DESC ");
			$stmt->bind_param('i', $idtransaction);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$stmt->close();
				return $result;
			}
		}

	    public function insertTransaction($transactioncode, $idfile, $iduser_req){
	    	$iduser = $_SESSION['iduser'];
			$stmt = $this->con->prepare("INSERT INTO tb_transaction(transactioncode, idfile, iduser_req, date_req, iduser_by, date_at) 
					VALUES (?,?,?,NOW(),$iduser,NOW())");
			$stmt->bind_param('sii', $transactioncode, $idfile, $iduser_req);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

	    public function isCodeTransactionExisted($transactioncode){
			$stmt = $this->con->prepare("SELECT transactioncode FROM tb_transaction WHERE transactioncode = ? ");
			$stmt->bind_param('s', $transactioncode);
			$stmt->execute();
			$stmt->store_result();
			$numRows = $stmt->num_rows;
			if($numRows > 0){
				//user existed
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function removeTransaction($idtransaction){
			$stmt = $this->con->prepare("DELETE FROM tb_transaction WHERE idtransaction = ?");
			$stmt->bind_param("i", $idtransaction);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function showRecoveryById($idrecovery){
			$stmt = $this->con->prepare("SELECT * FROM tb_recovery WHERE idrecovery = ? ");
			$stmt->bind_param("i", $idrecovery);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$data = $result->fetch_array();
				$stmt->close();
				return $data;
			}
		}

		public function showRecoveryByIdTransaction($idtransaction){
			$stmt = $this->con->prepare("SELECT * FROM tb_recovery WHERE idtransaction = ? ");
			$stmt->bind_param("i", $idtransaction);
			$stmt->execute();
			$result = $stmt->get_result();
			$stmt->close();
			return $result;
		}


		public function checkKunciWithIduserOwnerAndIdFile($kunci, $iduser_recovery, $idfile){
			$stmt = $this->con->prepare("SELECT * FROM tb_share WHERE kunci = ? AND iduser_share = ? AND idfile = ? ");
			$stmt->bind_param('sii', $kunci, $iduser_recovery, $idfile);
			$stmt->execute();
			$stmt->store_result();
			$numRows = $stmt->num_rows;
			if($numRows > 0){
				//kunci benar
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}


		public function insertRecovery($idtransaction, $iduser_recovery, $numberofrecovery, $kunci_recovery){
	    	$iduser = $_SESSION['iduser'];
			$stmt = $this->con->prepare("INSERT INTO tb_recovery(idtransaction, iduser_recovery, numberofrecovery, kunci_recovery, iduser_by, date_at) VALUES (?,?,?,?,$iduser,NOW())");
			$stmt->bind_param('iiss', $idtransaction, $iduser_recovery, $numberofrecovery, $kunci_recovery);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function showLogRecoveryByIdRecovery($idrecovery, $idtransaction){
			$stmt = $this->con->prepare("SELECT * FROM tb_logrecovery LEFT JOIN tb_user 
				ON tb_logrecovery.updated_by=tb_user.iduser WHERE idrecovery= ? AND idtransaction= ? ORDER BY updated_at DESC");
			$stmt->bind_param('ii', $idrecovery, $idtransaction);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$stmt->close();
				return $result;
			}
		}

		public function updateRecoveryWithIdRecovery($kunci_recovery, $idrecovery){
			$iduser = $_SESSION['iduser'];
			$stmt = $this->con->prepare("UPDATE tb_recovery SET kunci_recovery=?, iduser_by=$iduser, date_at=NOW() WHERE idrecovery = ?");
			$stmt->bind_param("si", $kunci_recovery, $idrecovery);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function checkRecoveryWithIdTransactionAndIdUserOwner($idtransaction, $iduser_recovery){
			$stmt = $this->con->prepare("SELECT * FROM tb_recovery WHERE idtransaction = ? AND iduser_recovery = ?");
			$stmt->bind_param('ii', $idtransaction, $iduser_recovery);
			$stmt->execute();
			$stmt->store_result();
			$numRows = $stmt->num_rows;
			if($numRows > 0){
				//user existed
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function checkRecoveryWithIdTransactionAndIdUserOwnerKunci($idtransaction, $iduser_recovery, $kunci_recovery){
			$stmt = $this->con->prepare("SELECT * FROM tb_recovery WHERE idtransaction = ? AND iduser_recovery = ? AND kunci_recovery = ?");
			$stmt->bind_param('iis', $idtransaction, $iduser_recovery, $kunci_recovery);
			$stmt->execute();
			$stmt->store_result();
			$numRows = $stmt->num_rows;
			if($numRows > 0){
				//user existed
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}


		public function removeRecovery($idrecovery){
			$stmt = $this->con->prepare("DELETE FROM tb_recovery WHERE idrecovery = ?");
			$stmt->bind_param("i", $idrecovery);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function countCompany(){
			$stmt = $this->con->prepare("SELECT * FROM tb_company");
			$stmt->execute();
			$stmt->store_result();
			$data = $stmt->num_rows();
			return $data;
		}

		public function countUser(){
			$stmt = $this->con->prepare("SELECT * FROM tb_user");
			$stmt->execute();
			$stmt->store_result();
			$data = $stmt->num_rows();
			return $data;
		}
		public function countFile(){
			$stmt = $this->con->prepare("SELECT * FROM tb_file");
			$stmt->execute();
			$stmt->store_result();
			$data = $stmt->num_rows();
			return $data;
		}

		public function countFileByIdCompany($idcompany){
			$stmt = $this->con->prepare("SELECT * FROM tb_file LEFT JOIN tb_user ON tb_file.iduser_owner=tb_user.iduser LEFT JOIN tb_company ON tb_user.idcompany=tb_company.idcompany WHERE tb_company.idcompany = ? ");
			$stmt->bind_param("i", $idcompany);
			$stmt->execute();
			$stmt->store_result();
			$data = $stmt->num_rows();
			return $data;
		}
		public function countFileByIdUser($iduser){
			$stmt = $this->con->prepare("SELECT * FROM tb_file LEFT JOIN tb_user ON tb_file.iduser_owner=tb_user.iduser WHERE tb_user.iduser = ? ");
			$stmt->bind_param("i", $iduser);
			$stmt->execute();
			$stmt->store_result();
			$data = $stmt->num_rows();
			return $data;
		}
		

		public function countTransaction(){
			$stmt = $this->con->prepare("SELECT * FROM tb_transaction");
			$stmt->execute();
			$stmt->store_result();
			$data = $stmt->num_rows();
			return $data;
		}
		public function countTransactionByIdCompany($idcompany){
			$stmt = $this->con->prepare("SELECT * FROM tb_transaction LEFT JOIN tb_user ON tb_transaction.iduser_req=tb_user.iduser LEFT JOIN tb_company ON tb_user.idcompany=tb_company.idcompany WHERE tb_company.idcompany = ? ");
			$stmt->bind_param("i", $idcompany);
			$stmt->execute();
			$stmt->store_result();
			$data = $stmt->num_rows();
			return $data;
		}
		public function countTransactionByIdUser($iduser){
			$stmt = $this->con->prepare("SELECT * FROM tb_transaction LEFT JOIN tb_user ON tb_transaction.iduser_req=tb_user.iduser WHERE tb_user.iduser = ? ");
			$stmt->bind_param("i", $iduser);
			$stmt->execute();
			$stmt->store_result();
			$data = $stmt->num_rows();
			return $data;
		}
		public function countShareByIdUser($iduser){
			$stmt = $this->con->prepare("SELECT * FROM tb_share LEFT JOIN tb_user ON tb_share.iduser_share=tb_user.iduser WHERE tb_user.iduser = ? ");
			$stmt->bind_param("i", $iduser);
			$stmt->execute();
			$stmt->store_result();
			$data = $stmt->num_rows();
			return $data;
		}
		public function countRecoveryByIdUser($iduser){
			$stmt = $this->con->prepare("SELECT * FROM tb_recovery LEFT JOIN tb_user ON tb_recovery.iduser_recovery=tb_user.iduser WHERE tb_user.iduser = ? ");
			$stmt->bind_param("i", $iduser);
			$stmt->execute();
			$stmt->store_result();
			$data = $stmt->num_rows();
			return $data;
		}




		public function checkIdSharesss($idfile){
			$db = new Db_Connect();
			$stmt = $db->connect()->prepare("SELECT * FROM tb_sharesss WHERE idfile = ? ");
			$stmt->bind_param('i', $idfile);
			$stmt->execute();
			$stmt->store_result();
			$numRows = $stmt->num_rows;
			if($numRows > 0){
				//kunci benar
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function removeSharesss($idfile){
			$db = new Db_Connect();
			$stmt = $db->connect()->prepare("DELETE FROM tb_sharesss WHERE idfile = ?");
			$stmt->bind_param("i", $idfile);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function insertSharesss($idfile, $coeffs1, $pangkat2, $coeffs2, $pangkat1, $variable_code, $bagian, $max, $min, $part_no, $char_no, $hasil_dec, $hasil){
		    $db = new Db_Connect();
		        
		    $stmt = $db->connect()->prepare("INSERT INTO tb_sharesss(idfile, koef1, koef1_pangkat2, koef2, koef2_pangkat1, variable_code, bagian, max, min, part_no, char_no, hasil_dec, hasil) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");
		    $stmt->bind_param('issssssssssss', $idfile, $coeffs1, $pangkat2, $coeffs2, $pangkat1, $variable_code, $bagian, $max, $min, $part_no, $char_no, $hasil_dec, $hasil);
		    $result = $stmt->execute();
		    return $result;
		}

		public function showShareSSSById($idfile, $min, $part_no, $hasil, $bagian){
			$stmt = $this->con->prepare("SELECT * FROM tb_sharesss WHERE idfile = ? AND min = ? AND part_no = ? AND hasil = ? AND bagian = ? ");
			$stmt->bind_param("issss", $idfile, $min, $part_no, $hasil, $bagian);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$stmt->close();
				return $result;
			}
		}

		public function checkIdRecoversss($idfile){
			$db = new Db_Connect();
			$stmt = $db->connect()->prepare("SELECT * FROM tb_recoversss WHERE idfile = ? ");
			$stmt->bind_param('i', $idfile);
			$stmt->execute();
			$stmt->store_result();
			$numRows = $stmt->num_rows;
			if($numRows > 0){
				//kunci benar
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}
		public function removeRecoversss($idfile){
			$db = new Db_Connect();
			$stmt = $db->connect()->prepare("DELETE FROM tb_recoversss WHERE idfile = ?");
			$stmt->bind_param("i", $idfile);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}
		public function insertRecoversss($idfile, $char_no, $r_dec, $r_koef){
		    $db = new Db_Connect();
		        
		    $stmt = $db->connect()->prepare("INSERT INTO tb_recoversss(idfile, char_no, r_dec, r_koef) VALUES (?,?,?,?)");
		    $stmt->bind_param('isss', $idfile, $char_no, $r_dec, $r_koef);
		    $result = $stmt->execute();
		    return $result;
		}
		public function showRecoverSSSById($idfile){
			$stmt = $this->con->prepare("SELECT * FROM tb_recoversss WHERE idfile = ?");
			$stmt->bind_param("i", $idfile);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$stmt->close();
				return $result;
			}
		}

		public function showRecoverSSSByIdId($idfile, $char_no, $r_dec){
			$stmt = $this->con->prepare("SELECT * FROM tb_recoversss WHERE idfile = ? AND char_no = ? AND r_dec = ?");
			$stmt->bind_param("iss", $idfile, $char_no, $r_dec);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$stmt->close();
				return $result;
			}
		}



		/**
	     * @var Q needs to be a prime > max(2^8, $number)
	     */
	    const Q = 257;
	    
	    /** 
	     * @var $_invtab Cache of the inverse table.
	     */
	    private static $_invtab;

	    private static function modq($number) {
	        $mod = $number % self::Q;
	        return ($mod < 0) ? $mod + self::Q : $mod; //if true $mod + q, false Q;
	    }    
	 
	    private static function invtab() {
	        if(!isset(self::$_invtab)) {
	            $x = $y = 1;
	            self::$_invtab = array(0=>0);
	            for($i=0; $i < self::Q; $i++) {
	                self::$_invtab[$x] = $y;
	                $x = self::modq(3 * $x);  
	                $y = self::modq(86 * $y);
	            }

	        }

	        return  self::$_invtab;
	    }

	    private static function horner($x, $coeffs) {
	        $val = 0;
	        foreach($coeffs as $c)
	            $val = self::modq($x * $val + $c);
	        return $val;

	    }
	    
	    private static function inv($i) {
	        $invtab = self::invtab();
	        return ($i < 0) ? self::modq(-$invtab[-$i]) : $invtab[$i];
	    }

	    private static function coeffs($quorum) {
	        $coeffs = array();
	        for($i=0; $i < $quorum - 1; $i++) 
	            $coeffs[] = self::modq(mt_rand(0, 65535));
	       
	        return $coeffs;
	        
	    }

	    public static function rcoeffs($key_x, $quorum) {
	        $coeffs = array();
	        for($i=0; $i < $quorum; $i++) {
	            $temp = 1;
	            for($j=0; $j < $quorum; $j++) {
	                if($i != $j) {
	                    $temp = self::modq(-$temp * $key_x[$j] * 
	                             self::inv($key_x[$i]-$key_x[$j]));
	                    
	                 //    // $key_x[$j] per bagian atas
	                 //    // $key_x[$i] per bagian bawah

	                 
	                }
	                
	             
	            }
			            
					

	            if($temp == 0) {
	                /* Repeated share. */
	                throw new Exception(
	                    "Shamir->rcoeffs(): Repeated share detected - ".
	                    "cannot compute reverse-coefficients!"
	                );
	            }
	            
	            $coeffs[] = $temp;

	        }
	        return $coeffs;
	    }

	    private static function thresh($byte, $number, $quorum) {
	        $coeffs = self::coeffs($quorum);
	        $coeffs[] = $byte;
	        $result = array();
	        for($i=0; $i < $number; $i++)
	            $result[] = self::horner($i + 1, $coeffs);  
	        
	        
	        return array($result, $coeffs); 
	        
	    }

	    public static function share($secret, $number, $quorum=NULL, $idfile) {
	    	if(self::checkIdSharesss($idfile) == TRUE){
	    		self::removeSharesss($idfile);
	    	}
	        if($number > self::Q - 1 || $number < 0) { 
	            throw new Exception(
	                "Shamir->share(): number ($number) needs to be between 0 and ".
	                (self::Q - 1) . "."
	            );
	        }

	        if(is_null($quorum)) {
	            $quorum = floor($number/2) + 1;
	        } elseif($quorum > $number) {
	            throw new Exception(
	                "Shamir->share(): Quorum ($quorum) cannot exceed number ".
	                "($number)."
	            );
	        }

	        $result = array();
	        $result2 = array();
	        foreach(unpack("C*", $secret) as $byte) {
	            $result1 = array();
	            foreach(self::thresh($byte, $number, $quorum) as $sub_result){
	                $result1[] = $sub_result; 
	            }
	            // $result[] = $result1[0]; 
	            $result[] = $result1[0]; 
	            $result2[] = $result1[1]; 
	        }   
	         
	        $query = array();
	        for ($z=0; $z < strlen($secret); $z++) { 
                $coeffs1 = $result2[$z][0];
                $coeffs2 = $result2[$z][1];
                $variable_code = $result2[$z][2];
                $min = sprintf('%02s', $quorum);
                $urutan = $z+1;
	                
	                    
                for ($y=0; $y < $number; $y++) {
                    $pangkat2 = pow($y+1,2);
                    $nilai1 = intval($coeffs1);
                    $pangkat1 = pow($y+1,1);
                    $part_no = sprintf('%02s', $y+1);
                    $nilai2 = intval($coeffs2);
                    $nilai3 = intval($variable_code);

                    $test1 = $pangkat2*$nilai1;
                    $test2 = $pangkat1*$nilai2;
                    $test3 = $nilai3;
                    $tes4 = $test1+$test2+$test3;
                    $mod   = 257;

                    $max = $number;

                	$char_no = $urutan;

                    $hasil_dec = $tes4 % $mod;
                    $bagian = "Max-".$number."-Min-".$min."-Part_No-".$part_no."-Char_No-".$char_no;
                    $hasil = sprintf('%02s', dechex($hasil_dec));
                    $query[] = self::insertSharesss($idfile, $coeffs1, $pangkat2, $coeffs2, $pangkat1, $variable_code, $bagian, $max, $min, $part_no, $char_no, $hasil_dec, $hasil);
                }       
	        } 
	        
	        $result = call_user_func_array("array_merge", $result);

	        $keys = array();
	        
	        for($i = 0; $i < $number; $i++) {
	            $key = sprintf("%02x%02x", $quorum, $i+1);
	            
	            for($j = 0; $j < strlen($secret); $j++) {
	                $key .= ($result[$j * $number + $i] == 256) ? "g0" : 
	                            sprintf("%02x", $result[$j * $number + $i]);
	            }
	            
	            $keys[] = substr($key, 0);
	        }
	        return $keys;
	    }

	   
	    public static function recover($keys, $idfile) {
	    	if(self::checkIdRecoversss($idfile) == TRUE){
	    		self::removeRecoversss($idfile);
	    	}
	        $key_x = array();
	        $key_y = array();

	        foreach($keys as $key) {
	            $quorum = intval(substr($key, 0, 2));
	            $number = intval(substr($key, 2, 2));
	            $key = substr($key, 4);
	            $keylen = strlen($key);     
	            $key_x[] = $number;
	            for($i=0; $i < strlen($key); $i+=2) {
	                $key_y[] = (substr($key, $i, 2) == "g0") ? 
	                                256 : 
	                                hexdec(substr($key, $i, 2));
	            }
	        }
	        $quorum = count($keys);
	        
	        $keylen /= 2;

	        $coeffs = self::rcoeffs($key_x, $quorum);
	        
	        $secret = "";
	        for($i=0; $i < $keylen; $i++) {
	        	$char_no = $i+1; 
	            $temp = 0;
	            for($j=0; $j < $quorum; $j++) {

	            		
	            		$r_dec = $key_y[$keylen * $j + $i];
	            		$r_koef = $coeffs[$j];
	            		$sql = self::insertRecoversss($idfile, $char_no, $r_dec, $r_koef);
	            	

	                $temp = self::modq($temp + $key_y[$keylen * $j + $i] *
	                                   $coeffs[$j]);
	            }
	            $secret .= chr($temp);
	        }
	
	        return $secret;
	    }

	    public static function checkRecover($keys) {
	        $key_x = array();
	        $key_y = array();

	        foreach($keys as $key) {
	            $quorum = intval(substr($key, 0, 2));
	            $number = intval(substr($key, 2, 2));
	            $key = substr($key, 4);
	            $keylen = strlen($key);     
	            $key_x[] = $number;
	            for($i=0; $i < strlen($key); $i+=2) {
	                $key_y[] = (substr($key, $i, 2) == "g0") ? 
	                                256 : 
	                                hexdec(substr($key, $i, 2));
	            }
	        }
	        
	        $keylen /= 2;

	        $coeffs = self::rcoeffs($key_x, $quorum);
	        
	        $secret = "";
	        for($i=0; $i < $keylen; $i++) {
	        	$char_no = $i+1; 
	            $temp = 0;
	            for($j=0; $j < $quorum; $j++) {

	            	
	                $temp = self::modq($temp + $key_y[$keylen * $j + $i] *
	                                   $coeffs[$j]);
	            }
	            $secret .= chr($temp);
	        }
	
	        return $secret;
	    }







	    
	    public function showUrl(){
			$stmt = $this->con->prepare("SELECT * FROM tb_countvisit");
			if($stmt->execute()){
				$result = $stmt->get_result();
				$stmt->close();
				return $result;
			}
		}
	    public function showUrlByUrl($url){
			$stmt = $this->con->prepare("SELECT * FROM tb_countvisit WHERE url = ? ");
			$stmt->bind_param('s', $url);
			if($stmt->execute()){
				$result = $stmt->get_result();
				$data = $result->fetch_array();
				$stmt->close();
				return $data;
			}
		}
	    public function insertUrlVisit($url){
	    	$count = 1;
			$stmt = $this->con->prepare("INSERT INTO tb_countvisit(url,count) VALUES (?,$count)");
			$stmt->bind_param('s', $url);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}
	    public function isURLExisted($url){
			$stmt = $this->con->prepare("SELECT url FROM tb_countvisit WHERE url = ? ");
			$stmt->bind_param('s', $url);
			$stmt->execute();
			$stmt->store_result();
			$numRows = $stmt->num_rows;
			if($numRows > 0){
				//user existed
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function updateCountVisitWithUrl($count, $url){
	
			$stmt = $this->con->prepare("UPDATE tb_countvisit SET count=? WHERE url = ?");
			$stmt->bind_param("is", $count, $url);
			$result = $stmt->execute();
			if($result){
				$stmt->close();
				return TRUE;
			}else{
				$stmt->close();
				return FALSE;
			}
		}

		public function checkPassword($iduser_recovery, $password){
			$stmt = $this->con->prepare("SELECT * FROM tb_user WHERE iduser = ? ");
			$stmt->bind_param('i', $iduser_recovery);
			if($stmt->execute()){
				$user = $stmt->get_result()->fetch_assoc();
				$stmt->close();

				$salt = $user['salt'];
				$encrypted_password = $user['encrypted_password'];
				$hash = $this->checkhashSSHA($salt, $password);

				if($encrypted_password == $hash){
					return $user;
				}
			}else{
				return FALSE;
			}
		}

		

		

	}
?>