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
        <li class="breadcrumb-item active">Data Transaction</li>
      </ol>
    <div class="x_title">
      <h2>Master Transaction</h2>
      <div class="clearfix"></div>
    </div>
    <div class="x_content">
      <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
        <thead>
          <tr>
            <th>No</th>
            <th>Transaction Code</th>
            <th>Request By</th>
            <th>Date Request</th>
            <th>Personal Recovery</th>
            <th>Team Recovery</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <?php
            require_once '../cores/db_function.php';
            $db = new Db_Function();
            $idcompany = $_SESSION['idcompany'];
            $result = $db->showTransactionByIdCompany($idcompany);
            $no = 1;
            while($data = $result->fetch_array()){
          ?>
          <tr>
            <td><?php echo $no++; ?></td>
            <td><?php echo $data['transactioncode'] ?></td>
            <td><?php 
                  $iduser = $data['iduser_req'];
                  $result2 = $db->showUserById($iduser);
                  echo $result2['email'];
                ?>
            </td>
            <td><?php echo $data['date_req'] ?></td>
            <td><?php

                  $idtransaction = $data['idtransaction'];
                  $result3 = $db->showTransactionById($idtransaction);
                  $idfile = $result3['idfile'];
                  $iduser_share = $_SESSION['iduser'];
                  $result4 = $db->showShareByIdFileAndIdUser($idfile, $iduser_share);

                  while ($data2 = $result4->fetch_array()) {
                    $kunci_recovery = $data2['kunci'];
                    $iduser_recovery = $data2['iduser_share'];
                    $idfile = $data2['idfile'];

                    $checkRecovery = $db->checkRecoveryWithIdTransactionAndIdUserOwner($idtransaction, $iduser_recovery);
                    $checkAll = $db->checkRecoveryWithIdTransactionAndIdUserOwnerKunci($idtransaction, $iduser_recovery,$kunci_recovery);

                    if($checkRecovery == TRUE && $checkAll == 0 ){
                      echo "Update Key";
                    }elseif($checkRecovery == TRUE && $checkAll == TRUE){
                      echo "Done";
                    }else{
                      echo "Recovery Now !!!";
                    }
                  }
                  
               ?>
            </td>
            <td>
              <?php
                $idtransaction = $data['idtransaction'];
                $result1= $db->showRecoveryByIdTransaction($idtransaction);

                  $kunci_all = array();
                  $kunci_recovery = array();
                  while($data1 = $result1->fetch_array()){
                    $iduser_recovery = $data1['iduser_recovery'];
                    $kunci = $data1['kunci_recovery'];
                    $kunci_recovery[] = $data1['kunci_recovery'];

                    $result2 = $db->showTransactionById($idtransaction);
                    $idfile = $result2['idfile'];

                    $check_kunci = $db->checkKunciWithIduserOwnerAndIdFile($kunci, $iduser_recovery, $idfile);
                    if($check_kunci){
                      $kunci_all[] = $data1['kunci_recovery'];
                    }
                  }

                  $count = count($kunci_all);
                  $count1 = count($kunci_recovery);
                  if($count1 < 3){
                    echo "Recovery In Progress";
                  }elseif($count < 3){
                    echo "Expired Access";
                  }else{
                    $quorum = 3;
                    $status = $db->checkRecover(array_slice($kunci_all, 0, $quorum));

                    if($status){
                      echo "Accepted this Transaction";
                    }else{
                      echo "Recovery Error";
                    }
                  }
                  
                
              ?>
            </td>

            <td>
               <div class="btn-group  btn-group-xs">
               
                  <a class="btn btn-success btn-xs" type="button" href="?page=o_master_recovery&id=<?php echo $data['idtransaction'];?>">
                    <div class="btnTooltip" data-placement="top" title="View"> 
                      <i class="fa fa-share"></i>
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