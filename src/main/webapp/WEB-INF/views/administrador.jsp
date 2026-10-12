<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("name") == null) {
        response.sendRedirect("login");
    }

    if ("cliente".equals(session.getAttribute("rol"))) {
        response.sendRedirect("tienda");
    }
%>
<!DOCTYPE html>
<html>
     
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>AleashPeru</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- Barra de navegación -->
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#">AleashPeru</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/logout">Cerrar Sesión</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <!-- Sidebar -->
                <nav class="col-md-2 d-md-block bg-dark sidebar">
                    <div class="position-sticky">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Ventas</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Productos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Ofertas</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Clientes</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Reportes</a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <!-- Main Content -->
                <main class="col-md-10 ms-sm-auto col-lg-10 px-md-4">
                    <h1>Bienvenido a AleashPeru <%= session.getAttribute("name")%></h1>

                    <!-- Contenido principal -->
                    <div class="info-container">
                        <div class="info-box">
                            <h3>PRODUCTOS VENDIDOS</h3>
                            <p>Cantidad: 500+</p>
                        </div>
                        <div class="info-box">
                            <h3>CLIENTES SATISFECHOS</h3>
                            <p>Cantidad: 100+</p>
                        </div>
                        <div class="info-box">
                            <h3>GANANCIAS TOTALES</h3>
                            <p>Cantidad: $10 000</p>
                        </div>
                    </div>
                </main>
            </div>

            <!-- Gráficos -->
            <div class="row">
                <div class="col-md-3 offset-md-3">
                    <canvas id="ventas-chart" width="150" height="100"></canvas>
                </div>
                <div class="col-md-4">
                    <canvas id="productos-chart" width="200" height="150"></canvas>
                </div>
            </div>
            <!-- Scripts y estilos -->
            <script>
                // Datos para los gráficos
                var datosVentas = {
                    labels: ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes"],
                    datasets: [{
                            label: 'Ventas de la ultima semana',
                            data: [12, 19, 3, 5, 2],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 205, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 205, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)'
                            ],
                            borderWidth: 1
                        }]
                };

                var datosProductos = {
                    labels: ["Smartphone", "Teclado", "Tablet", "Impresora", "Auriculares"],
                    datasets: [{
                            label: 'Productos más vendidos',
                            data: [30, 50, 10, 25, 45],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 205, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 205, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)'
                            ],
                            borderWidth: 1
                        }]
                };

// Configuración del gráfico de ventas (circular)
                var configVentas = {
                    type: 'pie',
                    data: datosVentas,
                    options: {}
                };

// Configuración del gráfico de productos (barras)
                var configProductos = {
                    type: 'bar',
                    data: datosProductos,
                    options: {}
                };

// Inicializar los gráficos
                var ventasChart = new Chart(document.getElementById('ventas-chart'), configVentas);
                var productosChart = new Chart(document.getElementById('productos-chart'), configProductos);

            </script>


            <!-- Bootstrap JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-lqVuU4ZZ2fjE3JyY3Fp8CGsVgvpOTUp+CWYYOO9r7GC1xl9R6K5F0JwNY5vLE5n6" crossorigin="anonymous"></script>

          
    </body>
</html>
