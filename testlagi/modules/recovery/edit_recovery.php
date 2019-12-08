<?php if($_SESSION['level'] != 'Administrator'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{
?>
 <div class="col-md-12 col-sm-12 col-xs-12">
  <div class="x_panel">
    <div class="x_title">
      <div class="clearfix"></div>
      <ol class="breadcrumb">
        <li class="breadcrumb-item">Master</li>
        <li class="breadcrumb-item"><a href="?page=master_transaction">Data Transaction</a></li>
        <?php
          require_once '../cores/db_function.php';
          $db = new Db_Function();
          $idtransaction = $_GET['idtransaction'];
          $result = $db->ShowTransactionById($idtransaction);
          $transactioncode = $result['transactioncode'];
          $idfile = $result['idfile'];
        ?>
        <li class="breadcrumb-item"><a href="?page=master_recovery&id=<?php echo $idtransaction; ?>">Manage Transaction Of <?php echo $transactioncode; ?></a></li>
        <li class="breadcrumb-item active">Edit Recovery Of <?php 
                                                              $iduser = $_GET['iduser'];
                                                              $result3 = $db->showUserById($iduser);
                                                              echo $result3['email'];
                                                            ?>
                                                                 
        </li>
      </ol>
    </div>
    <div class="x_content">
      <div class="clearfix"></div>

      <form enctype="multipart/form-data" id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="POST" 
      action="?page=prosesedit_recovery&id=<?php echo $_GET['id']; ?>&iduser=<?php echo $iduser?>&idtransaction=<?php echo $idtransaction; ?>&idfile=<?php echo $idfile; ?>">

          <div class="form-group">
            <label class="control-label col-md-6 col-sm-6 col-xs-12"><h2>Form Edit Recovery</h2></label>
          </div>
          <hr>
            <div class="form-group">
               
              </div>
              <div class="form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="kunci">New Key <span class="required">*</span>
                </label>
                <div class="col-md-6 col-sm-6 col-xs-12">
                  <input type="password" id="kunci" name="kunci" required="required" class="form-control col-md-7 col-xs-12">
                </div>
                
              </div>

          <div class="ln_solid"></div>
          <div class="form-group">
            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
              <a class="btn btn-primary" type="button" href="?page=master_recovery&id=<?php echo $idtransaction; ?>">Cancel</a>
              <button class="btn btn-primary" type="reset">Reset</button>
              <button type="submit" class="btn btn-success">Submit</button>
            </div>
          </div>

        </form>
    </div>
  </div>
</div>
<?php
}
?>