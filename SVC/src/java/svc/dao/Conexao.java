/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package svc.dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author LAB
 */
public class Conexao {
    
   public Conexao() {
        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            Class.forName("com.mysql.jdbc.Driver");

        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }

    public Connection abrirConexao() {
        Connection conexao=null;
        try {

            conexao = DriverManager.getConnection("jdbc:mysql://localhost/svc", "root", "");
            if (!conexao.isClosed()) {
                System.out.println("Conexão realizada com sucesso");
            }
        } catch (Exception e) {
            System.out.println("Erro ao realizar conexão");
        }
        finally{
         return conexao;
        }
    }

    public void fecharConexao(Connection conexao) {
        try {
            conexao.close();
            System.out.println("Conexão fechada!");
        } catch (Exception e) {
            System.out.println("Erro ao fechar conexão");
        }

    }

    
    
}
