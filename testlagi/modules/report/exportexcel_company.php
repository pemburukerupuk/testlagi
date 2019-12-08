<?php

require_once '../../cores/db_function.php';
// Load plugin PHPExcel nya
require_once '../../tools/PHPExcel/PHPExcel.php';
$db = new Db_Function();

// Panggil class PHPExcel nya
$excel = new PHPExcel();

// Settingan awal file excel
$excel->getProperties()->setCreator('Pemburu Kerupuk')
             ->setLastModifiedBy('Pemburu Kerupuk')
             ->setTitle("Data File Perusahaan")
             ->setSubject("Data File")
             ->setDescription("Laporan Data File Perusahaan")
             ->setKeywords("Data File Perusahaan");

// Buat sebuah variabel untuk menampung pengaturan style dari header tabel
$style_col = array(
  'font' => array('bold' => true), // Set font nya jadi bold
  'alignment' => array(
    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER, // Set text jadi ditengah secara horizontal (center)
    'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER // Set text jadi di tengah secara vertical (middle)
  ),
  'borders' => array(
    'top' => array('style'  => PHPExcel_Style_Border::BORDER_THIN), // Set border top dengan garis tipis
    'right' => array('style'  => PHPExcel_Style_Border::BORDER_THIN),  // Set border right dengan garis tipis
    'bottom' => array('style'  => PHPExcel_Style_Border::BORDER_THIN), // Set border bottom dengan garis tipis
    'left' => array('style'  => PHPExcel_Style_Border::BORDER_THIN) // Set border left dengan garis tipis
  )
);

// Buat sebuah variabel untuk menampung pengaturan style dari isi tabel
$style_row = array(
  'alignment' => array(
    'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER // Set text jadi di tengah secara vertical (middle)
  ),
  'borders' => array(
    'top' => array('style'  => PHPExcel_Style_Border::BORDER_THIN), // Set border top dengan garis tipis
    'right' => array('style'  => PHPExcel_Style_Border::BORDER_THIN),  // Set border right dengan garis tipis
    'bottom' => array('style'  => PHPExcel_Style_Border::BORDER_THIN), // Set border bottom dengan garis tipis
    'left' => array('style'  => PHPExcel_Style_Border::BORDER_THIN) // Set border left dengan garis tipis
  )
);

$excel->setActiveSheetIndex(0)->setCellValue('A1', "DATA FILE PERUSAHAAN DI SISTEM PENGAMANAN DATA MIGAS"); // Set kolom A1 dengan tulisan "DATA SISWA"
$excel->getActiveSheet()->mergeCells('A1:E1'); // Set Merge Cell pada kolom A1 sampai F1
$excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(TRUE); // Set bold kolom A1
$excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(15); // Set font size 15 untuk kolom A1
$excel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER); // Set text center untuk kolom A1

// Buat header tabel nya pada baris ke 3
$excel->setActiveSheetIndex(0)->setCellValue('A3', "NO"); // Set kolom A3 dengan tulisan "NO"
$excel->setActiveSheetIndex(0)->setCellValue('B3', "NAMA PERUSAHAAN"); // Set kolom B3 dengan tulisan "NIS"
$excel->setActiveSheetIndex(0)->setCellValue('C3', "JUMLAH FILE"); // Set kolom C3 dengan tulisan "NAMA"
$excel->setActiveSheetIndex(0)->setCellValue('D3', "JUMLAH TRANSAKSI"); // Set kolom D3 dengan tulisan "JENIS KELAMIN"
$excel->setActiveSheetIndex(0)->setCellValue('E3', "TOTAL"); // Set kolom D3 dengan tulisan "JENIS KELAMIN"

// Apply style header yang telah kita buat tadi ke masing-masing kolom header
$excel->getActiveSheet()->getStyle('A3')->applyFromArray($style_col);
$excel->getActiveSheet()->getStyle('B3')->applyFromArray($style_col);
$excel->getActiveSheet()->getStyle('C3')->applyFromArray($style_col);
$excel->getActiveSheet()->getStyle('D3')->applyFromArray($style_col);
$excel->getActiveSheet()->getStyle('E3')->applyFromArray($style_col);

// Set height baris ke 1, 2 dan 3
$excel->getActiveSheet()->getRowDimension('1')->setRowHeight(20);
$excel->getActiveSheet()->getRowDimension('2')->setRowHeight(20);
$excel->getActiveSheet()->getRowDimension('3')->setRowHeight(20);

// Buat query untuk menampilkan semua data siswa

$totalfile = 0;
$totaltransaction = 0;
$totaltransactiondanfile = 0;
$totalall = 0;
$totalcompany = 0;

$result = $db->showCompany();
while ($data = $result->fetch_array()) {
  $idcompany = $data['idcompany'];
  $company = $data['company'];

  $jumlahfile = $db->countFileByIdCompany($idcompany);
  $jumlahtransaction = $db->countTransactionByIdCompany($idcompany);

  $totalcompany += count($company);

  $totalfile += $jumlahfile;
  $totaltransaction += $jumlahtransaction;
  $totaltransactiondanfile = $jumlahfile+$jumlahtransaction;

  $totalall += $totaltransactiondanfile;

  $data1[] = array('company' => $company, 'jumlahfile' => $jumlahfile, 'jumlahtransaction' => $jumlahtransaction, 
                  'totaltransactiondanfile' => $totaltransactiondanfile, 'totalall' => $totalall, 'totalfile' => $totalfile, 
                  'totaltransaction' => $totaltransaction);
}


$no = 1; // Untuk penomoran tabel, di awal set dengan 1
$numrow = 4; // Set baris pertama untuk isi tabel adalah baris ke 4
$barisakhir = $totalcompany+$numrow;
foreach ($data1 as $key => $value) { // Ambil semua data dari hasil eksekusi $sql
  $excel->setActiveSheetIndex(0)->setCellValue('A'.$numrow, $no);
  $excel->setActiveSheetIndex(0)->setCellValue('B'.$numrow, $value['company']);
  $excel->setActiveSheetIndex(0)->setCellValue('C'.$numrow, $value['jumlahfile'], PHPExcel_Cell_DataType::TYPE_STRING);
  $excel->setActiveSheetIndex(0)->setCellValue('D'.$numrow, $value['jumlahtransaction'], PHPExcel_Cell_DataType::TYPE_STRING);
  $excel->setActiveSheetIndex(0)->setCellValue('E'.$numrow, $value['totaltransactiondanfile'], PHPExcel_Cell_DataType::TYPE_STRING);

  // Apply style row yang telah kita buat tadi ke masing-masing baris (isi tabel)
  $excel->getActiveSheet()->getStyle('A'.$numrow)->applyFromArray($style_row);
  $excel->getActiveSheet()->getStyle('B'.$numrow)->applyFromArray($style_row);
  $excel->getActiveSheet()->getStyle('C'.$numrow)->applyFromArray($style_row);
  $excel->getActiveSheet()->getStyle('D'.$numrow)->applyFromArray($style_row);
  $excel->getActiveSheet()->getStyle('E'.$numrow)->applyFromArray($style_row);
  
  $excel->getActiveSheet()->getRowDimension($numrow)->setRowHeight(20);
  
  $no++; // Tambah 1 setiap kali looping
  $numrow++; // Tambah 1 setiap kali looping


  //latest value of data
    $excel->setActiveSheetIndex(0)->setCellValue('A'.$barisakhir, 'Total');
    $excel->getActiveSheet()->mergeCells("A".($barisakhir).":B".($barisakhir));

    $excel->setActiveSheetIndex(0)->setCellValue('C'.$numrow, $value['totalfile'], PHPExcel_Cell_DataType::TYPE_STRING);
    $excel->setActiveSheetIndex(0)->setCellValue('D'.$numrow, $value['totaltransaction'], PHPExcel_Cell_DataType::TYPE_STRING);
    $excel->setActiveSheetIndex(0)->setCellValue('E'.$numrow, $value['totalall'], PHPExcel_Cell_DataType::TYPE_STRING);

    // Apply style row yang telah kita buat tadi ke masing-masing baris (isi tabel)
    $excel->getActiveSheet()->getStyle('A'.$barisakhir)->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('B'.$barisakhir)->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('C'.$barisakhir)->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('D'.$barisakhir)->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('E'.$barisakhir)->applyFromArray($style_col);
    
    $excel->getActiveSheet()->getRowDimension($barisakhir)->setRowHeight(20);


  
}



// Set width kolom
$excel->getActiveSheet()->getColumnDimension('A')->setWidth(5); // Set width kolom A
$excel->getActiveSheet()->getColumnDimension('B')->setWidth(40); // Set width kolom B
$excel->getActiveSheet()->getColumnDimension('C')->setWidth(20); // Set width kolom C
$excel->getActiveSheet()->getColumnDimension('D')->setWidth(20); // Set width kolom D
$excel->getActiveSheet()->getColumnDimension('E')->setWidth(20); // Set width kolom D

// Set orientasi kertas jadi LANDSCAPE
$excel->getActiveSheet()->getPageSetup()->setOrientation(PHPExcel_Worksheet_PageSetup::ORIENTATION_LANDSCAPE);

// Set judul file excel nya

$excel->getActiveSheet(0)->setTitle("Jumlah Data File");
$excel->setActiveSheetIndex(0);


// Proses file excel
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment; filename="Data Laporan Perusahaan.xlsx"'); // Set nama file excel nya
header('Cache-Control: max-age=0');
$write = PHPExcel_IOFactory::createWriter($excel, 'Excel2007');
$write->save('php://output');
?>