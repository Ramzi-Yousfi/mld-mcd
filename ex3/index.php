<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>game</title>
</head>
<body>
<?php
    try
    {
$pdo_options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
$db = new PDO('mysql:host=localhost;dbname=test-php', 'root', '',$pdo_options);
$sql = "SELECT UPPER(nom) AS MAJ_nom  FROM jeux_video ";
$requete = $db->query($sql);


while ($id = $requete->fetch()){
echo $id['MAJ_nom'].'<br/>';

}
$requete->closeCursor(); }
catch(Exception $e)
{
die('Erreur : '.$e->getMessage());
}
?>
 
</body>
</html>