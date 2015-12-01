/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package cadastroclientes.controladores;

import cadastroclientes.dao.EstadoDAO;
import cadastroclientes.entidades.Estado;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet - tratar Estados.
 */
public class EstadosServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter( "acao" );
        EstadoDAO dao = null;
        RequestDispatcher disp = null;
        List<String> erros=new ArrayList<String>();

        try {

            dao = new EstadoDAO();

            if ( acao.equals( "criar" ) ) {

                String nome = request.getParameter( "nome" );
                String sigla = request.getParameter( "sigla" );
                boolean erro=false;
                
                if(nome.isEmpty()){
                  erros.add("O nome do Estado não pode ser vazio!");
                  erro=true;
                }
                
                if(sigla.length() != 2){
                  erros.add("A sigla de estado deve ser de 2 letras");
                  erro = true;
                }                
                
                
                Estado e = new Estado();
                                
                if(erro){
                 request.setAttribute("msg", erros);
                 disp = request.getRequestDispatcher("/formularios/estados/erro.jsp");
                }else{              
                e.setNome( nome );
                e.setSigla( sigla );
                dao.salvar(e);
                disp = request.getRequestDispatcher("/formularios/estados/listagem.jsp" );
                }
            } else if ( acao.equals( "alterar" ) ) {

                int id = Integer.parseInt( request.getParameter( "id" ) );
                String nome = request.getParameter( "nome" );
                String sigla = request.getParameter( "sigla" );
                boolean erro=false;
                
                 if(nome.isEmpty()){
                  erros.add("O nome do Estado não pode ser vazio!");
                  erro=true;
                }
                
                if(sigla.length() != 2){
                  erros.add("A sigla de estado deve ser de 2 letras");
                  erro = true;
                }
                
                Estado e = new Estado();
                e.setId( id );
                
                if(erro){
                    request.setAttribute("msg", erros);
                    disp=request.getRequestDispatcher("/formularios/estados/erro.jsp");                
                }else{
                e.setNome( nome );
                e.setSigla( sigla );

                dao.atualizar( e );

                disp = request.getRequestDispatcher("/formularios/estados/listagem.jsp" );
                }

            } else if ( acao.equals( "excluir" ) ) {

                int id = Integer.parseInt( request.getParameter( "id" ) );

                Estado e = new Estado();
                e.setId( id );

                dao.excluir( e );

                disp = request.getRequestDispatcher(
                        "/formularios/estados/listagem.jsp" );

            } else if ( acao.equals( "prepAlteracao" ) ) {

                int id = Integer.parseInt( request.getParameter( "id" ) );
                Estado e = dao.obterPorId( id );
                request.setAttribute( "estado", e );

                disp = request.getRequestDispatcher(
                        "/formularios/estados/alterar.jsp" );

            } else if ( acao.equals( "prepExclusao" ) ) {

                int id = Integer.parseInt( request.getParameter( "id" ) );
                Estado e = dao.obterPorId( id );
                request.setAttribute( "estado", e );

                disp = request.getRequestDispatcher(
                        "/formularios/estados/excluir.jsp" );

            }

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

        if ( disp != null ) {
            disp.forward( request, response );
        }

    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
