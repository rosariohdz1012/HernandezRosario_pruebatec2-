package com.hackaboss.logica.controladora;

import com.hackaboss.logica.Usuario;
import com.hackaboss.persistencia.controladora.ControladoraPersistenciaUsuario;
import java.util.List;

public class ControladoraLogicaUsuario {

    ControladoraPersistenciaUsuario controlPersUsuario = new ControladoraPersistenciaUsuario();

    public Usuario buscarId(Long id) {
        return controlPersUsuario.buscarId(id);
    }
    
    public Usuario validarUsuario(String email,String contrasenia){
        Usuario usuario = controlPersUsuario.buscarPorEmail(email);
        
        if(usuario != null){
            if(usuario.getEmail().equals(email)&& usuario.getPassword().equals(contrasenia)){
                return usuario;                
            }
        }        
        return null;
    }

    public boolean crear(String nombre,String email,String password) {
        boolean creado = false;
        Usuario usu = new Usuario(nombre, email, password);
               
        try {
           controlPersUsuario.crear(usu); 
           creado=true;
        } catch (Exception e) {
           
        }
        return creado;        
    }

    public List<Usuario> listar() {
        return controlPersUsuario.listar();
    }

    public void eliminar(Long id) {
        controlPersUsuario.eliminar(id);
    }

    public void editar(Usuario usuar) {
        controlPersUsuario.editar(usuar);
    }

}
