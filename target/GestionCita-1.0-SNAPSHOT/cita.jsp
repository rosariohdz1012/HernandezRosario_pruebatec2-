
<%@page import="com.hackaboss.logica.Usuario"%>
<%@page import="com.hackaboss.logica.Cita"%>
<%@page import="com.hackaboss.logica.Ciudadano"%>
<%@page import="com.hackaboss.logica.Tramite"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset=UTF-8">
        <title>Reserva Cita</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    </head>

    <body>
        <%
            Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogin");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <!-- Barra de Navegación Fija -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Sistema de Turno de Citas</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/panel.jsp">Panel</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/Cita">Cita</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/Tramite">Trámite</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/Ciudadano">Ciudadano</a>
                        </li>
                    </ul>
                    <span class="navbar-text">
                        Usuario: <%=request.getSession().getAttribute("nombre")%>
                    </span>
                </div>
            </div>
        </nav>
        <div class="container mt-5 p-4">
            <div class="row">
                <!-- Columna del Formulario -->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            Asignar Cita
                        </div>
                        <div class="card-body">
                            <form action="<%=request.getContextPath()%>/Cita?accion=insertarCita" method="post">
                                <div class="mb-3">
                                    <label for="fechaCita" class="form-label">Fecha de la Cita</label>
                                    <input type="date" class="form-control" id="fechaCita" name="fechaCita" required>
                                </div>
                                <div class="mb-3">
                                    <label for="horaCita" class="form-label">Hora de la Cita</label>
                                    <input type="time" class="form-control" id="horaCita" name="horaCita" required>
                                </div>
                                <div class="mb-3">
                                    <label for="tramiteId" class="form-label">Trámite</label>
                                    <select class="form-control" id="tramiteId" name="tramiteId" required>
                                        <option value="">Seleccione un trámite</option>
                                        <%
                                            List<Tramite> listaT = (List<Tramite>) request.getSession().getAttribute("tramitesC");
                                            for (Tramite t : listaT) {
                                        %>
                                        <option value="<%=t.getId()%>"><%=t.getNombre()%></option>
                                        <%}%>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="ciudadanoId" class="form-label">Ciudadano</label>
                                    <select class="form-control" id="ciudadanoId" name="ciudadanoId" required>
                                        <!-- Opciones de ejemplo -->
                                        <option value="">Seleccione un ciudadano</option>
                                        <%
                                            List<Ciudadano> listaC = (List<Ciudadano>) request.getSession().getAttribute("ciudadanosC");
                                            for (Ciudadano c : listaC) {
                                        %>
                                        <option value="<%=c.getId()%>"><%=c.getNombre() + " " + c.getApellidoPat() + " " + c.getApellidoMat()%></option>
                                        <%}%>
                                    </select>
                                </div>

                                <button type="submit" class="btn btn-primary">Insertar</button>
                                <a href="<%=request.getContextPath()%>/panel.jsp" class="btn btn-secondary">Cancelar</a>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Columna de la Tabla -->
                <div class="col-md-9">
                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            Citas
                        </div>
                        <div class="card-body">
                            <div class="card-body">
                                <a class="btn btn-info btn-sm" href="<%=request.getContextPath()%>/Cita?accion=atendidos">Filtro Atendidos</a>
                                <a class="btn btn-success btn-sm" href="<%=request.getContextPath()%>/Cita?accion=enespera">Filtro en Espera</a>
                                <form action="<%=request.getContextPath()%>/Cita?accion=filtrarFecha" method="get">
                                <select class="form-control" id="filtroFecha" name="filtroFecha" required>
                                    <!-- Opciones de ejemplo -->
                                    <option value="">Seleccionar fecha</option>
                                    <%
                                        List<Cita> listaCitaS = (List<Cita>) request.getSession().getAttribute("citasSFechasSinDuplicar");
                                        for (Cita c : listaCitaS) {
                                    %>
                                    <option value="<%=c.getFechaCita()%>"><%=c.getFechaCita()%></option>
                                    <%}%>
                                </select>
                                <button type="submit" class="btn btn-success btn-sm" >Filtrar por fecha</button>
                                </form>
                                <div class="table-responsive mt-2" style="max-height: 400px;">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Fecha</th>
                                                <th>Hora</th>
                                                <th>Trámite</th>
                                                <th>Ciudadano</th>
                                                <th>Estado</th>
                                                <th>Usuario</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                List<Cita> listaCita = (List<Cita>) request.getSession().getAttribute("citasS");
                                                for (Cita c : listaCita) {
                                            %>
                                            <tr>
                                                <td><%=c.getId()%></td>
                                                <td><%=c.getFechaCita()%></td>
                                                <td><%=c.getHoraCita()%></td>
                                                <td><%=c.getTramite().getNombre()%></td>
                                                <td><%=c.getCiudadano().getNombre() + " " + c.getCiudadano().getApellidoPat() + " " + c.getCiudadano().getApellidoMat()%></td>
                                                <%if (c.getEstado() == 0) {%>
                                                <td><span class="badge bg-success text-dark">Espera</span></td>
                                                <%} else {%>
                                                <td><span class="badge bg-info text-dark">Atendido</span></td>
                                                <%
                                                    }
                                                %>
                                                <td><%=c.getUsuario().getNombre()%></td>
                                                <td>
                                                    <a class="btn btn-warning btn-sm" href="<%=request.getContextPath()%>/Cita?accion=editarCita&idCita=<%=c.getId()%>">Editar</a>
                                                    <a class="btn btn-danger btn-sm" href="<%=request.getContextPath()%>/Cita?accion=eliminarCita&idCita=<%=c.getId()%>">Eliminar</a>
                                                </td>
                                            </tr>
                                            <%}%>
                                            <!-- Más filas de ejemplo aquí -->
                                        </tbody>
                                    </table>                                    
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    </body>

</html>