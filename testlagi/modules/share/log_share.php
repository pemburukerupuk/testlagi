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
        <li class="breadcrumb-item"><a href="?page=master_file">Data File</a></li>
        <?php
          require_once '../cores/db_function.php';
          $db = new Db_Function();
          $idfile = $_GET['idfile'];
          $result1 = $db->showFileById($idfile);
          $barcode = $result1['barcode'];
          $iduser = $result1['iduser_owner'];
        ?>
        <li class="breadcrumb-item"><a href="?page=master_share&id=<?php echo $idfile; ?>">Manage Share Of <?php echo $barcode; ?></a></li>
        <li class="breadcrumb-item active">
          Log Of Key From <?php
                            $iduser = $result1['iduser_owner'];
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
              
              require_once '../cores/db_function.php';
              $db = new Db_Function();
              $idshare = $_GET['id'];
              $result = $db->showLogShareByIdShare($idshare, $idfile);
              $no = 1;
              while($data = $result->fetch_array()){
            ?>
            <tr class="even pointer">
              <td><?php echo $no++; ?></td>
              <td><?php echo $data['note'] ?></td>
              <td><?php echo $data['kunci'] ?></td>
              <td><?php echo $data['username'] ?></td>
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