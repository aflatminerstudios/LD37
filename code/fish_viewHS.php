<html>
 <head>
<title>High Scores</title>
 </head>
 <body>
 
 <h1> High Score List For Fishy Game</h1>
 
 <table>
 <tr>
 <td>User Name</td>
 <td>Score</td>
 </tr>
<?php

include "db.php";

$dbConnection = new PDO("mysql:dbname=".$db.";host=127.0.0.1;charset=utf8", $u, $p);

$dbConnection->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$stmt = $dbConnection->prepare('SELECT user, score FROM '.$scoretable.' ORDER BY score DESC');

$stmt->execute();

while ($result = $stmt->fetch(PDO::FETCH_ASSOC)) {
	echo '<tr>';
    foreach ($result as $row => $rValue) {
		if ($row == 'user') {
			echo '<td><a href="http://www.catbirdgames.com/fish/fish_viewUser.php?user='.$rValue.'">',$rValue,'</a></td>';
		} else {			
			echo '<td>',$rValue,'</td>';
		}
    }
    echo "</tr>";
}
?>
</table>

</body>
</html>