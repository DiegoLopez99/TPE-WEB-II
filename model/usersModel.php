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


    }
?>