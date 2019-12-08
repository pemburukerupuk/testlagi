<?php if($_SESSION['level'] != 'Data Owner'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{

    require_once '../cores/db_function.php';
    
    $idfile = $_GET['id'];
    $db = new Db_Function();
    $result = $db->showFileById($idfile);
 ?>
 <div class="col-md-12 col-sm-12 col-xs-12">
  <div class="x_panel">
    <div class="x_title">
 		
      <div class="clearfix"></div>
      <ol class="breadcrumb">
        <li class="breadcrumb-item">Personal</li>
        <li class="breadcrumb-item"><a href="?page=o_master_file">Data File</a></li>
        <li class="breadcrumb-item">Barcode : <?php echo $result['barcode']; ?></li>
      </ol>
    </div>
    <div class="x_content">
    	<div class="clearfix"></div>

    	<form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="POST"
      action="?page=o_prosessetpassword_file&id=<?php echo $idfile; ?>">

    	    <div class="form-group">
            <label class="control-label col-md-6 col-sm-6 col-xs-12"><h2>Form Set Security File</h2></label>
          </div>
          <hr>

          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="password">Password <span class="required"></span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="password" id="password" name="password" required="required" class="form-control col-md-7 col-xs-12">
            </div>
          </div>
         
          <div class="ln_solid"></div>
          <div class="form-group">
            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
              <a class="btn btn-primary" type="button" href="?page=o_master_file">Cancel</a>
              <button class="btn btn-primary" type="reset">Reset</button>
              <button type="submit" class="btn btn-success"onclick="return confirm('Apakah anda yakin set security file ini ???'); ">Submit</button>
            </div>
          </div>

        </form>
    </div>
  </div>
</div>
<?php
}
?>