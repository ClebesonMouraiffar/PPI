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
import java.text.SimpleDateFormat;
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
                //tratamento da Data e Hora de Saida
                Timestamp saida = resultado.getTimestamp("saida");
                String strsaida = new SimpleDateFormat("dd/MM/yyyy HH:mm").format(saida);
                usoM.setSaida(strsaida);
                try {
                    //tratamento da Data e Hora de Retorno
                    Timestamp retorno = resultado.getTimestamp("retorno");
                    String strretorno = new SimpleDateFormat("dd/MM/yyyy HH:mm").format(retorno);
                    usoM.setRetorno(strretorno);
                } catch (Exception e) {
                    usoM.setRetorno(null);
                }
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
                    = conect.prepareStatement("SELECT * FROM uso WHERE idveiculo = ? ORDER BY iduso DESC LIMIT 1");
            statement.setInt(1, id);
            ResultSet resultado = statement.executeQuery();
            while (resultado.next()) {
                usoM.setId(resultado.getInt("iduso"));
                try {
                    //tratamento da Data e Hora de Retorno
                    Timestamp retorno = resultado.getTimestamp("retorno");
                    String strretorno = new SimpleDateFormat("dd/MM/yyyy HH:mm").format(retorno);
                    usoM.setRetorno(strretorno);
                } catch (Exception e) {
                    usoM.setRetorno(null);
                }
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
                    "insert into " + tabela + "(saida, retorno, idusuario, idveiculo) values (CURRENT_TIMESTAMP,NULL,?,?)");
            statement.setInt(1, usoM.getIdUsuario());
            statement.setInt(2, usoM.getIdVeiculo());
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
                    = conect.prepareStatement("update " + tabela + " set retorno =  CURRENT_TIMESTAMP where iduso = ?");
            statement.setInt(1, usoM.getId());
            statement.executeUpdate();

            return true;

        } catch (Exception e) {
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
