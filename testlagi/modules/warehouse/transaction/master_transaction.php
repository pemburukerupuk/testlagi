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
        <li class="breadcrumb-item active">Data Transaction</li>
      </ol>
    <div class="x_title">
      <h2>Master Transaction</h2>
      <div class="clearfix"></div>
    </div>
    <div class="x_content">
      <div class="btn-group" role="group">
          <a href="?page=w_tambah_transaction" type="button" class="btn btn-success btn-sm">Tambah Transaction</a>
      </div>
      <hr>
      <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
        <thead>
          <tr>
            <th>No</th>
            <th>Transaction Code</th>
            <th>Request By</th>
            <th>Date Request</th>
            <th>Info Recovery</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <?php
            require_once '../cores/db_function.php';
            $db = new Db_Function();

            $result = $db->showTransaction();
            $no = 1;
            while($data = $result->fetch_array()){
          ?>
          <tr>
            <td><?php echo $no++; ?></td>
            <td><?php echo $data['transactioncode'] ?></td>
            <td><?php echo $data['email'] ?></td>
            <td><?php echo $data['date_req'] ?></td>
            <td>
              <?php
                
                $idtransaction = $data['idtransaction'];
                $result1= $db->showRecoveryByIdTransaction($idtransaction);

                  $kunci = array();
                  while($data1 = $result1->fetch_array()){
                   $kunci[] = $data1['kunci_recovery'];
                  }
                  $count = count($kunci);

                  if($count < 3){
                    echo "Recovery In Progress";
                  }else{
                    $quorum = 3;
                    $status = $db->checkRecover(array_slice($kunci, 0, $quorum));
                    if($status){
                      echo "Data Owner Accepted this transaction";
                    }else{
                      echo "Recovery Error";
                    }
                  }
              ?>
            </td>
            <td>
                <div class="btn-group  btn-group-xs">
                  <a class="btn btn-info" type="button" href="?page=w_master_recovery&id=<?php echo $data['idtransaction']; ?>">
                    <div class="btnTooltip" data-placement="top" title="Progress Recovery"> 
                      <i class="fa fa-share"></i>
                    </div>
                  </a>
                  <a class="btn btn-danger" type="button" href="?page=w_prosesdelete_transaction&id=<?php echo $data['idtransaction']; ?>"
                    onclick="return confirm('Apakah anda yakin menghapus transaksi = <?php echo $data['transactioncode']; ?> ???');">
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