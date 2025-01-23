
package com.hackaboss.servlets.ciudadano;

import com.hackaboss.logica.Ciudadano;
import com.hackaboss.logica.controladora.ControladoraLogicaCiudadano;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "CiudadanoServ", urlPatterns = {"/Ciudadano"})
public class CiudadanoServ extends HttpServlet { 
    ControladoraLogicaCiudadano controlC = new ControladoraLogicaCiudadano();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String accion = Optional.ofNullable(request.getParameter("accion")).orElse("listarC");
        switch (accion) {
            case "listarC":
                this.listar(request, response);
                break;
            case "editarC":
                this.editar(request, response);
                break;
            case "eliminarC":
                this.eliminar(request, response);
                break;
            default:
                 listar(request, response);
               
        }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = Optional.ofNullable(request.getParameter("accion")).orElse("listarC");
        switch (accion) {
            case "insertarC":
                this.insertar(request, response);
                break;
            case "modificarC":
                this.modificar(request, response);
                break;
            default:
                 listar(request, response);
        }
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Ciudadano> listaC = controlC.listar();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("ciudadanos", listaC);
        request.getRequestDispatcher("ciudadano.jsp").forward(request, response);
    }

    private void editar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long idCiudadano = Long.parseLong(request.getParameter("idCiudadano"));
        Ciudadano c = controlC.buscar(idCiudadano);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("ciudadanoS", c);
        //request.setAttribute("tramiteE", c);
        request.getRequestDispatcher("editarCiudadano.jsp").forward(request, response);
        
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
        Long idCiudadano = Long.parseLong(request.getParameter("idCiudadano"));
        controlC.eliminar(idCiudadano);
        this.listar(request, response);
    }
        

    private void insertar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
        String nombre = request.getParameter("nombre");
        String apellidoPat = request.getParameter("apellidoPat");
        String apellidoMat = request.getParameter("apellidoMat");
        String genero = request.getParameter("genero");
        String telefono = request.getParameter("telefono");
        
        controlC.crear(nombre, apellidoPat, apellidoMat, genero, telefono);
        listar(request, response);                
    }

    private void modificar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
        Ciudadano ciudadano = (Ciudadano)request.getSession().getAttribute("ciudadanoS");
        String nombre = request.getParameter("nombre");
        String apellidoPat = request.getParameter("apellidoPat");
        String apellidoMat = request.getParameter("apellidoMat");
        String genero = request.getParameter("genero");
        String telefono = request.getParameter("telefono");
        ciudadano.setNombre(nombre);
        ciudadano.setApellidoPat(apellidoPat);
        ciudadano.setApellidoMat(apellidoMat);
        ciudadano.setGenero(genero);
        ciudadano.setTelefono(telefono);
        controlC.editar(ciudadano);
        listar(request, response);     
    }

}
