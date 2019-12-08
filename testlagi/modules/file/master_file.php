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
        <li class="breadcrumb-item active">Data File</li>
      </ol>
    <div class="x_title">
      <h2>Master File</h2>
      <div class="clearfix"></div>
    </div>
    <div class="x_content">

      <div class="btn-group" role="group">
          <a href="?page=tambah_file" type="button" class="btn btn-success btn-sm">Tambah File</a>
      </div>
      <hr>
      <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
        <thead>
          <tr>
            <th>No</th>
            <th>Barcode</th>
            <th>Title</th>
            <th>Send Password</th>
            <th>Info Share</th>
            <th>Manage Share</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <?php
            require_once '../cores/db_function.php';
            $db = new Db_Function();
            $result = $db->showFile();
            $no = 1;
            while($data = $result->fetch_array()){
          ?>
          <tr>
            <td><?php echo $no++; ?></td>
            <td><?php echo $data['barcode'] ?></td>
            <td><?php echo $data['title'] ?></td>
            <td><?php echo $data['sendpassword'] ?></td>
            <td>
              <?php 
                  $idfile = $data['idfile'];
                  $result1 = $db->showShareByIdFile($idfile);
                  $data2 = array();
                  while($data1 = $result1->fetch_array()){
                    $data2[] = $data1['kunci'];        
                  }
                  $data3 = count($data2);
                  if($data3 == 0 ){
                    echo "Set Now !!!";
                  }else{
                    echo "Ready";
                  } 
                ?>
            </td>
            <td>
              <div class="btn-group  btn-group-xs">
                <a class="btn btn-info" type="button" href="?page=master_share&id=<?php echo $data['idfile']; ?>">
                  <div class="btnTooltip" data-placement="top" title="View"> 
                    <i class="fa fa-share"></i>
                  </div>
                </a>
              </div>
            </td>
            <td>
                <div class="btn-group  btn-group-xs">
                  <a class="btn btn-success" type="button" href="?page=detail_file&id=<?php echo $data['idfile']; ?>">
                    <div class="btnTooltip" data-placement="top" title="Detail"> 
                      <i class="fa fa-arrows-alt"></i>
                    </div>
                  </a>
                  <a target="_blank" class="btn btn-primary" type="button" href="?page=log_file&id=<?php echo $data['idfile']; ?>">
                    <div class="btnTooltip" data-placement="top" title="Log"> 
                      <i class="fa fa-info"></i>
                    </div>
                  </a>
                  <a class="btn btn-warning" type="button" href="?page=edit_file&id=<?php echo $data['idfile']; ?>">
                    <div class="btnTooltip" data-placement="top" title="Edit"> 
                      <i class="fa fa-pencil"></i>
                    </div>
                  </a>
                  <a class="btn btn-danger" type="button" href="?page=prosesdelete_file&id=<?php echo $data['idfile']; ?>"
                    onclick="return confirm('Apakah anda yakin menghapus file = <?php echo $data['barcode']; ?> ???');">
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
<!-- jQuery -->
<script src="../assets/vendors/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $('.btnTooltip').tooltip({
    delay: { "show": 1, "hide": 300 },
    title:"<strong class='txt-highlight'>Title is from the JavaScript</strong> as given as the Tooltip options.",
    html:true,
  });   
});
</script>
<?php
}
?>