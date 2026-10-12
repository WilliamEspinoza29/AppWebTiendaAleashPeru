<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    if (session.getAttribute("name") == null) {
        response.sendRedirect("login");
        return;
    }

%>

<!DOCTYPE html>
<html>
    <head>
        
        <title>Favoritos</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/favoritostyle.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">  

    </head>
    <body>
        <!-- Naaaav -->
        <nav data-bs-theme="dark" class="navbar w-100 bg-dark navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/tienda">
                    <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="Bootstrap" width="40" height="40">
                    <span class="navbar-brand text-white">AleashPeru</span>
                </a>
                <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav ms-auto  mb-lg-0" id="listanav">
                        <li class="nav-item">
                            <a class="nav-link active me-4" aria-current="page" href="${pageContext.request.contextPath}/tienda">Tienda</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link me-4" href="#">Favoritos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link me-4" href="#">Carrito</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link me-4" href="#">Conócenos</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle me-4" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-person-fill text-primary fs-3 me-2"></i>
                                <%= session.getAttribute("name")%>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Historial Compras</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Cerrar Sesión</a></li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>

        <div class="favoritos-container">
            <h1 class="text-center">Favoritos</h1>
            <div class="table-responsive table-container">
                <table class="table table-striped table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Imagen</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Detalles</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="producto" items="${productosFavoritos}">
                            <tr>
                                <td><img src="${producto.imagen}" alt="${producto.nombre}" width="100" height="100"></td>
                                <td>${producto.nombre}</td>
                                <td>${producto.descripcion}</td>
                                <td>S/${producto.precio}</td>
                                <td>
                                    <button class="eliminar-favorito-btn  btn btn-danger btn-sm" data-producto-id="${producto.idProducto}">Eliminar de favoritos</button>
                                    <form action="${pageContext.request.contextPath}/addToCart" method="post" style="display:inline;">
                                        <input type="hidden" name="productoId" value="${producto.idProducto}">
                                        <button class="btn btn-primary btn-sm" type="submit">Añadir al carrito</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; AleashPeru 2024</p></div>
        </footer>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            $(document).ready(function () {
                $(".eliminar-favorito-btn").click(function () {
                    var button = $(this);
                    var productoId = button.data("producto-id");

                    $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/eliminarFavorito",
                        data: {productoId: productoId},
                        success: function (response) {
                            button.closest("tr").remove();
                            mostrarNotificacion(response);
                        }
                    });
                });

                function mostrarNotificacion(mensaje) {
                    var notificacion = $("<div>").addClass("alert alert-info notificacion").text(mensaje);
                    $("body").append(notificacion);
                    setTimeout(function () {
                        notificacion.fadeOut(function () {
                            $(this).remove();
                        });
                    }, 2000);
                }
            });
        </script>
    </body>
</html>





