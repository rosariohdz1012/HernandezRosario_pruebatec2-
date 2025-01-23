package com.hackaboss.logica;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Cita implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private LocalDate fechaCita;
    private LocalTime horaCita;
    @ManyToOne
    @JoinColumn(name = "TRAMITE_ID")
    private Tramite tramite;
    @ManyToOne
    @JoinColumn(name = "CIUDADANO_ID")
    private Ciudadano ciudadano;
    @ManyToOne
    @JoinColumn(name = "USUARIO_ID")
    private Usuario usuario;
    private Integer estado;

    public Cita() {
    }

    public Cita(LocalDate fechaCita, LocalTime horaCita, Tramite tramite, Ciudadano ciudadano, Usuario usuario, Integer estado) {
        this.fechaCita = fechaCita;
        this.horaCita = horaCita;
        this.tramite = tramite;
        this.ciudadano = ciudadano;
        this.usuario = usuario;
        this.estado = estado;
    }

    public Long getId() {
        return id;
    }

    public LocalDate getFechaCita() {
        return fechaCita;
    }

    public void setFechaCita(LocalDate fechaCita) {
        this.fechaCita = fechaCita;
    }

    public LocalTime getHoraCita() {
        return horaCita;
    }

    public void setHoraCita(LocalTime horaCita) {
        this.horaCita = horaCita;
    }

    public Tramite getTramite() {
        return tramite;
    }

    public void setTramite(Tramite tramite) {
        this.tramite = tramite;
    }

    public Ciudadano getCiudadano() {
        return ciudadano;
    }

    public void setCiudadano(Ciudadano ciudadano) {
        this.ciudadano = ciudadano;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Integer getEstado() {
        return estado;
    }

    public void setEstado(Integer estado) {
        this.estado = estado;
    }

}
