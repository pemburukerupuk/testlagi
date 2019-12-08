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
        <li class="breadcrumb-item active">Data Perusahaan</li>
      </ol>
    <div class="x_title">
      <h2>Master Perusahaan</h2>
      <div class="clearfix"></div>
    </div>
    <div class="x_content">

      <div class="btn-group" role="group">
          <a href="?page=tambah_company" type="button" class="btn btn-success btn-sm">Tambah Perusahaan</a>
      </div>
      <hr>
      <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
        <thead>
          <tr>
            <th>No</th>
            <th>Nama Perusahaan</th>
            <th>Alamat</th>
            <th>No Extension</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <?php
            require_once '../cores/db_function.php';
            $db = new Db_Function();
            $result = $db->showCompany();
            $no = 1;
            while($data = $result->fetch_array()){
          ?>
          <tr>
            <td><?php echo $no++; ?></td>
            <td><?php echo $data['company'] ?></td>
            <td><?php echo $data['address'] ?></td>
            <td><?php echo $data['noextension'] ?></td>
            <td>
                <div class="btn-group  btn-group-xs">
                  <a class="btn btn-primary" type="button" href="?page=log_company&id=<?php echo $data['idcompany']; ?>">
                    <div class="btnTooltip" data-placement="top" title="Log"> 
                      <i class="fa fa-info"></i>
                    </div>
                  </a>
                  <a class="btn btn-warning" type="button" href="?page=edit_company&id=<?php echo $data['idcompany']; ?>">
                    <div class="btnTooltip" data-placement="top" title="Edit"> 
                      <i class="fa fa-pencil"></i>
                    </div>
                  </a>
                  <a class="btn btn-danger" type="button" href="?page=prosesdelete_company&id=<?php echo $data['idcompany']; ?>" 
                    onclick="return confirm('Apakah anda yakin menghapus perusahaan = <?php echo $data['company']; ?> ???'); ">
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