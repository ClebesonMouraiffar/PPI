<%-- 
    Document   : login
    Created on : 22/11/2017, 22:23:40
    Author     : LAB


<%@page import="svc.model.UsuarioModel"%>
<%@page import="svc.model.UsoModel"%>
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
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="svc.model.VeiculoModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
              crossorigin="anonymous"

              <title> Registro de Uso</title>

        <!-- Bootstrap core CSS-->
        <link href="resource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template-->
        <link href="resource/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Custom styles for this template-->
        <link href="resource/css/sb-admin.css" rel="stylesheet">

    </head>

    <body class="bg-dark">
        <%
            ArrayList<VeiculoModel> lista
                    = (ArrayList<VeiculoModel>) request.getAttribute("lista");

        %>

        <div class="container">
            <div class="card card-register mx-auto mt-5">
                <div class="card-header">Empresa XXX</div>
                <div class="card-body">
                    <form action="./registro" method="POST">
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <div class="form-label-group">
                                        <input name="login" type="text" id="login" class="form-control" placeholder="Login" required="required" autofocus="autofocus">
                                        <label for="login">Usuário</label>
                                    </div>
                                    <p></div>
                                <div class="col-md-6">
                                    <div class="form-label-group">
                                        <input name="senha" type="password" id="senha" class="form-control" placeholder="Senha" required="required">
                                        <label for="senha">Senha</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="form-label-group">
                                        <label for="veiculo">Veiculo</label>
                                        <select name="veiculo" class="form-control" id="veiculo">
                                            <%for (VeiculoModel u : lista) {
                                            %>
                                            <option value="<%=u.getId()%>"><%=u.getPlaca()%></option> 
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <input class="btn btn-primary btn-block" type="submit" value="Registrar"/>
                    </form>
                    <div class="text-center">
                        <a class="d-block small mt-3" href="login.html">Pagina de login</a>

                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="resource/vendor/jquery/jquery.min.js"></script>
        <script src="resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="resource/vendor/jquery-easing/jquery.easing.min.js"></script>

    </body>

</html>


