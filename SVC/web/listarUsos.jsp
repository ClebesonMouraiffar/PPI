<%-- 
    Document   : index
    Created on : 11/10/2017, 14:37:43
    Author     : LAB
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="svc.model.UsoModel"%>
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
            ArrayList<UsoModel> lista = 
                    (ArrayList<UsoModel>)request.getAttribute("lista");            
            
        %>
        <a href="./index.jsp">Home</a>
        <br>
        <table>
            <tr>
                <td>Código</td>
                <td>Saida</td>
                <td>Retorno</td>
                <td>Usuario</td>
                <td>Veiculo</td>
            </tr>
            <%
                for(UsoModel u : lista){
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
             %>
             <tr>
                 <td><%=u.getId()%></td>
                 <td><%if(u.getSaida()!= null){
                    out.print(u.getSaida().format(formatter));
                 }%></td>
                 <td><%if(u.getRetorno()!= null){
                      out.print(u.getRetorno().format(formatter));
                 } else{
                     out.print("Em Uso");
                 }%></td>
                 <td><%=u.getNomeUsuario()%></td>
                 <td><%=u.getPlacaVeiculo()%></td>
             </tr>
              <% 
                }
            %>
        </table>
        
    </body>
</html>
