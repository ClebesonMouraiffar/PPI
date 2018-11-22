<%@page import="java.util.ArrayList"%>
<%@page import="scv.model.VeiculoModel"%>
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
            String mensagem = request.getAttribute("mensagem").toString();
            String tipo = request.getAttribute("tipo").toString();
        %>

        <div class="container">
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">

                        <div class="modal-body">
                            <div class="container">
                                <div class="card card-register mx-auto mt-5">
                                    <div class="card-header">Mensagem</div>
                                    <div class="card-body">
                                        <div class="alert alert-success col-md-12 alert-dismissible">
                                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                            <%=request.getAttribute("mensagem")%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="card card-register mx-auto mt-5">
                <div class="card-header">Empresa XXX</div>
                <div class="card-body">
                    <form action="./registro" method="POST">
                        <%if (!mensagem.equals("null") && !tipo.equals("null")) {
                                if (tipo.equals("sucess")) {
                        %>
                        <div class="alert alert-success col-md-12 alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <%=request.getAttribute("mensagem")%>
                        </div>
                        <%} else if (tipo.equals("error")) {%>
                        <div class="alert alert-danger col-md-12 alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <%=request.getAttribute("mensagem")%>
                        </div>
                        <%}else if (tipo.equals("emuso")) {
                        %>
                        <div class="alert alert-danger col-md-12 alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <%=request.getAttribute("mensagem")%>
                        </div>
                        <input name="retornouso" value="devolvido" hidden="true">
                        <input class="btn btn-primary btn-block" type="submit" value="Devolver veículo e Registrar Uso"/>
                        <a href="./registro" class="btn btn-danger btn-block">Cancelar</a>
                        <%}
                        }%>
                        <%
                            if (!tipo.equals("emuso")) {
                        %> 
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <input name="retornouso" value="devolvido" hidden="true">
                                    <label for="login">Usuário</label>
                                    <input name="login" type="text" id="login" class="form-control" placeholder="Login" required="required" autofocus="autofocus">

                                    <p>
                                </div>                                
                                <div class="col-md-6">
                                    <label for="senha">Senha</label>
                                    <input name="senha" type="password" id="senha" class="form-control" placeholder="Senha" required="required">
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
                        <input class="btn btn-primary btn-block" type="submit" value="Registrar Uso"/>
                        <%}%>
                    </form>
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


