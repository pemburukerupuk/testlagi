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
        <li class="breadcrumb-item active">Master Report</li>
      </ol>
    <div class="x_title">
      <h2>Master Report</h2>
      <div class="clearfix"></div>
    </div>
    <div class="x_content">

      <div class="btn-group" role="group">
          <a href="report/exportexcel_company.php" type="button" class="btn btn-success btn-sm">Export Data File By Perusahaan To Excel</a>
      </div>
      <hr>
       <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
          <thead>
            <tr>
              <th>No</th>
              <th>Nama Perusahaan</th>
              <th>Jumlah File</th>
              <th>Jumlah Transaksi</th>
              <th>Total</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <?php
              require_once '../cores/db_function.php';
              $db = new Db_Function();
              $result = $db->showCompany();
              $no = 1;

              $totalfile = 0;
              $totaltransaction = 0;
              $totaltransactiondanfile = 0;
              $totalall = 0;

              while($data = $result->fetch_array()){
                    $idcompany = $data['idcompany'];
                    $jumlahfile = $db->countFileByIdCompany($idcompany);
                    $jumlahtransaction = $db->countTransactionByIdCompany($idcompany);
                    $totalfile += $jumlahfile;
                    $totaltransaction += $jumlahtransaction;
                    $totaltransactiondanfile = $jumlahfile+$jumlahtransaction;
                    $totalall += $totaltransactiondanfile;

            ?>
            <tr>
              <td><?php echo $no++; ?></td>
              <td><?php echo $data['company'] ?></td>
              <td><?php echo $jumlahfile ?></td>
              <td><?php echo $jumlahtransaction ?></td>
              <td><?php echo $totaltransactiondanfile ?></td>
              <td><a href="?page=report_user&id=<?php echo $idcompany ?>">View Detail</a></td>
            </tr>
            <?php
              }
            ?>
            <tfoot>
              <tr>
              <th colspan="2" align="center"><b>Total</b></th>
              <th><?php echo $totalfile; ?></th>
              <th><?php echo $totaltransaction; ?></th>
              <th><?php echo $totalall; ?></th>
              <th></th>
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