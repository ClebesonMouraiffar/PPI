<%-- 
    Document   : login
    Created on : 22/11/2017, 22:23:40
    Author     : LAB
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="svc.model.VeiculoModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ArrayList<VeiculoModel> lista
                    = (ArrayList<VeiculoModel>) request.getAttribute("lista");

        %>
        <form action="./registro" method="POST">
            Usuario:<input name="login"/>
            <br>
            Senha:<input name="senha" type="text"/>
            <br>
            Veiculo:
            <select name="veiculo">
                <%for (VeiculoModel u : lista) {
                %>
                <option value="<%=u.getId()%>"><%=u.getPlaca()%></option> 
                <%
                    }
                %>   
            </select>
            <br>
            <input type="submit" value="Registrar"/>
        </form>
    </body>
</html>
<!DOCTYPE html>


