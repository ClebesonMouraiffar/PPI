/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package svc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import svc.model.UsoModel;

public class UsoDao implements DAO<UsoModel> {

    Conexao conexao;
    String tabela = "uso";

    @Override
    public List<UsoModel> buscar() {
        List<UsoModel> lista = new ArrayList();
        Conexao conexao = new Conexao();
        Connection conect = conexao.abrirConexao();
        try {
            PreparedStatement statement = conect.prepareStatement(
                    "select u.iduso, "
                    + "u.saida, "
                    + "u.retorno,"
                    + "us.nome, "
                    + "v.placa "
                    + "from " + tabela + " u "
                    + "inner join usuario us on (u.idusuario = us.idusuario) "
                    + "inner join veiculo V on (U.idveiculo = V.idveiculo)");
            ResultSet resultado = statement.executeQuery();

            while (resultado.next()) {
                UsoModel usoM = new UsoModel();
                usoM.setId(resultado.getInt("iduso"));
                usoM.setSaida(resultado.getTimestamp("saida").toLocalDateTime());
                //verifica data de retorno nula
                LocalDateTime retorno = resultado.getTimestamp("retorno").toLocalDateTime();
                if (retorno  == null) {
                    
                }
                
                   usoM.setRetorno(retorno);
                usoM.setNomeUsuario(resultado.getString("nome"));
                usoM.setPlacaVeiculo(resultado.getString("placa"));
                lista.add(usoM);
            }
        } catch (Exception e) {
            System.out.println("");
        } finally {
            conexao.fecharConexao(conect);
            return lista;
        }
    }

    @Override
    public UsoModel buscar(int id) {
        UsoModel usoM = new UsoModel();

        try {
            Connection conect = new Conexao().abrirConexao();
            PreparedStatement statement
                    = conect.prepareStatement("select * from " + tabela + " where id=?");
            statement.setInt(1, id);
            ResultSet resultado = statement.executeQuery();
            while (resultado.next()) {
                usoM.setId(resultado.getInt("id"));
            }
            resultado.close();
            statement.close();
        } catch (Exception e) {
            return null;
        } finally {
            return usoM;
        }
    }

    public UsoModel buscarUltimo() {
        UsoModel usoM = new UsoModel();

        try {
            Connection conect = new Conexao().abrirConexao();
            PreparedStatement statement
                    = conect.prepareStatement("SELECT * FROM uso ORDER BY iduso DESC LIMIT 1");
            ResultSet resultado = statement.executeQuery();
            while (resultado.next()) {
                usoM.setId(resultado.getInt("iduso"));
                usoM.setSaida(resultado.getTimestamp("saida").toLocalDateTime());
                usoM.setRetorno(resultado.getTimestamp("retorno").toLocalDateTime());
                usoM.setNomeUsuario(resultado.getString("nome"));
                usoM.setPlacaVeiculo(resultado.getString("placa"));
            }
            resultado.close();
            statement.close();
        } catch (Exception e) {
            return null;
        } finally {
            return usoM;
        }
    }

    public boolean inserir(UsoModel usoM) {
        conexao = new Conexao();
        Connection conect = conexao.abrirConexao();
        try {
            PreparedStatement statement = conect.prepareStatement(
                    "insert into " + tabela + "(saida, retorno, idusuario, idveiculo) values (?,NULL,?,?)");
            //data loca -> data sql
            statement.setTimestamp(1, Timestamp.valueOf(usoM.getSaida()));
            statement.setInt(2, usoM.getIdUsuario());
            statement.setInt(3, usoM.getIdVeiculo());

            statement.execute();
            return true;

        } catch (Exception e) {
            return false;
        } finally {
            conexao.fecharConexao(conect);
        }
    }

    @Override
    public boolean editar(UsoModel usoM) {
        try {
            Connection conect = new Conexao().abrirConexao();
            PreparedStatement statement
                    = conect.prepareStatement("update " + tabela + " set placa = ?,  descricao = ? where id = ?");
            statement.setInt(3, usoM.getId());
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
        String sql = "delete from " + tabela + " where iduso=?";
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
    public boolean apagar(UsoModel usoM) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
