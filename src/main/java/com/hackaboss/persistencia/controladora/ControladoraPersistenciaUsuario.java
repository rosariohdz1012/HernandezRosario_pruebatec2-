package com.hackaboss.persistencia.controladora;

import com.hackaboss.logica.Usuario;
import com.hackaboss.persistencia.UsuarioJpaController;
import com.hackaboss.persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladoraPersistenciaUsuario {

    UsuarioJpaController usuarioJpa = new UsuarioJpaController();

    public Usuario buscarId(Long id) {
        return usuarioJpa.findUsuario(id);
    }
    public Usuario buscarPorEmail(String email) {
       return usuarioJpa.findUsuarioByEmail(email);        
    }

    public void crear(Usuario usuar) {
        usuarioJpa.create(usuar);
    }

    public List<Usuario> listar() {
        return usuarioJpa.findUsuarioEntities();
    }

    public void eliminar(Long id) {
        try {
            usuarioJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistenciaUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editar(Usuario usuar) {
        try {
            usuarioJpa.edit(usuar);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistenciaUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
