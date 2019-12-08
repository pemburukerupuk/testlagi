<?php if($_SESSION['level'] != 'Administrator'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{

  require_once '../cores/db_function.php';
  $idfile= $_GET['id'];
  $db = new Db_Function();
  $result = $db->showFileById($idfile);
 ?>
 <div class="col-md-12 col-sm-12 col-xs-12">
  <div class="x_panel">
    <div class="x_title">
 		
      <div class="clearfix"></div>
      <ol class="breadcrumb">
        <li class="breadcrumb-item">Master</li>
        <li class="breadcrumb-item"><a href="?page=master_file">Data File</a></li>
        <li class="breadcrumb-item">Edit File</li>
      </ol>
    </div>
    <div class="x_content">
    	<div class="clearfix"></div>

    	<form enctype="multipart/form-data" id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="POST" 
      action="?page=prosesedit_file&id=<?php echo $result['idfile']; ?>">

    	    <div class="form-group">
            <label class="control-label col-md-6 col-sm-6 col-xs-12"><h2>Form Edit File</h2></label>
          </div>
          <hr>

          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="oldbarcode">Barcode <span class=""> </span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" id="oldbarcode" name="oldbarcode" class="form-control col-md-7 col-xs-12" 
              value="<?php echo $result['barcode']; ?>" disabled="">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="ubahbarcode">Ubah Barcode <span class=""></span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="checkbox" id="ubahbarcode" name="ubahbarcode" class="form-control col-md-7 col-xs-12" value="true">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="newbarcode">New Barcode <span class=""> </span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" id="newbarcode" name="newbarcode" class="form-control col-md-7 col-xs-12">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="title">Title <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" id="title" name="title" required="required" class="form-control col-md-7 col-xs-12" value="<?php echo $result['title']; ?>">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pathfile">Name File <span class=""></span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" id="pathfile" name="pathfile" class="form-control col-md-7 col-xs-12" value="<?php echo $result['pathfile']; ?>" disabled="">

            </div>
          </div>
          
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="idlevel">Level<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <select id="idlevel" name="idlevel" required="" class="form-control col-md-7 col-xs-12" disabled="">
                <option value="" disabled>Choose Option</option>
                <?php
                    $iduser = $result['iduser_owner'];
                    $result1 = $db->showUserById($iduser);
                    $idcompany = $result1['idcompany'];
                    $result2 = $db->showCompanyById($idcompany);
                    $getidlevel = $result2['idlevel'];

                    $result3 = $db->showLevel();
                    while($data = $result3->fetch_array()){

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
              <select id="idcompany" name="idcompany" required="required" class="form-control col-md-7 col-xs-12" disabled="">
                <?php
                   $result4 = $db->showCompany();
                  while($data1 = $result4->fetch_array()){
                ?>
                  <option value="<?php echo $data1['idcompany'] ?>" <?php if($data1['idcompany'] == $idcompany) echo 'selected'; ?> > <?php echo $data1['company'] ?></option>
                <?php
                  }
                ?>
              </select> 
            </div>
          </div>
          <img src="../assets/loader.gif" width="10px" height="10px" id="imgLoad" style="display:none">
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="iduser">Email User<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <select id="iduser" name="iduser" required="required" class="form-control col-md-7 col-xs-12" disabled="">
                <?php
                   $result5 = $db->showUser();
                  while($data2 = $result5->fetch_array()){
                ?>
                  <option value="<?php echo $data2['iduser'] ?>" <?php if($data2['iduser'] == $iduser) echo 'selected'; ?> > <?php echo $data2['email'] ?></option>
                <?php
                  }
                ?>
              </select> 
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sendpassword">Send Password To User<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <select id="sendpassword" name="sendpassword" required="" class="form-control col-md-7 col-xs-12">
                <?php
                  if($result['sendpassword'] == "No"){
                ?>
                    
                      <option value="No" selected="selected">No</option>
                      <option value="Yes">Yes</option>
                <?php 
                  }elseif($result['sendpassword'] == "Yes"){
                ?>
                      <option value="No">No</option>
                      <option value="Yes" selected="selected">Yes</option>
                <?php
                  }
                ?>
              </select>
            </div>
          </div>
          <div class="ln_solid"></div>
          <div class="form-group">
            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
              <a class="btn btn-primary" type="button" href="?page=master_file">Cancel</a>
			        <button class="btn btn-primary" type="reset">Reset</button>
              <button type="submit" class="btn btn-success" onclick="return confirm('Apakah anda yakin merubah file ini ???'); ">Submit</button>
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
            url: "user/cari_owner.php",
            data: "id="+idlevel,
            success: function(msg){
               
                // jika tidak ada data
                if(msg == ''){
                    alert('Tidak ada data perusahaan');
                }
               
                // jika dapat mengambil data, tampilkan di combo box idperusahaan
                else{
                    $("#idperusahaan").html(msg);                                                     
                }
               
                // hilangkan image load
                $("#imgLoad").hide();
            }
        });    
    });

 $("#idperusahaan").change(function(){
   
        // variabel dari nilai combo box perusahaan
        var idperusahaan = $("#idperusahaan").val();
       
        // tampilkan image load
       $("#imgLoad").show("");
       
        // mengirim dan mengambil data
        $.ajax({
            type: "POST",
            dataType: "html",
            url: "file/cari_user.php",
            data: "idperusahaan="+idperusahaan,
            success: function(msg){
               
                // jika tidak ada data
                if(msg == ''){
                    alert('Tidak ada data user');
                }
               
                // jika dapat mengambil data, tampilkan di combo box iduser
                else{
                    $("#iduser").html(msg);                                                     
                }
               
                // hilangkan image load
                $("#imgLoad").hide();
            }
        });    
    });
</script>
<?php
}
?>