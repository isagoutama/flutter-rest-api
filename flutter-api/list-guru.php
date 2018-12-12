<?php

require_once 'db.php';
$query = $db->prepare("SELECT guru.id, guru.nama_guru, pelajaran.nama_pelajaran FROM".
											" guru,pelajaran WHERE guru.id_pelajaran=pelajaran.id");

if ($query->execute()) {

	$data = $query->fetchAll(PDO::FETCH_OBJ);

	$response = $data;
}

header('Content-Type: application/json');

echo json_encode($response);


 ?>
