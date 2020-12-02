<?php

require_once './api/ApiController.php';

class comentariosModel{

    function __construct(){
        $this->db = new PDO('mysql:host=localhost;'.'dbname=dl_gameshop;charset=utf8', 'root', '');
    }

    function getComentarios(){
        $sentencia = $this->db->prepare("SELECT * FROM comentario");
        $sentencia->execute();
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function getComentario($id){
        $sentencia = $this->db->prepare("SELECT * FROM comentario WHERE id=?");
        $sentencia->execute(array($id));
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function borrarComentario($id){
        $sentencia = $this->db->prepare("DELETE FROM comentario WHERE id=?");
        $sentencia->execute(array($id));
        return $sentencia->rowCount();
    }

    function agregarComentario($texto, $id_usuario, $id_juego, $puntuacion){
        $sentencia = $this->db->prepare("INSERT INTO comentario(texto, id_usuario, id_juego, puntuacion) VALUES(?,?,?,?)");
        $sentencia->execute(array($texto, $id_usuario, $id_juego, $puntuacion));
        return $this->db->lastInsertId();
    }
}