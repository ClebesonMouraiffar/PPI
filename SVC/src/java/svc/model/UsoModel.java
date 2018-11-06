/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package svc.model;

import java.time.LocalDateTime;
import java.util.List;
import svc.dao.UsoDao;

/**
 *
 * @author Ederson
 */
public class UsoModel {

    private int id;
    private LocalDateTime saida;
    private LocalDateTime retorno;
    private int usuario;
    private int veiculo;

    //geters e seters
    public int getUsuario() {
        return usuario;
    }

    public void setUsuario(int usuario) {
        this.usuario = usuario;
    }

    public int getVeiculo() {
        return veiculo;
    }

    public void setVeiculo(int veiculo) {
        this.veiculo = veiculo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDateTime getSaida() {
        return saida;
    }

    public void setSaida(LocalDateTime saida) {
        this.saida = saida;
    }

    public LocalDateTime getRetorno() {
        return retorno;
    }

    public void setRetorno(LocalDateTime retorno) {
        this.retorno = retorno;
    }

    public void listar() {
        List<UsoModel> lista = new UsoDao().buscar();
        for (UsoModel uso : lista) {
            System.out.println(uso.toString());
        }
    }

}
