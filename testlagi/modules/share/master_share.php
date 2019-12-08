<?php if($_SESSION['level'] != 'Administrator'){
      echo "<script>
            alert('Tidak Diperkenankan !!!'); 
            history.back();
         </script>";
}else{
?>
 <div class="col-md-12 col-sm-12 col-xs-12">
  <div class="x_panel">
     <ol class="breadcrumb">
        <li class="breadcrumb-item">Master</li>
        <li class="breadcrumb-item"><a href="?page=master_file">Data File</a></li>
        <?php
          require_once '../cores/db_function.php';
          $db = new Db_Function();
          $idfile = $_GET['id'];
          $result1 = $db->ShowFileById($idfile);
          $barcode = $result1['barcode'];
        ?>
        <li class="breadcrumb-item active">Manage Share Of <?php echo $barcode; ?> </li>
      </ol>
    <div class="x_title">
      <h2>Master Share</h2>
      <div class="clearfix"></div>
    </div>
    <div class="x_content">

      <div class="btn-group" role="group">
          <a href="?page=tambah_share&id=<?php echo $idfile; ?>" type="button" class="btn btn-success btn-sm">Tambah Share</a>

          
      </div>

      <hr>
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>No</th>
            <th>Email</th>
            <th>Key</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <?php
           
            $result = $db->showShareByIdFile($idfile);
            $no = 1;
            while($data = $result->fetch_array()){
          ?>
          <tr>
            <td><?php echo $no++; ?></td>
            <td><?php
                  $iduser = $data['iduser_share'];
                  $result2 = $db->showUserById($iduser);
                  echo $result2['email'];
                ?>    
            </td>
            <td>
              <?php 
                if($data['kunci'] == 0){
                  echo "Contact Sender to Set password !!!";
                }else{
                  echo $data['kunci'];
                } 
              ?>
            </td>
            <td>
                <div class="btn-group btn-group-xs">
                   <a target="_blank" class="btn btn-primary" type="button" href="?page=log_share&id=<?php echo $data['idshare']; ?>&idfile=<?php echo $idfile; ?>">
                    <div class="btnTooltip" data-placement="top" title="Log"> 
                      <i class="fa fa-info"></i>
                    </div>
                  </a>
                  <a class="btn btn-danger" type="button" href="?page=prosesdelete_share&id=<?php echo $data['idshare']; ?>"
                    onclick="return confirm('Apakah anda yakin menghapus share key = <?php echo $result2['email']; ?> ???');">
                    <div class="btnTooltip" data-placement="top" title="Delete">
                      <i class="fa fa-times"></i>
                    </div>    
                  </a>
                </div>
            </td>
          </tr>
          <?php
            }
          ?>
        </tbody>
      </table>


    </div>
  </div>
</div>
<?php
}
?>