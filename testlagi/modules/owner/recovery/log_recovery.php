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
          $idrecovery = $_GET['id'];
          $result3 = $db->showRecoveryById($idrecovery);
          $idtransaction = $result3['idtransaction'];
          $iduser= $result3['iduser_recovery'];

          $result1 = $db->ShowTransactionById($idtransaction);
          $transactioncode = $result1['transactioncode'];
        ?>
        <li class="breadcrumb-item"><a href="?page=o_master_recovery&id=<?php echo $idtransaction; ?>">Manage Transaction Of <?php echo $transactioncode; ?></a></li>
        <li class="breadcrumb-item active">
          Log Of Recovery From <?php 
                                  $iduser= $result3['iduser_recovery'];
                                  $result2 = $db->showUserById($iduser);
                                  echo $result2['email'];
                                ?>
        </li>
      </ol>
     <div class="x_content">
      <div class="table-responsive">
        <table class="table table-striped jambo_table bulk_action">
          <thead>
            <tr class="headings">
              <th class="column-title">No </th>
              <th class="column-title">Note </th>
              <th class="column-title">Key </th>
              <th class="column-title">By </th>
              <th class="column-title">Date </th>
            </tr>
          </thead>

          <tbody>
            <?php
              $idrecovery = $_GET['id'];
              $result = $db->showLogRecoveryByIdRecovery($idrecovery, $idtransaction);
              $no = 1;
              while($data = $result->fetch_array()){
            ?>
            <tr class="even pointer">
              <td><?php echo $no++; ?></td>
              <td><?php echo $data['note'] ?></td>
              <td><?php echo $data['kunci_recovery'];  ?></td>
              <td><?php echo $data['email']; ?></td>
              <td>
                <?php 
                  $date = strtotime($data['updated_at']);
                  $date1 = date('j-F-Y H:i:s',$date);
                  echo $date1;
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
</div>
<?php
}
?>