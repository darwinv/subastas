<?php
include_once "../clases/ventanachat.php";
include_once "../clases/bd.php";
include_once "../clases/usuarios.php";
include_once "../clases/eventos.php";
$metodo=filter_input(INPUT_POST,"metodo");
switch($metodo){
	case "buscarRegiones":
                buscaRegiones();
		break;
	case "abrirChat":
		abrirChat();
		break;
        case "guardarMensaje":
                guardaMensaje();
                break;
        case "recomendar":
                recomienda();
				break;
		case "pujar":
				pujar();
				break;
}
function buscaRegiones(){
	$bd=new bd();
        $pais=  filter_input(INPUT_POST,"pais");
	$condicion="paises_id=$pais";
	$result=$bd->doFullSelect("regiones",$condicion);
	$devolver="<select class='form-select' id='e_regiones_id' name='e_regiones_id'>";
	foreach($result as $valor ){
		$devolver.="<option value={$valor["id"]}>" . utf8_encode($valor["nombre"]) . "</option>";
	}
	$devolver.="</select>";
	echo $devolver;
}
function abrirChat(){
        $id=filter_input(INPUT_POST,"id");
	if(!isset($_SESSION)){
            session_start();
        }
	$chat=new ventanachat($_SESSION["id"],$id);
}
function guardaMensaje(){
        $bd=new bd();
        $amigo=  filter_input(INPUT_POST,"amigo");
        $mensaje=  filter_input(INPUT_POST,"mensaje");
        if(!isset($_SESSION)){
            session_start();
        }
        $tiempo = date("Y-m-d H:i:s",time());
        $valores=array("usuarios_id"=>$_SESSION["id"],
                       "amigos_id"=>$amigo,
                       "mensaje"=>$mensaje,
                       "fecha"=>$tiempo,
                       );
        $bd->doInsert("mensajes",$valores);
}
function recomienda(){
    $evento=new eventos();
    $mensaje=filter_input(INPUT_POST,"mensaje");
    $tipo=filter_input(INPUT_POST,"tipo");
    $evento_id=filter_input(INPUT_POST,"evento");
    $grupos=filter_input(INPUT_POST,"grupos");
    if(!isset($_SESSION)){
        session_start();
    }
    $valores=array("mensaje"=>$mensaje,
                   "usuarios_id"=>$_SESSION["id"],
                   "eventos_tipos_id"=>$tipo,
                   "fecha"=>date("Y-m-d H:i:s",time()),
                   "evento_id"=>$evento_id,
                   "grupos"=>$grupos,
                   "status"=>1
                   );
    $result=$evento->nuevoEvento($valores);
    echo $result;
}

function pujar(){
	$bd=new bd();
	$id=filter_input(INPUT_POST,"id");
	$monto=filter_input(INPUT_POST,"monto");
	$limite=filter_input(INPUT_POST,"limite");	
	$vendedor=filter_input(INPUT_POST,"vendedor");
	if(!isset($_SESSION))
		session_start();
	$tiempo = date("Y-m-d H:i:s",time());
	$valores=array(
			"recurso_id" =>$id,
			"usuario_id" =>$_SESSION["id"],
			"monto"		 =>$monto,
			"fecha"		 =>$tiempo,
	);
	$result=$bd->doInsert("pujas",$valores);
	if($result){
		$valores=array("precioa"=>$monto);
		if($limite==1){
			$valores["status"]=2;
		}
		$bd->doUpdate("recursos",$valores,"id={$id}");
		echo json_encode(array("result"=>"ok","id"=>$bd->lastInsertId(),"limite"=>$limite));
		sendMail($vendedor,"Han realizado una mejora en la oferta","El usuario " . $_SESSION["seudonimo"] . " ha realizado una oferta, <br> Total ofertado = " . $monto,$limite);

	}else{
		echo json_encode(array("result"=>"error"));
	}
}

function sendMail($para,$subject,$mensaje,$limite,$de="norespon@plotterbarato.com"){

    $body = "<div>" . $mensaje . "</div>";
    $headers = 'From: ' . $_SESSION['seudonimo'] . ' ' . $para . '\r\n' ;
    $headers .='Reply-To: '. $para . "\r\n" ;
    $headers .='X-Mailer: PHP/' . phpversion();
    $headers .= "MIME-Version: 1.0\r\n";
    $headers .= "Content-type: text/html; charset=iso-8859-1\r\n";  
    $headers .= "X-Priority: 3\n";
    $headers .= "X-MSMail-Priority: Normal\n";
    $headers .= "X-Mailer: php\n";    
    
    mail($para, $subject, $body,$headers);
  
  
//	mail($para, $subject,$mensaje,"From: " . $de ."\r\n" . "X-Mailer: PHP/" . phpversion());
	if($limite==1){
		sendMail($para,"Artículo vendido","El usuario " . $_SESSION["seudonimo"] . " ha realizado una oferta de = " . $monto . " y ha ganado la subasta, Felicitaciones!!!!",0);
	}
}
?>