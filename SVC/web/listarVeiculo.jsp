<%-- 
    Document   : index
    Created on : 11/10/2017, 14:37:43
    Author     : LAB


<%@page import="svc.model.VeiculoModel"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
c<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%        
            ArrayList<VeiculoModel> lista = 
                    (ArrayList<VeiculoModel>)request.getAttribute("lista");            
            
        %>
        <a href="./index.jsp">Home</a>
        <br>
        <table>
            <tr>
                <td>C�digo</td>
                <td>Placa</td>
                <td>Descri��o</td>
                <td>A��es</td>
            </tr>
            <%
                for(VeiculoModel u : lista){
             %>
             <tr>
                 <td><%=u.getId()%></td>
                 <td><%=u.getPlaca()%></td>
                 <td><%=u.getDescricao()%></td>
                 <td><a href="./veiculo?acao=del&id=<%=u.getId()%>">Apagar</a>
                     <a href="./veiculo?acao=editar&id=<%=u.getId()%>">Editar</a>
                 </td>
             </tr>
              <% 
                }
            %>
        </table>
        
    </body>
</html>
--%>
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
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">

    <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

        <a class="navbar-brand mr-1" href="index2.html">Empresa XXX</a>

        <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
            <i class="fas fa-bars"></i>
        </button>



        <!-- Navbar -->


    </nav>

    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="sidebar navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="index2.html">
                    <i class="fas fa-fw"></i>
                    <span>Início</span>
                </a>
            </li>

            <li class="nav-item active">
                <a class="nav-link" href="cadFuncionario.html">
                    <i class="fas fa-fw"></i>
                    <span>Cadastrar Funcionario</span>
                </a>
            </li>

        </ul>
      </ul>

 

          <!-- DataTables Example -->
          <div class="card mb-3">
            <div class="card-header">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@fat">Cadastrar
                Veículo</button>
            
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
                                                            <input type="text" id="veiculo" class="form-control" required="required"
                                                                autofocus="autofocus">
                                                            <label for="veiculo">Veículo</label>
                                                        </div>
                                                        <p>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-label-group">
                                                            <input type="text" id="modelo" class="form-control" required="required">
                                                            <label for="modelo">Modelo</label>
                                                        </div>
                                                    </div>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <div class="form-label-group">
                                                            <input type="text" id="placa" class="form-control" required="required">
                                                            <label for="placa">Placa</label>
                                                        </div>
                                                    </div>
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
                      <th>Placa</th>
                      <th>Data sa�da</th>
                      
                      <th>Data de retorno</th>
                      
                      <th>Retirado por</th>
                     
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>Placa</th>
                      <th>Data sa�da</th>
                      
                      <th>Data de retorno</th>
                      
                      <th>Retirado por</th>
                    </tr>
                  </tfoot>
                  <tbody>
                    <tr>
                      <td>IHC 1530</td>
                      <td>32/12/1234</td>
                      
                      <td>30/02/1235</td>
                      
                      <td>Judas Tadeu</td>
                      
                    </tr>
                    <tr>
                      <td>ROM 4666</td>
                      <td>23/12/2345</td>
                      
                      <td>30/12235</td>
                      
                      <td>Nero</td>
                      
                    </tr>
                    <tr>
                      <td>XJA 0441</td>
                      <td>15/12/1985</td>
                      
                      <td>16/12/1986</td>
                      
                      <td>Professor X</td>
                      
                    </tr>
                    <tr>
                      <td>ERR 0404</td>
                      <td>01/01/1970</td>
                      
                      <td>31/12/2000</td>
                      
                      <td>Bug do Milenio</td>
                      
                    </tr>
                    <tr>
                      <td>IPH 0941</td>
                      <td>17/09/2007</td>
                      
                      <td>30/09/2018</td>
                      
                      <td>Steve Jobs</td>
                      
                    </tr>
                    <tr>
                      <td>DOS 0331</td>
                      <td>23/12/1989</td>
                      
                      <td>07/10/2018</td>
                      
                      <td>Bill Port�o</td>
                      
                    
                    </tr>
                    
                  </tbody>
                </table>
              </div>
            </div>
            <br>
            
            

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
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/datatables/jquery.dataTables.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>

    <!-- Demo scripts for this page-->
    <script src="js/demo/datatables-demo.js"></script>
    <script src="js/demo/chart-area-demo.js"></script>

  </body>

</html>
