/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package cadastroclientes.servicos;

import cadastroclientes.dao.CidadeDAO;
import cadastroclientes.entidades.Cidade;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class CidadeServices {

    
    public List<Cidade> getTodos() {

        List<Cidade> lista = new ArrayList<Cidade>();
        CidadeDAO dao = null;

        try {
            dao = new CidadeDAO();
            lista = dao.listarTodos();
        } catch ( SQLException exc ) {
            exc.printStackTrace();
        } finally {
            if ( dao != null ) {
                try {
                    dao.fecharConexao();
                } catch ( SQLException exc ) {
                    exc.printStackTrace();
                }
            }
        }

        return lista;

    }

}
