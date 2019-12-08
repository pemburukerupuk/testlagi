<?php if($_SESSION['level'] != 'Data Owner'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{
?>
<div class="col-md-12 col-sm-12 col-xs-12">
<div class="x_panel">
  <ol class="breadcrumb">
    <li class="breadcrumb-item">Personal</li>
    <li class="breadcrumb-item"><a href="?page=o_master_file">Data File</a></li>
    <li class="breadcrumb-item active">
      View Detail Of <?php
                $idfile = $_GET['id'];
                $result1 = $db->showFileById($idfile);
                echo $result1['barcode'];
             ?>
    </li>
  </ol>

  <div class="x_content">
    <div class="col-md-7 col-sm-7 col-xs-12">
      <div class="x_panel">
        <h2><b>Cover Image</b></h2>
            <hr>
        <div class="product-image">
        	<?php
        		$pathname = $result1['pathfile'];
        		$iduser =  $result1['iduser_owner'];
        		$result = $db->showUserById($iduser);
        		$email = $result['email'];
        		$path = "../file storage/".$email."/".$pathname;
            
            exec("convert \"{$path}[0]\" output.jpg");

        	?>
          <img src="output.jpg">
        </div>
      </div>
    </div>

    
      <div class="col-md-5 col-sm-5 col-xs-12">
        <div class="x_panel">
            <h2><b>Content Detail</b></h2>
            <hr>
          <div class="">
            <label class="control-label col-md-3 col-sm-3 col-xs-12">Barcode<span class=""></span></label> 
            <label class="control-label col-md-9 col-sm-9 col-xs-12"> : <?php echo $result1['barcode']; ?></label>
          </div>
          <div class="">
            <label class="control-label col-md-3 col-sm-3 col-xs-12">Title<span class=""></span></label> 
            <label class="control-label col-md-9 col-sm-9 col-xs-12"> : <?php echo $result1['title']; ?></label>
          </div>
          <div class="">
          <label class="control-label col-md-3 col-sm-3 col-xs-12">Owner<span class=""></span></label> 
          <label class="control-label col-md-9 col-sm-9 col-xs-12"> : 
            <?php 
              $idcompany = $result['idcompany'];
              $result2 = $db->showCompanyById($idcompany);
              $company = $result2['company'];
              echo $company;
            ?>
              
          </label>
        </div>
      </div>
      <div class="x_panel">
          <div class="">
            <form enctype="multipart/form-data" id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="POST" 
              action="?page=menu_requestfile">
              <div class="form-group" hidden="">
                <div class="col-md-6 col-sm-6 col-xs-12">
                  <input type="text" id="idfile" name="idfile" required="required" class="form-control col-md-7 col-xs-12" 
                  value="<?php echo $result1['idfile'] ?>">
                </div>
              </div>
               <div class="form-group" hidden="">
                <div class="col-md-6 col-sm-6 col-xs-12">
                  <input type="text" id="iduser" name="iduser" required="required" class="form-control col-md-7 col-xs-12" 
                  value="<?php echo $_SESSION['iduser'] ?>">
                </div>
              </div>

              <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                    <button type="submit" class="btn btn-round btn-success">Request To Full View</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
<?php
}
?>