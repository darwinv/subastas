<?php
include_once 'clases/bd.php';
$bd=new bd();
$formatos=$bd->doFullSelect("formatos");
?>
<div>
    <h2><center>Pública un art&iacute;culo para subastar</center></h2>
</div>
<div class="contenedor">
    <div class="row">
        <form role="form" id="frm-recurso" name="frm-recurso" enctype="multipart/form-data">
            <div class="form-group pad20 t18">
                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2"><span>Mensaje</span></div>
                <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10">
                    <textarea id="txt-mensaje" name="txt-mensaje" class="form-textarea" rows="2" placeholder="Comentarios,sugerencias,reclamos,dudas,etc."></textarea>
                </div>
                <div class="col-xs-12 hidden-sm"><br></div>
                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2 hidden"><span class="t18">Tipo </span></div>
                <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5 hidden"><input type="radio" id="objetivo" name="objetivo" value="1"> Solo comentario</input></div>
                <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5 hidden"><input type="radio" id="objetivo" name="objetivo" value="2" checked> Publicar un art&iacute;culo</input></div>
                <div class="col-xs-12 hidden-sm"><br></div>
                <section class="t18" id="subir-recurso">
                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2"><span>Titulo</span></div>
                    <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10">
                        <input type="text" id="txt-titulo" name="txt-titulo" class="form-input" placeholder="Titulo de la publicaci&oacute;n"></input>
                    </div>
                    <div class="col-xs-12 hidden-sm"><br></div>
                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2"><span>Descripci&oacute;n</span></div>
                    <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10">
                        <textarea class="form-textarea" id="txtdescripcion" name=txtdescripcion" rows="2" placeholder="Una clara introducci&oacute;n del art&iacute;culo"></textarea>
                    </div>
                    <div class="col-xs-12 hidden-sm"><br></div>
					<div class="col-xs-12">
						<div class="col-xs-12 col-sm-2 col-md-2 col-lg-2"><span>Precios y fecha</span></div>					
						<div class="col-xs-12 col-sm-3">
							<input type="text" id="txt-precioI" name="txt-precioI" class="form-input" placeholder="Precio inicial"></input>
						</div>
						<div class="col-xs-12 col-sm-3">						
							<input type="text" id="txt-precioL" name="txt-precioL" class="form-input" placeholder="Precio limite"></input>
						</div>
						<div class="col-xs-12 col-sm-4">						
							<input type="date" id="txt-fecha-limite" name="txt-fecha-limite" class="form-input" placeholder="Fecha limite"></input>
						</div>
					</div>
                    <div class="col-xs-12 hidden-sm"><br></div>                    
                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
						<span>Foto</span>
					</div>
                    <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10">
						<input id="txt-file" name="txt-file" type="file" accept="image/*"></input><span class="opacity t8">M&aacute;ximo 10 MB.</span>
					</div>
                    <div class="col-xs-12"><br></div>
                </section>
                <section class="text-center">
                    <button type="submit" id="enviar" data-dismiss="modal" aria-label="Close" class="btn btn-primary2">Enviar</button>                    
                    <button class="btn btn-default" type="reset" id="limpiar" name="limpiar">Limpiar</button>
                </section>
                <div class="col-xs-12 hidden-sm"><hr></div>
		<div class="center-block text-center hidden-sm t14" style="width: 80%">
                    Sitio de subastas
                    Exposistema,  Bogota - Colombia <br>
                    Telefonos: +57 xxxxxxx / xxxxx Email:
                    contacto@plotter.com / admin@plotter.com
		</div>                
            </div>
        </form>
        <div class="col-xs-12"><br></div>
    </div>
</div>