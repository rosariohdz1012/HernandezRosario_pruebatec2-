package com.hackaboss.persistencia.controladora;

import com.hackaboss.logica.Ciudadano;
import com.hackaboss.persistencia.CiudadanoJpaController;
import com.hackaboss.persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladoraPersistenciaCiudadano {

    CiudadanoJpaController ciudadanoJpa = new CiudadanoJpaController();

    public Ciudadano buscar(Long id) {
        return ciudadanoJpa.findCiudadano(id);
    }

    public void crear(Ciudadano ciu) {
        ciudadanoJpa.create(ciu);
    }

    public List<Ciudadano> listar() {
        return ciudadanoJpa.findCiudadanoEntities();
    }

    public void eliminar(Long id) {
        try {
            ciudadanoJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistenciaCiudadano.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editar(Ciudadano ciu) {
        try {
            ciudadanoJpa.edit(ciu);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistenciaCiudadano.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
