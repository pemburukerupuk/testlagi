<?php if($_SESSION['level'] != 'Administrator'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{
    require_once '../cores/db_function.php';
    $iduser = $_GET['id'];
    $db = new Db_Function();
    $result = $db->showUserById($iduser);
 ?>
 <div class="col-md-12 col-sm-12 col-xs-12">
  <div class="x_panel">
    <div class="x_title">
 		
      <div class="clearfix"></div>
      <ol class="breadcrumb">
        <li class="breadcrumb-item">Master</li>
        <li class="breadcrumb-item"><a href="?page=master_user">Data Account</a></li>
        <li class="breadcrumb-item">Edit Account</li>
      </ol>
    </div>
    <div class="x_content">
    	<div class="clearfix"></div>

    	<form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="POST" 
      action="?page=prosesedit_user&id=<?php echo $iduser; ?>">

    	    <div class="form-group">
            <label class="control-label col-md-6 col-sm-6 col-xs-12"><h2>Form Edit Account</h2></label>
          </div>
          <hr>

          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">Username <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" id="username" name="username" required="required" class="form-control col-md-7 col-xs-12" 
              value="<?php echo $result['username']; ?>">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="oldemail">Email <span class=""></span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="oldemail" id="oldemail" name="oldemail" required="required" class="form-control col-md-7 col-xs-12"  
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
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="newemail">Email Baru <span class=""></span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="email" id="newemail" name="newemail" class="form-control col-md-7 col-xs-12">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="password">Password <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="password" id="password" name="password" required="required" class="form-control col-md-7 col-xs-12">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="c_password">Confirm Password <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="password" id="c_password" name="c_password" required="required" class="form-control col-md-7 col-xs-12">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="idlevel">Level<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <select id="idlevel" name="idlevel" required="" class="form-control col-md-7 col-xs-12">
                <option value="" disabled>Choose Option</option>
                <?php
                    $idcompany = $result['idcompany'];
                    $getidlevel = $db->showCompanyById($idcompany);

                    $result1 = $db->showLevel();
                    while($data = $result1->fetch_array()){

                ?>
                    <option value="<?php echo $data['idlevel'] ?>" <?php if($data['idlevel'] == $getidlevel['idlevel']) echo 'selected'; ?> > <?php echo $data['level'] ?></option>
                <?php
                  }
                ?>
              </select> 
            </div>
          </div>
          <img src="../assets/loader.gif" width="10px" height="10px" id="imgLoad" style="display:none">
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="idcompany">Nama Perusahaan<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <select id="idcompany" name="idcompany" required="required" class="form-control col-md-7 col-xs-12">
                <?php
                    $result2 = $db->showCompanyByIdLevel($getidlevel['idlevel']);
                    while($data1 = $result2->fetch_array()){

                ?>
                    <option value="<?php echo $data1['idcompany'] ?>" <?php if($data1['idcompany'] == $idcompany) echo 'selected'; ?> > <?php echo $data1['company'] ?></option>
                <?php
                  }
                ?>
              </select> 
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="info">Info<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
               <?php
                    if($result['info'] == 'Pending'){
                ?>
                    <select class="form-control" name="info">
                      <option value="" disabled>Choose Option</option>
                      <option value="Pending" selected="selected">Pending</option>
                      <option value="Active">Active</option>
                      <option value="Non Active">Non Active</option>
                    </select> 
                <?php
                    }elseif($result['info'] == 'Active'){
                ?>
                    <select class="form-control" name="info">
                        <option value="" disabled>Choose Option</option>
                        <option value="Pending">Pending</option>
                        <option value="Active" selected="selected">Active</option>
                        <option value="Non Active">Non Active</option>
                    </select> 
                <?php
                    }elseif($result['info'] == 'Non Active'){
                ?>   
                    <select class="form-control" name="info">
                        <option value="" disabled>Choose Option</option>
                        <option value="Pending">Pending</option>
                        <option value="Active">Active</option>
                        <option value="Non Active" selected="selected">Non Active</option>
                    </select> 
                <?php
                    }
                ?> 
            </div>
          </div>
          <div class="ln_solid"></div>
          <div class="form-group">
            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
              <a class="btn btn-primary" type="button" href="?page=master_user">Cancel</a>
			        <button class="btn btn-primary" type="reset">Reset</button>
              <button type="submit" class="btn btn-success" onclick="return confirm('Apakah anda yakin merubah akun ini ???'); ">Submit</button>
            </div>
          </div>

        </form>
    </div>
  </div>
</div>
 <!-- jQuery -->
<script src="../assets/vendors/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">
 $("#idlevel").change(function(){
   
        // variabel dari nilai combo box level
        var idlevel = $("#idlevel").val();
       
        // tampilkan image load
       $("#imgLoad").show("");
       
        // mengirim dan mengambil data
        $.ajax({
            type: "POST",
            dataType: "html",
            url: "user/cari_company.php",
            data: "id="+idlevel,
            success: function(msg){
               
                // jika tidak ada data
                if(msg == ''){
                    alert('Tidak ada data perusahaan');
                }
               
                // jika dapat mengambil data,, tampilkan di combo box kota
                else{
                    $("#idcompany").html(msg);                                                     
                }
               
                //hilangkan image load
                $("#imgLoad").hide();
            }
        });    
    });
</script>
<?php
}
?>