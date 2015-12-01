
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema para Cadastro de Clientes</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estilos.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>     
    </head>

    <body>

        <div align="center"><h1> Cadastre aqui: </h1></div>
        
      
        <div align="center">
        
            <p>
                <a class="btn btn-default" href="${pageContext.request.contextPath}/formularios/clientes/listagem.jsp">Clientes</a>
            </p>
            <br>
            
            <p>
                <a class="btn btn-default" href="${pageContext.request.contextPath}/formularios/cidades/listagem.jsp">Cidades</a>
            </p>
            <br>
            
            
            <p>
                <a class="btn btn-default" href="${pageContext.request.contextPath}/formularios/estados/listagem.jsp">Estados</a>
            </p>
        </div>  
            <br>
            
        <p align="center">
            <a class="btn btn-default" href="${pageContext.request.contextPath}/telabemvindo.jsp">TELA PRINCIPAL</a>
        </p>

    </body>

</html>
