<?php

require_once 'db.php';
$query = $db->prepare("SELECT * FROM pelajaran");

if ($query->execute()) {

	$data = $query->fetchAll(PDO::FETCH_OBJ);

	$response = $data;
}
header('Content-Type: application/json');

echo json_encode($response);


 ?>
