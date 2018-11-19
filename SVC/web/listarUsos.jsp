<%--
    Document   : index
    Created on : 11/10/2017, 14:37:43
    Author     : LAB

--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="svc.model.UsoModel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SVC - Admin</title>

        <!-- Bootstrap core CSS-->
        <link href="./resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template-->
        <link href="./resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="./resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="./resources/css/sb-admin.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

            <a class="navbar-brand mr-1" href="./admin">Empresa XXX</a>

            <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
                <i class="fas fa-bars"></i>
            </button>



            <!-- Navbar -->


        </nav>

        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="sidebar navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="./admin">
                        <i class="fas fa-fw"></i>
                        <span>Início</span>
                    </a>
                </li>
                
                <li class="nav-item active">
                    <a class="nav-link" href="./admin/usuarios">
                        <i class="fas fa-fw"></i>
                        <span>Usuários</span>
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="./admin/veiculos">
                        <i class="fas fa-fw"></i>
                        <span>Veículos</span>
                    </a>
                </li>

            </ul>
            <%
                ArrayList<UsoModel> lista
                        = (ArrayList<UsoModel>) request.getAttribute("lista");

            %>
            <!-- DataTables Example -->
            <div class="card mb-3">
                <div class="card-header">

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <td>Código</td>
                                        <th>Placa</th>
                                        <th>Saída</th>
                                        <th>Retorno</th>
                                        <th>Retirado por</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <%      for (UsoModel u : lista) {
                                            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
                                    %>
                                    <tr>
                                        <td><%=u.getId()%></td>
                                        <td><%=u.getPlacaVeiculo()%></td>
                                        <td><%=u.getSaida()%></td>
                                        <td><%if (u.getRetorno() != null) {
                                                out.print(u.getRetorno());
                                            } else {
                                                out.print("Em Uso");
                                            }%></td>
                                        <td><%=u.getNomeUsuario()%></td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td>Código</td>
                                        <th>Placa</th>
                                        <th>Saída</th>
                                        <th>Retorno</th>
                                        <th>Retirado por</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>

                </div>

            </div>
            <!-- /.container-fluid -->

            <!-- Sticky Footer -->


        </div>
        <!-- /.content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">�</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="./resources/vendor/jquery/jquery.min.js"></script>
    <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="./resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="./resources/vendor/chart.js/Chart.min.js"></script>
    <script src="./resources/vendor/datatables/jquery.dataTables.js"></script>
    <script src="./resources/vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="./resources/js/sb-admin.min.js"></script>

    <!-- Demo scripts for this page-->
    <script src="./resources/js/demo/datatables-demo.js"></script>
    <script src="./resources/js/demo/chart-area-demo.js"></script>

</body>

</html>

