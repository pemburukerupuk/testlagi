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
        <li class="breadcrumb-item active">My Account</li>
      </ol>
    </div>
    <div class="x_content">
    	<div class="clearfix"></div>

    	<form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">

    	    <div class="form-group">
            <label class="control-label col-md-6 col-sm-6 col-xs-12"><h2>Detail Account</h2></label>
          </div>
          <hr>

          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">Username <span class="required"></span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" id="username" name="username" required="required" class="form-control col-md-7 col-xs-12" 
              value="<?php echo $result['username']; ?>" disabled>
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
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Nama Perusahaan <span class=""></span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <?php
                    $idcompany= $result['idcompany'];
                    $result1 = $db->showCompanyById($idcompany);

                ?>
              <input type="text" id="idcompany" name="idcompany" required="required" class="form-control col-md-7 col-xs-12"  
              value="<?php echo $result1['company']; ?>" disabled="">
            </div>
          </div>
          
         
          <div class="ln_solid"></div>
          <div class="form-group">
            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
              <a class="btn btn-primary" type="button" href="?page=my_account_edituser">Edit Account</a>
            </div>
          </div>

        </form>
    </div>
  </div>
</div>