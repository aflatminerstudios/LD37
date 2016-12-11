<html>
 <head>
<title>User Info</title>
 </head>
 <body>
 
<?php

include "db.php";

$user = $_GET['user'];

$dbConnection = new PDO("mysql:dbname=".$db.";host=127.0.0.1;charset=utf8", $u, $p);

$dbConnection->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


$stmt = $dbConnection->prepare("SELECT * FROM ".$achievetable." WHERE user=:user");

$stmt->execute(array('user' => $user));

echo '<h1>Achievement List for ', $user, '</h2>';
echo '<hr><br>';

$result = $stmt->fetch(PDO::FETCH_ASSOC);
    
if ($result['totaltime15min'] == true) {
	echo 'Dedicated - Spend 15 minutes total in-game<br>';
}
if ($result['totalgames20'] == true) {
	echo 'Persistent - Died 20 times<br>';
}
if ($result['eat35flakes'] == true) {
	echo 'Gourmand - Eat 35 pieces of food<br>';
}
if ($result['totalScore1000'] == true) {
	echo 'High Roller - Score 100 total points<br>';
}
if ($result['live60s'] == true) {
	echo 'Survivor - Survive for 60 seconds in one game<br>';
}
if ($result['flakes15game'] == true) {
	echo 'Glutton - Eat 15 flakes in one game<br>';
}
if ($result['score250game'] == true) {
	echo 'Lebron - Score 250 points in one game<br>';
}
if ($result['stareAtWall'] == true) {
	echo 'Nietzsche - You gazed too long at the outside world. And it gazed back.<br>';
}


?>
</table>

</body>
</html>