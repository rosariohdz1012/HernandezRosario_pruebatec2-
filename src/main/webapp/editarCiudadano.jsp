<%@page import="com.hackaboss.logica.Usuario"%>
<%@page import="com.hackaboss.logica.Ciudadano"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset=UTF-8">
        <title>Registro ciudadano</title>
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
                            Editar Ciudadano
                        </div>
                        <div class="card-body">
                            <%
                                Ciudadano ciudadano = (Ciudadano) request.getSession().getAttribute("ciudadanoS");
                            %>
                            <form action="<%=request.getContextPath()%>/Ciudadano?accion=modificarC" method="post">
                                <div class="mb-3">
                                    <label for="nombre" class="form-label">Nombre</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre" required value="<%=ciudadano.getNombre()%>">
                                </div>
                                <div class="mb-3">
                                    <label for="apellidoPat" class="form-label">Apellido Paterno</label>
                                    <input type="text" class="form-control" id="apellidoPat" name="apellidoPat" required value="<%=ciudadano.getApellidoPat()%>">
                                </div>
                                <div class="mb-3">
                                    <label for="apellidoMat" class="form-label">Apellido Materno</label>
                                    <input type="text" class="form-control" id="apellidoMat" name="apellidoMat" required value="<%=ciudadano.getApellidoMat()%>">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Género</label>
                                    <div>
                                        <div class="form-check form-check-inline">
                                            <%if(ciudadano.getGenero().equals("masculino")){%>
                                            <input class="form-check-input" type="radio" id="masculino" name="genero" value="masculino"
                                                   checked="checked" required>
                                            <%}else{%>
                                            <input class="form-check-input" type="radio" id="masculino" name="genero" value="masculino"
                                                 required>                                            
                                            <%}%>
                                            <label class="form-check-label" for="masculino">Masculino</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <%if(ciudadano.getGenero().equals("femenino")){%>
                                            <input class="form-check-input" type="radio" id="femenino" name="genero" value="femenino"
                                                 checked="checked" required>
                                            <%}else{%>
                                            <input class="form-check-input" type="radio" id="femenino" name="genero" value="femenino"
                                                 required>                                            
                                            <%}%>
                                            <label class="form-check-label" for="femenino">Femenino</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="telefono" class="form-label">Teléfono</label>
                                    <input type="text" class="form-control" id="telefono" name="telefono" pattern="\d+" required value="<%=ciudadano.getTelefono()%>">
                                </div>
                                <button type="submit" class="btn btn-primary">Guardar</button>
                                <a href="<%=request.getContextPath()%>/ciudadano.jsp" class="btn btn-secondary">Cancelar</a>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Columna de la Tabla -->
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            Ciudadanos
                        </div>
                        <div class="card-body">
                            <div class="table-responsive" style="max-height: 400px;">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Nombre</th>
                                            <th>Apellido Paterno</th>
                                            <th>Apellido Materno</th>
                                            <th>Género</th>
                                            <th>Teléfono</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            List<Ciudadano> listaC = (List<Ciudadano>) request.getSession().getAttribute("ciudadanos");
                                            for (Ciudadano c : listaC) {
                                        %> 
                                        <tr>
                                            <td><%=c.getId()%></td>
                                            <td><%=c.getNombre()%></td>
                                            <td><%=c.getApellidoPat()%></td>
                                            <td><%=c.getApellidoMat()%></td>
                                            <td><%=c.getGenero()%></td>
                                            <td><%=c.getTelefono()%></td>
                                            <td>
                                                <a class="btn btn-warning btn-sm" href="<%=request.getContextPath()%>/Ciudadano?accion=editarC&idCiudadano=<%=c.getId()%>">Editar</a>
                                                <a class="btn btn-danger btn-sm" href="<%=request.getContextPath()%>/Ciudadano?accion=eliminarC&idCiudadano=<%=c.getId()%>">Eliminar</a>
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