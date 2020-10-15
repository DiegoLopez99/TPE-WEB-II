<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/7305faff6b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/style.css">
    <script src="./js/main.js"></script> 
    <title>DL GameShop</title>
</head>
<body>
{include file="header.tpl"}
<div class="home">
    <div class="galeriaPortada">
        <div class="item fade">
            <img src="./img/port1.jpg" alt="" id="img">
        </div>
        <div class="item fade">
            <img src="./img/port2.jpg" alt="" id="img">
        </div>
        <div class="item fade">
            <img src="./img/port3.jpg" alt="" id="img">
        </div>
        <div class="direcciones">
            <a  id="ant">&#10094;</a>
            <a  id="sig">&#10095;</a>
        </div>
        <div class="barras">
            <span class="barra active" id="barra1"></span>
            <span class="barra" id="barra2"></span>
            <span class="barra" id="barra3"></span>
        </div>
    </div>
    <h1>Destacados</h1>
    <div class="seccionDestacados">
        {foreach from=$juegos item=juego}
            <div class="destacado">
                <div class="imagen">
                    <img src="./img/juegos/juego{$juego->id}.jpg">
                    <div class="descripcion">
                        <h3>{$juego->nombre}</h3>
                        <h4>${$juego->precio}</h4>
                    </div>
                </div> 
            </div>
        {/foreach}
    </div>
</div>
{include file="footer.tpl"}