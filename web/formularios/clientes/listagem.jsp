
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes Cadastrados</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estilos.css"/>
    </head>

    <body>
        <div align="center"> 
        <h1>Clientes Cadastrados</h1>

        <p><a href="${pageContext.request.contextPath}/formularios/clientes/novo.jsp">CADASTRAR NOVO CLIENTE</a></p>

        <table class="tabelaListagem table-resposive" >
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nome</th>
                    <th>Sobrenome</th>
                    <th>Data Nascimento</th>               
                    <th>Email</th>
                    <th>CPF</th>
                    <th>Cidade</th>
                    <th>Alterar</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            <tbody>

                <jsp:useBean id="servicos" scope="page" class="cadastroclientes.servicos.ClienteServices"/>

                <c:forEach items="${servicos.todos}" var="cliente">
                    <tr>
                        <td>${cliente.id}</td>
                        <td>${cliente.nome}</td>
                        <td>${cliente.sobrenome}</td>
                        <td><fmt:formatDate pattern="dd/MM/yyyy" value="${cliente.dataNascimento}" /></td>
                        <td>${cliente.email}</td>
                        <td>${cliente.cpf}</td>
                        <td>${cliente.cidade.nome}</td>
                        <td><a href="${pageContext.request.contextPath}/processaClientes?acao=prepAlteracao&id=${cliente.id}">Alterar</a></td>
                        <td><a href="${pageContext.request.contextPath}/processaClientes?acao=prepExclusao&id=${cliente.id}">Excluir</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

       
        
        <p><a href="${pageContext.request.contextPath}/index.jsp">VOLTAR A TELA DE CADASTRO</a></p>
</div>
    </body>

</html>
