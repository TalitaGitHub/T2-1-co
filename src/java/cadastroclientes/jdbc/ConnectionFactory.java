/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package cadastroclientes.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConnectionFactory {

   
    static {
        try {
          
            Class.forName( "com.mysql.jdbc.Driver" );

            
        } catch ( ClassNotFoundException exc ) {

       
            exc.printStackTrace();

        }
    }

   
    public static Connection getConnection() throws SQLException {

        
        return DriverManager.getConnection(
                "jdbc:mysql://localhost/cadastro_cliente",
                "root",
                "" );

    }

}
