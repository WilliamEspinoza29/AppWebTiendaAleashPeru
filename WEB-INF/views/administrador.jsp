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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
    </head>
    <body>
        <h1>Hola <%= session.getAttribute("name")%></h1>
    </body>
</html>
