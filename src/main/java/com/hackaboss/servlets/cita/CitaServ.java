
package com.hackaboss.servlets.cita;

import com.hackaboss.logica.Cita;
import com.hackaboss.logica.Ciudadano;
import com.hackaboss.logica.Tramite;
import com.hackaboss.logica.Usuario;
import com.hackaboss.logica.controladora.ControladoraLogicaCita;
import com.hackaboss.logica.controladora.ControladoraLogicaCiudadano;
import com.hackaboss.logica.controladora.ControladoraLogicaTramite;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CitaServ", urlPatterns = {"/Cita"})
public class CitaServ extends HttpServlet {   
    ControladoraLogicaCita controlCita = new ControladoraLogicaCita();
    ControladoraLogicaTramite controlTramite = new ControladoraLogicaTramite();
    ControladoraLogicaCiudadano controlCiudadano = new ControladoraLogicaCiudadano();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = Optional.ofNullable(request.getParameter("accion")).orElse("listarCita");
        switch (accion) {
            case "listarCita":
                this.listar(request, response);
                break;
            case "editarCita":
                this.editar(request, response);
                break;
            case "eliminarCita":
                this.eliminar(request, response);
                break;
            case "atendidos":
                this.filtrarAtendidos(request, response);
                break;
            case "enespera":
                this.filtrarEnEspera(request, response);
                break;
            case "filtrarFecha":
                this.filtrarPorFecha(request, response);
                break;
            default:
                 listar(request, response);
               
        }
       
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = Optional.ofNullable(request.getParameter("accion")).orElse("listarCita");
        switch (accion) {
            case "insertarCita":
                this.insertar(request, response);
                break;
            case "modificarCita":
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

    private void listar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        List<Cita> listaCita = controlCita.listar();
        List<Tramite> listaTramite = controlTramite.listar();
        List<Ciudadano> listaCiudadano = controlCiudadano.listar();
        List<Cita> listaSinFechaDuplicada = controlCita.listarFechasDeTurnos();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("citasS", listaCita);
        sesion.setAttribute("citasSFechasSinDuplicar", listaSinFechaDuplicada);
        sesion.setAttribute("tramitesC", listaTramite);
        sesion.setAttribute("ciudadanosC", listaCiudadano);
        request.getRequestDispatcher("cita.jsp").forward(request, response);
    }

    private void editar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Long idCita = Long.parseLong(request.getParameter("idCita"));
        Cita cita = controlCita.buscar(idCita);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("citaS", cita);        
        request.getRequestDispatcher("editarCita.jsp").forward(request, response);
        
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Long idCita = Long.parseLong(request.getParameter("idCita"));
        controlCita.eliminar(idCita);
        this.listar(request, response);        
    }

    private void insertar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        LocalDate fechaCita = getLocalDate(request.getParameter("fechaCita"));
        LocalTime horaCita = getLocalTime(request.getParameter("horaCita"));
        Long idTramite = Long.parseLong(request.getParameter("tramiteId"));
        Long idCiudadano = Long.parseLong(request.getParameter("ciudadanoId"));
        List<Tramite> listTramites = (List<Tramite>) request.getSession().getAttribute("tramitesC");
        List<Ciudadano> listCiudadano = (List<Ciudadano>) request.getSession().getAttribute("ciudadanosC");
        Tramite tramite = (Tramite) listTramites.stream().filter(t->t.getId().equals(idTramite))
                .findAny()
                .orElseThrow(() -> new IllegalArgumentException());
        Ciudadano ciudadano = (Ciudadano) listCiudadano.stream().filter(c->c.getId().equals(idCiudadano))
                .findAny()
                .orElseThrow(() -> new IllegalArgumentException());
        Usuario usuario = (Usuario)request.getSession().getAttribute("usuarioLogin");
        controlCita.crear(fechaCita, horaCita, tramite, ciudadano, usuario, 0);
        listar(request, response);   
        
    }

    private void modificar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Cita cita = (Cita)request.getSession().getAttribute("citaS");
        LocalDate fechaCita = getLocalDate(request.getParameter("fechaCita"));
        LocalTime horaCita = getLocalTime(request.getParameter("horaCita"));
        Long idTramite = Long.parseLong(request.getParameter("tramiteId"));
        List<Tramite> listTramites = (List<Tramite>) request.getSession().getAttribute("tramitesC");
        List<Ciudadano> listCiudadano = (List<Ciudadano>) request.getSession().getAttribute("ciudadanosC");
        Tramite tramite = (Tramite) listTramites.stream().filter(t->t.getId().equals(idTramite))
                .findAny()
                .orElseThrow(() -> new IllegalArgumentException());        
        Integer estado = Integer.parseInt(request.getParameter("estado"));
        Usuario usuario = (Usuario)request.getSession().getAttribute("usuarioLogin");
        cita.setFechaCita(fechaCita);
        cita.setHoraCita(horaCita);
        cita.setTramite(tramite);        
        cita.setUsuario(usuario);
        cita.setEstado(estado);
        
        controlCita.editar(cita);
        listar(request, response);
        
    }
    
    private LocalDate getLocalDate(String fechaCita){
        String[] fecha = fechaCita.split("-");
        int anio = Integer.parseInt(fecha[0]);
        int mes = Integer.parseInt(fecha[1]);
        int dia = Integer.parseInt(fecha[2]);        
        return LocalDate.of(anio, mes, dia);
    }
    
    private LocalTime getLocalTime(String horaCita){
        String[] fecha = horaCita.split(":");
        int hora = Integer.parseInt(fecha[0]);
        int minutos = Integer.parseInt(fecha[1]);
               
        return LocalTime.of(hora,minutos);
    }

    private void filtrarAtendidos(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
        List<Cita> listaCita = controlCita.listaTurnosAtendidos();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("citasS", listaCita);
        request.getRequestDispatcher("cita.jsp").forward(request, response);
    }

    private void filtrarEnEspera(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
         List<Cita> listaCita = controlCita.listaTurnosEspera();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("citasS", listaCita);
        request.getRequestDispatcher("cita.jsp").forward(request, response);
    }
    
    private void filtrarPorFecha(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String[] fecha = request.getParameter("filtroFecha").split("-");
        List<Cita> listaCita = controlCita.listaTurnosPorFecha( Integer.parseInt(fecha[2]),  Integer.parseInt(fecha[1]), Integer.parseInt(fecha[0]));
        HttpSession sesion = request.getSession();
        sesion.setAttribute("citasS", listaCita);
        request.getRequestDispatcher("cita.jsp").forward(request, response);
    }
    
    
    
        

}
