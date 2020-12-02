<?php
    require_once "controller/Controller.php";
    require_once "RouterClass.php";

    define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');
    define('LOGIN', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/login');
    define('ADMINISTRAR', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/administar');

    $r = new Router();

    //Rutas
    $r->addRoute("home", "GET", "Controller", "Home");
    $r->addRoute("tienda", "GET", "Controller", "Tienda");
    $r->addRoute("generos", "GET", "Controller", "Generos");
    $r->addRoute("login", "GET", "Controller", "Login");
    $r->addRoute("verifyUser", "POST", "Controller", "VerifyUser");
    $r->addRoute("administrar", "GET", "Controller", "Administrar");
    $r->addRoute("eliminar/:ID", "GET", "Controller", "DeleteGame");
    $r->addRoute("enStock/:ID", "GET", "Controller", "EnStock");
    $r->addRoute("sinStock/:ID", "GET", "Controller", "SinStock");
    $r->addRoute("logout", "GET", "Controller", "Logout");
    $r->addRoute("tabla/:ID", "GET", "Controller", "MostrarTabla");
    $r->addRoute("addGame", "POST", "Controller", "AddGame");
    $r->addRoute("eliminarGenero/:ID", "GET", "Controller", "EliminarGenero");
    $r->addRoute("addGenero", "POST", "Controller", "AddGenero");
    $r->addRoute("juego/:ID", "GET", "Controller", "MostrarJuego");
    $r->addRoute("updateGame", "GET", "Controller", "UpdateGame");
    $r->addRoute("updateGenero", "GET", "Controller", "UpdateGenero");
    $r->addRoute("eliminarUser/:ID", "GET", "Controller", "EliminarUser");
    $r->addRoute("hacerAdmin/:ID", "GET", "Controller", "HacerAdmin");
    $r->addRoute("quitarAdmin/:ID", "GET", "Controller", "QuitarAdmin");
    $r->addRoute("registro", "GET", "Controller", "Registro");
    $r->addRoute("registrarUser", "POST", "Controller", "RegistrarUser");


    //Ruta por defecto.
    $r->setDefaultRoute("Controller", "Home");

    //run
    $r->route($_GET['action'], $_SERVER['REQUEST_METHOD']);
?>