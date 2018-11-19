/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package svc.controller;

import svc.dao.UsuarioDao;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.model.UsuarioModel;

/**
 *
 * @author LAB
 */
@WebServlet(name = "usuario", urlPatterns = {"/admin/usuario","/admin/usuarios","/usuario","/usuarios"})
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
        String id = request.getParameter("id");
        
        UsuarioDao usuarioD = new UsuarioDao();
        String mensagem = "null";

        if (id != null) {
            if (!id.equals("")) {
                usuarioM.setId(Integer.parseInt(id));                
                if (usuarioD.editar(usuarioM)) {
                    mensagem = "Usuario editado";
                } else {
                    mensagem = "Erro ao editar usuário";
                }
            }
        } else {
            //usuarioD.inserir(usuarioM);
            if (usuarioD.inserir(usuarioM)) {
                mensagem = "Usuario cadastrado";
            } else {
                mensagem = "Erro ao cadastrar usuário";
            }
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("resultado.jsp");
        request.setAttribute("mensagem", mensagem);
        dispatcher.forward(request, response);

    }

}
