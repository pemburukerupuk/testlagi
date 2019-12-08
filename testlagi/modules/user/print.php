<?php 
ob_start();  
require_once '../../cores/db_function.php';
$db = new Db_Function();
$iduser   = $_GET['id'];
$result = $db->showUserById($iduser);


?>
<html xmlns="http://www.w3.org/1999/xhtml"> <!-- Bagian halaman HTML yang akan konvert -->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <title>Get PDF</title>
  </head>
  <body>

    <p align="center">
      <b>Pertamina Upstram Data Center Building</b>
      <b>Jl Raya Pasar Minggu Km 18 No 18, Jakarta Selatan, Jakarta, Indonesia</b>

      <b>Pertamina Contact Center</b>
      <b>VP Corporate Communication : Adiatma Sardjito</b>
      <b>Gedung Perwira 2-4 lt 1 Jl Medan Merdeka Timur 1A Jakarta 10110</b>
      <b>Telp : 1 500-000</b>
      <b>Email : pcc@pertamina.com</b>

    </p>
    <hr>
    <h4 align="center">Data Akun</h4>
  <table border="0">
    <tr>
      <td width="150">Nama</td>
      <td width="10">:</td>
      <td width="250"><?php echo $result['username']; ?></td>
    </tr>
    <tr>
      <td width="150">Email</td>
      <td width="10">:</td>
      <td width="250"><?php echo $result['email']; ?></td>
    </tr>
    <tr>
      <td width="150">Level</td>
      <td width="10">:</td>
      <td width="250"><?php 
                       $idcompany = $result['idcompany'];
                       $result1 = $db->showCompanyById($idcompany);
                       $idlevel = $result1['idlevel'];
                       $result2 = $db->showLevelById($idlevel);
                       echo $result2['level'];
                      ?>
      </td>
    </tr>
    <tr>
      <td width="150">Perusahaan</td>
      <td width="10">:</td>
      <td width="250"><?php echo $result1['company']; ?>
      </td>
    </tr>
  </table>
  <h4 align="center">Kepemilikan Data</h4>
  <table border="0">
    <tr>
      <td width="150">Jumlah Data</td>
      <td width="10">:</td>
      <td width="250"><?php
                        $iduser_owner = $iduser;
                        $result3 = $db->showFileByIdUser($iduser_owner);
                        $jumlah = array();
                        while ($data1 = $result3->fetch_array()) {
                          $jumlah[] = $data1['idfile'];
                        }
                        echo count($jumlah); echo " Files";
                      ?>
      </td>
    </tr>
  </table>

  <h4 align="center">Permintaan Data</h4>
  <table border="0">
    <tr>
      <td width="150">Jumlah Permintaan</td>
      <td width="10">:</td>
      <td width="250"><?php
                        $iduser_req = $iduser;
                        $result4 = $db->showTransactionByIdUser($iduser_owner);
                        $jumlah1 = array();
                        while ($data2 = $result4->fetch_array()) {
                          $jumlah1[] = $data2['idtransaction'];
                        }
                        echo count($jumlah1); echo " Transaksi";
                      ?>
      </td>
    </tr>
  </table>


  <p>Dengan ini saya menyatakan data ini dibuat dengan benar dan digunakan untuk kepentingan seperlunya.</p>

  <p align='right'>JAKARTA, <?php echo date('d-m-Y'); ?>
  <br>
  <br>
  <br>
  (<?php echo $result['username'];  ?>)</p>


  </body>
</html>

<?php
$filename="ptgeopatra-pegawai_nip=".$row['nip'].".pdf"; //ubah untuk menentukan nama file pdf yang dihasilkan nantinya
//==========================================================================================================
//Copy dan paste langsung script dibawah ini,untuk mengetahui lebih jelas tentang fungsinya silahkan baca-baca tutorial tentang HTML2PDF
//==========================================================================================================
$content = ob_get_clean();
$content = '<page style="font-family: freeserif">'.nl2br($content).'</page>';
 include '../../assets/html2pdf/html2pdf.class.php';
 try
 {
  $html2pdf = new HTML2PDF('P','A4','en', false, 'ISO-8859-15',array(30, 0, 20, 0));
  $html2pdf->setDefaultFont('Arial');
  $html2pdf->writeHTML($content, isset($_GET['vuehtml']));
  $html2pdf->Output($filename);
 }
 catch(HTML2PDF_exception $e) { echo $e; }
?>