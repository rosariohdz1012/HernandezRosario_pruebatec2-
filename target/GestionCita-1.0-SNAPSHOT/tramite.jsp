
<%@page import="com.hackaboss.logica.Usuario"%>
<%@page import="com.hackaboss.logica.Tramite"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset=UTF-8">
        <title>Registrar Tramite</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    </head>

    <body>
        <%
         Usuario usuario = (Usuario)request.getSession().getAttribute("usuarioLogin");
         if(usuario==null){
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
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            Registrar tramite
                        </div>
                        <div class="card-body">
                            <form action="<%=request.getContextPath()%>/Tramite?accion=insertarT" method="post">
                                <div class="mb-3">
                                    <label for="nombre" class="form-label">Nombre</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre" required>
                                </div>
                                <div class="mb-3">
                                    <label for="descripcion" class="form-label">Descripción</label>
                                    <input type="text" class="form-control" id="descripcion" name="descripcion" required>
                                </div>
                                <button type="submit" class="btn btn-primary">Guardar</button>
                                <a href="<%=request.getContextPath()%>/panel.jsp" class="btn btn-secondary">Cancelar</a>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Columna de la Tabla -->
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            Tramites
                        </div>
                        <div class="card-body">
                            <div class="table-responsive" style="max-height: 400px;">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre</th>
                                        <th>Descripción</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        List<Tramite> listaT = (List<Tramite>)request.getSession().getAttribute("tramites");
                                        for (Tramite t : listaT) {                                             
                                    %>                                      
                                    <tr>
                                        <td><%=t.getId()%></td>
                                        <td><%=t.getNombre()%></td>
                                        <td><%=t.getDescripcionTra()%></td>
                                        <td>
                                            <a class="btn btn-warning btn-sm" href="<%=request.getContextPath()%>/Tramite?accion=editarT&idTramite=<%=t.getId()%>">Editar</a>
                                            <a class="btn btn-danger btn-sm" href="<%=request.getContextPath()%>/Tramite?accion=eliminarT&idTramite=<%=t.getId()%>">Eliminar</a>
                                            
                                        </td>
                                    </tr>
                                    <% }%>
                                    <!-- Más filas de ejemplo aquí -->
                                </tbody>
                            </table>
                                </div>
                        </div>
                    </div>


                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                    crossorigin="anonymous"></script>
                    </body>

                    </html>