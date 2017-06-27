<?php if(!isset($_SESSION)){
    session_start();
}
var_dump($_SESSION["tipos_usuarios_id"]);
?>
<nav class="navbar navbar-inverse navbar-static-top" role="navigation ">
	<div class="container">
		<div class="navbar-header ">
			<button type="button" class=" navbar-toggle collapsed"
				data-toggle="collapse" data-target="#menuP">
				<span class="sr-only">Mostrar / Ocultar</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>			
			<div class="collapse navbar-collapse" id="menuP">
				<img class="marT5 marB5 marL5 hidden-sm hidden-xs" src="galeria/img/logos/logo-header.png" width="120px;" height="50px">
				<ul class="nav navbar-nav navbar-right t16 navegador">
					<div class="vertical-line " style="height: 25px; margin-top: 15px;"></div>
					<li class="menu" id="menuinicio"><a class="marT10" href="index">
						Inicio
					</a></li>
					<div class="vertical-line " style="height: 25px; margin-top: 15px;"></div>
					<li class="menu" id="menuquienessomos"><a class="marT10" href="quienessomos" >
						¿Quienes Somos?
					</a></li>
					<div class="vertical-line " style="height: 25px; margin-top: 15px;"></div>
					<li class="menu" id="menucontactenos"><a class="marT10" href="contactenos">
						Contactanos
					</a></li>
					<div class="vertical-line " style="height: 25px; margin-top: 15px;"></div>
					<li class="menu" id="menupoliticas"><a class="marT10" href="politicas">
						Politicas y condiciones
					</a></li>
					<?php if(($_SESSION["tipos_usuarios_id"]=='1')){ ?>
						<div class="vertical-line " style="height: 25px; margin-top: 15px;"></div>
						<li class="menu" id="menupublicar"><a class="marT10" href="uploader">
							Publicar
						</a></li>
					<?php } ?>
<!--					<div class="vertical-line " style="height: 25px; margin-top: 15px;"></div>-->
					<li class="marT10 hidden-xs hidden-sm">
						<div class="borderS  point eti-blanco " style="display: flex; height: 40px; width: 40px; align-items: center;">
							<a href="perfil.php?id=<?php echo $_SESSION["id"];?>">
								<img id="fotoperfilm" src="<?php echo $_SESSION["fotoperfil"];?>" id="" class="img img-responsive center-block" style="max-height: 96%;max-width: 100%; cursor: pointer;background:white;">
							</a>
						</div>
					</li>
					<li class="dropdown marT10">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> 
							<?php if(strlen($_SESSION["seudonimo"])<=9){ echo strtoupper($_SESSION["seudonimo"]);}else{ echo substr(strtoupper($_SESSION["seudonimo"]),0,6) . "...";}?> 
						</a>
						<ul class="dropdown-menu blanco" role="menu">
							<li><a href="perfil.php?id=<?php echo $_SESSION["id"];?>">Mi Perfil</a></li>
                            <li><a href="configuracion.php">Configuraci&oacute;n</a></li>
							<li><a href="salir.php">Salir</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>		
	</div>
</nav>