/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package cadastroclientes.dao;

import cadastroclientes.jdbc.ConnectionFactory;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 * DAO - genérico.

 */
public abstract class DAO<T extends Object> {

    // cada DAO terá uma conexão.
    private Connection conexao;

    
    public DAO() throws SQLException {

       
        conexao = ConnectionFactory.getConnection();

    }

   
    public Connection getConnection() {
        return conexao;
    }

   
    public void fecharConexao() throws SQLException {
        conexao.close();
    }

    
    public abstract void salvar( T obj ) throws SQLException;

   
    public abstract void atualizar( T obj ) throws SQLException;

    public abstract void excluir( T obj ) throws SQLException;

    
    public abstract List<T> listarTodos() throws SQLException;

    
    public abstract T obterPorId( int id ) throws SQLException;

}
