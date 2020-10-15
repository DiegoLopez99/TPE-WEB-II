<?php

    require_once "./view/View.php";
    require_once "./model/juegosModel.php";
    require_once "./model/generosModel.php";
    require_once "./model/usersModel.php";

    class Controller{

        private $view;
        private $juegosModel;
        private $generosModel;

        function __construct(){
            $this->view = new View();
            $this->juegosModel = new juegosModel();
            $this->generosModel = new generosModel();
            $this->usersModel = new usersModel();
        }

        function Home(){
            $juegos = $this->juegosModel->getJuegosDestacados();
            $this->view->showHome($juegos);
        }

        function Tienda(){
            $juegos = $this->juegosModel->getJuegos();
            $this->view->showTienda($juegos);
        }

        function Generos(){
            $generos = $this->generosModel->getGeneros();
            $this->view->showGeneros($generos);
        }


        function Login(){
            $this->view->showLogin();
        }

        function Administrar(){
            $this->chekAdmin();
            $generos = $this->generosModel->getGeneros();
            $juegos = $this->juegosModel->getJuegos();
            $this->view->showAdministrar($generos, $juegos);
        }


        function VerifyUser(){
            $user = $_POST["input_user"];
            $pass = $_POST["input_password"];
            $userDB = $this->usersModel->getUser($user);

            if(isset($userDB) && $userDB){
                if(password_verify($pass, $userDB->password)){
                    session_start();
                    $_SESSION["EMAIL"] = $userDB->email;
                    $_SESSION["ADMIN"] = $userDB->admin;
                    if($userDB->admin == 1){
                        header("Location: ".BASE_URL."administrar");
                    }else{
                        header("Location: ".BASE_URL."home");
                    }
                }else{
                    $this->view->showLogin("Contraseña incorrecta");
                }
            }else{
                $this->view->showLogin("El usuario no existe");
            }
        }

        private function chekAdmin(){
            session_start();
            if($_SESSION["ADMIN"] == 0){
                header("Location: ".LOGIN);
                die();
            }
        }

        function Logout(){
            session_start();
            session_destroy();
            header("Location: ".BASE_URL."home");
        }

        function AddGame(){
            $this->chekAdmin();
            $this->juegosModel->addGame($_POST['nombre'], $_POST['precio'], $_POST['formato'], $_POST['id_genero']);
            header("Location: ".BASE_URL."administrar");
        }

        function DeleteGame($params = null){
            $id = $params[':ID'];
            $this->chekAdmin();
            $this->juegosModel->deleteGame($id);
            header("Location: ".BASE_URL."administrar");
        }

        function SinStock($params = null){
            $id = $params[':ID'];
            $this->chekAdmin();
            $this->juegosModel->sinStock($id);
            header("Location: ".BASE_URL."administrar");
        }

        function EnStock($params = null){
            $id = $params[':ID'];
            $this->chekAdmin();
            $this->juegosModel->EnStock($id);
            header("Location: ".BASE_URL."administrar");
        }

        function MostrarTabla($params = null){
            $id = $params[':ID'];
            $juegos = $this->juegosModel->getTablaGenero($id);
            $this->view->showTablaJuegoGenero($juegos);
        }

        function EliminarGenero($params = null){
            $id = $params[':ID'];
            $this->chekAdmin();
            $this->generosModel->deleteGenero($id);
            header("Location: ".BASE_URL."administrar");
        }

        function AddGenero(){
            $this->chekAdmin();
            $this->generosModel->addGenero($_POST['nombre']);
            header("Location: ".BASE_URL."administrar");
        }

        function MostrarJuego($params = null){
            $id = $params[':ID'];
            $juego = $this->juegosModel->getJuego($id);
            $this->view->showJuego($juego);
        }
    }
?>