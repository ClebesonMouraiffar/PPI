/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scv.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import scv.model.VeiculoModel;



public class VeiculoDao implements DAO<VeiculoModel> {

    Conexao conexao;
    String tabela = "veiculo";
   
    @Override
    public List<VeiculoModel> buscar() {
        List<VeiculoModel> lista = new ArrayList();
        Conexao conexao = new Conexao();
        Connection conect = conexao.abrirConexao();
        try {
            PreparedStatement statement = conect.prepareStatement(
                    "select * from "+ tabela +"");
            ResultSet resultado = statement.executeQuery();

            while (resultado.next()) {
                VeiculoModel veiculoM = new VeiculoModel();
                veiculoM.setId(resultado.getInt("idveiculo"));
                veiculoM.setPlaca(resultado.getString("placa"));
                veiculoM.setDescricao(resultado.getString("descricao"));
                lista.add(veiculoM);
            }
        } catch (Exception e) {
            System.out.println("");
        } finally {
            conexao.fecharConexao(conect);
            return lista;
        }
    }

    @Override
    public VeiculoModel buscar(int id) {
        VeiculoModel veiculoM = new VeiculoModel();

        try {
            Connection conect = new Conexao().abrirConexao();
            PreparedStatement statement
                    = conect.prepareStatement("select * from "+ tabela +" where idveiculo=?");
            statement.setInt(1, id);
            ResultSet resultado = statement.executeQuery();
            while (resultado.next()) {
                veiculoM.setId(resultado.getInt("idveiculo"));
                veiculoM.setPlaca(resultado.getString("placa"));
                veiculoM.setDescricao(resultado.getString("descricao"));
            }
            resultado.close();
            statement.close();
        } catch (Exception e) {
            return null;
        } finally {
            return veiculoM;
        }
    }

    public boolean inserir(VeiculoModel veiculoM) {
        conexao = new Conexao();
        Connection conect = conexao.abrirConexao();
        try {
            PreparedStatement statement = conect.prepareStatement(
                    "insert into "+ tabela +"(placa,descricao) values (?,?)");
            statement.setString(1, veiculoM.getPlaca());
            statement.setString(2, veiculoM.getDescricao());
            statement.execute();
            return true;

        } catch (Exception e) {
            return false;
        } finally {
            conexao.fecharConexao(conect);
        }
    }

    @Override
    public boolean editar(VeiculoModel veiculoM) {
        try {
            Connection conect = new Conexao().abrirConexao();
            PreparedStatement statement
                    = conect.prepareStatement("update "+ tabela +" set placa = ?,  descricao = ? where idveiculo = ?");
            statement.setString(1, veiculoM.getPlaca());
            statement.setString(2, veiculoM.getDescricao());
            statement.setInt(3, veiculoM.getId());
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
        String sql = "delete from "+ tabela +" where idveiculo=?";
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
    public boolean apagar(VeiculoModel veiculoM) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
