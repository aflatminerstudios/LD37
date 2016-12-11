 <?php

include "db.php";

$user = $_GET['user'];

$dbConnection = new PDO("mysql:dbname=".$db.";host=127.0.0.1;charset=utf8", $u, $p);

$dbConnection->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$stmt = $dbConnection->prepare("SELECT SUM(score) as totalScore, SUM(flakesEaten) as totalFlakes, SUM(timeInMS) as sumTime, COUNT(scoreID) as numGames FROM ".$scoretable." WHERE user=:user");

$stmt->execute(array('user' => $user));
$result = $stmt->fetch(PDO::FETCH_ASSOC);

$totalScore = $result['totalScore'];
$totalFlakes = $result['totalFlakes'];
$sumTime = $result['sumTime'];
$numGames = $result['numGames'];

$stmt2 = $dbConnection->prepare("SELECT * FROM ".$achievetable." WHERE user=:user");

$stmt2->execute(array('user' => $user));

$list = $stmt->fetch(PDO::FETCH_ASSOC);

if ($list['eat35flakes'] == false && $totalFlakes >= 35) {
	$list['eat35flakes'] = true;
	echo "eat35flakes ";
}

if ($list['totalGames20'] == false && $numGames >= 20) {
	$list['totalGames20'] == true;
	echo "totalGames20 ";
}

if ($list['totalScore1000'] == false && $totalScore >= 1000) {
	$list['totalScore1000'] == true;
	echo "totalScore1000 ";
}

if ($list['totalTime15Min'] == false && $sumTime >= (15 * 60 * 1000)) {
	$list['totalTime15Min'] == true;
	echo "totalTime15Min ";
}

$stmt3 = $dbConnection->prepare("UPDATE ".$achievetable." SET eat35flakes=:flakes, totalGames20=:games, totalScore1000=:score, totalTime15Min=:time WHERE user=:user");
$stmt3->execute(array('flakes' => $list['eat35flakes'], 'games' => $list['totalGames20'], 'score' => $list['totalScore1000'], 'time' => $list['totalTime15Min'], 'user' => $user));
?>