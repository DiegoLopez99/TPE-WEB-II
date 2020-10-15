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
    <div class="generos">
        <div class="listaGeneros">
            <ul>
                {foreach from=$generos item=genero}
                    <li><a href="tabla/{$genero->id}">{$genero->nombre}</a></li>
                {/foreach}
            </ul
        </div>
    </div>
{include file="footer.tpl"}