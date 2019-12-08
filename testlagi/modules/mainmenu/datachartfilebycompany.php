<?php
// Set proper HTTP response headers
header( 'Content-Type: application/json' );

require_once '../../cores/db_function.php';
$db = new Db_Function();
$data = array();
$result = $db->showCompany();

while ($data1 = $result->fetch_array()) {
    $idcompany = $data1['idcompany'];
    $company =  $data1['company'];
    $result1 = $db->countFileByIdCompany($idcompany);  

    $data[] = array('namaperusahaan' => $company, 'jumlahfile' => $result1);
}

echo json_encode($data);
?>