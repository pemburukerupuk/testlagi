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
        <li class="breadcrumb-item"><a href="?page=master_company">Data Perusahaan</a></li>
        <li class="breadcrumb-item">Create Perusahaan</li>
      </ol>
    </div>
    <div class="x_content">
      
      <div class="clearfix"></div>
      <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" 
        method="POST" action="?page=prosestambah_company">

        <div class="form-group">
            <label class="control-label col-md-6 col-sm-6 col-xs-12"><h2>Form Create Data Perusahaan</h2></label>
        </div>
        <hr>

          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="company">Nama Perusahaan <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" id="company" name="company" required="required" class="form-control col-md-7 col-xs-12">
            </div>
          </div>

          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Alamat <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <textarea type="text" rows="3" id="address" name="address" required="required" class="form-control col-md-7 col-xs-12"></textarea>
            </div>
          </div>

          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="noextension">No Extension <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" id="noextension" name="noextension" required="required" class="form-control col-md-7 col-xs-12">
            </div>
          </div>

          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="idlevel">Level <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <select id="idlevel" name="idlevel" required="required" class="form-control col-md-7 col-xs-12">
                    <option value="" selected disabled>Choose Option</option>
                    <?php
                        require_once '../cores/db_function.php';
                        $db = new Db_Function();
                        $result = $db->showLevel();
                        while($data = $result->fetch_array()){

                    ?>
                        <option value="<?php echo $data['idlevel']; ?>"><?php echo $data['level']; ?></option>
                    <?php
                      }
                    ?>
                 </select> 
            </div>
          </div>
          
          <div class="ln_solid"></div>
          <div class="form-group">
            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
              <a class="btn btn-primary" type="button" href="?page=master_company">Cancel</a>
              <button class="btn btn-primary" type="reset">Reset</button>
              <button type="submit" class="btn btn-success" onclick="return confirm('Apakah anda yakin menambah perusahaan ini ???'); ">Submit</button>
            </div>
          </div>

        </form>
    </div>
  </div>
</div>
<?php
}
?>