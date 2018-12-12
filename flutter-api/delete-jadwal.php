<?php
require_once 'db.php';

$id = $_GET['id'];

$query = $db->prepare("DELETE FROM jadwal_mapel WHERE id = $id");

$query->execute();

 ?>
