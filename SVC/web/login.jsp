<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"

   

    <!-- Bootstrap core CSS-->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css/>" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin.css" rel="stylesheet">

  </head>

  <body class="bg-dark">

    <div class="container">
      <div class="card card-login mx-auto mt-5">
        <div class="card-header">Login</div>
        <div class="card-body">
          <form action="./login" method="POST">
            <div class="form-group">
              
                  <label for="inputEmail">Usuário</label>
                <input name="login" type="text" id="usuario" class="form-control" placeholder="Usuário" required="required" autofocus="autofocus">
                
            </div>
            <div class="form-group">
              
                  <label for="inputPassword">Senha</label>
                <input name="senha" type="password" id="senha" class="form-control" placeholder="Senha" required="required">
                
            </div>
            <div class="form-group">
              
            </div>
            <input type="submit" value="Login" class="btn btn-primary btn-block"/> 
          </form>
          
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  </body>

</html>


