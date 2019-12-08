  <?php
    require_once '../cores/db_function.php';
    $iduser = $_SESSION['iduser'];
    $db = new Db_Function();
    $result = $db->showUserById($iduser);
 ?>
 <div class="col-md-12 col-sm-12 col-xs-12">
  <div class="x_panel">
    <div class="x_title">
 		
      <div class="clearfix"></div>
      <ol class="breadcrumb">
        <li class="breadcrumb-item">Personal</li>
        <li class="breadcrumb-item"><a href="?page=my_account">My Account</a></li>
        <li class="breadcrumb-item">Edit Account</li>
      </ol>
    </div>
    <div class="x_content">
    	<div class="clearfix"></div>

    	<form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="POST"
      action="?page=my_account_prosesedituser&id=<?php echo $iduser; ?>">

    	    <div class="form-group">
            <label class="control-label col-md-6 col-sm-6 col-xs-12"><h2>Form Edit Account</h2></label>
          </div>
          <hr>

          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">Username <span class="required"></span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" id="username" name="username" required="required" class="form-control col-md-7 col-xs-12" 
              value="<?php echo $result['username']; ?>">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Email <span class=""></span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="email" id="email" name="email" required="required" class="form-control col-md-7 col-xs-12"  
              value="<?php echo $result['email']; ?>" disabled="">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="ubahemail">Ubah Email <span class=""></span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="checkbox" id="ubahemail" name="ubahemail" class="form-control col-md-7 col-xs-12" value="true">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="emailbaru">Email Baru <span class=""></span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="email" id="emailbaru" name="emailbaru" class="form-control col-md-7 col-xs-12">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="password">Password <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="password" id="password" name="password" required="required" class="form-control col-md-7 col-xs-12">
            </div>
          </div>
          <div class="form-group" >
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="c_password">Confirm Password <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="password" id="c_password" name="c_password" required="required" class="form-control col-md-7 col-xs-12">
            </div>
          </div>
         
          <div class="ln_solid"></div>
          <div class="form-group">
            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
              <a class="btn btn-primary" type="button" href="?page=my_account">Cancel</a>
              <button class="btn btn-primary" type="reset">Reset</button>
              <button type="submit" class="btn btn-success">Submit</button>
            </div>
          </div>

        </form>
    </div>
  </div>
</div>