<%-- 
    Document   : editarUsuario
    Created on : 26/10/2017, 06:08:42
    Author     : LAB
--%>

<%@page import="model.UsuarioModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            UsuarioModel modelo = (UsuarioModel) request.getAttribute("usuario");
        %>
        <form action="UsuarioController?id=<%=modelo.getId()%>" method="POST">
            ID: <input name="id" value="<%=modelo.getId()%>" readonly=""/>
            
            Nome: <input name="nome" value="<%=modelo.getNome()%>">
            <br>
            Data de Nascimento: <input pattern="(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d"
                                       placeholder="dd/mm/aaaa" name="data_nascimento">
            <br>
            <input type="submit" value="Cadastrar">
        </form>
    </body>
</html>
