package com.hackaboss.logica.controladora;

import com.hackaboss.logica.Cita;
import com.hackaboss.logica.Ciudadano;
import com.hackaboss.logica.Tramite;
import com.hackaboss.logica.Usuario;
import com.hackaboss.persistencia.controladora.ControladoraPersistenciaCita;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.Month;
import java.util.List;

public class ControladoraLogicaCita {

    ControladoraPersistenciaCita controlPersisCita = new ControladoraPersistenciaCita();

    public Cita buscar(Long id) {
        return controlPersisCita.buscar(id);
    }

    public void crear(LocalDate fechaCita, LocalTime horaCita,Tramite tramite,Ciudadano ciudadano,Usuario usuario, int estado) {
        Cita cita = new Cita(fechaCita, horaCita, tramite, ciudadano, usuario, estado);
        controlPersisCita.crear(cita);
    }

    public List<Cita> listar() {
        return controlPersisCita.listar();
    }

    public void eliminar(Long id) {
        controlPersisCita.eliminar(id);
    }

    public void editar(Cita cit) {
        controlPersisCita.editar(cit);
    }
    
    public List<Cita> listaTurnosEspera(){
        return controlPersisCita.listarTurnosEspera();
    }
    
    public List<Cita> listaTurnosAtendidos(){
        return controlPersisCita.listarTurnosAtendido();
    }

    public List<Cita> listaTurnosPorFecha(int dia,int mes, int anio) {
        LocalDate fecha = LocalDate.of(anio, mes, dia);
        return controlPersisCita.listaTurnosPorFecha(fecha);
    }
    
     public List<Cita> listarFechasDeTurnos(){
         return controlPersisCita.listarFechasDeTurnos();
     }
}
