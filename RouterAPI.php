<?php

require_once 'RouterClass.php';
require_once 'api/ApiController.php';

$r = new Router();

//Tabla de ruteo
$r->addRoute("comentarios", "GET", "ApiController", "getComentarios");
$r->addRoute("comentarios", "POST", "ApiController", "agregarComentario");
$r->addRoute("comentarios/:ID", "DELETE", "ApiController", "borrarComentario");
$r->addRoute("comentarios/:ID", "GET", "ApiController", "getComentario");

//run
$r->route($_GET['resource'], $_SERVER['REQUEST_METHOD']);