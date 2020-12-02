<?php

    class generosModel{

        private $db;

        function __construct(){
            $this->db = new PDO('mysql:host=localhost;'.'dbname=dl_gameshop;charset=utf8', 'root', '');
        }

        function getGeneros(){
            $sentencia = $this->db->prepare("SELECT * FROM genero");
            $sentencia->execute();
            return $sentencia->fetchAll(PDO::FETCH_OBJ);
        }

        function deleteGenero($id){
            $sentencia = $this->db->prepare("DELETE FROM genero WHERE id=?");
            $sentencia->execute(array($id));    
        }

        function addGenero($nombre){
            $sentencia = $this->db->prepare("INSERT INTO genero(nombre) VALUE (?)");
            $sentencia->execute(array($nombre));
        }

        function updateGenero($nombre, $id_genero){
            $sentencia = $this->db->prepare("UPDATE genero SET nombre=? WHERE id=?");
            $sentencia->execute(array($nombre, $id_genero));
        }

    }

?>