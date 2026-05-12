<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>

<head>

    <title>Clientes</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

</head>

<body class="container mt-5">

<h2>Clientes</h2>

<form id="formCliente">

    <input
        type="text"
        id="nombre"
        class="form-control"
        placeholder="Nombre">

    <button
        type="submit"
        class="btn btn-primary mt-3">

        Guardar

    </button>

</form>

<hr>

<table class="table table-bordered">

    <thead>

    <tr>

        <th>ID</th>

        <th>Nombre</th>

    </tr>

    </thead>

    <tbody id="tablaClientesBody">

    <c:forEach items="${clientes}" var="c">

        <tr>

            <td>${c.clienteId}</td>

            <td>${c.clienteNombre}</td>

        </tr>

    </c:forEach>

    </tbody>

</table>

<a
    href="${pageContext.request.contextPath}/consignatarios"
    class="btn btn-secondary mb-3">

    Ir a Consignatarios

</a>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script>

    const CONTEXT_PATH =
        "${pageContext.request.contextPath}";

</script>

<script
    src="${pageContext.request.contextPath}/assets/js/clientes.js">

</script>

</body>

</html>