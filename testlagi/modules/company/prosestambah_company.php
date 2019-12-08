<?php if($_SESSION['level'] != 'Administrator'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{

  require_once '../cores/db_function.php';
  $db = new Db_Function();

  $company = $_POST['company'];
  $address = $_POST['address'];
  $noextension = $_POST['noextension'];
  $idlevel = $_POST['idlevel'];

  $checkcompany = $db->isCompanyExisted($company);  
  if($checkcompany){
    echo "<script>
          alert('Perusahaan sudah ada, Coba Lagi !!!');
          history.back();
       </script>"; 
        
  }else{
      
    $insertcompany = $db->insertCompany($company, $address, $noextension, $idlevel);
    if($insertcompany){

      echo "<script>
          alert('Proses tambah perusahaan sukses');
          window.location.href='?page=master_company';
       </script>";


    }else{
      echo "<script>
          alert('Proses tambah perusahaan gagal, Coba lagi !!!');
          history.back();
       </script>";
    }
  }
}

?>