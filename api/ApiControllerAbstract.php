<?php 

require_once 'ApiView.php';

abstract class ApiControllerAbstract{
    protected $model;
    protected $view;
    private $data;

    public function __construct(){
        $this->view = new Apiview();
        $this->data = file_get_contents("php://input");
    }

    function getData(){
        return json_decode($this->data);
    }
}