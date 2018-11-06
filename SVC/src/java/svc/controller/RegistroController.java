/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package svc.controller;

import svc.dao.UsuarioDao;
import java.io.IOException;
import java.time.LocalDateTime;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.dao.UsoDao;
import svc.dao.VeiculoDao;
import svc.model.UsoModel;
import svc.model.UsuarioModel;

/**
 *
 * @author LAB
 */
@WebServlet(name = "registro", urlPatterns = {"/registro"})
public class RegistroController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        VeiculoDao veiculoD = new VeiculoDao();
        String pagina = "./registro.jsp";
        request.setAttribute("lista", veiculoD.buscar());
        RequestDispatcher view = request.getRequestDispatcher(pagina);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("login");
        String senha = request.getParameter("senha");
        String id = request.getParameter("veiculo");

        UsuarioModel usuarioM
                = new UsuarioDao().login(nome, senha);

        UsoModel usoM = new UsoModel();

        UsoDao usoD = new UsoDao();
        String mensagem = "null";

        if (usuarioM.getId() != 0) {
            try {
                LocalDateTime dataHora = LocalDateTime.now();
                usoM.setSaida(dataHora);
            } catch (Exception e) {
                usoM.setSaida(null);
            }
            try {
                LocalDateTime dataHora2 = LocalDateTime.now();
                usoM.setRetorno(dataHora2);
            } catch (Exception e) {
                usoM.setRetorno(null);
            }
            usoM.setUsuario(usuarioM.getId());
            usoM.setVeiculo(Integer.parseInt(id));
            //inserir no Banco
            if (usoD.inserir(usoM)) {
                mensagem = "Uso registrado";
            } else {
                mensagem = "Erro registrar Uso";
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("resultado.jsp");
            request.setAttribute("mensagem", mensagem);
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("registro.jsp");
        }
    }

}
