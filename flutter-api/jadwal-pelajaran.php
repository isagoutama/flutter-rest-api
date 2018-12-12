<?php

require_once 'db.php';

$hari = $_GET['hari'];

$query = $db->prepare("SELECT jadwal_mapel.id,guru.nama_guru,pelajaran.nama_pelajaran ".
										 "FROM jadwal_mapel,guru,pelajaran ".
										 "WHERE hari='$hari' AND jadwal_mapel.id_guru=guru.id ".
										 "AND guru.id_pelajaran=pelajaran.id");

if ($query->execute()) {

	$data = $query->fetchAll(PDO::FETCH_OBJ);

	$response = $data;
}
header('Content-Type: application/json');

echo json_encode($response);


 ?>
