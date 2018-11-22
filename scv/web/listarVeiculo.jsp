<%@page import="java.util.ArrayList"%>
<%@page import="scv.model.VeiculoModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SCV - Admin/Veículos</title>

        <!-- Bootstrap core CSS-->
        <link href="./../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template-->
        <link href="./../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="./../resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="./../resources/css/sb-admin.css" rel="stylesheet">

    </head>

    <body id="page-top">
        <%
            ArrayList<VeiculoModel> lista
                    = (ArrayList<VeiculoModel>) request.getAttribute("lista");
            String mensagem = request.getAttribute("mensagem").toString();
            String tipo = request.getAttribute("tipo").toString();
        %>
        <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

            <a class="navbar-brand mr-1" href="./../admin">Empresa XXX</a>

            <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
                <i class="fas fa-bars"></i>
            </button>

        </nav>

        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="sidebar navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="./../admin">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Início</span>
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="./usuarios">
                        <i class="fas fa-fw fa-users"></i>
                        <span>Usuários</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="./veiculos">
                        <i class="fas fa-fw fa-car"></i>
                        <span>Veículos</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="./../logout">
                        <i class="fas fa-fw fa-sign-out-alt"></i>
                        <span>Sair</span></a>
                </li>
            </ul>

            <div id="content-wrapper">

                <div class="container-fluid">

                    <div class="modal fade" id="cadastrarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">

                                <div class="modal-body">
                                    <div class="container">
                                        <div class="card card-register mx-auto mt-5">
                                            <div class="card-header">Empresa XXX</div>
                                            <div class="card-body">
                                                <form action="veiculo" method="POST">
                                                    <div class="form-group">
                                                        <div class="form-row">
                                                            <div class="col-md-12">
                                                                <div class="form-label-group">
                                                                    <input name="placa" type="text" id="placa" class="form-control" required="required"
                                                                           autofocus="autofocus">
                                                                    <label for="placa">Placa</label>
                                                                </div>
                                                                <p>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="form-label-group">
                                                                    <input name="descricao" type="text" id="descricao" class="form-control" required="required">
                                                                    <label for="descricao">Descrição</label>
                                                                </div>
                                                            </div>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <input class="btn btn-primary btn-block" type="submit" value="Salvar">
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <%if (!mensagem.equals("null") && !tipo.equals("null")) {
                            if (tipo.equals("sucess")) {
                    %>
                    <div class="alert alert-success col-md-12">
                        <%=request.getAttribute("mensagem")%>
                    </div>
                    <%} else if (tipo.equals("error")) {%>
                    <div class="alert alert-danger col-md-12">
                        <%=request.getAttribute("mensagem")%>
                    </div>
                    <%}
                        }%>

                    <!-- DataTables Example -->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-table"></i>
                            Veículos</div>
                        <div class="card-body">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#cadastrarModal" data-whatever="@fat">Cadastrar
                                Veículo</button><br><br>
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Código</th>
                                            <th>Placa</th>
                                            <th>Descrição</th>
                                            <th>Ações</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Código</th>
                                            <th>Placa</th>
                                            <th>Descrição</th>
                                            <th>Ações</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <% for (VeiculoModel u : lista) {
                                        %>
                                        <tr>
                                            <td><%=u.getId()%></td>
                                            <td><%=u.getPlaca()%></td>
                                            <td><%=u.getDescricao()%></td>
                                            <td>
                                                <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" 
                                                        data-target="#apagarModal<%=u.getId()%>" data-whatever="@fat">Apagar</button>
                                                <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" 
                                                        data-target="#editarModal<%=u.getId()%>" data-whatever="@fat">Editar</button>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <% for (VeiculoModel u : lista) {
                        %>
                        <div class="modal fade" id="editarModal<%=u.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">

                                    <div class="modal-body">
                                        <div class="container">
                                            <div class="card card-register mx-auto mt-5">
                                                <div class="card-header">Empresa XXX</div>
                                                <div class="card-body">
                                                    <form action="veiculo?id=<%=u.getId()%>" method="POST" accept-charset="UTF-8">
                                                        <div class="form-group">
                                                            <div class="form-row">
                                                                <div class="col-md-12">
                                                                    <div class="form-label-group">
                                                                        <input name="placa" type="text" id="placa" class="form-control" required="required"
                                                                               autofocus="autofocus" value="<%=u.getPlaca()%>">
                                                                        <label for="placa">Placa</label>
                                                                    </div>
                                                                    <p>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-label-group">
                                                                        <input name="descricao" type="text" id="descricao" class="form-control" required="required" value="<%=u.getDescricao()%>">
                                                                        <label for="descricao">Descrição</label>
                                                                    </div>
                                                                </div>
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <input class="btn btn-primary btn-block" type="submit" value="Salvar">
                                                    </form>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="apagarModal<%=u.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Deseja Apagar esse Item?</h5>
                                    </div>
                                    <div class="modal-footer">
                                        <a class="btn btn-danger" href="./veiculo?acao=del&id=<%=u.getId()%>">Apagar</a>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%
                            }
                        %>
                    </div
                </div>
                <!-- /.container-fluid -->

                <!-- Sticky Footer -->
                <footer class="sticky-footer">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>PPI - TSI</span>
                        </div>
                    </div>
                </footer>

            </div>
            <!-- /.content-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Bootstrap core JavaScript-->
        <script src="./../resources/vendor/jquery/jquery.min.js"></script>
        <script src="./../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="./../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Page level plugin JavaScript-->
        <script src="./../resources/vendor/datatables/jquery.dataTables.js"></script>
        <script src="./../resources/vendor/datatables/dataTables.bootstrap4.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="./../resources/js/sb-admin.min.js"></script>

        <!-- Demo scripts for this page-->
        <script src="./../resources/js/demo/datatables-demo.js"></script>

    </body>

</html>
