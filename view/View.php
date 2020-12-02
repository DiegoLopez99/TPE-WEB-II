<?php
    require_once "./libs/smarty/Smarty.class.php";
    require_once "./controller/Controller.php";

    class View{
        
        function __contruct(){
            
        }

        function showHome($juegos){
            $smarty = new Smarty();
            $smarty->assign('juegos', $juegos);
            $smarty->display('templates/home.tpl');
        }

        function showTienda($juegos){
            $smarty = new Smarty();
            $smarty->assign('juegos', $juegos);
            $smarty->display('templates/tienda.tpl');
        }

        function showLogin($mesagge = ""){
            $smarty = new Smarty();
            $smarty->assign('mesagge', $mesagge);
            $smarty->display('templates/login.tpl');
        }

        function showAdministrar($generos, $juegos, $users){
            $smarty = new Smarty();
            $smarty->assign('generos', $generos);
            $smarty->assign('juegos', $juegos);
            $smarty->assign('users', $users);
            $smarty->display('templates/administrar.tpl');
        }

        function showGeneros($generos){
            $smarty = new Smarty();
            $smarty->assign('generos', $generos);
            $smarty->display('templates/generos.tpl');
        }

        function showPregFrecuentes(){
            $smarty = new Smarty();
            $smarty->display('templates/preguntasFrecuentes.tpl');
        }

        function showTablaJuegoGenero($juegos){
            $smarty = new Smarty();
            $smarty->assign('juegos', $juegos);
            $smarty->display('templates/tablaJuegoGenero.tpl');
        }

        function showJuego($juego, $users){
            $smarty = new Smarty();
            $smarty ->assign('juego', $juego);
            $smarty ->assign('users', $users);
            $smarty->display('templates/juego.tpl');
        }

        function showRegistro(){
            $smarty = new Smarty();
            $smarty->display('templates/registro.tpl');
        }
    }



?>