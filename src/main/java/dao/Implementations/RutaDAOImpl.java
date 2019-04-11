package dao.Implementations;

import dao.interfaces.RutaDAO;
import encapsulacion.Ruta;
import modelo.EntityServices.utils.CRUD;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

public class RutaDAOImpl extends CRUD<Ruta> implements RutaDAO {

    public RutaDAOImpl(Class<Ruta> rutaClass) {
        super(rutaClass);
    }

    @Override
    public void insert(Ruta e) {
        crear(e);
    }

    @Override
    public void update(Ruta e) {
        editar(e);
    }

    @Override
    public void delete(Ruta e) {
        eliminar(e.getId());
    }

    @Override
    public List<Ruta> getAll() {
        EntityManager em = getEntityManager();
        Query query = em.createNamedQuery("Ruta.findAllURL");
        return (List<Ruta>) query.getResultList();
    }

    @Override
    public Ruta getById(long id) {
        EntityManager em = getEntityManager();
        Query query = em.createNamedQuery("Ruta.findURLbyId");
        query.setParameter("id", id);
        return (Ruta) query.getSingleResult();
    }

    @Override
    public Ruta getByUser(long user_id) {
        EntityManager em = getEntityManager();
        Query query = em.createNamedQuery("Ruta.findURLbyUserId");
        query.setParameter("id", user_id);
        return (Ruta) query.getSingleResult();
    }

    @Override
    public Ruta generateShortLink(String ruta) {
        return null;
    }

    @Override
    public Ruta getByRutaAcortada(String rutaAcortada) {
        EntityManager em = getEntityManager();
        Query query = em.createNamedQuery("Ruta.findURLbyRutaAcortada");
        query.setParameter("ruta_acortada", rutaAcortada);
        return (Ruta) query.getSingleResult();
    }
}
