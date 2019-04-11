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

</head>

<body>

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
    <div class="row">
        <div class="accordion" id="accordionExample">
            <div class="card">
                <div class="card-header" id="headingOne">
                    <h2 class="mb-0">
                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne"
                                aria-expanded="true" aria-controls="collapseOne">
                            Todos los usuarios
                        </button>
                    </h2>
                </div>

                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne"
                     data-parent="#accordionExample">
                    <div class="row">
                        <!-- Usuarios -->
                        <div class="col-md-12">
                            <div>
                                <table class="table table-borderless table-responsive" style="width: 1080px">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Usuario</th>
                                        <th class="col-sm-3">Nombre</th>
                                        <th>Links</th>
                                        <th class="col-sm-2">Nivel de acceso</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>
                                            lugi
                                        </td>
                                        <td>
                                            Luis Capellan
                                        </td>
                                        <td>
                                            <a href="#" class="badge badge-dark">22</a>
                                        </td>
                                        <td>
                                            <a href="/stats" class="btn btn-primary">
                                                usuario
                                            </a>
                                        </td>

                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>
                                            lugi
                                        </td>
                                        <td>
                                            Luis Capellan
                                        </td>
                                        <td>
                                            <a href="#" class="badge badge-dark">22</a>
                                        </td>
                                        <td>
                                            <a href="/stats" class="btn btn-primary">
                                                usuario
                                            </a>
                                        </td>

                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>
                                            lugi
                                        </td>
                                        <td>
                                            Luis Capellan
                                        </td>
                                        <td>
                                            <a href="#" class="badge badge-dark">22</a>
                                        </td>
                                        <td>
                                            <a href="/stats" class="btn btn-primary">
                                                usuario
                                            </a>
                                        </td>

                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="headingTwo">
                    <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse"
                                data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            Todos los links
                        </button>
                    </h2>
                </div>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
                     data-parent="#accordionExample">
                    <div class="row">

                        <!-- Blog Entries Column -->
                        <div class="col-md-12">
                            <div class="table-responsive-md">
                                <table class="table table-borderless" style="width: 1080px">
                                    <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col" style="margin-right: 25vh;">Bookmark</th>
                                        <th scope="col">Acortado</th>
                                        <th scope="col">Completo</th>
                                        <th scope="col">Estadisticas</th>
                                        <th scope="col">Accion</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>
                                            <a class="link-preview"
                                               href="https://developers.google.com/chart/interactive/docs/basic_load_libs"></a>
                                        </td>
                                        <td><a href="#" class="badge badge-dark">lcapellan.me/8d5</a></td>
                                        <td><a href="#" class="badge badge-dark">prueba.com/prueba_larga/paratest/546548aasd</a>
                                        </td>
                                        <td>
                                            <a href="/stats" class="btn btn-primary">
                                                Estadisticas
                                            </a></td>
                                        <td>
                                            <a href="/stats" class="btn btn-danger">
                                                Borrar
                                            </a></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>
                                            <a class="link-preview" href="https://www.reddit.com/">https://www.reddit.com/</a>
                                        </td>
                                        <td><a href="#" class="badge badge-dark">lcapellan.me/8d5</a></td>
                                        <td><a href="#" class="badge badge-dark">prueba.com/prueba_larga/paratest/546548aasd</a>
                                        </td>
                                        <td>
                                            <a href="/stats" class="btn btn-primary">
                                                Estadisticas
                                            </a></td>
                                        <td>
                                            <a href="/stats" class="btn btn-danger">
                                                Borrar
                                            </a></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>
                                            <a class="link-preview" href="https://www.reddit.com/">https://www.reddit.com/</a>
                                        </td>
                                        <td><a href="#" class="badge badge-dark">lcapellan.me/8d5</a></td>
                                        <td><a href="#" class="badge badge-dark">prueba.com/prueba_larga/paratest/546548aasd</a>
                                        </td>
                                        <td>
                                            <a href="/stats" class="btn btn-primary ">
                                                Estadisticas
                                            </a></td>
                                        <td>
                                            <a href="/stats" class="btn btn-danger">
                                                Borrar
                                            </a></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.row -->
    </div>
</div>
<!-- /.container -->

<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Luis Capellan - 2014-0984</p>
    </div>
    <!-- /.container -->
</footer>
<!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../vendor/bootstrap/js/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="../vendor/bootstrap/js/my-login.js"></script>

</body>

</html>
