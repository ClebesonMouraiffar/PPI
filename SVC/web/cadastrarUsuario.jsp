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
        <form action="UsuarioController" method="POST">
            Nome: <input name="nome">
            <br>
            Senha: <input name="senha">
            <br>
            Data de Nascimento: <input  name="data_nascimento">
            <br>
            <input type="submit" value="Enviar">
            
        </form>
    </body>
</html>
