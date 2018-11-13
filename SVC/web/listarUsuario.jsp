<%-- 
    Document   : index
    Created on : 11/10/2017, 14:37:43
    Author     : LAB


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
                <td>C�digo</td>
                <td>Nome</td>
                <td>Login</td>
                <td>A��es</td>
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
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="svc.model.UsuarioModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SVC - Usuários</title>

        <!-- Bootstrap core CSS-->
        <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template-->
        <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="resources/css/sb-admin.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <%
            ArrayList<UsuarioModel> lista
                    = (ArrayList<UsuarioModel>) request.getAttribute("lista");

        %>

        <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

            <a class="navbar-brand mr-1" href="./index.jsp">Empresa XXX</a>

            <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
                <i class="fas fa-bars"></i>
            </button>
        </nav>

        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="sidebar navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">
                        <i class="fas fa-fw"></i>
                        <span>Início</span>
                    </a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="./veiculos">
                        <i class="fas fa-fw"></i>
                        <span>Veículos</span>
                    </a>
                </li>

            </ul>



            <!-- DataTables Example -->
            <div class="card mb-3">
                <div class="card-header">

                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@fat">Cadastrar
                        Usuário</button>

                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">

                                <div class="modal-body">
                                    <div class="container">
                                        <div class="card card-register mx-auto mt-5">
                                            <div class="card-header">Empresa XXX</div>
                                            <div class="card-body">
                                                <form>
                                                    <div class="form-group">
                                                        <div class="form-row">
                                                            <div class="col-md-6">
                                                                <div class="form-label-group">
                                                                    <input type="text" id="funcionario" class="form-control" required="required"
                                                                           autofocus="autofocus">
                                                                    <label for="funcionario">Funcionario</label>
                                                                </div>
                                                                <p>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-label-group">
                                                                    <input type="password" id="senha" class="form-control" required="required">
                                                                    <label for="senha">Senha</label>
                                                                </div>
                                                            </div>
                                                            </p>
                                                        </div>
                                                    </div>


                                                    <a class="btn btn-primary btn-block" href="">Registrar</a>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>


                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Codigo</th>
                                        <th>Nome</th>
                                        <th>Login</th>
                                        <th>ações</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (UsuarioModel u : lista) {
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
                                </tbody>
                                <tfoot>
                                    <tr>
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
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
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
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/endor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="resources/vendor/chart.js/Chart.min.js"></script>
    <script src="resources/vendor/datatables/jquery.dataTables.js"></script>
    <script src="resources/vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin.min.js"></script>

    <!-- Demo scripts for this page-->
    <script src="resources/js/demo/datatables-demo.js"></script>
    <script src="resources/js/demo/chart-area-demo.js"></script>

</body>

</html>
