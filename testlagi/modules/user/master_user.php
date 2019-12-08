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
        <li class="breadcrumb-item active">Data Account</li>
      </ol>
    <div class="x_title">
      <h2>Master Account</h2>
      <div class="clearfix"></div>
    </div>
    <div class="x_content">

      <div class="btn-group" role="group">
          <a href="?page=tambah_user" type="button" class="btn btn-success btn-sm">Tambah Account</a>
      </div>
      <hr>
      <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
        <thead>
          <tr>
            <th>No</th>
            <th>Username</th>
            <th>Email</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <?php
            require_once '../cores/db_function.php';
            $db = new Db_Function();
            $result = $db->showUser();
            $no = 1;
            while($data = $result->fetch_array()){
          ?>
          <tr>
            <td><?php echo $no++; ?></td>
            <td><?php echo $data['username'] ?></td>
            <td><?php echo $data['email'] ?></td>
            <td>
              <div class="btn-group  btn-group-xs">
                <a target="_blank" class="btn btn-primary" type="button" href="?page=log_user&id=<?php echo $data['iduser']; ?>">
                  <div class="btnTooltip" data-placement="top" title="Log"> 
                    <i class="fa fa-info"></i>
                  </div>
                </a>
                <a target="_blank" class="btn btn-success" type="button" href="user/print.php?id=<?php echo $data['iduser']; ?>">
                  <div class="btnTooltip" data-placement="top" title="Cetak"> 
                    <i class="fa fa-print"></i>
                  </div>
                </a>
                <a class="btn btn-warning" href="?page=edit_user&id=<?php echo $data['iduser']; ?>">
                  <div class="btnTooltip" data-placement="top" title="Edit">
                    <i class="fa fa-pencil"></i>
                  </div>
                </a>
                <a class="btn btn-danger" href="?page=prosesdelete_user&id=<?php echo $data['iduser']; ?>" 
                  onclick="return confirm('Apakah anda yakin menghapus username = <?php echo $data['username']; ?> ???'); ">
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