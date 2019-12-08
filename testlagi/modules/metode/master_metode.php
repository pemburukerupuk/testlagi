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
          $idfile = $_GET['id'];
          $result1 = $db->ShowFileById($idfile);
          $barcode = $result1['barcode'];
        ?>
        <li class="breadcrumb-item"><a href="?page=masterdatametode">View Log Algoritm Of <?php echo $barcode; ?></a> </li>
        <li class="breadcrumb-item active">Cara Kerja Metode Shamir Secret Sharing</li>
      </ol>
    <div class="x_title">
      <h1><b>Cara Kerja Metode Shamir Secret Sharing</b></h1>
      <div class="clearfix"></div>
    </div>
    <div class="x_content">
      <?php
           
        $result = $db->showShareByIdFile($idfile);
        $kunci = array();
        while($data = $result->fetch_array()){
          $kunci[] = $data['kunci'];
          
        }
        $quorum = 3;
        $status = $db->recover(array_slice($kunci, 0, $quorum), $idfile);
        $count = strlen($status)*2;
      ?>
      
      <ol class="breadcrumb">
        <li class="breadcrumb-item active">
          <h1><b>Variable dalam algoritma Shamir Secret Sharing yang digunakan pada aplikasi : </b></h1>
          <hr>
          <h2>1. secret = Informasi yang dimasukkan untuk melindungi sebuah file. Secret ini berupa plaintext yang nantinya dibagikan kepada n user berupa chippertext untuk verifikasi sebuah transaksi.</h2>
          <h2>2. n = Jumlah user yang diberikan chippertext untuk proses verifikasi.</h2>
          <h2>3. t = Jumlah minimal user yang diperlukan sehingga verifikasi disetujui. t harus lebih kecil atau sama dengan n (t ≤ n).</h2>
          <h2>4. m = Variebel secret berupa bilangan desimal.</h2>
          <h2>5. k = Koefisien yang dibangkitkan menggunakan polinomial dengan jumlah k = t-1 (k<sub>1</sub>, k<sub>2</sub>, ..., k<sub>t-1</sub>) dengan setiap k adalah bilangan acak.</h2>
          <h2>6. p = Bilangan prima yang lebih besar dari variabel n, t, m dan k. Jika p yang digunakan lebih kecil dari variabel n, t, m dan k, maka hasil dari kalkulasi akan salah.</h2>
         
        </li>
      </ol>
      <hr>
      <ol class="breadcrumb">
        <li class="breadcrumb-item active"><h1><b>A. Secret : <?php echo $status; ?></b></h1></li>
      </ol>
      <hr>

      <ol class="breadcrumb">
         
          <li class="breadcrumb-item active">
            <h1><b>B. Proses Enkripsi : </b></h1>
          </li>
          <hr>
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
                          Char Ke ".$ke2." (".$ambil.") | P<sub>n(".$ambil.")</sub> = m + k<sub>1</sub>(n<sup>1</sup>)
                           + k<sub>2</sub>(n<sup>2</sup>) mod p
                        </th>";
                }
            ?>
              </tr>
            </thead>
              <tbody>
              <?php
                foreach ($kunci as $key) {

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
                  $char_no = $c+1;
                  $hasil = $hex[$c];
                  $bagian = "Max-".count($kunci)."-Min-".$min."-Part_No-".$part_no."-Char_No-".$char_no;
                 
                  $result2 = $db->showShareSSSById($idfile, $min, $part_no, $hasil, $bagian); 
                  while ($data2 = $result2->fetch_array()) {
                        echo 
                        "<td>"
                              .$data2['variable_code']." + ("
                              .$data2['koef2']." x ".$data2['koef2_pangkat1'].") + ("
                              .$data2['koef1']." x ".$data2['koef1_pangkat2'].") mod 257 = "
                              .$data2['hasil_dec']." (Desimal)";
                        "</td>";
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
                          Char Ke ".$ke2." (".$ambil.") | P<sub>n(".$ambil.")</sub> = 
                        </th>";
                }
            ?>
              </tr>
            </thead>
              <tbody>
              <?php
                foreach ($kunci as $key) {

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
                  $char_no = $c+1;
                  $hasil = $hex[$c];
                  $bagian = "Max-".count($kunci)."-Min-".$min."-Part_No-".$part_no."-Char_No-".$char_no;
                  
                  $result2 = $db->showShareSSSById($idfile, $min, $part_no, $hasil, $bagian); 
                  while ($data2 = $result2->fetch_array()) {
                        echo 
                        "<td>" 
                              .$data2['hasil']." (Hexadesimal)";
                        "</td>";
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
                <table class="table table-bordered" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Min (t)</th>
                      <th>Part (n)</th>
                      <th>P<sub>n(<?php echo $potong ?>)</sub></th>
                    </tr>
                  </thead>
                    <tbody>
                    <?php
                      foreach ($kunci as $key) {

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
                        $char_no = $c+1;
                        $hasil = $hex[$c];
                        $bagian = "Max-".count($kunci)."-Min-".$min."-Part_No-".$part_no."-Char_No-".$char_no;
                        
                        $result2 = $db->showShareSSSById($idfile, $min, $part_no, $hasil, $bagian); 
                        
                        while ($data2 = $result2->fetch_array()) {
                              $gabung = $data2['hasil'];
                        echo "<td>".$gabung."";
                        }
                        echo "</td";
                      }
                    ?>

                     
                        </tr>
                    <?php
                      }
                    ?>
                    </tbody>

                  </table>   


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
                      foreach ($kunci as $key) {

                        $min = sprintf('%02s',substr($key, 0, 2));
                        $part_no = sprintf('%02s',substr($key, 2, 2));
                        $user_no = intval(substr($key, 2, 2));
                     
                    ?>
                        <tr>
                          <td><?php echo $user_no ?></td>
                          <td><?php echo $min,$part_no;
                     
                    
                      $kode = sprintf('%02s',substr($key, 4, $count));
                      $hex = array();
                      $ascii = array();
                      for ($i=0; $i < strlen($kode) ; $i+=2) { 
                        $parts = sprintf('%02s',substr($kode, $i, 2));
                        $hex[] = sprintf('%02s',$parts);
                      }

                          
                      for ($c=0; $c < strlen($status); $c++) { 
                        $char_no = $c+1;
                        $hasil = $hex[$c];
                        $bagian = "Max-".count($kunci)."-Min-".$min."-Part_No-".$part_no."-Char_No-".$char_no;
                        
                        $result2 = $db->showShareSSSById($idfile, $min, $part_no, $hasil, $bagian); 
                        
                        while ($data2 = $result2->fetch_array()) {
                              $gabung = $data2['hasil'];
                        echo $gabung;
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
              </ol>



            <ol class="breadcrumb">
              <li class="breadcrumb-item active"><h1><b>C. Proses Dekripsi</b></h1></li>
              <hr>
    

                <form target="_blank" enctype="multipart/form-data" id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="POST" 
      action="?page=recovery_metode&id=<?php echo $idfile ?>">
                    <?php
                        for ($iaia=0; $iaia < count($kunci); $iaia++) { 
                    ?>
                        <div class="form-group">
                          <label class="control-label col-md-3 col-sm-3 col-xs-12" for="iduser">Chipper Code Ke-<?php echo $iaia+1; ?> <span class="required">*</span>
                          </label>
                          <div class="col-md-6 col-sm-6 col-xs-12">
                          
                            <li>
                              <label>  
                                <input type="checkbox" name="kuncipilihan[]" id="<?php echo $kunci[$iaia]; ?>" value="<?php echo $kunci[$iaia]; ?>" class="flat"> <?php echo $kunci[$iaia]; ?>
                              </label>
                            </li>
                         
                                
                          </div>
                        </div>
                    <?php
                         
                        }
                    ?>
                  

                  <div class="ln_solid"></div>
                  <div class="form-group">
                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                      <button type="submit" class="btn btn-success"onclick="return confirm('Apakah anda yakin dekripsi dengan kunci tersebut ???'); ">Proses Dekripsi</button>
                    </div>
                  </div>

                </form>
                </ol>


    </div>
   
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
