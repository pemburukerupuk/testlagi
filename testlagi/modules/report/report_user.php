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
        <li class="breadcrumb-item">Reporting</li>
        <li class="breadcrumb-item"><a href="?page=master_report">Master Report</a></li>
        <li class="breadcrumb-item">Report File Of <?php 
                                                      require_once '../cores/db_function.php';
                                                      $db = new Db_Function();
                                                      $idcompany = $_GET['id']; 
                                                      $result = $db->showCompanyById($idcompany);
                                                      echo $result['company'];  
                                                      ?> 
        </li>
      </ol>
    <div class="x_title">
      <h2>Report User</h2>
      <div class="clearfix"></div>
    </div>
    <div class="x_content">

      <div class="btn-group" role="group">

          <a href="report/exportexcel_user.php?id=<?php echo $idcompany ?>" type="button" class="btn btn-success btn-sm">Export Data File By User To Excel</a>
      </div>
      <hr>
       <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
          <thead>
            <tr>
              <th>No</th>
              <th>Email</th>
              <th>Jumlah File</th>
              <th>Jumlah Part Key File</th>
              <th>Jumlah Transaction</th>
              <th>Jumlah Recovery Transaction</th>
              <th>Total</th>
            </tr>
          </thead>
          <tbody>
            <?php
              require_once '../cores/db_function.php';
              $db = new Db_Function();
              $result1 = $db->showUserByIdCompany($idcompany);
              $no = 1;


              $totalfile = 0;
              $totalshare = 0;
              $totaltransaction = 0;
              $totalrecovery = 0;
              $totalkanan = 0;
              $totalall = 0;

              while($data = $result1->fetch_array()){
                    $iduser = $data['iduser'];
                    $jumlahfile = $db->countFileByIdUser($iduser);
                    $jumlahshare = $db->countShareByIdUser($iduser);
                    $jumlahtransaksi = $db->countTransactionByIdUser($iduser);
                    $jumlahrecovery = $db->countRecoveryByIdUser($iduser);

                    $totalfile += $jumlahfile;
                    $totalshare += $jumlahshare;
                    $totaltransaction += $jumlahtransaksi;
                    $totalrecovery += $jumlahrecovery;
                    $totalkanan = $jumlahfile+$jumlahshare+$jumlahtransaksi+$jumlahrecovery;
                    $totalall += $totalkanan;
            ?>
            <tr>
              <td><?php echo $no++; ?></td>
              <td><?php echo $data['email'] ?></td>
              <td><?php echo $jumlahfile ?></td>
              <td><?php echo $jumlahshare ?></td>
              <td><?php echo $jumlahtransaksi ?></td>
              <td><?php echo $jumlahrecovery ?></td>
              <td><?php echo $totalkanan ?></td>
            </tr>
            <?php
              }
            ?>
            <tfoot>
              <tr>
              <th colspan="2" align="center"><b>Total</b></th>
              <th><?php echo $totalfile; ?></th>
              <th><?php echo $totalshare; ?></th>
              <th><?php echo $totaltransaction; ?></th>
              <th><?php echo $totalrecovery; ?></th>
              <th><?php echo $totalall; ?></th>
            </tr>
            </tfoot>
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