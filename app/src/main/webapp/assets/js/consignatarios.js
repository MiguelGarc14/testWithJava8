$(document).ready(function () {

    $("#formConsignatario").submit(function (e) {

        e.preventDefault();

        let clienteId =
            $("#clienteId").val();

        let nombre =
            $("#nombre").val();

        let activo =
            $("#activo").is(":checked");

        /*
        VALIDACIONES
        */

        if (clienteId.trim() === "") {

            alert("Cliente ID requerido");

            return;
        }

        if (isNaN(clienteId)) {

            alert(
                "Cliente ID debe ser numérico"
            );

            return;
        }

        if (parseInt(clienteId) <= 0) {

            alert(
                "Cliente ID inválido"
            );

            return;
        }

        if (nombre.trim() === "") {

            alert("Nombre requerido");

            return;
        }

        if (nombre.trim().length < 3) {

            alert(
                "Nombre demasiado corto"
            );

            return;
        }

        /*
        AJAX
        */

        $.ajax({

            url:
                CONTEXT_PATH +
                "/consignatarios/guardar",

            method: "POST",

            contentType: "application/json",

            data: JSON.stringify({

                clienteId:
                    parseInt(clienteId),

                consignatarioNombre:
                    nombre,

                consignatarioActivo:
                    activo

            }),

            success: function (response) {

                /*
                OK
                */

                if (response.success) {

                    alert(response.message);

                    /*
                    NUEVA FILA
                    */

                    const nuevo =
                        response.consignatario;

                    let nuevaFila = `

                        <tr>

                            <td>
                                ${nuevo.clienteId}
                            </td>

                            <td>
                                ${nuevo.consignatarioId}
                            </td>

                            <td>
                                ${nuevo.consignatarioNombre}
                            </td>

                            <td>
                                ${nuevo.consignatarioActivo
                                    ? 'Sí'
                                    : 'No'}
                            </td>

                        </tr>
                    `;

                    /*
                    INSERTAR ARRIBA
                    */

                    $("#tablaConsignatariosBody")
                        .prepend(nuevaFila);

                    /*
                    SOLO 5 FILAS
                    */

                    if (
                        $("#tablaConsignatariosBody tr")
                        .length > 5
                    ) {

                        $("#tablaConsignatariosBody tr:last")
                            .remove();
                    }

                    /*
                    LIMPIAR FORM
                    */

                    $("#clienteId").val("");

                    $("#nombre").val("");

                    $("#activo")
                        .prop("checked", true);

                } else {

                    /*
                    ERROR CONTROLADO
                    */

                    alert(response.message);
                }
            },

            error: function (xhr) {

                /*
                ERROR HTTP
                */

                console.error(xhr);

                console.log(
                    "STATUS:",
                    xhr.status
                );

                console.log(
                    "RESPONSE:",
                    xhr.responseText
                );

                alert(
                    "Error al guardar consignatario"
                );
            }
        });

    });

});