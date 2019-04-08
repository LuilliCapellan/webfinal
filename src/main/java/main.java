import encapsulacion.Usuario;
import freemarker.template.Configuration;
import freemarker.template.Version;
import modelo.EntityServices.EntityServices.UsuarioService;
import modelo.EntityServices.utils.Crypto;
import modelo.EntityServices.utils.DBService;
import spark.ModelAndView;
import spark.Session;
import spark.template.freemarker.FreeMarkerEngine;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.HashMap;
import java.util.Map;

import static spark.Spark.*;

public class main {
    public static Usuario usuario;
    static final String iv = "0123456789123456"; // This has to be 16 characters
    static final String secretKeyUSer = "qwerty987654321";
    static final String secretKeyContra = "123456789klk";

    public static void main(String[] args) {

        staticFiles.location("/template");

        DBService.getInstancia().iniciarDn();
        Usuario usuarioStart = new Usuario("admin", "admin", "admin", true);
        UsuarioService usuarioService = UsuarioService.getInstancia();
        if (usuarioService.validateLogIn("admin", "admin") == null) {
           usuarioService.insert(usuarioStart);
       }
        Configuration configuration = new Configuration(new Version(2, 3, 0));
        configuration.setClassForTemplateLoading(main.class, "/template");

        FreeMarkerEngine freeMarkerEngine = new FreeMarkerEngine(configuration);

        get("/", (request, response) -> {
            Map<String, Object> attributes = new HashMap<>();
            Map<String, String> cookies = request.cookies();

            String[] llaveValor = new String[2];
            request.cookie("login");
            for (String key : cookies.keySet()) {
                System.out.println("llave: " + key + " valor: " + cookies.get(key));
                llaveValor = cookies.get(key).split(",");

            }

            if (llaveValor.length > 1) {
                Crypto crypto = new Crypto();

                System.out.println(llaveValor[0] + " contra: " + llaveValor[1]);
                String user = crypto.decrypt(llaveValor[0], iv, secretKeyUSer);
                String contra = crypto.decrypt(llaveValor[1], iv, secretKeyContra);

                Usuario usuario1 = UsuarioService.getInstancia().validateLogIn(user, contra);
                if (usuario1 != null) {
                    usuario = usuario1;
                    request.session(true);
                    request.session().attribute("usuario", usuario);
                    response.redirect("/inicio/1");
                }
            }
            return new ModelAndView(attributes, "login.ftl");
        }, freeMarkerEngine);
        post("/iniciarSesion", (request, response) -> {

            String user = request.queryParams("usuario");
            String contra = request.queryParams("password");
            String recordar = request.queryParams("remember");

            System.out.println(recordar);

            System.out.println(user + " pass : " + contra);
            Usuario usuario1 = UsuarioService.getInstancia().validateLogIn(user, contra);

            if (usuario1 != null) {
                if (recordar != null && recordar.equalsIgnoreCase("on")) {

                    Crypto crypto = new Crypto();
                    String userEncrypt = crypto.encrypt(user, iv, secretKeyUSer);
                    String contraEncrypt = crypto.encrypt(contra, iv, secretKeyContra);

                    System.out.println("user encryp: " + userEncrypt + " contra encryp: " + contraEncrypt);

                    response.cookie("/", "login", userEncrypt + "," + contraEncrypt, 604800, false); //incluyendo el path del cookie.
                }
                usuario = usuario1;
                request.session(true);
                request.session().attribute("usuario", usuario);
                response.redirect("/inicio/1");
            }
            else {
                response.redirect("/");
            }
            return "";
        });
        get("/inicio/:pag", (request, response) -> {

            Map<String, Object> attributes = new HashMap<>();
            userLevel(attributes);
            return new ModelAndView(attributes, "inicio.ftl");
        }, freeMarkerEngine);

        get("/agregarUsuario", (request, response) -> {
            Map<String, Object> attributes = new HashMap<>();
            userLevel(attributes);
            return new ModelAndView(attributes, "agregarUsuario.ftl");
        }, freeMarkerEngine);

        post("/guardarUsuario", (request, response) -> {
            String username = request.queryParams("usuario");
            String nombre = request.queryParams("nombre");
            String pass = request.queryParams("pass");
            Usuario u = new Usuario(username, nombre, pass, false);
            UsuarioService.getInstancia().insert(u);
            System.out.println(username + " pass : " + pass);
            Usuario usuario1 = UsuarioService.getInstancia().validateLogIn(username, pass);
            if (usuario1 != null) {
                usuario = usuario1;
                request.session(true);
                request.session().attribute("usuario", usuario);
                response.redirect("/inicio/1");
            }
            return "";
        });

        get("/logOut", (request, response) -> {

            usuario = null;
            Session session = request.session(true);
            session.invalidate();
            response.removeCookie("/", "login");
            response.redirect("/inicio/1");

            return "";
        });
    }


    private static void userLevel(Map<String, Object> attributes) {
        attributes.put("usuario", usuario);
        if (usuario != null) {
            attributes.put("admin", usuario.getAdministrator());
            attributes.put("usuarioName", usuario.getNombre());
        }
    }

    static void crear() {
        EntityManagerFactory emf =  Persistence.createEntityManagerFactory("UnidadPersistencia");
        EntityManager entityManager = emf.createEntityManager();
        entityManager.getTransaction().begin();
    }
}
