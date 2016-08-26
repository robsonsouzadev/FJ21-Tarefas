<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Lista de tarefas</title>
        <script src="<c:url value='/resources/js/jquery.js' />"></script>
    </head>
    <body>
        <script>
            function finalizaAgora(id) {
            	$.post("finalizaTarefa", {'id' : id}, function() {
            		$("#tarefa_" + id).html("Finalizado");
            	})
            }

            function removeAgora(id) {
            	$.post("removeTarefa", {'id' : id}, function() {
            		$("#tarefa_" + id).closest("tr").remove();
            	})
            }
        </script>

        <a href="novaTarefa">Criar tarefa</a>

        <br /> <br />

        <table>
            <tr>
                <td>ID</td>
                <td>Descrição</td>
                <td>Finalizado?</td>
                <td>Data de finalização</td>
            </tr>

            <c:forEach var="tarefa" items="${tarefas}">
                <tr>
                    <td>${tarefa.id}</td>
                    <td>${tarefa.descricao}</td>
                    <c:if test="${tarefa.finalizado eq false}">
                        <td id="tarefa_${tarefa.id}">
                            <a href="#" onclick="finalizaAgora(${tarefa.id})">Finalizar agora!</a>
                        </td>
                    </c:if>
                    <c:if test="${tarefa.finalizado eq true}">
                        <td>Finalizado</td>
                    </c:if>
                    <td><fmt:formatDate value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy" /></td>
                    <td><a href="#" onclick="removeAgora(${tarefa.id})">Remover</a></td>
                    <td><a href="mostraTarefa?id=${tarefa.id}">Alterar</a></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>