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
import svc.dao.UsoDao;
import svc.dao.VeiculoDao;
import svc.model.UsoModel;
import svc.model.UsuarioModel;

/**
 *
 * @author LAB
 */
@WebServlet(name = "admin", urlPatterns = {"/admin"})
public class AdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UsoDao usoD = new UsoDao();
        request.setAttribute("lista", usoD.buscar());
        RequestDispatcher view = request.getRequestDispatcher("./listarUsos.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       
    }

}
