/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package svc.model;

import java.util.List;
import svc.dao.VeiculoDao;

/**
 *
 * @author Ederson
 */
public class VeiculoModel {

    private int id;
    private String placa;
    private String descricao;
    private boolean disponibilidade;

    //getters e setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public boolean isDisponibilidade() {
        return disponibilidade;
    }

    public void setDisponibilidade(boolean disponibilidade) {
        this.disponibilidade = disponibilidade;
    }

    public void listar() {
        List<VeiculoModel> lista = new VeiculoDao().buscar();
        for (VeiculoModel veiculo : lista) {
            System.out.println(veiculo.toString());
        }
    }

}
