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
    <div class="registro">
        <div class="formulario">
            <form action="registrarUser" method="post">
                <h1>Email:</h1>
                <input name="email">
                <h1>Contraseña:</h1>
                <input type="password" name="password">
                <button type="submit">Registrarse</button>
            </form>
        </div>
    </div>
{include file="footer.tpl"}