package com.hackaboss.persistencia.controladora;

import com.hackaboss.logica.Cita;
import com.hackaboss.persistencia.CitaJpaController;
import com.hackaboss.persistencia.exceptions.NonexistentEntityException;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;


public class ControladoraPersistenciaCita {

    CitaJpaController citaJpa = new CitaJpaController();

    public Cita buscar(Long id) {
        return citaJpa.findCita(id);
    }

    public void crear(Cita cit) {
        citaJpa.create(cit);
    }

    public List<Cita> listar() {
        return citaJpa.findCitaEntities();
    }

    public void eliminar(Long id) {
        try {
            citaJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistenciaCita.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editar(Cita cita) {
        try {
            citaJpa.edit(cita);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistenciaCita.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<Cita> listarTurnosEspera(){        
        return listar().stream().filter(cita->cita.getEstado()== 0L).toList();
    }
    
    public List<Cita> listarTurnosAtendido(){        
        return listar().stream().filter(cita->cita.getEstado()== 1L).toList();
    }

    public List<Cita> listaTurnosPorFecha(LocalDate fecha) {        
        return listar().stream().filter(cita->cita.getFechaCita()== fecha).toList();
    }
    
    public List<Cita> listarFechasDeTurnos(){
//        Set<Cita> setCitas = new HashSet<>();
//        listar().stream().filter(setCitas::add);        
//        return setCitas.stream().toList();
        List<Cita> fechasCitas = listar().stream()
            .distinct()
            .collect(Collectors.toList());
        
        return fechasCitas;
        
    }

}
