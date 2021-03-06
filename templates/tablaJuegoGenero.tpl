<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/7305faff6b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/style.css">
    <script src="./js/main.js"></script>
    <base href="http://{$smarty.server.SERVER_NAME}{dirname($smarty.server.PHP_SELF)}/" target="_self">
    <title>DL GameShop</title>
</head>
<body>
{include file="header.tpl"}
    <div class="generos">
        <div class="tablaJuegos">
            <table class="tableXGenero">
                <thead>
                    <tr>
                        <td></td>
                        <td>Nombre</td>
                        <td>Precio</td>
                        <td>Formato</td>
                        <td>Genero</td>
                        <td>Stock</td>
                    </tr>
                </thead>
                <tbody>
                {foreach from=$juegos item=juego}
                    <tr>
                        <td><a href="juego/{$juego->id}"><img src="./img/juegos/juego{$juego->id}.jpg"></a></td>
                        <td data-titulo="Nombre:"><a href="juego/{$juego->id}">{$juego->nombre}</a></td>
                        <td data-titulo="Precio:">$ {$juego->precio}</td>
                        <td data-titulo="Formato:">{$juego->formato}</td>
                        <td data-titulo="Genero:">{$juego->genero}</td>
                        {if $juego->stock == 0}
                            <td data-titulo="Stock:">Sin Stock</td>
                        {else}
                            <td data-titulo="Stock:">En Stock</td>
                        {/if}
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
{include file="footer.tpl"}