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
        <li class="breadcrumb-item">Master</li>
        <li class="breadcrumb-item"><a href="?page=o_master_transaction">Data Transaction</a></li>
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
      <h2>History Recovery</h2>
      <div class="clearfix"></div>
    </div>
    <div class="x_content">
       <div class="btn-group" role="group">
          <a href="?page=o_tambah_recovery&id=<?php echo $idtransaction; ?>" type="button" class="btn btn-success btn-sm"> Recovery This Transaction</a>
        </div>
      <hr>
      <table class="table table-striped jambo_table bulk_action">
          <thead>
            <tr class="headings">
              <th class="column-title">No </th>
              <th class="column-title">Email </th>
              <th class="column-title">Key </th>
              <th class="column-title">Status Key </th>
              <th class="column-title">Date Recovery </th>
              <th class="column-title">Action </th>
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
              <td><?php echo substr($data['kunci_recovery'], 0, 10); echo "[xxx]"; ?></td>
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
                  <?php 
                    $date = strtotime($data['date_at']);
                    $date1 = date('j-F-Y H:i:s',$date);
                    echo $date1;
                  ?>
                </td>
              <td>
                <?php
                if($data['iduser_recovery'] == $_SESSION['iduser']){
                ?>
                <div class="btn-group  btn-group-xs">
                    <a target="_blank" class="btn btn-primary" type="button" href="?page=o_log_recovery&id=<?php echo $data['idrecovery'];?>">
                      <div class="btnTooltip" data-placement="top" title="Log"> 
                        <i class="fa fa-info"></i>
                      </div>
                    </a>
                    <a class="btn btn-warning" type="button" href="?page=o_edit_recovery&id=<?php echo $data['idrecovery']; ?>">                 
                      <div class="btnTooltip" data-placement="top" title="Update"> 
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
                <?php
                }
                ?>
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