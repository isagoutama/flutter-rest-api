<?php
require_once 'db.php';

$id_guru = $_POST['id_guru'];
$hari = $_POST['hari'];

$query = $db->prepare("INSERT INTO jadwal_mapel(hari, id_guru) VALUES('$hari','$id_guru')");

$query->execute();

 ?>
