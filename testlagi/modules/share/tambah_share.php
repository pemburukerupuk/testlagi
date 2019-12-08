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
        <li class="breadcrumb-item"><a href="?page=master_file">Data File</a></li>
        <?php
          require_once '../cores/db_function.php';
          $db = new Db_Function();
          $idfile = $_GET['id'];
          $result = $db->ShowFileById($idfile);
          $barcode = $result['barcode'];
        ?>
        <li class="breadcrumb-item"><a href="?page=master_share&id=<?php echo $idfile; ?>">Manage Share Of <?php echo $barcode; ?></a></li>
        <li class="breadcrumb-item active">Tambah Share</li>
      </ol>
    </div>
    <div class="x_content">
    	<div class="clearfix"></div>

    	<form enctype="multipart/form-data" id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="POST" 
      action="?page=prosestambah_share&id=<?php echo $_GET['id']; ?>">

    	    <div class="form-group">
            <label class="control-label col-md-6 col-sm-6 col-xs-12"><h2>Form Tambah Share</h2></label>
          </div>
          <hr>
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="iduser">Data Owner --- Email <span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <?php
                  $iduser = $result['iduser_owner'];

                  $result1 = $db->showUserById($iduser);
                  $idcompany= $result1['idcompany'];

                  $result2 = $db->showUserByIdCompany($idcompany);
                  $no = 1;
                   while($data = $result2->fetch_array()){
                ?>
                <li>
                  <label>  
                    <input type="checkbox" name="idusertoshare[]" id="<?php echo $data['iduser']; ?>" value="<?php echo $data['iduser']; ?>" class="flat" 
                    <?php
                      $result3 = $db->showShareByIdFile($idfile);
                      while ($data1 = $result3->fetch_array()) {
                        if($data['iduser'] == $data1['iduser_share']){ 
                    ?>
                       disabled
                    <?php
                      }
                    }
                    ?> > <?php echo $data['email']; ?>
                  </label>
                </li>
                <?php
                          }
                        ?>
                    
              </div>
              </div>

          <div class="ln_solid"></div>
          <div class="form-group">
            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
              <a class="btn btn-primary" type="button" href="?page=master_share&id=<?php echo $idfile; ?>">Cancel</a>
			        <button class="btn btn-primary" type="reset">Reset</button>
              <button type="submit" class="btn btn-success"onclick="return confirm('Apakah anda yakin set share file ini ???'); ">Submit</button>
            </div>
          </div>

        </form>
    </div>
  </div>
</div>
<?php
}
?>