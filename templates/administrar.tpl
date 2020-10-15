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
    <div class="administrar">
        <div class="tabla">
            <table class="tabla-admin">
                <thead>
                    <tr>
                        <td>Nombre</td>
                        <td>Precio</td>
                        <td>Formato</td>
                        <td>Genero</td>
                        <td>Stock</td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                {foreach from=$juegos item=juego}
                    <tr>
                        <td>{$juego->nombre}</td>
                        <td>{$juego->precio}</td>
                        <td>{$juego->formato}</td>
                        <td>{$juego->genero}</td>
                        {if $juego->stock == 0}
                            <td>Sin Stock</td>
                        {else}
                            <td>En Stock</td>
                        {/if}
                        <td><a href="eliminar/{$juego->id}">Borrar Item</a></td>
                        <td><a href="enStock/{$juego->id}">Cambiar a En Stock</a></td>
                        <td><a href="sinStock/{$juego->id}">Cambiar a Sin Stock</a></td>
                    </tr>
                {/foreach}
            </tbody>
            </table>
        </div>
        <div class="formInsert">
            <form action="addGame" method="post">
                <h2>Agregar Juego</h2>
                <h3>Nombre del juego</h3>
                <input name="nombre">
                <h3>Precio</h3>
                <input type="number" name="precio">
                <h3>Formato</h3>
                <input name="formato">
                <h3>Genero</h3>
                <select name="id_genero">
                    {foreach from=$generos item=genero}
                    <option value="{$genero->id}">{$genero->nombre}</option>
                    {/foreach}
                </select>
                <button type="submit">Agregar</button>
            </form>
        </div>
        <div class="admin-generos">
            <div class="tablaGeneros">
                <table>
                    <thead>
                        <tr>
                            <td>Id</td>
                            <td>Nombre</td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$generos item=genero}
                            <tr>
                                <td>{$genero->id}</td>
                                <td>{$genero->nombre}</td>
                                <td><a href="eliminarGenero/{$genero->id}">Eliminar</a></td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
            <div class="formAddGenero">
                <form action="addGenero" method="post">
                    <h2>Agregar genero</h2>
                    <h3>Nombre</h3>
                    <input name="nombre">
                    <button type="submit">Agregar</button>
                </form>
            </div>
        </div>
    </div>


{include file="footer.tpl"}