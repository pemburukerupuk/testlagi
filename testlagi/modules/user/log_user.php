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
        <li class="breadcrumb-item"><a href="?page=master_user">Data Account</a></li>
        <li class="breadcrumb-item active">
          Log Of <?php
                    $iduser = $_GET['id'];
                    $result1 = $db->showUserById($iduser);
                    echo $result1['email'];
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
              <th class="column-title">Username </th>
              <th class="column-title">Email </th>
              <th class="column-title">Perusahaan </th>
              <th class="column-title">Info </th>
              <th class="column-title">By </th>
              <th class="column-title">Date </th>
              
            </tr>
          </thead>

          <tbody>
            <?php
              require_once '../cores/db_function.php';
              $db = new Db_Function();

              if($iduser == 12){
                $result = $db->showLogUserByIdAdministrator($iduser);
                  $no = 1;
                  while($data = $result->fetch_array()){
                ?>
                <tr class="even pointer">
                  <td><?php echo $no++; ?></td>
                  <td><?php echo $data['note'] ?></td>
                  <td><?php echo $data['username'] ?></td>
                  <td><?php echo $data['email'] ?></td>
                  <td><?php echo "System"?></td>
                  <td><?php echo $data['info'] ?></td>
                  <td><?php echo "System"?></td>
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
                }else{
                  $result = $db->showLogUserByIdUser($iduser);
            
                  $no = 1;
                  while($data = $result->fetch_array()){
                ?>
                <tr class="even pointer">
                  <td><?php echo $no++; ?></td>
                  <td><?php echo $data['note'] ?></td>
                  <td><?php echo $data['username'] ?></td>
                  <td><?php echo $data['email'] ?></td>
                  <td>
                    <?php 
                      $idcompany = $data['idcompany'];
                      $result3 = $db->showCompanyById($idcompany);
                      echo $result3['company'];
                    ?>
                  </td>
                  <td><?php echo $data['info'] ?></td>
                  <td>
                    <?php 
                      $iduser = $data['iduser'];
                      $result2 = $db->showUserById($iduser);
                      echo $result2['username'];
                    ?>
                  </td>
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