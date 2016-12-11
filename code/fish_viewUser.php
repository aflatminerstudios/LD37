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
	echo 'Dedicated - spend 15 minutes total in-game<br>';
}
if ($result['totalgames20'] == true) {
	echo 'Experienced - play 20 games<br>';
}
if ($result['eat35flakes'] == true) {
	echo 'Gourmand - eat 35 pieces of food<br>';
}
if ($result['totalScore1000'] == true) {
	echo 'High Roller - score 100 total points<br>';
}
if ($result['live60s'] == true) {
	echo 'Survivor - survive for 60 seconds in one game<br>';
}


?>
</table>

</body>
</html>