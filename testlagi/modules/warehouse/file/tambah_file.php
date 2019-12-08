<?php if($_SESSION['level'] != 'Data Warehouse'){
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
        <li class="breadcrumb-item"><a href="?page=w_master_file">Data File</a></li>
        <li class="breadcrumb-item">Create File</li>
      </ol>
    </div>
    <div class="x_content">
    	<div class="clearfix"></div>

    	<form enctype="multipart/form-data" id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="POST" 
      action="?page=w_prosestambah_file">

    	    <div class="form-group">
            <label class="control-label col-md-6 col-sm-6 col-xs-12"><h2>Form Create File</h2></label>
          </div>
          <hr>

          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="barcode">Barcode <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" id="barcode" name="barcode" required="required" class="form-control col-md-7 col-xs-12">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="title">Title <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" id="title" name="title" required="required" class="form-control col-md-7 col-xs-12">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="file">File <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="file" id="file" name="file" required="required" class="form-control col-md-7 col-xs-12">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="idlevel">Level<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <select id="idlevel" name="idlevel" required="" class="form-control col-md-7 col-xs-12" onmousedown="if(this.options.length>5){this.size=5;}"  onchange='this.size=0;' onblur="this.size=0;">
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
          <img src="../assets/loader.gif" width="10px" height="10px" id="imgLoad" style="display:none">
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="idcompany">Nama Perusahaan<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <select id="idcompany" name="idcompany" required="required" class="form-control col-md-7 col-xs-12" onmousedown="if(this.options.length>5){this.size=5;}"  onchange='this.size=0;' onblur="this.size=0;">
                
              </select> 
            </div>
          </div>
          <img src="../assets/loader.gif" width="10px" height="10px" id="imgLoad" style="display:none">
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="iduser">Sender<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <select id="iduser" name="iduser" required="required" class="form-control col-md-7 col-xs-12" onmousedown="if(this.options.length>5){this.size=5;}"  onchange='this.size=0;' onblur="this.size=0;">
                
              </select> 
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sendpassword">Send Password To Sender<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <select id="sendpassword" name="sendpassword" required="" class="form-control col-md-7 col-xs-12">
                <option value="" selected disabled>Choose Option</option>
                <option value="No">No</option>
                <option value="Yes">Yes</option>
              </select> 
            </div>
          </div>
          <div class="ln_solid"></div>
          <div class="form-group">
            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
              <a class="btn btn-primary" type="button" href="?page=w_master_file">Cancel</a>
			        <button class="btn btn-primary" type="reset">Reset</button>
              <button type="submit" class="btn btn-success" onclick="return confirm('Apakah anda yakin menambah file ini ???'); ">Submit</button>
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
            url: "warehouse/file/cari_company.php",
            data: "id="+idlevel,
            success: function(msg){
               
                // jika tidak ada data
                if(msg == ''){
                    alert('Tidak ada data perusahaan');
                }
               
                // jika dapat mengambil data, tampilkan di combo box idcompany
                else{
                    $("#idcompany").html(msg);                                                     
                }
               
                // hilangkan image load
                $("#imgLoad").hide();
            }
        });    
    });

 $("#idcompany").change(function(){
   
        // variabel dari nilai combo box perusahaan
        var idcompany = $("#idcompany").val();
       
        // tampilkan image load
       $("#imgLoad").show("");
       
        // mengirim dan mengambil data
        $.ajax({
            type: "POST",
            dataType: "html",
            url: "warehouse/file/cari_user.php",
            data: "idcompany="+idcompany,
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