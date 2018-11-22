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
import javax.servlet.http.HttpSession;
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
        String ret = request.getParameter("ret");
        String mensagem = "null";
        String tipo = "null";
        //testa os tipos de retorno
        if (ret != null) {
            if (ret.equals("elogin")) {
                mensagem = "Usuário ou senha incorreto, tente novamente";
                tipo = "error";
            }
            if (ret.equals("sreg")) {
                mensagem = "Uso registrado";
                tipo = "sucess";
            }
            if (ret.equals("ereg")) {
                mensagem = "Não foi possível registrar o uso, tente novamente.";
                tipo = "error";
            }
            if (ret.equals("dsreg")) {
                mensagem = "Uso devolvido e registrado.";
                tipo = "sucess";
            }
            if (ret.equals("dereg")) {
                mensagem = "Erro registrar Devolver/Registrar.";
                tipo = "error";
            }
            if (ret.equals("edreg")) {
                mensagem = "Erro registrar Uso: veiculo nao foi devolvido.";
                tipo = "error";
            }
            if (ret.equals("emuso")) {
                mensagem = "Este Veiculo esta sendo usado.";
                tipo = "emuso";
            }
        }
        request.setAttribute("tipo", tipo);
        request.setAttribute("mensagem", mensagem);
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
        String retornoemuso = request.getParameter("retornouso");

        UsuarioModel usuarioM
                = new UsuarioDao().login(nome, senha);

        UsoModel usoM = new UsoModel();

        UsoDao usoD = new UsoDao();
        try {
            UsoModel retornoUso = new UsoDao().buscar(Integer.parseInt(idveiculo));
            //se usuario e senha ok, prosegue..
            if (usuarioM.getId() != 0) {
                //se for o primeiro uso ou o veiculo ja foi entregue, registra o uso
                if (retornoUso.getId() == 0 || retornoUso.getRetorno() != null) {
                    usoM.setIdUsuario(usuarioM.getId());
                    usoM.setIdVeiculo(Integer.parseInt(idveiculo));
                    //inserir no Banco
                    if (usoD.inserir(usoM)) {
                        response.sendRedirect("./registro?ret=sreg");
                    } else {
                        response.sendRedirect("./registro?ret=ereg");
                    }
                } else //coloca o objeto na sessão e avisa que veiculo esta em uso
                {
                    usoM.setId(retornoUso.getId());
                    usoM.setIdUsuario(usuarioM.getId());
                    usoM.setIdVeiculo(Integer.parseInt(idveiculo));
                    if (usoM != null) {
                        request.getSession().setAttribute("uso", usoM);
                        response.sendRedirect("./registro?ret=emuso");
                    }
                }

            } else //informa erro de login
            {
                response.sendRedirect("./registro?ret=elogin");
            }
        } catch (Exception e) {
            // se a confirmação do usuario for devolver e registrar( recupera da sessao edita e insere no banco)
            if (retornoemuso.equals("devolvido")) {
                HttpServletRequest requisicao = (HttpServletRequest) request;
                HttpSession sessao = requisicao.getSession();

                if ((sessao.getAttribute("uso") != null)) {
                    UsoModel emusoM = (UsoModel) sessao.getAttribute("uso");
                    //usoM.setId(retornoUso.getId());
                    if (usoD.editar(emusoM)) {
                    //usoM.setIdUsuario(usuarioM.getId());
                        //usoM.setIdVeiculo(Integer.parseInt(idveiculo));
                        //inserir no Banco
                        if (usoD.inserir(emusoM)) {
                            response.sendRedirect("./registro?ret=dsreg");
                        } else {
                            response.sendRedirect("./registro?ret=dereg");
                        }
                    } else {
                        response.sendRedirect("./registro?ret=edreg");
                    }
                }
            }
        }

    }

}
