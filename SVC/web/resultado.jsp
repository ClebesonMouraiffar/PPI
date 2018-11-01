<%-- 
    Document   : resultado
    Created on : 11/10/2017, 15:14:22
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
        <%
            String mensagem = request.getAttribute("mensagem").toString();
            out.print(mensagem);
        %>
        <br>
        <a href="index.jsp">OK</a>
                
    </body>
</html>
