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
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tiendastyle.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">  

        <title>Tienda</title>
    </head>
    <body>
        <nav data-bs-theme="dark" class="navbar w-100 bg-dark navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
                    <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="Bootstrap" width="40" height="40">
                    <span class="navbar-brand text-white">AleashPeru</span>
                </a>
                <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav ms-auto  mb-lg-0" id="listanav">
                        <li class="nav-item">
                            <a class="nav-link active me-4" aria-current="page" href="#">Tienda</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link me-4" href="${pageContext.request.contextPath}/favoritos">Favoritos</a>
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

        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">AleashPeru</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Bienvenido a AleashPeru <%= session.getAttribute("name")%>!</p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <div id="notificaciones"></div>
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach var="producto" items="${productos}">
                        <div class="col mb-5">
                            <div class="card h-100">
                                <img class="card-img-top" src="${producto.imagen}" alt="${producto.nombre}" />
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <h5 class="fw-bolder">${producto.nombre}</h5>
                                        <p>${producto.descripcion}</p>
                                        <p>S/${producto.precio}</p>
                                    </div>
                                </div>
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center">
                                        <form action="${pageContext.request.contextPath}/addToCart" method="post" style="display:inline;">
                                            <input type="hidden" name="productId" value="${producto.idProducto}">
                                            <button type="submit" class="btn btn-outline-dark mt-auto">Agregar al Carro</button>
                                        </form>
                                        <form action="" method="post" style="display:inline;">
                                            <input type="hidden" name="productId" value="${producto.idProducto}">
                                            <button type="button" class="btn btn-outline-warning mt-auto  favorito-btn  <c:if test='${favoritosIds.contains(producto.idProducto)}'>active</c:if>" data-producto-id="${producto.idProducto}">
                                                <c:if test="${favoritosIds.contains(producto.idProducto)}">
                                                    <i class="bi bi-star"></i>Quitar fav
                                                </c:if>
                                                <c:if test="${!favoritosIds.contains(producto.idProducto)}">
                                                    <i class="bi bi-star"></i>Favoritos
                                                </c:if>
                                            </button>
                                        </form>
                                        <a class="btn btn-outline-secondary mt-auto" href="${pageContext.request.contextPath}/tienda/detalleProducto/${producto.idProducto}">Detalles</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; AleashPeru 2024</p></div>
        </footer>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

        <script>

            $(document).ready(function () {
                $(".favorito-btn").click(function () {
                    var button = $(this);
                    var productoId = button.data("producto-id");
                    var usuarioId = "${sessionScope.idUsuario}";

                    if (button.hasClass("active")) {
                        $.post("${pageContext.request.contextPath}/eliminarFavorito", {productoId: productoId}, function (response) {
                            button.removeClass("active").html('<i class="bi bi-star"></i>Favoritos');
                            mostrarNotificacion(response);
                        });
                    } else {
                        $.post("${pageContext.request.contextPath}/agregarFavorito", {productoId: productoId}, function (response) {
                            button.addClass("active").html('<i class="bi bi-star"></i>Quitar fav');
                            mostrarNotificacion(response);
                        });
                    }
                });

                function mostrarNotificacion(mensaje) {
                    var notificacion = $("<div>").addClass("notificacion").text(mensaje);
                    $("body").append(notificacion);
                    setTimeout(function () {
                        notificacion.fadeOut(function () {
                            $(this).remove();
                        });
                    }, 2000);
                }
            });

        </script>



        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>




    </body>
</html>
