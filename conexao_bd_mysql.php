<?php
	$dsn = "mysql:host=187.45.196.168;dbname=redefretefacil;charset=utf8";
	$usuario = "redefretefacil";
	$senha   ="An@18939500162";
	
	try{
		$PDO = new PDO($dsn,$usuario, $senha);
		$conectou = 1;
	}catch(PDOException $erro){
		echo $erro->getMessage();
	}
?>