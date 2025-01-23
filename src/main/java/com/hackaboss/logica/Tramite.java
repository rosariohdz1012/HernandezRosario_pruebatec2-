package com.hackaboss.logica;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Tramite implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nombre;
    private String descripcionTra;

    public Tramite() {
    }

    public Tramite(String nombre, String descripcionTra) {
        this.nombre = nombre;
        this.descripcionTra = descripcionTra;
    }

    public Long getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcionTra() {
        return descripcionTra;
    }

    public void setDescripcionTra(String descripcionTra) {
        this.descripcionTra = descripcionTra;
    }

}
