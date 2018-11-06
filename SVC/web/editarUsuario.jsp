<%-- 
    Document   : editarUsuario
    Created on : 26/10/2017, 06:08:42
    Author     : LAB
--%>

<%@page import="java.text.SimpleDateFormat"%>
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
            UsuarioModel usuarioM = (UsuarioModel) request.getAttribute("usuario");
        %>
        <a href="./index.jsp">Home</a>
        <br>
        <form action="usuario?id=<%=usuarioM.getId()%>" method="POST" accept-charset="UTF-8">
            ID: <input name="id" value="<%=usuarioM.getId()%>" readonly=""/>
            <br>
            Nome: <input name="nome" value="<%=usuarioM.getNome()%>">
            <br>
            Login: <input name="login" value="<%=usuarioM.getLogin()%>">
            <br>
            Senha: <input name="senha" value="<%=usuarioM.getSenha()%>">
            <br>
            <input type="submit" value="Salvar">
        </form>
    </body>
</html>
