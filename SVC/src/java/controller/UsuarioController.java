/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UsuarioDao;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UsuarioModel;

/**
 *
 * @author LAB
 */
public class UsuarioController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UsuarioDao usuarioDao = new UsuarioDao();
        String pagina = "./listarUsuario.jsp";
        String id = request.getParameter("id");
        String acao = request.getParameter("acao");

        if (id != null && acao != null) {
            if (acao.equals("del")) {
                boolean resultado = usuarioDao.apagar(Integer.parseInt(id));
                request.setAttribute("lista", usuarioDao.buscar());
            } else {
                pagina = "editarUsuario.jsp";
                request.setAttribute("usuario", usuarioDao.buscar(Integer.parseInt(id)));
            }
        } else {
            request.setAttribute("Lista", new UsuarioDao().buscar());
        }
        RequestDispatcher view = request.getRequestDispatcher(pagina);
        view.forward(request, response);
        

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UsuarioModel model = new UsuarioModel();

        model.setNome(request.getParameter("nome"));

        //string -> date  
        try {
            SimpleDateFormat simpleDateFormat
                    = new SimpleDateFormat("dd/MM/yyyy");

            Date date = simpleDateFormat.
                    parse(request.getParameter("data_nascimento"));

            model.setDataNascimento(date);
        } catch (Exception e) {
            model.setDataNascimento(null);
        }

        UsuarioDao dao = new UsuarioDao();
        String mensagem;
        if (dao.inserir(model)) {
            mensagem = "Usuario cadastrado";
        } else {
            mensagem = "Erro ao cadastrar usuário";
        }
        
        model.setNome(request.getParameter("nome"));
        String id = request.getParameter("id");
        
        if (id != null){
            if (!id.equals("")){
                model.setId(Integer.parseInt(id));
                dao.editar(model);
            }
        } else{
            dao.inserir(model);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("listarUsuario.jsp");
        request.setAttribute("lista", dao.buscar());
        dispatcher.forward(request, response);

    }

}
