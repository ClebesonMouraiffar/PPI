/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package svc.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.dao.VeiculoDao;
import svc.model.VeiculoModel;


/**
 *
 * @author LAB
 */
@WebServlet(name = "veiculo", urlPatterns = {"/veiculo","/veiculos"})
public class VeiculoController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        VeiculoDao veiculoDao = new VeiculoDao();
        String pagina = "./listarVeiculo.jsp";
        String id = request.getParameter("id");
        String acao = request.getParameter("acao");

        if (id != null && acao != null) {
            if (acao.equals("del")) {
                boolean resultado = veiculoDao.apagar(Integer.parseInt(id));
                request.setAttribute("lista", veiculoDao.buscar());
            } else {
                request.setAttribute("veiculo", veiculoDao.buscar(Integer.parseInt(id)));
            }
        }
        request.setAttribute("lista", new VeiculoDao().buscar());
        RequestDispatcher view = request.getRequestDispatcher(pagina);
        view.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        VeiculoModel veiculoM = new VeiculoModel();
        request.setCharacterEncoding("UTF-8");
        veiculoM.setPlaca(request.getParameter("placa"));
        veiculoM.setDescricao(request.getParameter("descricao"));
        String id = request.getParameter("id");


        VeiculoDao veiculoD = new VeiculoDao();
        String mensagem = "null";

        if (id != null) {
            if (!id.equals("")) {
                veiculoM.setId(Integer.parseInt(id));                
                if (veiculoD.editar(veiculoM)) {
                    mensagem = "Veiculo editado";
                } else {
                    mensagem = "Erro ao editar usuário";
                }
            }
        } else {
            //usuarioD.inserir(usuarioM);
            if (veiculoD.inserir(veiculoM)) {
                mensagem = "Veiculo cadastrado";
            } else {
                mensagem = "Erro ao cadastrar usuário";
            }
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("resultado.jsp");
        request.setAttribute("mensagem", mensagem);
        dispatcher.forward(request, response);

    }

}
