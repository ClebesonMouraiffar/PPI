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
            UsuarioModel modelo = (UsuarioModel) request.getAttribute("usuario");
        %>
        <a href="./index.jsp">Home</a>
        <br>
        <form action="usuario?id=<%=modelo.getId()%>" method="POST" accept-charset="UTF-8">
            ID: <input name="id" value="<%=modelo.getId()%>" readonly=""/>
            <br>
            Nome: <input name="nome" value="<%=modelo.getNome()%>">
            <br>
            Senha: <input name="senha" value="<%=modelo.getSenha()%>">
            <br>
            Data de Nascimento: <input pattern="(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d"
                                       placeholder="dd/mm/aaaa" name="data_nascimento" 
                                       value="<%=new SimpleDateFormat("dd/MM/yyyy")
                         .format(modelo.getDataNascimento())%>">
            <br>
            <input type="submit" value="Cadastrar">
        </form>
    </body>
</html>
