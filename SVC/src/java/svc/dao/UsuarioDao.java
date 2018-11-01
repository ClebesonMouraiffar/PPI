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
                usuarioM.setId(resultado.getInt("id"));
                usuarioM.setNome(resultado.getString("nome"));
                //Date sql -> date util
                java.util.Date data = resultado.getDate("data_nascimento");
                usuarioM.setDataNascimento(data);
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
                    = conect.prepareStatement("select * from  "+ tabela +" where id=?");
            statement.setInt(1, id);
            ResultSet resultado = statement.executeQuery();
            while (resultado.next()) {
                usuarioM.setId(resultado.getInt("id"));
                usuarioM.setNome(resultado.getString("nome"));
                usuarioM.setSenha(resultado.getString("senha"));
                java.util.Date data = resultado.getDate("data_nascimento");
                usuarioM.setDataNascimento(data);
            }
            resultado.close();
            statement.close();
        } catch (Exception e) {
            return null;
        } finally {
            return usuarioM;
        }
    }

    public UsuarioModel login(String nome, String senha) {
        UsuarioModel usuarioM = new UsuarioModel();

        try {
            Connection conect = new Conexao().abrirConexao();
            PreparedStatement statement
                    = conect.prepareStatement("select * from "+ tabela +" where nome=? and senha=?");
            statement.setString(1, nome);
            statement.setString(2, senha);
            ResultSet resultado = statement.executeQuery();
            while (resultado.next()) {
                usuarioM.setId(resultado.getInt("id"));
                usuarioM.setNome(resultado.getString("nome"));
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
                    "insert into "+ tabela +"(nome,senha,data_nascimento) values (?,?,?)");
            statement.setString(1, usuarioM.getNome());
            statement.setString(2, usuarioM.getSenha());

            //Date util -> Date sql            
            java.sql.Date data_nascimento
                    = new java.sql.Date(usuarioM.getDataNascimento().getTime());

            statement.setDate(3, data_nascimento);

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
                    = conect.prepareStatement("update "+ tabela +" set nome = ?, senha = ?, data_nascimento = ? where id = ?");
            statement.setString(1, usuarioM.getNome());
            statement.setString(2, usuarioM.getSenha());
            java.sql.Date data_nascimento
                    = new java.sql.Date(usuarioM.getDataNascimento().getTime());
            statement.setDate(3, data_nascimento);
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
        String sql = "delete from "+ tabela +" where id=?";
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
