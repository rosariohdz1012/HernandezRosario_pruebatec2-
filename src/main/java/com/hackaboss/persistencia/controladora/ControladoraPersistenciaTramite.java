package com.hackaboss.persistencia.controladora;

import com.hackaboss.logica.Tramite;
import com.hackaboss.persistencia.TramiteJpaController;
import com.hackaboss.persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladoraPersistenciaTramite {

    TramiteJpaController tramiteJpa = new TramiteJpaController();

    public Tramite buscarId(Long id) {
        return tramiteJpa.findTramite(id);
    }

    public void crear(Tramite t) {
        tramiteJpa.create(t);
    }

    public List<Tramite> listar() {
        return tramiteJpa.findTramiteEntities();
    }

    public void eliminar(Long id) {
        try {
            tramiteJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistenciaTramite.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editar(Tramite t) {
        try {
            tramiteJpa.edit(t);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistenciaTramite.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
