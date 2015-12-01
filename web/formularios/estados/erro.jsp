
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Novo Estado</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estilos.css"/>
    </head>

    <body>

        <h1>Pagina de Erros</h1>
     
       
        <form>
            
            <table>
                  <tr>
                      <td class="alinharDireita" > </td>
                       <td>
                        <c:choose>
                            <c:when test="${empty requestScope.msg}">
                            </c:when>
                            <c:otherwise>
                            <c:forEach items="${requestScope.msg}" var="erro">
                            <p id="erro">${erro}</p>
                            </c:forEach>
                          </c:otherwise>
                           </c:choose>     
                       
                        <a href="${pageContext.request.contextPath}/formularios/estados/listagem.jsp">Voltar</a>
                    </td>
                    <td class="alinharDireita">
                     
                    </td>
                </tr>
            </table>

        </form>

    </body>

