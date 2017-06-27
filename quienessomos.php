<?php
	include "fcn/incluir-css-js.php";
?>
<!DOCTYPE html>
<html lang="es">
<body class="pad-body">
<?php
	include "temas/header.php";
?>
<div style="margin-top: -25px;margin-bottom:10px;"><?php //include 'paginas/index/apdp-principal.php'; ?></div>
<div id="grupo" name="grupo">
<section class="col-xs-12 col-sm-12 col-md-8 col-lg-10 center-block" style="padding-left:15%;padding-rigth:10%;" id="centro" name="centro">
	<div id="page-content">	
		<div id="page-header">  
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<h4><strong>¿QUIENES SOMOS?</strong></h4>
					</div><!-- col -->
				</div><!-- row -->
			</div><!-- container -->    
		</div><!-- page-header -->			
		<div class="container">
			<h4>Conocenos</h4>		
			<br>	
			<div class="row">
				<div class="col-sm-4 text-justify">
					<?php include "templates/v3.txt";?>
				</div><!-- col -->
				<div class="col-sm-1"></div>
				<div class="col-sm-3 text-justify">
					<?php include "templates/v4.txt";?>
				</div><!-- col -->
			</div><!-- row -->				
		</div><!-- container -->			
	</div>

</section>
<section class="col-xs-12 col-sm-12 col-md-4 col-lg-2" id="derecha" name="derecha">
	<?php
		include "fcn/f_chat.php";
	?>
</section>
<section class="col-xs-12">
	
</section>
<?php include "temas/footer.php";?>
</div>
<?php	
	include "modales/m_registrar.php";
?>
<div class="modal-backdrop fade in cargador" style="display:none"></div>
<script src="js/quienessomos.js"></script>
</body>
</html>