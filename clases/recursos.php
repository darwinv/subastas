<?php
include_once 'bd.php';
/**
 * @property string r_table
 * @property int id
 * @property string r_titulo;
 * @property string r_descripcion;
 * @property string r_precioi;
 * @property string r_precior;
 * @property string r_precioa;
 * @property string r_usuarios_id;
 * @property string r_ruta;
 * @property string r_fecha;
 * @property string r_status;
 */
class recursos{
	protected $r_table="recursos";
	private $id;
	private $r_titulo;
	private $r_descripcion;
    private $r_precioi;
	private $r_preciol;
	private $r_precioa;	
	private $r_usuarios_id;
	private $r_ruta;
	private $r_fecha;
	private $r_status;
	private $r_moneda_id;
	public function recursos($id = NULL){
		if(!is_null($id)){
			$this->buscarRecurso($id);
		}
	}
	public function nuevoRecurso($params){  //Funcion que se mejorara a medida que se utilice la clase
		$bd = new bd();
		$result = $bd->doInsert($this->r_table, $params);
		if($result){
			return $this->id;
		}else{
			return false;
		}
	}
	public function buscarRecurso($id){
		$this->id = $id;
		$bd = new bd();
		$result = $bd->doSingleSelect($this->r_table,"id = {$this->id}");
		if($result){
			$valores["id"] = $result["id"];
			$valores["r_titulo"] = $result["titulo"];
			$valores["r_descripcion"] = $result["descripcion"];
            $valores["r_precioi"] = $result["precioi"];
			$valores["r_preciol"] = $result["preciol"];
			$valores["r_precioa"] = $result["precioa"];			
			$valores["r_usuarios_id"] = $result["usuarios_id"];
			$valores["r_ruta"] = $result["ruta"];
			$valores["r_fecha"] = $result["fecha"];
			$valores["r_status"] = $result["status"];
			$valores["r_moneda_id"] = $result["moneda_id"];
			$this->setRecurso($valores);
			return true;
		}else {
			return false;
		}
	}
	public function setRecurso($params){
		if(!empty($params)){
			foreach ($params as $key => $values){
				$this->$key = $values;
			}
			return true;
		}else{
			throw "Error Publicar 001: No se recibieron parametros";
			return false;
		}
	}
	public function getUsuario($id=NULL){
		if(is_null($id)){
			$id=$this->id;
		}
		$bd=new bd();
		$result=$bd->doSingleSelect("usuarios","id=$this->r_usuarios_id");
		if($result){
			return "{$result["nombres"]} {$result["apellidos"]}";
		}else{
			return false;
		}
	}
	public function countVisitas(){
		$bd=new bd();
		$result=$bd->query("select count(*) as tota from recursos_visitas where recursos_id=$this->id");
		$row=$result->fetch();
		return $row["tota"];
	}
	public function setCalificacion($calificacion,$accion="poner",$id=NULL){
		if(is_null($id)){
			$id=$this->id;
		}
		$bd=new bd();
		if(!isset($_SESSION)){
			session_start();
		}
		$tiempo = date("Y-m-d H:i:s",time());
		if($accion=="poner"){
			$consulta=$bd->doSingleSelect("recursos_comentarios","usuarios_id={$_SESSION["id"]} and recursos_id=$id");
			if($consulta){
				$result=$bd->doUpdate("recursos_comentarios",array("calificacion"=>$calificacion,"fecha"=>$tiempo),"usuarios_id={$_SESSION["id"]} and recursos_id=$id");
			}else{
				$result=$bd->doInsert("recursos_comentarios",array("usuarios_id"=>$_SESSION["id"],"recursos_id"=>$id,"calificacion"=>$calificacion,"fecha"=>$tiempo));
			}
		}else{
			$result=$bd->query("delete from recursos_comentarios where usuarios_id={$_SESSION["id"]} and recursos_id=$id");
		}
		return $result;
	}
	public function getCalificacion($id=NULL){
		if(is_null($id)){
			$id=$this->id;
		}
		if(!isset($_SESSION)){
			session_start();
		}
		$bd=new bd();
		$condicion="usuarios_id={$_SESSION["id"]} and recursos_id=$id";
		$result=$bd->doSingleSelect("recursos_comentarios",$condicion);
		if($result){
			return $result["calificacion"];
		}else{
			return 0;
		}
	}
	public function __get($property) {
		if (property_exists ( $this, $property )) {
			return $this->$property;
		}
	}
	public function atributoFormateado($atributo="titulo",$longitud=15){
		$devolver=(strlen($this->$atributo)<=$longitud?$this->$atributo:substr($this->$atributo,0,$longitud) . "...");
		return $devolver;
	}
	public function getDestino($id=NULL){
		if(is_null($id)){
			$id=$this->id;
		}
		return "$this->r_ruta";
	}
	
	public function getRecursos(){
		$bd=new bd();
		$recursos=$bd->doFullSelect("recursos","status=1");
		return;
	}
}