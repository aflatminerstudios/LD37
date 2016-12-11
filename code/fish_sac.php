<?php

include "db.php";

$user = $_GET["user"];
$which = $_GET["which"];
$other = $_GET["other"];

$val = md5($user.$which.$magic);

if ($other == $val) {

$dbConnection = new PDO("mysql:dbname=".$db.";host=127.0.0.1;charset=utf8", $u, $p);

$dbConnection->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

if ($which != 'eat35flakes' && $which != 'totalgames20' && $which != 'totalScore1000' && $which != 'totaltime15min') {
	$which = 'ASDFGHLJLKJ';
}


$stmt = $dbConnection->prepare("UPDATE ".$achievetable." SET ".$which." = 1 WHERE user = :user");
$stmt->execute(array('user' => $user));

$result = $stmt->fetch(PDO::FETCH_ASSOC);


echo 'Added';
} else {
  echo 'Failure ';
}
?>
