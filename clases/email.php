<?php 
class email {
	private $subject='Subastas';
	private $headers;		
	
	function __construct(){
      
    }

	function sendEmail($destinatario,$html){
$company_name='Subastas';
$webpage='http://plotterbarato.com/';


		$headers = 'From: '.$company_name.' <no-responder@'.$webpage.'> '  . "\r\n" . 'Reply-To: '  . 'no-responder@'.$webpage. "\r\n" . 'X-Mailer: PHP/' . phpversion ();
		$headers .= "MIME-Version: 1.0\r\n";
		$headers .= "Content-type: text/html; charset=UTF-8.";
		
		mail($destinatario,'Confirmar Cuenta',$html,$headers);
	}
	function Header($version='1'){
	$company_name='Subastas';
	$webpage='http://plotterbarato.com/';	

		$txt = "<!DOCTYPE html>
      <html lang='es'><body>
      	<div style=' padding 20px; text-align:left; margin: 20px;'>
		<div style='width:500px;background:#fff; color:#666; padding:20px; margin-left:30px; margin-right:30px;'>	
		<div style='text-align:left; padding-bottom:10px; border-bottom: 1px solid #CCC;'><img src='".$webpage."subastas/galeria/img-site/logos/logo-header-full.png' ></div>
		<br> ";
		return $txt;
	}	
	function Footer($version='1'){
	$company_name='Subastas';
$webpage='http://plotterbarato.com/';

		$txt = "<div style='font-size: 12px; text-align:left; margin-left:10px; color:#999;  margin-top:5px;'>			
		</div></div></div></body></html>";		
		return $txt;		
	}	
	function sendConfirmarCuenta($destinatario,$link){
	$company_name='Subastas';
$webpage='http://plotterbarato.com/';
		$contenido = "<div style='text-align:left; margin-left:10px; font-size: 18px; '>
			<p><b>Hola,</b></p>
	 		<p>Para Confirmar tu cuenta Ingresa al enlace.</p>			
		</div>
		<br>		
		<div style='text-align:left; padding-bottom:10px; border-bottom: 1px solid #ccc;' >
		<a href=".$link." style='text-decoration:none;'>
		<button style='background:blue;
		 text-align:center;  color:#FFF; padding:10px; margin:10px; border: 1px solid white; cursor: pointer; font-size: 18px;'>Confirmar Cuenta</button>
		</a>
		<br>
		</div>";

		
		$html=$this->Header().$contenido.$this->Footer();
		$this->sendEmail($destinatario,$html);
	}

	
}