<?php if($_SESSION['level'] != 'Data Warehouse'){
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
        <li class="breadcrumb-item"><a href="?page=w_master_transaction">Data Transaction</a></li>
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
      <h2>Progress Recovery</h2>
      <div class="clearfix"></div>
    </div>
    <div class="x_content">
       <div class="table-responsive">
        <table class="table table-striped jambo_table bulk_action">
          <thead>
            <tr class="headings">
              <th class="column-title">No</th>
              <th class="column-title">Email</th>
              <th class="column-title">Key</th>
              <th class="column-title">Status Key</th>      
              <th class="column-title">Date Recovery</th>
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
            <td><?php echo substr($data['kunci_recovery'],0,10);echo "[xxx]   <-   Secure, Not Show All"  ?></td>
            <td><?php 
                  
                  $iduser_share = $data['iduser_recovery'];
                  $result3 = $db->showShareByIdFileAndIdUser($idfile, $iduser_share);
                  
                  while ($data1 = $result3->fetch_array()) {
                    $keyshare = $data1['kunci'];
                    $keyrecovery = $data['kunci_recovery'];
                    if($keyshare == $keyrecovery){
                    echo "Valid";
                  }else{
                    echo "Invalid";
                  }
                  }
                  
                ?>
            </td>
            <td><?php echo $data['date_at'];  ?></td>
            
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