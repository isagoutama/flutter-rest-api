<?php

try {

	$db = new PDO("mysql:host=localhost;dbname=flutter_mapel;",
								"root","password");

} catch (Exception $e) {

	echo $e->getMessage();
}


 ?>
