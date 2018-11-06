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
        <form action="usuario" method="POST">
            Nome: <input name="nome">
            <br>
            Login: <input name="login">
            <br>
            Senha: <input name="senha">
            <br>
            <input type="submit" value="Cadastrar">            
        </form>
    </body>
</html>
