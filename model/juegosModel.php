<?php
    require_once "./controller/Controller.php";

    class juegosModel{

        private $db;

        function __construct(){
            $this->db = new PDO('mysql:host=localhost;'.'dbname=dl_gameshop;charset=utf8', 'root', '');
        }

        function getJuegos(){
            $sentencia = $this->db->prepare("SELECT juego.*, genero.nombre as genero FROM juego JOIN genero ON juego.id_genero = genero.id");
            $sentencia->execute();
            return $sentencia->fetchAll(PDO::FETCH_OBJ);
        }

        function getJuego($id){
            $sentencia = $this->db->prepare("SELECT juego.*, genero.nombre as genero FROM juego JOIN genero ON juego.id_genero = genero.id WHERE juego.id =?");
            $sentencia->execute(array($id));
            return $sentencia->fetch(PDO::FETCH_OBJ);
        }

        function getJuegosDestacados(){
            $sentencia = $this->db->prepare("SELECT * FROM `juego` LIMIT 0, 5");
            $sentencia->execute();
            return $sentencia->fetchAll(PDO::FETCH_OBJ);
        }

        function addGame($nombre, $precio, $formato, $id_genero){
            $sentencia = $this->db->prepare("INSERT INTO juego(nombre, precio, formato, id_genero) VALUES(?,?,?,?)");
            $sentencia->execute(array($nombre, $precio, $formato, $id_genero));
        }

        function deleteGame($id){
            $sentencia = $this->db->prepare("DELETE FROM juego WHERE id=?");
            $sentencia->execute(array($id));    
        }

        function sinStock($id){
            $sentencia = $this->db->prepare("UPDATE juego SET stock=0 WHERE id=?");
            $sentencia->execute(array($id));
        }

        function enStock($id){
            $sentencia = $this->db->prepare("UPDATE juego SET stock=1 WHERE id=?");
            $sentencia->execute(array($id));
        }

        function getTablaGenero($id){
            $sentencia = $this->db->prepare("SELECT juego.*, genero.nombre as genero FROM juego JOIN genero ON juego.id_genero = genero.id WHERE genero.id =?");
            $sentencia->execute(array($id));
            return $sentencia->fetchAll(PDO::FETCH_OBJ);
        }

        function updateGame($nombre, $precio, $formato, $id_genero, $id_juego){
            $sentencia = $this->db->prepare("UPDATE juego SET nombre=?, precio=?, formato=?, id_genero=? WHERE id=?)");
            $sentencia->execute(array($nombre, $precio, $formato, $id_genero, $id_juego));
        }

        
    }

?>