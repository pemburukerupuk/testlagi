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
        <li class="breadcrumb-item"><a href="?page=master_level">Data Level</a></li>
        <li class="breadcrumb-item active">
          Log Of <?php
                    $idlevel = $_GET['id'];
                    $result1 = $db->showLevelById($idlevel);
                    echo $result1['level'];
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
              <th class="column-title">Level </th>
              <th class="column-title">By </th>
              <th class="column-title">Date </th>
              
            </tr>
          </thead>

          <tbody>
            <?php
              require_once '../cores/db_function.php';
              $db = new Db_Function();
              $result = $db->showLogLevelByIdLevel($idlevel);
              $no = 1;
              while($data = $result->fetch_array()){
            ?>
            <tr class="even pointer">
              <td><?php echo $no++; ?></td>
              <td><?php echo $data['note'] ?></td>
              <td><?php echo $data['level'] ?></td>
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