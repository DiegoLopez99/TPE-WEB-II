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
    <div class="contenedor">
        <div class="juego">
            <div>
                <img src="./img/juegos/juego{$juego->id}.jpg"> 
            </div>
            <div class="descripcion">
                <h2>{$juego->nombre}</h2>
                <h3>{$juego->genero}</h3>
                <h3>{$juego->precio}</h3>
                <button>Comprar</button>
            </div>
        </div>
    </div>
{include file="footer.tpl"}

