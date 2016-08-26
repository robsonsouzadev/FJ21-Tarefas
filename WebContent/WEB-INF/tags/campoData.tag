<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ attribute name="id" required="true" %>
<%@ attribute name="value" required="false" type="java.util.Date" %>

<fmt:formatDate value="${value}" pattern="dd/MM/yyyy" var="data" />
<input type="text" id="${id}" name="${id}" value="${data}"/>

<script>
    $("#${id}").datepicker(
        {dateFormat : 'dd/mm/yy',
         changeYear : true,
         changeMonth : true}
    );
</script>