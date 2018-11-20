/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package svc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import svc.model.UsuarioModel;

public class UsuarioDao implements DAO<UsuarioModel> {

    Conexao conexao;
    String tabela = "usuario";

    @Override
    public List<UsuarioModel> buscar() {
        List<UsuarioModel> lista = new ArrayList();
        Conexao conexao = new Conexao();
        Connection conect = conexao.abrirConexao();
        try {
            PreparedStatement statement = conect.prepareStatement(
                    "select * from "+ tabela +"");
            ResultSet resultado = statement.executeQuery();

            while (resultado.next()) {
                UsuarioModel usuarioM = new UsuarioModel();
                usuarioM.setId(resultado.getInt("idusuario"));
                usuarioM.setNome(resultado.getString("nome"));
                usuarioM.setLogin(resultado.getString("login"));
                lista.add(usuarioM);
            }
        } catch (Exception e) {
            System.out.println("");
        } finally {
            conexao.fecharConexao(conect);
            return lista;
        }
    }

    @Override
    public UsuarioModel buscar(int id) {
        UsuarioModel usuarioM = new UsuarioModel();

        try {
            Connection conect = new Conexao().abrirConexao();
            PreparedStatement statement
                    = conect.prepareStatement("select * from  "+ tabela +" where idusuario=?");
            statement.setInt(1, id);
            ResultSet resultado = statement.executeQuery();
            while (resultado.next()) {
                usuarioM.setId(resultado.getInt("idusuario"));
                usuarioM.setNome(resultado.getString("nome"));
                usuarioM.setLogin(resultado.getString("login"));
                usuarioM.setSenha(resultado.getString("senha"));
                
            }
            resultado.close();
            statement.close();
        } catch (Exception e) {
            return null;
        } finally {
            return usuarioM;
        }
    }

    public UsuarioModel login(String login, String senha) {
        UsuarioModel usuarioM = new UsuarioModel();

        try {
            Connection conect = new Conexao().abrirConexao();
            PreparedStatement statement
                    = conect.prepareStatement("select * from "+ tabela +" where login=? and senha=?");
            statement.setString(1, login);
            statement.setString(2, senha);
            ResultSet resultado = statement.executeQuery();
            while (resultado.next()) {
                usuarioM.setId(resultado.getInt("idusuario"));
                usuarioM.setLogin(resultado.getString("login"));
            }
            resultado.close();
            statement.close();
        } catch (Exception e) {
            return null;
        } finally {
            return usuarioM;
        }

    }

    public boolean inserir(UsuarioModel usuarioM) {
        conexao = new Conexao();
        Connection conect = conexao.abrirConexao();
        try {
            PreparedStatement statement = conect.prepareStatement(
                    "insert into "+ tabela +"(nome,login,senha) values (?,?,?)");
            statement.setString(1, usuarioM.getNome());
            statement.setString(2, usuarioM.getLogin());
            statement.setString(3, usuarioM.getSenha());

            statement.execute();
            return true;

        } catch (Exception e) {
            return false;
        } finally {
            conexao.fecharConexao(conect);
        }
    }

    @Override
    public boolean editar(UsuarioModel usuarioM) {
        try {
            Connection conect = new Conexao().abrirConexao();
            PreparedStatement statement
                    = conect.prepareStatement("update "+ tabela +" set nome = ?, login = ?, senha = ? where idusuario = ?");
            statement.setString(1, usuarioM.getNome());
            statement.setString(2, usuarioM.getLogin());
            statement.setString(3, usuarioM.getSenha());
            statement.setInt(4, usuarioM.getId());
            statement.executeUpdate();

            return true;

        } catch (Exception e) {
            System.out.println("Erro ao inserir registro " + e.getMessage());
            return false;
        }

    }

    @Override
    public boolean apagar(int id) {
        Connection conect = new Conexao().abrirConexao();
        String sql = "delete from "+ tabela +" where idusuario=?";
        try {
            PreparedStatement statement = conect.prepareStatement(sql);
            statement.setInt(1, id);
            statement.execute();
            statement.close();
        } catch (Exception e) {
            System.out.println("erro ao remover");
            return false;
        }
        return false;

    }

    @Override
    public boolean apagar(UsuarioModel usuarioM) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
