<%@page import="com.hackaboss.logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <style>
            a {
                text-decoration: none;
            }
        </style>
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
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#"> Usuario: <%=request.getSession().getAttribute("nombre")%></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Elemento de separación -->
        <div class="mt-5"></div>

        <section class="container p-4">

            <h1 class="text-primary">Panel Principal</h1>
            <div class="row">
                <div class="col-md-3">
                    <a href="<%=request.getContextPath()%>/Cita">
                        <div class="card text-center bg-primary text-white">
                            <div class="card-body">
                                <h3 class="display-6">Cita <i class="bi bi-calendar4-event"></i></h3>
                            </div>
                        </div>
                    </a>

                </div>
                <div class="col-md-3">
                    <a href="<%=request.getContextPath()%>/Tramite">
                        <div class="card text-center bg-primary text-white">
                            <div class="card-body">
                                <h3 class="display-6">Tramite <i class="bi bi-files"></i></h3>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-3">
                    <a href="<%=request.getContextPath()%>/Ciudadano">
                        <div class="card text-center bg-primary text-white">
                            <div class="card-body">
                                <h3 class="display-6">Ciudadano <i class="bi bi-person"></i></h3>

                            </div>
                        </div>
                    </a>
                </div>

            </div>
        </section>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    </body>

</html>