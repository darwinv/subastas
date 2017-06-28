<?php
include_once "clases/usuarios.php";
if (!isset ( $_GET ["token"] )) {
	header ( "Location: index.php" );
}
		include "fcn/incluir-css-js.php";		
		
		
		$token = $_GET['token'];
		$idusuario = $_GET['idusuario'];
		
		$user=new usuario();
		$result=$user->comprobarToken($token);
		
		if($result){
		
		$user->setStatusActivo($result['id_usuario']);
		
			 if( $result['id_usuario'] == $idusuario ){ 
			 	
			 	?>
			 	
			 
		
	
<!DOCTYPE html>
<html lang="es">	
	<body class="body-index">	
<div class="container center-container login-admin" style="width:500px; padding:30px; margin-top: 5%">
	<p>Cuenta Confirmada</p>

	<a class="marT10" href="index">
						Inicio
					</a>
</div>
<script type="text/javascript" src="js/restablecer.js"></script>
</body>
</html>
<?php 
}else {
	
	header ( "Location: index.php" );}
		}
 else {
 	
 	header ( "Location: index.php" );
 } 