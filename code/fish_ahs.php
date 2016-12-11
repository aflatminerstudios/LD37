<?php

include "db.php";

$user = $_GET["user"];
$score = intval($_GET["score"]);
$other = $_GET["other"];
$flakes = $_GET["flakes"];
$time = $_GET["time"];


$val = md5($user.$score.$magic);

if ($other == $val) {

$dbConnection = new PDO("mysql:dbname=".$db.";host=127.0.0.1;charset=utf8", $u, $p);

$dbConnection->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$stmt = $dbConnection->prepare('INSERT INTO '.$scoretable.' ( user, score, flakesEaten, timeInMS ) VALUES (:user, :score, :flakes, :time)');

$stmt->execute(array('user' => $user, 'score' => $score, 'flakes' => $flakes, 'time' => $time));

$achieves = $dbConnection->prepare('SELECT COUNT(id) as countUsers FROM '.$achievetable.' WHERE user = :user');
$achieves->execute(array('user' => $user));

$result = $stmt->fetch(PDO::FETCH_ASSOC);

if ($result['countUsers'] == 0) {
	$achieveadd = $dbConnection->prepare('INSERT INTO '.$achievetable.' (user) VALUES (:user)');
	$achieveadd->execute(array('user' => $user));
}



echo 'Success';
} else {
  echo 'Failure ';
}
?>