/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scv.dao;

import java.util.List;

/**
 *
 * @author Ederson
 */
public interface DAO<T> {
    
    public boolean inserir(T objeto);
    
    public boolean apagar(T objeto);
    
    public boolean apagar(int i);
    
    public boolean editar(T objeto);
    
    public List<T> buscar();
    
    public T buscar(int id);
    
}
