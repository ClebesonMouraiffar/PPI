/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scv.controller;

import scv.dao.UsuarioDao;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import scv.dao.UsoDao;
import scv.dao.VeiculoDao;
import scv.model.UsoModel;
import scv.model.UsuarioModel;

/**
 *
 * @author LAB
 */
@WebServlet(name = "registro", urlPatterns = {"/registro"})
public class UsoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        VeiculoDao veiculoD = new VeiculoDao();
        request.setAttribute("lista", veiculoD.buscar());
        RequestDispatcher view = request.getRequestDispatcher("./registro.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("login");
        String senha = request.getParameter("senha");
        String idveiculo = request.getParameter("veiculo");

        UsuarioModel usuarioM
                = new UsuarioDao().login(nome, senha);

        UsoModel usoM = new UsoModel();

        UsoDao usoD = new UsoDao();
        String mensagem = "null";
        String tipo = "null";
        String servelet = "./registro";

        UsoModel retornoUso = new UsoDao().buscar(Integer.parseInt(idveiculo));
        if (usuarioM.getId() != 0) {

            if (retornoUso.getRetorno() != null) {
                usoM.setIdUsuario(usuarioM.getId());
                usoM.setIdVeiculo(Integer.parseInt(idveiculo));
                //inserir no Banco
                if (usoD.inserir(usoM)) {
                    mensagem = "Uso registrado";
                    tipo = "sucess";
                } else {
                    mensagem = "Não foi possível registrar o uso, tente novamente.";
                }
            } else {
                usoM.setId(retornoUso.getId());
                if (usoD.editar(usoM)) {
                    usoM.setIdUsuario(usuarioM.getId());
                    usoM.setIdVeiculo(Integer.parseInt(idveiculo));
                    //inserir no Banco
                    if (usoD.inserir(usoM)) {
                        mensagem = "Uso devolvido e registrado";
                    } else {
                        mensagem = "Erro registrar Devolver/Registrar";
                    }
                } else {
                    mensagem = "Erro registrar Uso: veiculo nao foi devolvido";
                }
            }
        } else {
            mensagem = "Usuario ou senha inválido, tente novamente";
        }
         RequestDispatcher dispatcher = request.getRequestDispatcher("resultado.jsp");
            request.setAttribute("mensagem", mensagem);
            request.setAttribute("tipo", tipo);
            request.setAttribute("servelet", servelet);
            dispatcher.forward(request, response);
    }

}
