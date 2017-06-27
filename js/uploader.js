$(document).ready(function(){
   $("li.menu").removeClass("active");
   $("li#menupublicar").addClass("active");
   $("input#objetivo").click(function(){
      if($(this).val()==="1"){
          $("section#subir-recurso").addClass("hidden");
      }else{
          $("section#subir-recurso").removeClass("hidden");
      }
   });
   $("button#enviar").click(function(e){
      e.preventDefault();
      var mensaje=$("textarea#txt-mensaje").val();
      if($("section#subir-recurso").hasClass("hidden")){       
		if(mensaje===""){
		   mensajeValidacion("FALTA EL MENSAJE","No puedes enviar mensajes vacios");
		   return false;
		}	  
        $.ajax({
           url:"paginas/uploader/fcn/f_uploader.php",
           data:{metodo:"guardarMensaje",mensaje:mensaje},
           type:"POST",
           dataType:"json",
           success:function(data){
               if(data.result==="ok"){
                   swal({
                        title: "GRACIAS POR ESCRIBIRNOS",
                        text: "Pronto revisaremos tu mensaje",
                        imageUrl: "galeria/img/logos/bill-ok.png",
                        showConfirmButton: true,
                        timer:2000
                    },function(){
                        document.location.reload();
                   });
               }
           }
        });
      }else{
        if($("input#txt-titulo").val()===""){
            mensajeValidacion("FALTA EL TITULO","El titulo es necesario");
            return false;
        }
        if($("textarea#txtdescripcion").val()===""){
            mensajeValidacion("FALTA LA DESCRIPCIÓN","La descripción es necesaria");
            return false;
        }
        if($("input#txt-precioI").val()===""){
            mensajeValidacion("FALTA EL PRECIO DE INICIO","Con que precio iniciara la subasta");
            return false;
        }
        if($("input#txt-precioL").val()===""){
            mensajeValidacion("FALTA EL PRECIO LIMITE","El precio limite para la subasta");
            return false;
        }
        if($("input#txt-fecha-limite").val()===""){
            mensajeValidacion("FALTA LA FECHA LIMITE DE LA SUBASTA","La fecha máxima es necesaria");
            return false;
        }
        if($("#txt-file").val()!=""){
            var file_tama = $("#txt-file").prop("files")[0]["size"];
            if(file_tama>10485760){
                mensajeValidacion("MAXIMO 10 MEGAS","El archivo no puede ser mayor a 10 MEGABYTES, te recomendamos comprimirlo");
                return false;
            }
        }
        if($("#txt-file").val()!=""){
            guardarFile();
        }else{
            guardarBD();
        }
     }
   });
   $("button#limpiar").click(function(){
      $("section#subir-recurso").addClass("hidden"); 
   });   
});
function mensajeValidacion(titulo,mensaje){
    swal({
        title: titulo,
        text: mensaje,
        imageUrl: "galeria/img/logos/bill-ok.png",
        showConfirmButton: true
    });
}
function guardarFile(){
    var file_data = $("#txt-file").prop("files")[0];
    var form_data = new FormData();
    form_data.append("file", file_data);
    loadingAjax(true);
    $.ajax({
        url: "paginas/uploader/fcn/f_uploaderfile.php",
        dataType: 'json',
        cache: false,
        contentType: false,
        processData: false,
        data: form_data,
        type: 'POST',
        success: function(data){
            if(data.result==="error"){
                SweetError("Inesperado");
                return false;
            }
            guardarBD(data);
        },
        error:function(xhr){
           loadingAjax(false);
           SweetError(xhr);
        }
    });
}
function guardarBD(data){
    if(typeof data=="undefined"){
        filename="";
    }else{
        filename="&filename=" + data.name;
    }
    var form=$("#frm-recurso").serialize() + "&metodo=guardarRecurso" + "&descripcion=" + $("textarea#txtdescripcion").val()+filename;
    $.ajax({
        url:"paginas/uploader/fcn/f_uploader.php",
        data:form,
        type:"POST",
        dataType:"json",
        success:function(data){
            console.log(data);
            if(data.result==="ok"){                            
                loadingAjax(false);
                swal({
                    title: "EXITO",
                    text: "Gracias por compartir tu recurso con la comunidad",
                    imageUrl: "galeria/img/logos/bill-ok.png",
                    showConfirmButton: true,
                    time:2000
                },function(){
                    document.location.reload();
                });
            }else{
                loadingAjax(false);
                SweetError("Error inesperado");
            }
        },
        error:function(xhr){
            loadingAjax(false);
            SweetError(xhr);
        }
    });    
}