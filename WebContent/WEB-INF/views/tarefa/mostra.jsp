<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Alterar tarefa - ${tarefa.id}</title>
    </head>
    <body>
        <h3>Alterar tarefa - ${tarefa.id}</h3>

        <form action="alteraTarefa" method="post">
            <input type="hidden" name="id" value="${tarefa.id}" />

            Descri��o: <br />
            <textarea name="descricao" rows="5" cols="100">${tarefa.descricao}</textarea> <br />

            Finalizado? <input type="checkbox" name="finalizado" value="true" ${tarefa.finalizado ? 'checked' : ''} /> <br />

            Data de finaliza��o: <br />
            <input type="text" name="dataFinalizacao" value="<fmt:formatDate value='${tarefa.dataFinalizacao.time}' pattern='dd/MM/yyyy' />" /> <br />

            <input type="submit" value="Alterar" />
        </form>
    </body>
</html>