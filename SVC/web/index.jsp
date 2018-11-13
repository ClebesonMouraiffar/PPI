<%-- 
    Document   : index
    Created on : 11/10/2017, 14:37:43
    Author     : LAB
--%>


<%@page import="svc.model.UsuarioModel"%>
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
        <br>
        <a href="./registro">Registrar Uso</a>
        <br>
        <a href="./registro?acao=list">Listar Uso</a>
        <br>
        <a href="./cadastrarUsuario.jsp">Cadastrar Usu�rio</a>
        <br>
        <a href="./usuarios">Listar Usu�rios</a>
        <br>
        <a href="./cadastrarVeiculo.jsp">Cadastrar Veiculos</a>
        <br>
        <a href="./veiculos">Listar Veiculos</a>
        <br>
    </body>
</html>
