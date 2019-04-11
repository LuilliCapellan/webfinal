<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/bootstrap.tagsinput/0.4.2/bootstrap-tagsinput.css"/>
    <title>Acortador URL - Final Web1 - 2014-0984</title>

    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/blog-home.css" rel="stylesheet">
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/@microlink/vanilla@latest/umd/microlink.min.js"></script>


</head>

<body>

<!-- Microlink SDK Vanilla/UMD bundle -->
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="/inicio/1">Inicio</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <#if admin?? && admin == true>
                    <li class="nav-item">
                        <a class="nav-link" href="/adminPanel">Panel de Admin</a>
                    </li>
                </#if>
                <#if usuario??>
                    <li class="nav-item">
                        <a class="nav-link" href="/logOut">Salir</a>
                    </li>
                <#else>
                    <li class="nav-item">
                        <a class="nav-link" href="/">Log In</a>
                    </li>
                </#if>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div class="container">
    <!-- Microlink SDK Vanilla/UMD bundle -->
    <script src="//cdn.jsdelivr.net/npm/@microlink/vanilla@latest/umd/microlink.min.js"></script>

    <!-- Replace all elements with `link-preview` class -->
    <script>
        document.addEventListener("DOMContentLoaded", function (event) {
            microlink('.link-preview', {
                size: 'small',
                video: true
            })
        })
    </script>

    <h4 class="card-title">Links de ${user.nombre} </h4>
    <div class="row">

        <!-- Blog Entries Column -->
        <div class="col-md-12">
            <div class="table-responsive-md">
                <table class="table table-borderless">
                    <thead>
                    <tr>
                        <th scope="col" style="margin-right: 25vh;">Bookmark</th>
                        <th scope="col">Acortado</th>
                        <th scope="col">Estadisticas</th>
                        <th >Accion</th>

                    </tr>
                    </thead>
                    <tbody>
                    <#list list as ruta>
                        <tr>
                            <td class="col">
                                <a class="link-preview"
                                   href="${ruta.ruta}"></a></td>
                            <td><a href="#" class="badge badge-dark">${ruta.ruta_acortada}</a></td>
                            <td>
                                <a href="/stats/${ruta.id}" class="btn btn-primary">
                                    Estadisticas
                                </a></td>
                            <td>
                                <a href="/borrarlink/${ruta.id}" class="btn btn-danger">
                                    Borrar
                                </a>
                            </td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
</body>

<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Luis Capellan - 2014-0984</p>
    </div>
    <!-- /.container -->
</footer>
<!-- /.container -->

<!-- Bootstrap core JavaScript -->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../vendor/bootstrap/js/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="../vendor/bootstrap/js/my-login.js"></script>
</html>
