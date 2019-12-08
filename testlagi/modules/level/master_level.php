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
        <li class="breadcrumb-item active">Data Level</li>
      </ol>
    <div class="x_title">
      <h2>Master Level</h2>
      <div class="clearfix"></div>
    </div>
    <div class="x_content">

      <div class="btn-group" role="group">
          <a href="?page=tambah_level" type="button" class="btn btn-success btn-sm">Tambah Level</a>
      </div>
      <hr>
      <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
        <thead>
          <tr>
            <th>No</th>
            <th>Level</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <?php
            require_once '../cores/db_function.php';
            $db = new Db_Function();
            $result = $db->showLevel();
            $no = 1;
            while($data = $result->fetch_array()){
          ?>
          <tr>
            <td><?php echo $no++; ?></td>
            <td><?php echo $data['level'] ?></td>
            <td>
              <div class="btn-group  btn-group-xs">
                <a target="_blank" class="btn btn-primary" type="button" href="?page=log_level&id=<?php echo $data['idlevel']; ?>">
                  <div class="btnTooltip" data-placement="top" title="Log"> 
                    <i class="fa fa-info"></i>
                  </div>
                </a>
                <a class="btn btn-warning" href="?page=edit_level&id=<?php echo $data['idlevel']; ?>">
                  <div class="btnTooltip" data-placement="top" title="Edit">
                    <i class="fa fa-pencil"></i>
                  </div>
                </a>
                <a class="btn btn-danger" href="?page=prosesdelete_level&id=<?php echo $data['idlevel']; ?>" 
                  onclick="return confirm('Apakah anda yakin menghapus level = <?php echo $data['level']; ?> ???'); ">
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