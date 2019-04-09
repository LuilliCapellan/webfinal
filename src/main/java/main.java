import com.google.gson.Gson;
import encapsulacion.Usuario;
import freemarker.template.Configuration;
import freemarker.template.Version;
import modelo.EntityServices.EntityServices.UsuarioService;
import modelo.EntityServices.utils.Crypto;
import modelo.EntityServices.utils.DBService;
import modelo.EntityServices.utils.Rest.JsonUtilidades;
import org.simpleframework.xml.Serializer;
import org.simpleframework.xml.core.Persister;
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

    public final static String ACCEPT_TYPE_JSON = "application/json";
    public final static String ACCEPT_TYPE_XML = "application/xml";
    public final static int BAD_REQUEST = 400;
    public final static int ERROR_INTERNO = 500;

    public static void main(String[] args) {

        staticFiles.location("/template");

        DBService.getInstancia().iniciarDn();
        //Entrando el admin
        Usuario usuarioStart = new Usuario("admin", "admin", "admin", true);

        //Clase que representa el servicio.
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
            } else {
                response.redirect("/");
            }
            return "";
        });
        get("/inicio/:pag", (request, response) -> {
            Map<String, Object> attributes = new HashMap<>();
            userLevel(attributes);
            return new ModelAndView(attributes, "inicio.ftl");
        }, freeMarkerEngine);

        get("/stats", (request, response) -> {

            Map<String, Object> attributes = new HashMap<>();
            userLevel(attributes);
            return new ModelAndView(attributes, "stats.ftl");
        }, freeMarkerEngine);

        get("/adminPanel", (request, response) -> {


            Map<String, Object> attributes = new HashMap<>();
            userLevel(attributes);
            return new ModelAndView(attributes, "stats.ftl");
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

        //Rest
        //rutas servicios RESTFUL
        path("/rest", () -> {
            //filtros especificos:
            afterAfter("/*", (request, response) -> { //indicando que todas las llamadas retorna un json.
                if(request.headers("Accept")!=null && request.headers("Accept").equalsIgnoreCase(ACCEPT_TYPE_XML)){
                    response.header("Content-Type", ACCEPT_TYPE_XML);
                }else{
                    response.header("Content-Type", ACCEPT_TYPE_JSON);
                }

            });

            get("/", (request, response) -> {
                return "RUTA API REST";
            });

            //rutas del api
            path("/usuarios", () -> {


                //listar todos los usuarios.
                get("/", (request, response) -> {
                    return usuarioService.getAll();
                }, JsonUtilidades.json());

                //retorna un usuario
                get("/:id", (request, response) -> {
                    Usuario usuario = usuarioService.getById(Integer.parseInt(request.params("id")));
                    if(usuario==null){
                        throw new RuntimeException("No existe el cliente");
                    }
                    return  usuario;
                }, JsonUtilidades.json());

                //crea un usuario
                post("/", main.ACCEPT_TYPE_JSON, (request, response) -> {

                    Usuario usuario = null;

                    //verificando el tipo de dato.
                    switch (request.headers("Content-Type")) {
                        case main.ACCEPT_TYPE_JSON:
                            usuario = new Gson().fromJson(request.body(), Usuario.class);
                            break;
                        case main.ACCEPT_TYPE_XML:
                            break;
                        default:
                            throw new IllegalArgumentException("Error el formato no disponible");
                    }
                    usuarioService.insert(usuario);
                    return true;
                }, JsonUtilidades.json());

                //
                post("/", main.ACCEPT_TYPE_XML, (request, response) -> {
                    return true;
                }, JsonUtilidades.json());

                //actualiza un usuario
                put("/", main.ACCEPT_TYPE_JSON, (request, response) -> {
                    Usuario usuario = new Gson().fromJson(request.body(), Usuario.class);
                    usuarioService.update(usuario);
                    return true;
                }, JsonUtilidades.json());

                //eliminar un usuario
                delete("/:id", (request, response) -> {
                    Usuario usuario = new Gson().fromJson(request.body(), Usuario.class);
                    usuarioService.delete(usuario);
                    return true;
                }, JsonUtilidades.json());

            });
        });
    }



    private static void userLevel(Map<String, Object> attributes) {
        attributes.put("usuario", usuario);
        if (usuario != null) {
            attributes.put("admin", usuario.getAdministrator());
            attributes.put("usuarioName", usuario.getNombre());
        }
    }

}
