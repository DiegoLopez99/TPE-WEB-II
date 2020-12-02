<?php

require_once './model/comentariosModel.php';
require_once 'ApiControllerAbstract.php';

class ApiController extends ApiControllerAbstract{

    function __construct(){
        parent::__construct();
        $this->model = new comentariosModel;
        $this->view = new ApiView;
    }

    public function getComentarios($params = null){
        $comentarios = $this->model->getComentarios();
        if(!empty($comentarios))
            $this->view->response($comentarios, 200);
        else
            $this->view->response("No hay comentarios", 404);

    }

    public function getComentario($params = null){
        $id = $params[':ID'];
        $comentario = $this->model->getComentario($id);
        if(!empty($comentario))
            $this->view->response($comentarios, 200);
        else
            $this->view->response("El comentario no existe", 404);

    }

    public function borrarComentario($params = null){
        $id = $params[':ID'];
        $result = $this->model->borrarComentario($id);
        if($result > 0)
            $this->view->response("La tarea con el id=$id fue eliminada", 200);
        else
            $this->view->response("La tarea con el id=$id no existe", 200);
    }

    public function agregarComentario($params = null){
        $body = $this->getData();
        $texto = $body->texto;
        $id_usuario = $body->id_usuario;
        $id_juego = $body->id_juego;
        $puntuacion = $body->puntuacion;
        $idComentario = $this->model->agregarComentario($texto, $id_usuario, $id_juego, $puntuacion);
        if(!empty($idComentario))
            $this->view->response($this->model->getComentario($idComentario), 201);
        else
            $this->view->response("El comentario no se pudo agregar", 404);
    }

}