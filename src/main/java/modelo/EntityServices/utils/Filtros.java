package modelo.EntityServices.utils;

import encapsulacion.Usuario;

import static spark.Spark.before;

public class Filtros {
    public void filtros() {


        before((request, response) -> System.out.println("Ruta antes: " + request.pathInfo()));
        before("/inicio", (request, response) -> response.redirect("/inicio/1"));

        before("/adminPanel", (request, response) -> {
            Usuario usuario = request.session(true).attribute("usuario");
            if (usuario == null || !usuario.getAdministrator()) {
                response.redirect("/inicio/1");
            }
        });

        before("/links_usuario", (request, response) -> {
            Usuario usuario = request.session(true).attribute("usuario");
            if (usuario == null || !usuario.getAdministrator()) {
                response.redirect("/inicio/1");
            }
        });

        before("/stats", (request, response) -> {
            Usuario usuario = request.session(true).attribute("usuario");
            if (usuario == null) {
                response.redirect("/inicio/1");
            }
        });

    }

}
