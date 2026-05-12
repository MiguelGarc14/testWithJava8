<%@ page contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>

<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">

    <title>Consignatarios</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

</head>

<body class="container mt-5">

<h2>Consignatarios</h2>

<form id="formConsignatario">

    <div class="mb-3">

        <label class="form-label">

            Cliente ID

        </label>

        <input
            type="number"
            id="clienteId"
            class="form-control"
            placeholder="Cliente ID">

    </div>

    <div class="mb-3">

        <label class="form-label">

            Nombre

        </label>

        <input
            type="text"
            id="nombre"
            class="form-control"
            placeholder="Nombre consignatario">

    </div>

    <div class="form-check mb-3">

        <input
            class="form-check-input"
            type="checkbox"
            id="activo"
            checked>

        <label class="form-check-label">

            Activo

        </label>

    </div>

    <button
        type="submit"
        class="btn btn-primary">

        Guardar

    </button>

</form>

<hr>

<h4>Últimos 5 consignatarios</h4>

<table class="table table-bordered">

    <thead>

    <tr>

        <th>Cliente ID</th>

        <th>Consignatario ID</th>

        <th>Nombre</th>

        <th>Activo</th>

    </tr>

    </thead>

    <!-- IMPORTANTE -->
    <tbody id="tablaConsignatariosBody">

    <c:forEach items="${consignatarios}" var="c">

        <tr>

            <td>${c.clienteId}</td>

            <td>${c.consignatarioId}</td>

            <td>${c.consignatarioNombre}</td>

            <td>

                <c:choose>

                    <c:when test="${c.consignatarioActivo}">

                        Sí

                    </c:when>

                    <c:otherwise>

                        No

                    </c:otherwise>

                </c:choose>

            </td>

        </tr>

    </c:forEach>

    </tbody>

</table>

<a
    href="${pageContext.request.contextPath}/clientes"
    class="btn btn-secondary mb-3">

    Ir a Clientes

</a>

<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- Context path global -->
<script>

    const CONTEXT_PATH =
        "${pageContext.request.contextPath}";

</script>

<!-- JS desacoplado -->
<script
    src="${pageContext.request.contextPath}/assets/js/consignatarios.js">

</script>

</body>

</html>