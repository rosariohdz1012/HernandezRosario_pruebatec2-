
package com.hackaboss.servlets;

import com.hackaboss.logica.Usuario;
import com.hackaboss.logica.controladora.ControladoraLogicaUsuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "LoginServ", urlPatterns = {"/Login"})
public class LoginServ extends HttpServlet {
     ControladoraLogicaUsuario conUsu = new ControladoraLogicaUsuario();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password =  request.getParameter("password");
        Usuario usuarioLogin = conUsu.validarUsuario(email, password);
        if(usuarioLogin!= null){            
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuarioLogin", usuarioLogin);
            sesion.setAttribute("nombre", usuarioLogin.getNombre());
            response.sendRedirect("panel.jsp");
            
        }else{
            response.sendRedirect("login.jsp");
        }        
        
    }
    

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
