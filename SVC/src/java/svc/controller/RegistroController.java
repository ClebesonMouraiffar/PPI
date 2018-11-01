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
import javax.servlet.http.HttpSession;
import svc.dao.VeiculoDao;
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
        VeiculoDao veiculoDao = new VeiculoDao();
        String pagina = "./registro.jsp";
        request.setAttribute("lista", new VeiculoDao().buscar());
        RequestDispatcher view = request.getRequestDispatcher(pagina);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("login");
        String senha = request.getParameter("senha");
         
        UsuarioModel model
                = new UsuarioDao().login(nome, senha);

        if (model.getId() != 0) {
            request.getSession().setAttribute("logado", model);
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("registro.jsp");
        }
    }

}
