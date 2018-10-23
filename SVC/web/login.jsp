<%-- 
    Document   : login
    Created on : 22/11/2017, 22:23:40
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
        <form action="./LoginController" method="POST">
            Usuario:<input name="login"/>
            Senha:<input name="senha" type="text"/>
            <input type="submit" value="Entrar no sistema"/>
        </form>
    </body>
</html>
