
package com.hackaboss.servlets.tramite;

import com.hackaboss.logica.Tramite;
import com.hackaboss.logica.controladora.ControladoraLogicaTramite;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "TramiteServ", urlPatterns = {"/Tramite"})
public class TramiteServ extends HttpServlet { 
    ControladoraLogicaTramite controlT = new ControladoraLogicaTramite();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = Optional.ofNullable(request.getParameter("accion")).orElse("listarT");
        switch (accion) {
            case "listarT":
                this.listar(request, response);
                break;
            case "editarT":
                this.editar(request, response);
                break;
            case "eliminarT":
                this.eliminar(request, response);
                break;
            default:
                 listar(request, response);
               
        }
       
       
    }
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String accion = Optional.ofNullable(request.getParameter("accion")).orElse("listarT");
        switch (accion) {
            case "insertarT":
                this.insertar(request, response);
                break;
            case "modificarT":
                this.modificar(request, response);
                break;
            default:
                 listar(request, response);
        }
        
    }

    private void listar(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
        List<Tramite> listaT = controlT.listar();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("tramites", listaT);
        request.getRequestDispatcher("tramite.jsp").forward(request, response);
    }    
    private void insertar(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");      
        
        controlT.crear(nombre, descripcion);
        listar(request, response);                
    }
    private void eliminar(HttpServletRequest request, HttpServletResponse response) 
    throws ServletException, IOException{
        Long idTramite = Long.parseLong(request.getParameter("idTramite"));
        controlT.eliminar(idTramite);
        this.listar(request, response);
    }
    
    private void editar(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        Long idTramite = Long.parseLong(request.getParameter("idTramite"));
        Tramite t = controlT.buscarId(idTramite);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("tramiteS", t);
        
        request.getRequestDispatcher("editarTramite.jsp").forward(request, response);
        
    }
    
    private void modificar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Tramite tramite = (Tramite)request.getSession().getAttribute("tramiteS");
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");      
        tramite.setNombre(nombre);
        tramite.setDescripcionTra(descripcion);
        controlT.editar(tramite);
        //response.sendRedirect("tramite.jsp");
        listar(request, response);            
        
    }
        
        
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    

    

   

}
