<?php
	include "conexao_bd_mysql.php";
	//////////////////////////////////////////////////////
	$email = $_POST['email'];
	//$senha = $_POST['senha'];
	
	// $dtLogin = $_POST['dtLogin'];
	// $aparelho = $_POST['aparelho'];
	// $cidade = $_POST['cidade'];
	/////////////////////////////////////////////////////
	////CODIFICANDO A SENHA
	//$string = $senha;
    //$codificada = base64_encode($string);
    
    //echo "Resultado da codificação usando base64: " . $codificada;
    //$original = base64_decode($codificada);
    //echo "Resultado da decodificação usando base64: " . $original;
	/////////////////////////////////////////////////////
	$sql_query ="SELECT email_empresa, senha FROM usuarios WHERE email_empresa = '$email' AND senha = '$senha'";
	//////////////////////////////////////////////////////
	$dados = $PDO->query($sql_query);
    $resultado = array();
    
    while($c = $dados->fetch(PDO::FETCH_OBJ)){
        $resultado[] = array("email_empresa"=>$c->email_empresa,
                             "senha"=>$c->senha);
    }
	////////////////////////////////////////////////////
	// if($resultado <> null){
    	// $sql_query ="INSERT INTO `u629312246_oftfa`.`LOG_LOGIN_USUARIO` 
                    	// (
                    	// `EMAIL`, 
                    	// `DTLOGIN`, 
                    	// `APARELHO`, 
                    	// `CIDADE`,
                    	// LOGIN
                    	// )
                    	// VALUES
                    	// (
                    	// '$email', 
                    	// '$dtLogin', 
                    	// '$aparelho', 
                    	// '$cidade',
                    	// 1
                    	// )";
    	// $PDO->query($sql_query);
    	// }else{
    	    // $sql_query ="INSERT INTO `u629312246_oftfa`.`LOG_LOGIN_USUARIO` 
                    	// (
                    	// `EMAIL`, 
                    	// `DTLOGIN`, 
                    	// `APARELHO`, 
                    	// `CIDADE`,
                    	// LOGIN
                    	// )
                    	// VALUES
                    	// (
                    	// '$email', 
                    	// '$dtLogin', 
                    	// '$aparelho', 
                    	// '$cidade',
                    	// 0
                    	// )";
    	// $PDO->query($sql_query);
    	// }
	/////////////////////////////////////////////////
	echo json_encode($resultado);
	////////////////////////////////////////////////////
?>