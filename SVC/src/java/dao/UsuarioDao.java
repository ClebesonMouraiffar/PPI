/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.UsuarioModel;

public class UsuarioDao implements DAO<UsuarioModel> {
    Conexao conexao;
    //OK
    public boolean inserir(UsuarioModel model) {
        conexao = new Conexao();
        Connection c = conexao.abrirConexao();
        try {
            PreparedStatement statement = c.prepareStatement(
                    "insert into usuario(nome, data_nascimento) "
                            + "values (?,?)");
            statement.setString(1, model.getNome());
           
            //Date util -> Date sql            
            java.sql.Date data_nascimento = 
                    new java.sql.Date(model.getDataNascimento().getTime());
           
            statement.setDate(2, data_nascimento);
            
            statement.execute();
            return true;

        } catch (Exception e) {
            return false;
        } finally {
            conexao.fecharConexao(c);
        }
    }   

    @Override
    public boolean apagar(int id) {
        Connection c = new Conexao().abrirConexao();
        String sql = "delete from usuario where id=?";
        try {
            PreparedStatement stmt = c.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.execute();
            stmt.close();
        } catch (Exception e) {
            System.out.println("erro ao remover");
            return false;
        }
        return false;
        
       
    }

    @Override
    public boolean editar(UsuarioModel objeto) {
        try {
            Connection c = new Conexao().abrirConexao();
            PreparedStatement statement =
                    c.prepareStatement("update usuario set nome=? where id=?");
            statement.setString(1, objeto.getNome());
            statement.setInt(2, objeto.getId());
            statement.executeUpdate();
            
            return true;
            
        } catch (Exception e) {
            System.out.println("Erro ao inserir registro " + e.getMessage());
            return false;
        }
         
    }

    //OK
    @Override
    public List<UsuarioModel> buscar() {
        List<UsuarioModel> lista = new ArrayList();
        Conexao conexao = new Conexao();
        Connection c = conexao.abrirConexao();
        try {
            PreparedStatement statement = c.prepareStatement(
                    "select * from usuario");
            ResultSet resultado = statement.executeQuery();
            
            while(resultado.next()){
                UsuarioModel usuario = new UsuarioModel();
                usuario.setId(resultado.getInt("id"));
                usuario.setNome(resultado.getString("nome"));  
                //Date sql -> date util
                java.util.Date data = resultado.getDate("data_nascimento");                  
                usuario.setDataNascimento(data);                
                lista.add(usuario);
            }           
        } catch (Exception e) {
            System.out.println("");
        } finally {
            conexao.fecharConexao(c);
            return lista;
        }
    }
    
    public UsuarioModel buscar(String nome,String senha){
        UsuarioModel modelo = new UsuarioModel();
        
        try {
            Connection c = new Conexao().abrirConexao();
            PreparedStatement stmt = 
                    c.prepareStatement("select * from usuario where nome=? and senha=?");
            stmt.setString(1, nome);
            stmt.setString(2, senha);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()){
                modelo.setId(rs.getInt("id"));
                modelo.setNome(rs.getString("nome"));
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            return null;
        }finally{
            return modelo;
        }
        
    }

    @Override
    public boolean apagar(UsuarioModel objeto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public UsuarioModel buscar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }



}
