<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>AleashPeru</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">  

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    </head>
    <body>
    <nav data-bs-theme="dark" class="navbar bg-dark navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <div>
                    <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="Bootstrap" width="40" height="40">
                    <a class="navbar-brand text-white" href="#">AleashPeru</a>
                </div>
            </a>
            <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0" id="listanav">
                    <li class="nav-item">
                        <a class="nav-link active me-4" aria-current="page" href="${pageContext.request.contextPath}/home">Tienda</a>
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
                <ul class="nav justify-content-end">
                    <li class="nav-item">
                        <a id="login" class="nav-link active btn btn-outline-success" aria-current="page" href="${pageContext.request.contextPath}/login">Login</a>
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
                <p class="lead fw-normal text-white-50 mb-0">Tu sitio de compras online favorita</p>
            </div>
        </div>
    </header>
    <!-- Section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <c:forEach var="producto" items="${productosHome}">
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

                                    <a href="${pageContext.request.contextPath}/login"  class="btn btn-outline-dark mt-auto">Agregar al Carro</button>

                                        <a  href="${pageContext.request.contextPath}/login"  class="btn btn-outline-warning mt-auto"><i class="bi bi-star"></i> Favoritos</a>

                                        <a class="btn btn-outline-secondary mt-auto" href="${pageContext.request.contextPath}/login">Detalles</a>
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
    <!-- Bootstrap core JS-->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>

</body>
</html>
