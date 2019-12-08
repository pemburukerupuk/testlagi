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
      <li class="breadcrumb-item active">
 		   <h1><b>C. Proses Dekripsi dengan data berikut : </b></h1>
      </li>
      <hr>
 
 		<?php
   		$idfile = $_GET['id'];
   		$kunci = array();
			$kunci_all = $_POST['kuncipilihan'];
      $quorum = count($kunci_all);
			$status = $db->recover(array_slice($kunci_all, 0, $quorum), $idfile);
			$count = strlen($status)*2;
	 ?>
      <ol class="breadcrumb"></ol>
  			<table class="table table-bordered" cellspacing="0">
            <thead>
              <tr>
                <th>User Ke</th>
                <th>Chippercode</th>
              </tr>
            </thead>
            <tbody>
            <?php
              foreach ($kunci_all as $key) {

                $min = sprintf('%02s',substr($key, 0, 2));
                $part_no = sprintf('%02s',substr($key, 2, 2));
                $user_no = intval(substr($key, 2, 2));
                $kode = sprintf('%02s',substr($key, 4, $count));
             
            ?>
                <tr>
                  <td><?php echo $user_no ?></td>
                  <td><?php echo $min,$part_no,$kode; ?> </td>
             
                </tr>
            <?php
              }
            ?>
            </tbody>
        </table>


          <table class="table table-bordered display nowrap" cellspacing="0">
            <thead>
              <tr>
                <th>Min (t)</th>
                <th>Part (n)</th>
              <?php
                $potong = $status;
                $satusatu = str_split($potong);
                for ($b=0; $b < strlen($status); $b++) { 
                    $ambil = $satusatu[$b];  
                    $ke2 = $b+1;
                    echo 
                        "<th> 
                          Hex Ke ".$ke2. 
                        "</th>";
                }
            ?>
              </tr>
            </thead>
              <tbody>
              <?php
                foreach ($kunci_all as $key) {

                  $min = sprintf('%02s',substr($key, 0, 2));
                  $part_no = sprintf('%02s',substr($key, 2, 2));
               
              ?>
                  <tr>
                    <td><?php echo $min ?></td>
                    <td><?php echo $part_no ?></td>
                    
              <?php
              
                $kode = sprintf('%02s',substr($key, 4, $count));
                $hex = array();
                $ascii = array();
                for ($i=0; $i < strlen($kode) ; $i+=2) { 
                  $parts = sprintf('%02s',substr($kode, $i, 2));
                  $hex[] = sprintf('%02s',$parts);
                }

                    
                for ($c=0; $c < strlen($status); $c++) { 
                  
                  $hasil = $hex[$c];
                  echo "<td>".$hasil." (Hexadecimal)</td>";
                  
                }
              ?>
                  </tr>
              <?php
                }
              ?>
              </tbody>
            </table>  


          <ol class="breadcrumb"></ol>
          <table class="table table-bordered display nowrap" cellspacing="0">
            <thead>
              <tr>
                <th>Min (t)</th>
                <th>Part (n)</th>
              <?php
                $potong = $status;
                $satusatu = str_split($potong);
                for ($b=0; $b < strlen($status); $b++) { 
                    $ambil = $satusatu[$b];  
                    $ke2 = $b+1;
                    echo 
                        "<th> 
                          Hex Ke ".$ke2. 
                        "</th>";
                }
            ?>
              </tr>
            </thead>
              <tbody>
              <?php
                foreach ($kunci_all as $key) {

                  $min = sprintf('%02s',substr($key, 0, 2));
                  $part_no = sprintf('%02s',substr($key, 2, 2));
               
              ?>
                  <tr>
                    <td><?php echo $min ?></td>
                    <td><?php echo $part_no ?></td>
                    
              <?php
              
                $kode = sprintf('%02s',substr($key, 4, $count));
                $hex = array();
                $ascii = array();
                for ($i=0; $i < strlen($kode) ; $i+=2) { 
                  $parts = sprintf('%02s',substr($kode, $i, 2));
                  $hex[] = sprintf('%02s',$parts);
                }

                    
                for ($c=0; $c < strlen($status); $c++) { 
                  
                  $hasil = hexdec($hex[$c]);
                  echo "<td>".$hasil." (Decimal)</td>";
                  
                }
              ?>
                  </tr>
              <?php
                }
              ?>
              </tbody>

            </table>

          <ol class="breadcrumb"></ol>
          <table class="table table-bordered display nowrap" cellspacing="0">
            <thead>
              <tr>
                <th>Min (t)</th>
                <th>Part (n)</th>
                <th>Rumus</th>    
              <?php
                $potong = $status;
                $satusatu = str_split($potong);
                for ($b=0; $b < strlen($status); $b++) { 

                    $ambil = $satusatu[$b];  
                    $ke2 = $b+1;
              ?>
                        <th>Char Ke 
                          <?php echo $ke2; ?>
                        </th>
                       
                    
              <?php
                }
              ?>
              </tr>
            </thead>
              <tbody>
              	<?php
                
                for ($zzz=0; $zzz < count($kunci_all); $zzz++) { 
                

	                  $min = sprintf('%02s',substr($kunci_all[$zzz], 0, 2));
	                  $part_no = sprintf('%02s',substr($kunci_all[$zzz], 2, 2));
	               
	              ?>
	                  <tr>
	                    <td><?php echo $min ?></td>
	                    <td><?php echo $part_no ?></td>  
                      <td>
                        <?php
                           
                          if($part_no == "01"){
                            echo "L<sub>0</sub>(x) / L<sub>0</sub>(x<sub>0</sub>) * y<sub>0</sub> = ";
                          }
                          if($part_no == "02"){
                             echo "L<sub>1</sub>(x) / L<sub>1</sub>(x<sub>1</sub>) * y<sub>1</sub> = ";
                          }
                          if($part_no == "03"){
                             echo "L<sub>2</sub>(x) / L<sub>2</sub>(x<sub>2</sub>) * y<sub>2</sub> = ";
                          }
                          if($part_no == "04"){
                             echo "L<sub>3</sub>(x) / L<sub>3</sub>(x<sub>3</sub>) * y<sub>3</sub> = ";
                          }
                          if($part_no == "05"){
                             echo "L<sub>4</sub>(x) / L<sub>4</sub>(x<sub>4</sub>) * y<sub>4</sub> = ";
                          }
                        ?>
                     

                      </td>
	              <?php
                  
	                $kode = sprintf('%02s',substr($kunci_all[$zzz], 4, $count));
                  
	                $hex = array();
	                for ($i=0; $i < strlen($kode) ; $i+=2) { 
	                  $parts = sprintf('%02s',substr($kode, $i, 2));
	                  $hex[] = sprintf('%02s',$parts);
	                }

	                for ($c=0; $c < strlen($status); $c++) { 
	                  $char_no = $c+1;
	                  $r_dec = hexdec($hex[$c]);
                    $result = $db->showRecoverSSSByIdId($idfile, $char_no, $r_dec);
                    while ($data1 = $result->fetch_array()) {
                      echo "<td>";
                        

                        if($data1['r_koef']){
                          echo $data1['r_koef']." x ";
                        }
                        if($data1['r_dec']){
                          echo $data1['r_dec']." = ";
                        }
                        if($data1['r_koef'] && $data1['r_dec']){
                           echo $data1['r_koef'] * $data1['r_dec'];
                        }
                      echo "</td>";
                    }
                    

	                }    
	              ?>
	                  </tr>
	              <?php
	                }
                  
	              ?>
              </tbody>
            </table> 




          <ol class="breadcrumb"></ol>
          <table class="table table-bordered display nowrap" cellspacing="0">
            <thead>
              <tr>
              <?php
                $potong = $status;
                $satusatu = str_split($potong);
                for ($b=0; $b < strlen($status); $b++) { 

                    $ambil = $satusatu[$b];  
                    $ke2 = $b+1;
              ?>
                        <th>Char Ke 
                          <?php 
                              echo $ke2." | ";
                                  
                                  for ($zzzi=0; $zzzi < count($kunci_all); $zzzi++) { 
                                  $part_no_head = sprintf('%02s',substr($kunci_all[$zzzi], 2, 2));

                                  if($part_no_head == "01"){
                                    echo "(L<sub>0</sub>(x) / L<sub>0</sub>(x<sub>0</sub>) * y<sub>0</sub>)";
                                    if($part_no_head == $part_no){
                                      echo " mod p = ";
                                    }else{
                                      echo " + ";
                                    }
                                  }
                                  if($part_no_head == "02"){
                                     echo "(L<sub>1</sub>(x) / L<sub>1</sub>(x<sub>1</sub>) * y<sub>1</sub>)";
                                     if($part_no_head == $part_no){
                                      echo " mod p = ";
                                    }else{
                                      echo " + ";
                                    }
                                  }
                                  
                                  if($part_no_head == "03"){
                                     echo "(L<sub>2</sub>(x) / L<sub>2</sub>(x<sub>2</sub>) * y<sub>2</sub>)";
                                     if($part_no_head == $part_no){
                                      echo " mod p = ";
                                    }else{
                                      echo " + ";
                                    }
                                  }
                                  
                                  if($part_no_head == "04"){
                                     echo "(L<sub>3</sub>(x) / L<sub>3</sub>(x<sub>3</sub>) * y<sub>3</sub>)";
                                     if($part_no_head == $part_no){
                                      echo " mod p = ";
                                    }else{
                                      echo " + ";
                                    }
                                  }
                                  
                                  if($part_no_head == "05"){
                                     echo "(L<sub>4</sub>(x) / L<sub>4</sub>(x<sub>4</sub>) * y<sub>4</sub>)";
                                     if($part_no_head == $part_no){
                                      echo " mod p = ";
                                    }else{
                                      echo " + ";
                                    }
                                  }
                                  
                                  }
                                ?>
                      
                        </th>
                       
                    
              <?php
                }
              ?>
              </tr>
            </thead>
              <tbody>
                <?php
                $final_loop = array();
                for ($zzz=0; $zzz < count($kunci_all); $zzz++) { 
                

                    $min = sprintf('%02s',substr($kunci_all[$zzz], 0, 2));
                    $part_no = sprintf('%02s',substr($kunci_all[$zzz], 2, 2));

                  $kode = sprintf('%02s',substr($kunci_all[$zzz], 4, $count));
                  
                  $hex = array();
                  for ($i=0; $i < strlen($kode) ; $i+=2) { 
                    $parts = sprintf('%02s',substr($kode, $i, 2));
                    $hex[] = sprintf('%02s',$parts);
                  }

                  $loop = array();
                  $c = array();
                  for ($c=0; $c < strlen($status); $c++) { 

                    $char_no = $c+1;
                    $r_dec = hexdec($hex[$c]);
                    $result = $db->showRecoverSSSByIdId($idfile, $char_no, $r_dec);
                    while ($data1 = $result->fetch_array()) {
                      
                      $data = $data1['r_koef'] * $data1['r_dec'];
                       
                      
                    }
                    $loop[] = $data;
                  }
                  $final_loop[] = $loop;
                  
                }
                

                  $bahan = $final_loop;
                 
                  for ($ii=0; $ii < strlen($status); $ii++) {
                    $data9 = 0;
                    for ($i=0; $i < count($kunci_all); $i++) { 
                      $data9 += $bahan[$i][$ii];
                    }
                    echo "<td>";
                    echo $data9 % 257;
                    echo "</td>";
                  }
                ?>
              </tbody>
            </table>  






          <ol class="breadcrumb"></ol>
          <table class="table table-bordered display nowrap" cellspacing="0">
            <thead>
              <tr>
              <?php
                $potong = $status;
                $satusatu = str_split($potong);
                for ($b=0; $b < strlen($status); $b++) { 

                    $ambil = $satusatu[$b];  
                    $ke2 = $b+1;
              ?>
                        <th>Char Ke 
                          <?php 
                              echo $ke2;
                          ?>
                      
                        </th>
                       
                    
              <?php
                }
              ?>
              </tr>
            </thead>
              <tbody>
                <?php
                $final_loop = array();
                for ($zzz=0; $zzz < count($kunci_all); $zzz++) { 
                

                    $min = sprintf('%02s',substr($kunci_all[$zzz], 0, 2));
                    $part_no = sprintf('%02s',substr($kunci_all[$zzz], 2, 2));

                  $kode = sprintf('%02s',substr($kunci_all[$zzz], 4, $count));
                  
                  $hex = array();
                  for ($i=0; $i < strlen($kode) ; $i+=2) { 
                    $parts = sprintf('%02s',substr($kode, $i, 2));
                    $hex[] = sprintf('%02s',$parts);
                  }

                  $loop = array();
                  $c = array();
                  for ($c=0; $c < strlen($status); $c++) { 

                    $char_no = $c+1;
                    $r_dec = hexdec($hex[$c]);
                    $result = $db->showRecoverSSSByIdId($idfile, $char_no, $r_dec);
                    while ($data1 = $result->fetch_array()) {
                      
                      $data = $data1['r_koef'] * $data1['r_dec'];
                       
                      
                    }
                    $loop[] = $data;
                  }
                  $final_loop[] = $loop;
                  
                }
                

                  $bahan = $final_loop;
                 
                  for ($ii=0; $ii < strlen($status); $ii++) {
                    $data9 = 0;
                    for ($i=0; $i < count($kunci_all); $i++) { 
                      $data9 += $bahan[$i][$ii];
                    }
                    echo "<td>";
                    echo chr($data9 % 257);
                    echo "</td>";
                  }
                ?>
              </tbody>
            </table>    

          </ol>

          <ol class="breadcrumb">
            <li class="breadcrumb-item active"><h1><b>D. Secret Semula : 
              <?php
                $final_loop = array();
                for ($zzz=0; $zzz < count($kunci_all); $zzz++) { 
                

                    $min = sprintf('%02s',substr($kunci_all[$zzz], 0, 2));
                    $part_no = sprintf('%02s',substr($kunci_all[$zzz], 2, 2));

                  $kode = sprintf('%02s',substr($kunci_all[$zzz], 4, $count));
                  
                  $hex = array();
                  for ($i=0; $i < strlen($kode) ; $i+=2) { 
                    $parts = sprintf('%02s',substr($kode, $i, 2));
                    $hex[] = sprintf('%02s',$parts);
                  }

                  $loop = array();
                  $c = array();
                  for ($c=0; $c < strlen($status); $c++) { 

                    $char_no = $c+1;
                    $r_dec = hexdec($hex[$c]);
                    $result = $db->showRecoverSSSByIdId($idfile, $char_no, $r_dec);
                    while ($data1 = $result->fetch_array()) {
                      
                      $data = $data1['r_koef'] * $data1['r_dec'];
                       
                      
                    }
                    $loop[] = $data;
                  }
                  $final_loop[] = $loop;
                  
                }
                

                  $bahan = $final_loop;
                 
                  for ($ii=0; $ii < strlen($status); $ii++) {
                    $data9 = 0;
                    for ($i=0; $i < count($kunci_all); $i++) { 
                      $data9 += $bahan[$i][$ii];
                    }
                    echo "<td>";
                    echo chr($data9 % 257);
                    echo "</td>";
                  }
                ?>
            </b></h1>
          </li>
          </ol>

  </div>
 </div>
<?php
}
?>

 <!-- jQuery -->
<script src="../assets/vendors/jquery/dist/jquery-3.3.1.js"></script>
<script src="../assets/vendors/jquery/dist/jquery.dataTables.min.js"></script>

<script type="text/javascript">
  $(document).ready(function() {
    $('#example').DataTable( {
        "scrollX": true
    } );
    $('table.display').DataTable( {
        fixedHeader: {
            header: false,
            footer: false
        }
    } );
} );
</script>