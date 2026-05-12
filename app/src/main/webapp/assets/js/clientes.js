$(document).ready(function () {

    $("#formCliente").submit(function (e) {

        e.preventDefault();

        let nombre = $("#nombre").val();

        /*
        VALIDACIONES
        */

        if (nombre.trim() === "") {

            alert("Nombre requerido");

            return;
        }

        if (nombre.trim().length < 3) {

            alert("El nombre debe tener mínimo 3 caracteres");

            return;
        }

        /*
        AJAX
        */

        $.ajax({

            url: CONTEXT_PATH + "/clientes/guardar",

            method: "POST",

            contentType: "application/json",

            data: JSON.stringify({

                clienteNombre: nombre,

                clienteActivo: true

            }),

            success: function (response) {

                /*
                RESPUESTA EXITOSA
                */

                if (response.success) {

                    alert(response.message);

                    /*
                    CONSTRUIR NUEVA FILA
                    */

                    let nuevaFila = `

                        <tr>

                            <td>${response.clienteId}</td>

                            <td>${response.clienteNombre}</td>

                        </tr>
                    `;

                    /*
                    INSERTAR ARRIBA
                    */

                    $("#tablaClientesBody")
                        .prepend(nuevaFila);

                    /*
                    SOLO MANTENER 5 FILAS
                    */

                    if ($("#tablaClientesBody tr").length > 5) {

                        $("#tablaClientesBody tr:last")
                            .remove();
                    }

                    /*
                    LIMPIAR FORMULARIO
                    */

                    $("#nombre").val("");

                } else {

                    /*
                    ERROR CONTROLADO
                    */

                    alert(response.message);
                }
            },

            error: function (xhr) {

                /*
                ERROR HTTP / SERVIDOR
                */

                console.error(xhr);

                console.log(xhr.responseText);

                alert("Error del servidor");
            }
        });

    });

});