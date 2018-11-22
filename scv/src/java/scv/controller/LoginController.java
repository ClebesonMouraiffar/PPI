/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scv.controller;

import scv.dao.UsuarioDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import scv.model.UsuarioModel;

/**
 *
 * @author LAB
 */
@WebServlet(name = "login", urlPatterns = {"/login","/logout"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
       session.invalidate();
        response.sendRedirect("login.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
         
        UsuarioModel usuarioM
                = new UsuarioDao().login(login, senha);

        if (usuarioM.getId() != 0) {
            request.getSession().setAttribute("logado", usuarioM);
            response.sendRedirect("./admin");
        } else {
            response.sendRedirect("login.jsp?error");
        }
    }

}
