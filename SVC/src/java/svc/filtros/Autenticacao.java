/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package svc.filtros;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LAB
 */
public class Autenticacao implements Filter {

    public Autenticacao() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest requisicao = (HttpServletRequest) request;
        HttpSession sessao = requisicao.getSession();

        if ((sessao.getAttribute("logado") != null)
                || requisicao.getRequestURI().endsWith("index.jsp")
                || requisicao.getRequestURI().endsWith("registro.jsp")
                || requisicao.getRequestURI().endsWith("registro")
                || requisicao.getRequestURI().endsWith("login.jsp")
                || requisicao.getRequestURI().endsWith(".css")
                || requisicao.getRequestURI().endsWith("login")) {
            chain.doFilter(request, response);
        } else {
            HttpServletResponse resposta = (HttpServletResponse) response;
            resposta.sendRedirect("login.jsp");
        }

    }

    /**
     * Destroy method for this filter
     */
    @Override
    public void destroy() {
    }

    @Override
    public void init(FilterConfig filterConfig) {

    }

}
