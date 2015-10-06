<?php
include "../classes/BD.class.php";
include "../classes/Usuario.php";

$objUsuario = new Usuario();
if(isset($_POST['login'])){
$objUsuario->login = $_POST['login'];
$objUsuario->insert();
}
?>
<html>
<head>
</head>
<body>
<form method='post'>
	<input type='text' name='login'/>
	<input type='submit'/>
</form>
</body>
</html>
