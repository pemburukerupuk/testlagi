<?php 
  require_once '../cores/db_function.php';
  $db = new Db_Function();

  $idtransaction = $_GET['id'];
  $result = $db->showTransactionById($idtransaction);
  $transactioncode = $result['transactioncode'];

  if($_SESSION['iduser'] != substr($transactioncode, -2)){
    echo "<script>
          alert('Tidak Diperkenankan !!!'); 
          history.back();
       </script>";
}else{
   $url= "http://{$_SERVER['HTTP_HOST']}{$_SERVER['REQUEST_URI']}";
    $checkUrl = $db->isURLExisted($url);
    if($checkUrl){
      $read = $db->showUrlByUrl($url);
      $url= "http://{$_SERVER['HTTP_HOST']}{$_SERVER['REQUEST_URI']}";
      $count = $read['count']+1;
      $result100 = $db->updateCountVisitWithUrl($count, $url);
    }else{
      $result101 = $db->insertUrlVisit($url);
    }
    

?>
<div class="col-md-12 col-sm-12 col-xs-12">
  <div class="x_panel">
  	<ol class="breadcrumb">
	    <li class="breadcrumb-item">Personal</li>
	    <li class="breadcrumb-item"><a href="?page=my_transaction">My Transaction</a></li>
	    <li class="breadcrumb-item active">
	      View Transaction Of <?php
          echo $transactioncode;
          $idfile = $result['idfile'];
          $result1 = $db->showFileById($idfile);
					$title = $result1['title'];
					$iduser = $result1['iduser_owner'];
					$pathfile = $result1['pathfile'];
					$result2 = $db->showUserById($iduser);
					$email = $result2['email'];

					$path = "../file storage/".$email."/".$pathfile;
	             ?>
	    </li>
	</ol>
	<div class="col-md-12 col-sm-12 col-xs-12" style="border:0px solid #e5e5e5;">
        <div class="x_panel">
           <h2><b>Content Detail</b></h2>
            <hr>
        <div class="">
          <label class="control-label col-md-3 col-sm-3 col-xs-12">Barcode<span class=""></span></label> 
          <label class="control-label col-md-9 col-sm-9 col-xs-12"> : <?php echo $result1['barcode']; ?></label>
        </div>
        <div class="">
          <label class="control-label col-md-3 col-sm-3 col-xs-12">Title<span class=""></span></label> 
          <label class="control-label col-md-9 col-sm-9 col-xs-12"> : <?php echo $result1['title']; ?></label>
        </div>
         <div class="">
          <label class="control-label col-md-3 col-sm-3 col-xs-12">Owner<span class=""></span></label> 
          <label class="control-label col-md-9 col-sm-9 col-xs-12"> : 
            <?php 
              $idcompany = $result2['idcompany'];
              $result3 = $db->showCompanyById($idcompany);
              $company = $result3['company'];
              echo $company;
            ?>
              
          </label>
        </div>
        <hr>
      </div>
    </div>
 	<div class="col-md-12 col-sm-12 col-xs-12" style="border:0px solid #e5e5e5;">
 		<div class="x_panel">
 			<h2><b>Full View File</b></h2>
            <hr>
			<embed src="<?php echo $path; ?>#toolbar=0&navpanes=0&scrollbar=0" type="application/pdf" width="100%" height="600px"  />
		</div>
	</div>
  </div>
</div>
<?php
}
?>
