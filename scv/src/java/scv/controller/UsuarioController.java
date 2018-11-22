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
import scv.model.UsuarioModel;

/**
 *
 * @author LAB
 */
@WebServlet(name = "usuario", urlPatterns = {"/admin/usuario", "/admin/usuarios", "/usuario", "/usuarios"})
public class UsuarioController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        UsuarioDao usuarioDao = new UsuarioDao();
        String pagina = "./../listarUsuario.jsp";
        String id = request.getParameter("id");
        String acao = request.getParameter("acao");
        String mensagem = "null";
        String tipo = "null";

        if (acao != null) {
            if (acao.equals("edtok")) {
                mensagem = "Alteração concluida.";
                tipo = "sucess";
            }
            if (acao.equals("edterror")) {
                mensagem = "Não foi possível realizar a alteração, tente novamente.";
                tipo = "error";
            }
            if (acao.equals("cadok")) {
                mensagem = "Cadastro Concluido";
                tipo = "sucess";
            }
            if (acao.equals("caderror")) {
                mensagem = "Não foi possível realizar o cadastro, tente novamente.";
                tipo = "error";
            }
        }
        if (id != null && acao != null) {
            if (acao.equals("del")) {
                boolean resultado = usuarioDao.apagar(Integer.parseInt(id));
                request.setAttribute("lista", usuarioDao.buscar());
            } else {
                pagina = "./../editarUsuario.jsp";
                request.setAttribute("usuario", usuarioDao.buscar(Integer.parseInt(id)));
            }
        } else {
            request.setAttribute("lista", new UsuarioDao().buscar());
        }
        request.setAttribute("tipo", tipo);
        request.setAttribute("mensagem", mensagem);
        RequestDispatcher view = request.getRequestDispatcher(pagina);
        view.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UsuarioModel usuarioM = new UsuarioModel();

        request.setCharacterEncoding("UTF-8");

        usuarioM.setNome(request.getParameter("nome"));
        usuarioM.setLogin(request.getParameter("login"));
        usuarioM.setSenha(request.getParameter("senha"));
        usuarioM.setPermissao(Integer.parseInt(request.getParameter("permissao")));
        String id = request.getParameter("id");

        UsuarioDao usuarioD = new UsuarioDao();

        if (id != null) {
            if (!id.equals("")) {
                usuarioM.setId(Integer.parseInt(id));
                if (usuarioD.editar(usuarioM)) {
                    response.sendRedirect("./usuario?acao=edtok");
                } else {
                    response.sendRedirect("./usuario?acao=edterror");
                }
            }
        } else {
            //usuarioD.inserir(usuarioM);
            if (usuarioD.inserir(usuarioM)) {
                response.sendRedirect("./usuario?acao=cadok");
            } else {
                response.sendRedirect("./usuario?acao=caderror");
            }
        }

    }

}
