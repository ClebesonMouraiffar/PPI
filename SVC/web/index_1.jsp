<%-- 
    Document   : index
    Created on : 11/10/2017, 14:37:43
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
            UsuarioModel modelo = (UsuarioModel) request.getSession().getAttribute("logado");
            out.println("Bem Vindo");
        %>
        <a href="./cadastrarUsuario.jsp">Cadastrar Usuário</a>
        <a href="./UsuarioController">Listar Usuários</a>
    </body>
</html>
