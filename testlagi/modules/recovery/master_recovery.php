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
        <li class="breadcrumb-item"><a href="?page=master_transaction">Data Transaction</a></li>
        <?php
          require_once '../cores/db_function.php';
          $db = new Db_Function();
          $idtransaction = $_GET['id'];
          $result1 = $db->ShowTransactionById($idtransaction);
          $transactioncode = $result1['transactioncode'];
        ?>
        <li class="breadcrumb-item active">Manage Transaction Of <?php echo $transactioncode; ?> </li>
      </ol>
    <div class="x_title">
      <h2>Master Recovery</h2>
      <div class="clearfix"></div>
    </div>
    <div class="x_content">
       <div class="btn-group" role="group">
          <a href="?page=tambah_recovery&id=<?php echo $idtransaction; ?>" type="button" class="btn btn-success btn-sm">Tambah Recovery</a>
        </div>
      <hr>
      <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
        <thead>
          <tr>
            <th>No</th>
            <th>Email</th>
            <th>Key</th>
            <th>Status Key</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <?php
            $idfile = $result1['idfile'];
            $result = $db->showRecoveryByIdTransaction($idtransaction);
            $no = 1;
            while($data = $result->fetch_array()){
          ?>
          <tr>
            <td><?php echo $no++; ?></td>
            <td>
              <?php  
                  $iduser = $data['iduser_recovery'];
                  $result2 = $db->showUserById($iduser);
                  $email = $result2['email'];
                  echo $email;
              ?>  
            </td>
            <td><?php echo $data['kunci_recovery'];  ?></td>
            <td><?php 
                    
                    $iduser_share = $data['iduser_recovery'];
                    $result3 = $db->showShareByIdFileAndIdUser($idfile, $iduser_share);
                    
                    while ($data1 = $result3->fetch_array()) {
                      $keyshare = $data1['kunci'];
                      $keyrecovery = $data['kunci_recovery'];
                      if($keyshare == $keyrecovery){
                      echo '<b style="color:green;text-align:center;">Valid</b>';
                    }else{
                      echo '<b style="color:red;text-align:center;">Invalid<b>';
                    }
                    }
                    
                  ?>
              </td>
            <td>
              <div class="btn-group  btn-group-xs">
                 <a target="_blank" class="btn btn-primary" type="button" href="?page=log_recovery&id=<?php echo $data['idrecovery'];?>">
                    <div class="btnTooltip" data-placement="top" title="Log"> 
                      <i class="fa fa-info"></i>
                    </div>
                  </a>
                   <a class="btn btn-warning" type="button" href="?page=edit_recovery&id=<?php echo $data['idrecovery'];?>&iduser=<?php echo $iduser; ?>&idtransaction=<?php echo $idtransaction; ?>">
                    <div class="btnTooltip" data-placement="top" title="Edit"> 
                      <i class="fa fa-pencil"></i>
                    </div>
                  </a>
               <a class="btn btn-danger" type="button" href="?page=prosesdelete_recovery&id=<?php echo $data['idrecovery']; ?>&idtransaction=<?php echo $idtransaction; ?>"
                  onclick="return confirm('Apakah anda yakin menghapus key = <?php echo $data['kunci_recovery']; ?> ???');">
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