package com.hackaboss.logica.controladora;

import com.hackaboss.logica.Tramite;
import com.hackaboss.persistencia.controladora.ControladoraPersistenciaTramite;
import java.util.List;

public class ControladoraLogicaTramite {

    ControladoraPersistenciaTramite controlPersis = new ControladoraPersistenciaTramite();

    public Tramite buscarId(Long id) {
        return controlPersis.buscarId(id);
    }

    public void crear( String nombre,String descripcion) {
        Tramite t = new Tramite(nombre, descripcion);
        controlPersis.crear(t);
    }

    public List<Tramite> listar() {
        return controlPersis.listar();
    }

    public void eliminar(Long id) {
        controlPersis.eliminar(id);
    }

    public void editar(Tramite t) {
        controlPersis.editar(t);
    }

}
