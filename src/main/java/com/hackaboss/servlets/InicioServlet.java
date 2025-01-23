
package com.hackaboss.servlets;

import com.hackaboss.logica.controladora.ControladoraLogicaUsuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "InicioServlet", urlPatterns = {"/"})
public class InicioServlet extends HttpServlet {  
    ControladoraLogicaUsuario conUsu = new ControladoraLogicaUsuario();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(conUsu.listar().isEmpty() || conUsu.listar()== null){
            response.sendRedirect("registro.jsp");
        }else{
            response.sendRedirect("login.jsp");            
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
