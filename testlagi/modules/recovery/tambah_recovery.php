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
          $idtransaction = $_GET['id'];
          $result = $db->ShowTransactionById($idtransaction);
          $transactioncode = $result['transactioncode'];
          $idfile = $result['idfile'];
        ?>
        <li class="breadcrumb-item active"><a href="?page=master_recovery&id=<?php echo $idtransaction; ?>">Manage Transaction Of <?php echo $transactioncode; ?></a></li>
        <li class="breadcrumb-item active">Tambah Recovery</li>
      </ol>
    </div>
    <div class="x_content">
      <div class="clearfix"></div>

      <form enctype="multipart/form-data" id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="POST" 
      action="?page=prosestambah_recovery&id=<?php echo $_GET['id']; ?>&idfile=<?php echo $idfile; ?>">

          <div class="form-group">
            <label class="control-label col-md-6 col-sm-6 col-xs-12"><h2>Form Tambah Share</h2></label>
          </div>
          <hr>
            <div class="form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="iduser">Data Owner --- Email <span class="required">*</span>
                </label>
                <div class="col-md-6 col-sm-6 col-xs-12">
                  <select id="iduser" name="iduser" required="required" class="form-control col-md-7 col-xs-12" onmousedown="if(this.options.length>5){this.size=5;}"  onchange='this.size=0;' onblur="this.size=0;">
                    <option value="" selected disabled>Choose Option</option>
                      <?php
                        $result1 = $db->showFileById($idfile);
                        $iduser= $result1['iduser_owner'];

                        $result2 = $db->showUserById($iduser);
                        $idcompany = $result2['idcompany'];
                     
                        $result = $db->showUserByIdCompany($idcompany);
                         while($data = $result->fetch_array()){
                      ?>
                  
                    <option value="<?php echo $data['iduser']; ?>"><?php echo $data['email']; ?></option>
                      <?php
                        }
                      ?>
                  </select>  
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="kunci">Key <span class="required">*</span>
                </label>
                <div class="col-md-6 col-sm-6 col-xs-12">
                  <input type="password" id="kunci" name="kunci" required="required" class="form-control col-md-7 col-xs-12">
                </div>
              </div>

          <div class="ln_solid"></div>
          <div class="form-group">
            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
              <a class="btn btn-primary" type="button" href="?page=master_recovery&id=<?php echo $idfile; ?>">Cancel</a>
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