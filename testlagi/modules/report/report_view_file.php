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
        <li class="breadcrumb-item active">Master Report View Full File</li>
      </ol>
    <div class="x_title">
      <h2>Master Report View File</h2>
      <div class="clearfix"></div>
    </div>
    <div class="x_content">
       <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
          <thead>
            <tr>
              <th>No</th>
              <th>Barcode</th>
              <th>Count Read View Full File</th>
            </tr>
          </thead>
          <tbody>
            <?php
              require_once '../cores/db_function.php';
              $no = 1;
              $result = $db->showUrl();
            	while($data = $result->fetch_array()){
             ?>
            <tr>
              <td><?php echo $no++; ?></td>
              <td>
                <?php
                  $url = $data['url'];
                  $idtransaction = substr($url, strpos($url, "&id=") + 4);    
                  $result1 = $db->showTransactionById($idtransaction);
                  $idfile = $result1['idfile'];
                  
                  $result2 = $db->showFileById($idfile);
                  echo $result2['barcode'];
                ?>
              </td>
              <td><?php
                   
                   $count = $data['count'];
                   echo $count;
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