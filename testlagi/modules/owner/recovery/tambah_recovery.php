<?php if($_SESSION['level'] != 'Data Owner'){
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
        <li class="breadcrumb-item">Personal</li>
        <li class="breadcrumb-item"><a href="?page=o_master_transaction">Data Transaction</a></li>
        <?php
          require_once '../cores/db_function.php';
          $db = new Db_Function();
          $idtransaction = $_GET['id'];
          $result = $db->ShowTransactionById($idtransaction);
          $transactioncode = $result['transactioncode'];
          $idfile = $result['idfile'];
        ?>
        <li class="breadcrumb-item"><a href="?page=o_master_recovery&id=<?php echo $idtransaction ?>">Recovery Transaction Of <?php echo $transactioncode; ?></a></li>
        <li class="breadcrumb-item active">Tambah Recovery</li>
      </ol>
    </div>
    <div class="x_content">
      <div class="clearfix"></div>

      <form enctype="multipart/form-data" id="demo-form2" class="form-horizontal form-label-left" method="POST" 
      action="?page=o_prosestambah_recovery&id=<?php echo $idtransaction; ?>&iduser=<?php echo $_SESSION['iduser']; ?>">

          <div class="form-group">
            <label class="control-label col-md-6 col-sm-6 col-xs-12"><h2>Form Recovery Transaction</h2></label>
          </div>
          <hr>
              <div class="form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="kunci">Key <span class="required">*</span>
                </label>
                <div class="col-md-6 col-sm-6 col-xs-12">
                  <input type="password" id="kunci" name="kunci" required="required" class="form-control col-md-7 col-xs-12">
                </div>
                <a href="javascript:void(0);" onClick=window.open("findmykey.php?id=<?php echo $idfile;?>","Ratting","width=1000,height=400,left=180,top=150,0,status=0,");>
                  <button class="btn btn-primary">Find My Key</button>
                </a>
              
              </div>
              <hr>
              <div class="form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                <label class="col-md-6 col-sm-6 col-xs-12" >Untuk menjaga keamanan pada saat verifikasi pemilik bagian kunci, <br> Dimohon untuk masukkan ulang password yang digunakan untuk login ke sistem dibawah ini. 
                </label>
              </div>
              <hr>
              <div class="form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="passlogin">Password Account <span class="required">*</span>
                </label>
                <div class="col-md-6 col-sm-6 col-xs-12">
                  <input type="password" id="passlogin" name="passlogin" required="required" class="form-control col-md-7 col-xs-12">
                </div>
              
              </div>

          <div class="ln_solid"></div>
          <div class="form-group">
            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
              <a class="btn btn-primary" type="button" href="?page=o_master_transaction">Cancel</a>
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