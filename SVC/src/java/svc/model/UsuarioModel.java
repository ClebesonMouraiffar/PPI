/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package svc.model;

import java.util.List;
import svc.dao.UsuarioDao;

/**
 *
 * @author Ederson
 */
public class UsuarioModel {

    private int id;
    private String nome;
    private String login;
    private String senha;

    //getters e setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public void listar() {
        List<UsuarioModel> lista = new UsuarioDao().buscar();
        for (UsuarioModel usuario : lista) {
            System.out.println(usuario.toString());
        }
    }

}
