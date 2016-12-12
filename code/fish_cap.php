 <?php

include "db.php";

$user = $_GET['user'];

$dbConnection = new PDO("mysql:dbname=".$db.";host=127.0.0.1;charset=utf8", $u, $p);

$dbConnection->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$stmt = $dbConnection->prepare("SELECT SUM(score) as totalScore, SUM(flakesEaten) as totalFlakes, SUM(timeInMS) as sumTime, COUNT(scoreID) as numGames, SUM(objectsDisappeared) as totalDisappeared, SUM(otherFlakesEaten) as totalOtherFlakes FROM ".$scoretable." WHERE user=:user");

$stmt->execute(array('user' => $user));
$result = $stmt->fetch(PDO::FETCH_ASSOC);

$totalScore = $result['totalScore'];
$totalFlakes = $result['totalFlakes'];
$sumTime = $result['sumTime'];
$numGames = $result['numGames'];
$totalDisappeared = $result['objectsDisappeared'];
$totalOtherFlakes = $result['otherFlakesEaten'];

$stmt2 = $dbConnection->prepare("SELECT * FROM ".$achievetable." WHERE user=:user");

$stmt2->execute(array('user' => $user));

$list = $stmt2->fetch(PDO::FETCH_ASSOC);

if ($list['eat35flakes'] == false && $totalFlakes >= 50) {
	$list['eat35flakes'] = true;
	echo "eat35flakes ";
}

if ($list['totalgames20'] == false && $numGames >= 20) {
	$list['totalgames20'] == true;
	echo "totalgames20 ";
}

if ($list['totalScore1000'] == false && $totalScore >= 1000) {
	$list['totalScore1000'] == true;
	echo "totalScore1000 ";
}

if ($list['totaltime15Min'] == false && $sumTime >= (15 * 60 * 1000)) {
	$list['totaltime15Min'] == true;
	echo "totaltime15Min ";
}

if ($list['shareFood'] == false && $totalOtherFlakes >= 50) {
	$list['shareFood'] == true;
	echo "shareFood ";
}

if ($list['memoryLoss'] == false && $totalDisappeared >= 50) {
	$list['memoryLoss'] == true;
	echo "memoryLoss ";
}
?>