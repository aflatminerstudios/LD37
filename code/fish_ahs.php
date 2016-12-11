<?php

include "db.php";

$table = 'scoreList';

$user = $_GET["user"];
$score = intval($_GET["score"]);


$dbConnection = new PDO("mysql:dbname=".$db.";host=127.0.0.1;charset=utf8", $u, $p);

$dbConnection->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$stmt = $dbConnection->prepare('INSERT INTO '.$table.' ( user, score ) VALUES (:user, :score)');

$stmt->execute(array('user' => $user, 'score' => $score));

echo 'Success';

?>