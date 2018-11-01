<%-- 
    Document   : index
    Created on : 11/10/2017, 14:37:43
    Author     : LAB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="./index.jsp">Home</a>
        <br>
        <form action="veiculo" method="POST">
            Placa: <input name="placa">
            <br>
            Descrição: <input name="descricao">
            <br>
            <input type="submit" value="Enviar">
            
        </form>
    </body>
</html>
