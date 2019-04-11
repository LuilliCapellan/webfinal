package dao.interfaces;

import encapsulacion.Ruta;

import java.util.List;

public interface RutaDAO {

    void insert(Ruta e);

    void update(Ruta e);

    void delete(Ruta e);

    List<Ruta> getAll();

    Ruta getById(long id);

    Ruta getByUser(long user_id);

    Ruta generateShortLink(String ruta);

    Ruta getByRutaAcortada(String rutaAcortada);
}
