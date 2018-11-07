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
    private int idUsuario;
    private int idVeiculo;
    private String nomeUsuario;
    private String placaVeiculo;

    //geters e seters

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

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdVeiculo() {
        return idVeiculo;
    }

    public void setIdVeiculo(int idVeiculo) {
        this.idVeiculo = idVeiculo;
    }

    public String getNomeUsuario() {
        return nomeUsuario;
    }

    public void setNomeUsuario(String nomeUsuario) {
        this.nomeUsuario = nomeUsuario;
    }

    public String getPlacaVeiculo() {
        return placaVeiculo;
    }

    public void setPlacaVeiculo(String placaVeiculo) {
        this.placaVeiculo = placaVeiculo;
    }
    
    public void listar() {
        List<UsoModel> lista = new UsoDao().buscar();
        for (UsoModel uso : lista) {
            System.out.println(uso.toString());
        }
    }
}
