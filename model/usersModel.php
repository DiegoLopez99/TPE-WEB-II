<?php

    class usersModel{
        private $db;

        function __construct(){
            $this->db = new PDO('mysql:host=localhost;'.'dbname=dl_gameshop;charset=utf8', 'root', '');
        }

        function getUser($user){
            $sentencia = $this->db->prepare("SELECT * FROM user WHERE email=?");
            $sentencia->execute(array($user));
            return $sentencia->fetch(PDO::FETCH_OBJ);
        }

        function getUsers(){
            $sentencia = $this->db->prepare("SELECT * FROM user");
            $sentencia->execute();
            return $sentencia->fetchAll(PDO::FETCH_OBJ);
        }

        function deleteUser($id){
            $sentencia = $this->db->prepare("DELETE FROM user WHERE id=?");
            $sentencia->execute(array($id));
        }

        function hacerAdmin($id){
            $sentencia = $this->db->prepare("UPDATE user SET admin=1 WHERE id=?");
            $sentencia->execute(array($id));
        }

        function quitarAdmin($id){
            $sentencia = $this->db->prepare("UPDATE user SET admin=0 WHERE id=?");
            $sentencia->execute(array($id));
        }

        function registrarUser($email, $hash){
            $sentencia = $this->db->prepare("INSERT INTO user(email, password) VALUE (?,?)");
            $sentencia->execute(array($email, $hash));
        }
    


    }
?>