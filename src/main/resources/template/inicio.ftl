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


    <form method="post" action="/agregarlink">
        <div class="input-group mb-3" style="margin-top: 2vh">
            <input type="text" class="form-control" placeholder="Intruduzca URL..." aria-label="Intruduzca URL..."
                   aria-describedby="button-add-url" name="link" required>
            <div class="input-group-append">
                <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Agregar
                </button>
            </div>
        </div>
    </form>

    <h4 class="card-title">Links agregados</h4>
    <div class="row">

        <!-- Blog Entries Column -->
        <div class="col-md-12">
            <div class="table-responsive-md">
                <table class="table table-borderless">
                    <thead>
                    <tr>
                        <th>Bookmark</th>
                        <th>Acortado</th>
                        <#if usuario??>
                            <th>Estadisticas</th>
                        </#if>
                        <th>Accion</th>

                    </tr>
                    </thead>
                    <tbody>
                    <#list list as ruta>
                        <tr>
                            <td class="col">
                                <a class="link-preview"
                                   href="${ruta.ruta}"></a></td>
                            <td><a href="#" class="badge badge-dark">${ruta.ruta_acortada}</a></td>
                            <#if usuario??>
                                <td>
                                    <a href="/stats/${ruta.id}" class="btn btn-primary">
                                        Estadisticas
                                    </a>
                                </td>
                            </#if>
                            <td>
                                <a href="/borrarlink/${ruta.id}" class="btn btn-danger">
                                    Borrar
                                </a>
                            </td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>

</body>


<#--<h1 class="my-4">${titulo}</h1>-->


<#--<#list list as articulo>-->
<#--<!-- Blog Post &ndash;&gt;-->
<#--<div class="card mb-4">-->
<#--<div class="card-body">-->
<#--<h2 class="card-title">${articulo.titulo}</h2>-->
<#--<p class="card-text">${articulo.cuerpo}</p>-->
<#--<a href="/verMas/${articulo.id}" style="float: right" class="btn btn-primary">Leer más-->
<#--&rarr;</a>-->
<#--</div>-->
<#--<div>-->
<#--<#assign x = articulo.id>-->
<#--<#list etiquetas as etiqueta>-->
<#--<#assign y = etiqueta.articulo.id>-->
<#--<#if (x == y?number) && etiqueta.articulo?? >-->
<#--<a href="/articulos/${etiqueta.etiqueta}"-->
<#--class="badge badge-primary">${etiqueta.etiqueta}</a>-->
<#--</#if>-->

<#--</#list>-->
<#--</div>-->
<#--<div class="card-footer text-muted">-->
<#--Publicado el ${articulo.fecha} por-->
<#--<a href="/ver/${articulo.autor.id}">${articulo.autor.nombre}</a>-->
<#--<a style="float: right" href="#" class="btn btn-primary btn-primary"><span-->
<#--class="far fa-thumbs-up"></span> Like</a>-->
<#--</div>-->
<#--</div>-->
<#--</#list>-->

<#--<!-- Pagination &ndash;&gt;-->
<#--<ul class="pagination justify-content-center mb-4">-->
<#--<#if actual gt 1>-->
<#--<li class="page-item">-->
<#--<a class="page-link" href="/inicio/${actual - 1}">&larr; Atras</a>-->
<#--</li>-->

<#--<#else>-->
<#--<li class="page-item disabled">-->
<#--<a class="page-link" href="#">Atras &larr;</a>-->
<#--</li>-->

<#--</#if>-->

<#--<#if paginas gt actual>-->
<#--<li class="page-item">-->
<#--<a class="page-link" href="/inicio/${actual + 1}">&rarr; Siguiente</a>-->
<#--</li>-->
<#--<#else>-->
<#--<li class="page-item disabled">-->
<#--<a class="page-link" href="#">Siguiente &rarr;</a>-->
<#--</li>-->
<#--</#if>-->
<#--</ul>-->

<!-- Sidebar Widgets Column -->
<div class="col-md-4">
    <#--<!-- Side Widget &ndash;&gt;-->
    <#--<div class="card my-4">-->
    <#--<h5 class="card-header">Blog</h5>-->
    <#--<div class="card-body">-->
    <#--Blog de prueba para la materia de Programacion WEB dada por el profesor Carlos Camacho, tarea-->
    <#--presentada por el estudiante, Luis Capellan-->
    <#--Matricula 2014-0984-->
    <#--</div>-->
    <#--</div>-->
</div>

<!-- /.row -->

<!-- /.container -->

<!-- Footer -->
<footer class="py-5 bg-dark embed-responsive">
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
