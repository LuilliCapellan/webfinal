package modelo.EntityServices.EntityServices;

import dao.Implementations.RutaDAOImpl;
import dao.interfaces.RutaDAO;
import encapsulacion.Ruta;

import java.util.List;

public class RutaService implements RutaDAO {

    private static RutaService instancia;
    private RutaDAOImpl rutaDAO;

    public static RutaService getInstancia() {
        if (instancia == null)
            instancia = new RutaService();
        return instancia;
    }


    public RutaService() {
        rutaDAO = new RutaDAOImpl(Ruta.class);
    }

    @Override
    public void insert(Ruta e) {
        rutaDAO.insert(e);
    }

    @Override
    public void update(Ruta e) {
        rutaDAO.update(e);
    }

    @Override
    public void delete(Ruta e) {
        rutaDAO.delete(e);
    }

    @Override
    public List<Ruta> getAll() {
        return null;
    }

    @Override
    public Ruta getById(long id) {
        return rutaDAO.getById(id);
    }

    @Override
    public Ruta getByUser(long user_id) {
        return rutaDAO.getByUser(user_id);
    }

    @Override
    public Ruta generateShortLink(String ruta) {
        return rutaDAO.generateShortLink(ruta);
    }

    @Override
    public Ruta getByRutaAcortada(String rutaAcortada) {
        return rutaDAO.getByRutaAcortada(rutaAcortada);
    }
}
