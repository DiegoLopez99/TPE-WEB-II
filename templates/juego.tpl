<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/7305faff6b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/style.css">
    <base href="http://{$smarty.server.SERVER_NAME}{dirname($smarty.server.PHP_SELF)}/" target="_self">
    <title>DL GameShop</title>
</head>
<body>
{include file="header.tpl"}
    <div id="cont-juego"  class="contenedor" data-id-juego={$juego->id} {*data-id-user={$smarty.session.ID}*}>
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
            <div class="comentarios">
                <ul id="comentarios-list">

                </ul>
                {*{if isset($smarty.session.ID)}*}
                    <form id="form-comentario">
                        <input type="text" name="texto">
                        <select name="puntuacion">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                        <select name="id_usuario">
                            {foreach from=$users item=user}
                                <option value="{$user->id}">{$user->email}</option>
                            {/foreach}
                        </select>
                        <button type="submit">Agregar Comentario</button>
                    </form>
                {*{else}
                    <a href="login">Ingrese para comentar</a>
                {/if}*}
            </div>
        </div>
    </div>
    <script src="./js/comentarios.js"></script> 
{include file="footer.tpl"}

