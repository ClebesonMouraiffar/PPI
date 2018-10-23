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
            Data de Nascimento: <input pattern="(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d"
                                       placeholder="dd/mm/aaaa" name="data_nascimento">
            <br>
            <input type="submit" value="Enviar">
            
        </form>
    </body>
</html>
