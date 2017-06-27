<?php
if(file_exists('clases/bd.php')){
	include_once 'clases/bd.php';
	include_once 'clases/fotos.php';
	include_once 'clases/recursos.php';
}else{
	include_once '../../clases/bd.php';
	include_once '../../clases/fotos.php';
	include_once '../../clases/recursos.php';
}
$foto=new fotos();
$bd=new bd();
//$result=$bd->query("select r.usuarios_id,count(r.id) as tota,seudonimo from recursos as r,usuarios_accesos as a
//                    where r.usuarios_id=a.usuarios_id group by r.usuarios_id order by tota desc limit 5");
$result=$bd->query("select r.*,u.nombres,u.apellidos,u.telefonos, a.email from recursos as r, usuarios as u, usuarios_accesos as a where r.status=1 and r.usuarios_id=u.id and u.id=a.usuarios_id");
$rndId=  rand(1, 25);
if(isset($_SESSION["id"])){
	$bd->doInsert("trafico",array("usuarios_id"=>$_SESSION["id"],"pagina"=>1,"fecha"=>date("Y-m-d H:i:s",time())));
}else{
	$bd->doInsert("trafico",array("usuarios_id"=>-1,"pagina"=>1,"fecha"=>date("Y-m-d H:i:s",time())));
}
?>
<div class="row">
    <div class="col-xs-12">
        <br>
    </div>
    <div class="col-xs-12">
        <center><span class="t30">Publicaciones vigentes</span></center>
        <br>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="height:400px;overflow-y:auto;">
        <?php
        foreach ($result as $r=>$valor):	
        switch ($valor['moneda_id']) {
        	case 1:
        		$moneda='&#36; COP';
        		break;
        	case 2:
        		$moneda='&#8364;';
        		break;	
        	case 3:
        		$moneda='&#36; USD';
        		break;	
        	
        	default:
        		# code...
        		break;
        }
            ?>
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-2 pad5">				
				<img class="img-top" src="<?php echo $valor["ruta"];?>"/>
                <br>
				<div style="padding-left:10px;">
					<span><?php echo $valor["titulo"];?></span><br>
					<span><?php echo $valor["precioa"]>$valor["precioi"]?number_format($valor["precioa"],2,',','.'):number_format($valor["precioi"],2,',','.') . ' '.$moneda ?> </span>
					<br>
					<?php
					if(isset($_SESSION["id"])):
						if($_SESSION["id"]!=$valor["usuarios_id"]):
					?>
						<a href="#" class="btn btn-sm btn-primary btn-pujar" data-id="<?php echo $valor["id"];?>">Pujar</a>
						<?php
						else:?>
							<br><span class="label label-success">Tu publicación</span>
						<?php
						endif;
					else:?>
						<a href="#" class="btn btn-sm btn-primary btn-pujar" data-id="new">Pujar</a>
					<?php
					endif;
					?>
				</div>
            </div>
        <?php
            endforeach;
        ?>
    </div>
    <div class="col-xs-12">
        <hr>
        <br>
    </div>
</div>