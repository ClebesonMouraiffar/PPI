<%-- 
    Document   : index
    Created on : 11/10/2017, 14:37:43
    Author     : LAB
--%>

<%@page import="svc.model.UsuarioModel"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%        
            ArrayList<UsuarioModel> lista = 
                    (ArrayList<UsuarioModel>)request.getAttribute("lista");            
            
        %>
        <a href="./index.jsp">Home</a>
        <br>
        <table>
            <tr>
                <td>Código</td>
                <td>Nome</td>
                <td>Login</td>
                <td>Ações</td>
            </tr>
            <%
                for(UsuarioModel u : lista){
             %>
             <tr>
                 <td><%=u.getId()%></td>
                 <td><%=u.getNome()%></td>
                 <td><%=u.getLogin()%></td>
                 <td><a href="./usuario?acao=del&id=<%=u.getId()%>">Apagar</a>
                     <a href="./usuario?acao=editar&id=<%=u.getId()%>">Editar</a>
                 </td>
             </tr>
              <% 
                }
            %>
        </table>
        
    </body>
</html>
