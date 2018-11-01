<%-- 
    Document   : editarUsuario
    Created on : 26/10/2017, 06:08:42
    Author     : LAB
--%>

<%@page import="svc.model.VeiculoModel"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            VeiculoModel modelo = (VeiculoModel) request.getAttribute("veiculo");
        %>
        <a href="./index.jsp">Home</a>
        <br>
        <form action="veiculo?id=<%=modelo.getId()%>" method="POST" accept-charset="UTF-8">
            ID: <input name="id" value="<%=modelo.getId()%>" readonly=""/>
            <br>
            Placa: <input name="placa" value="<%=modelo.getPlaca()%>">
            <br>
            Descrição: <input name="descricao" value="<%=modelo.getDescricao()%>">
            <br>
            <input type="submit" value="Cadastrar">
        </form>
    </body>
</html>
