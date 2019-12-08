
 <div class="col-md-12 col-sm-12 col-xs-12">
  <div class="x_panel">
     <ol class="breadcrumb">
        <li class="breadcrumb-item">Personal</li>
        <li class="breadcrumb-item active">My Transaction</li>
      </ol>
    <div class="x_title">
      <h2>My Transaction</h2>
      <div class="clearfix"></div>
    </div>
    <div class="x_content">
      <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
        <thead>
          <tr>
            <th>No</th>
            <th>Transaction Code</th>
            <th>Date Request</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          <?php
            require_once '../cores/db_function.php';
            $db = new Db_Function();
            $iduser_req = $_SESSION['iduser'];
            $result = $db->showTransactionByIdUser($iduser_req);
            $no = 1;
            while($data = $result->fetch_array()){
          ?>
          <tr>
            <td><?php echo $no++; ?></td>
            <td><?php echo $data['transactioncode'] ?></td>
            <td><?php echo $data['date_req'] ?></td>
           
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

                  ?>
                      <div class="btn-group  btn-group-xs">
                        <a class="btn btn-success btn-xs" type="button" href="?page=open_file&id=<?php echo $data['idtransaction'];?>">
                          <div class="btnTooltip" data-placement="top" title="View"> 
                            <i class="fa fa-arrows-alt"></i>
                          </div>
                        </a>
                        
                      </div>
                    <?php
                    }else{
                      echo "Recovery Error";
                    }
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