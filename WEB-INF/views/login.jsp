<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if ("cliente".equals(session.getAttribute("rol"))) {
        response.sendRedirect("tienda");
    }else if ("administrador".equals(session.getAttribute("rol"))) {
        response.sendRedirect("administrador") ; 
    }
%>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loginstyle.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <title>Login</title>
    </head>
    <body>
        <!-- Alerta al loguearse -->
        <input type="hidden" id="statusl" value="<%=request.getAttribute("error")%>">
        <!-- Alerta al registrar -->
        <input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
        <nav data-bs-theme="dark" class="navbar w-100 bg-dark navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href='${pageContext.request.contextPath}/home'>
                    <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="Bootstrap" width="40" height="40">
                    <span class="navbar-brand text-white">TecnoTienda</span>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav ms-auto mb-lg-0" id="listanav">
                        <li class="nav-item">
                            <a class="nav-link active me-4" aria-current="page" href="#">Tienda</a>
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
                </div>
            </div>
        </nav>
        <!-- circulo azul -->
        <div class="d-none d-md-block ball login bg-primary bg-gradient position-absolute rounded-circle"></div>
        <!-- Login-->
        <div class="container login__form active">
            <div class="row vh-100 w-100 align-self-center">
                <div class="col-12 col-lg-6 col-xl-6 px-5">
                    <div class="row vh-100">
                        <div class="col align-self-center p-5 w-100">
                            <h3 class="fw-bolder">BIENVENIDO DE NUEVO !</h3>
                            <p class="fw-lighter fs-6">¿No tienes una cuenta?, <span id="signUp" role="button" class="text-primary">Registrate</span></p>
                            <!-- form login -->
                            <form id="loginForm" action="${pageContext.request.contextPath}/LoginC" method="post" class="mt-5">
                                <div class="mb-3">
                                    <label for="username" class="form-label">Email</label>
                                    <input type="email" name="email" class="form-control text-indent shadow-sm bg-grey-light border-0 rounded-pill fw-lighter fs-7 p-3" placeholder="name@example.com">
                                </div>
                                <div class="mb-3">
                                    <label for="username" class="form-label">Contraseña</label>
                                    <div class="d-flex position-relative">
                                        <input type="password" name="password" class="form-control text-indent auth__password shadow-sm bg-grey-light border-0 rounded-pill fw-lighter fs-7 p-3">
                                        <span class="password__icon text-primary fs-4 fw-bold bi bi-eye-slash"></span>
                                    </div>
                                </div>
                                <div class="col text-center">
                                    <button type="submit" class="btn btn-outline-dark btn-lg rounded-pill mt-4 w-100">Ingresar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="d-none d-lg-block col-lg-6 col-xl-6 p-5">
                    <div class="row vh-100 p-5">
                        <div class="col align-self-center p-5 text-center">
                            <img src="${pageContext.request.contextPath}/resources/img/login.png" class="img-fluid bounce" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Registrar -->
        <div class="container register__form">
            <div class="row vh-100 w-100 align-self-center">
                <div class="d-none d-lg-block col-lg-6 col-xl-6 p-5">
                    <div class="row vh-100 p-5">
                        <div class="col align-self-center p-3 text-center">
                            <img src="${pageContext.request.contextPath}/resources/img/register.png" class="img-fluid bounce" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-6 col-xl-6 px-5">
                    <div class="row vh-100">
                        <div class="col align-self-center p-5 w-100">
                            <h3 class="fw-bolder">REGISTRATE AQUÍ !</h3>
                            <p class="fw-lighter fs-6">Ya tengo una cuenta, <span id="signIn" role="button" class="text-primary">Ingresar</span></p>
                            <!-- form register -->
                            <form action="${pageContext.request.contextPath}/register" method="post" class="mt-5" id="registerForm">
                                <div class="mb-1">
                                    <label for="username" class="form-label">Usuario</label>
                                    <input type="text" name="name" class="form-control text-indent shadow-sm bg-grey-light border-0 rounded-pill fw-lighter fs-7 p-3" placeholder="Coloca un nombre">
                                </div>
                                <div class="mb-1">
                                    <label for="username" class="form-label">Email</label>
                                    <input type="email" name="email" class="form-control text-indent shadow-sm bg-grey-light border-0 rounded-pill fw-lighter fs-7 p-3" placeholder="name@example.com">
                                </div>
                                <div class="mb-2">
                                    <label for="username" class="form-label">Contraseña</label>
                                    <div class="d-flex position-relative">
                                        <input type="password" name="pass" class="form-control text-indent auth__password shadow-sm bg-grey-light border-0 rounded-pill fw-lighter fs-7 p-3">
                                        <span class="password__icon text-primary fs-4 fw-bold bi bi-eye-slash"></span>
                                    </div>
                                </div>
                                <div class="col text-center">
                                    <button type="submit" class="btn btn-outline-dark btn-lg rounded-pill mt-4 w-100">Registrarse</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/js/loginScript.js"></script>

        <!-- Alerta para error de inicio de sesión -->
        <% if (session.getAttribute("error") != null) {%>
        <script type = "text/javascript" >
            Swal.fire("Error al ingresar", "<%= session.getAttribute("error")%>", "error");
        </script>
        <% }%>
        <!-- Alerta para login y registrar -->
        <script type="text/javascript">
            /*  
             var status = document.getElementById("status").value;
             if (status == "success") {
             Swal.fire("Felicidades", "Cuenta creada correctamente", "success");
             }
             */

        </script>

        <script>
            document.getElementById("registerForm").addEventListener("submit", function (event) {
                event.preventDefault();
                const form = event.target;

                fetch(form.action, {
                    method: 'POST',
                    body: new URLSearchParams(new FormData(form))
                })
                        .then(response => response.text())
                        .then(status => {
                            if (status === "success") {
                                Swal.fire("Felicidades", "Cuenta creada correctamente", "success").then(() => {
                                    window.location.href = '${pageContext.request.contextPath}/login';
                                });
                            } else {
                                Swal.fire("Error", "Hubo un problema al crear la cuenta", "error");
                            }
                        });
            });
        </script>

    </body>
</html>
