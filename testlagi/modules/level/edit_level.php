<?php if($_SESSION['level'] != 'Administrator'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{
    require_once '../cores/db_function.php';
    $idlevel = $_GET['id'];
    $db = new Db_Function();
    $result = $db->showLevelById($idlevel);
 ?>

 <div class="col-md-12 col-sm-12 col-xs-12">
  <div class="x_panel">
    <div class="x_title">
 		
      <div class="clearfix"></div>
      <ol class="breadcrumb">
        <li class="breadcrumb-item">Master</li>
        <li class="breadcrumb-item"><a href="?page=master_level">Data Level</a></li>
        <li class="breadcrumb-item">Edit Level</li>
      </ol>
    </div>
    <div class="x_content">
    	
      <div class="clearfix"></div>
    	<form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" 
        method="POST" action="?page=prosesedit_level&id=<?php echo $idlevel; ?>">

    	  <div class="form-group">
            <label class="control-label col-md-6 col-sm-6 col-xs-12"><h2>Form Edit Level</h2></label>
        </div>
        <hr>
          <div class="form-group" hidden="">
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" id="oldlevel" name="oldlevel" required="required" class="form-control col-md-7 col-xs-12" 
              value="<?php echo $result['level']; ?>">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="newlevel">Level <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" id="newlevel" name="newlevel" required="required" class="form-control col-md-7 col-xs-12" 
              value="<?php echo $result['level']; ?>">
            </div>
          </div>
          
          <div class="ln_solid"></div>
          <div class="form-group">
            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
              <a class="btn btn-primary" type="button" href="?page=master_level">Cancel</a>
			        <button class="btn btn-primary" type="reset">Reset</button>
              <button type="submit" class="btn btn-success" onclick="return confirm('Apakah anda yakin merubah level ini ???'); ">Submit</button>
            </div>
          </div>

        </form>
    </div>
  </div>
</div>
<?php
}
?>