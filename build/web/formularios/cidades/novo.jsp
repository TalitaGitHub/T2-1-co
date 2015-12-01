
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nova Cidade</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estilos.css"/>
                <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
       
                <!-- SCRIPT UTILIZADO PARA ALTERAR A COR DO FOCU DO FORMULÁRIO-->
        
        <script>
        $(document).ready(function(){
            $("input").focus(function(){
                $(this).css("background-color", "#f0f9ff");
            });
            $("input").blur(function(){
                $(this).css("background-color", "#ffffff");
            });
           
        });
        </script>  
                
    </head>

    <body>
        <div align="center">
        <h1>Nova Cidade</h1>

        <form method="post"
              action="${pageContext.request.contextPath}/processaCidades">

            <input name="acao" type="hidden" value="criar"/>

            <table class="table-responsive" >
                <tr>
                    <td class="alinharDireita">Nome:</td>
                    <td>
                        <input name="nome" type="text" size="20"/>
                    </td>
                </tr>
                <tr>
                    <td class="alinharDireita">Estado:</td>
                    <td>

                        <jsp:useBean id="servicos" scope="page" class="cadastroclientes.servicos.EstadoServices"/>

                        <select name="idEstado">
                            <c:forEach items="${servicos.todos}" var="estado">
                                <option value="${estado.id}">${estado.nome} - ${estado.sigla}</option>
                            </c:forEach>
                        </select>

                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="${pageContext.request.contextPath}/formularios/cidades/listagem.jsp">Voltar</a>
                    </td>
                    <td class="alinharDireita table-responsive">
                        <input type="submit" value="Salvar"/>
                    </td>
                </tr>
            </table>

        </form>
</div>
    </body>

</html>
