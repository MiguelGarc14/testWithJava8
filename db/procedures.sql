
-- CLIENTE
--Insertar cliente
CREATE OR REPLACE FUNCTION sp_agregar_cliente(
    p_nombre varchar,
    p_activo boolean
)
RETURNS int
AS
$$
DECLARE
    v_clienteid int;
BEGIN

    IF trim(p_nombre) = '' THEN
        RAISE EXCEPTION 'El nombre del cliente es obligatorio';
    END IF;

    INSERT INTO cliente(
        clientenombre,
        clienteactivo
    )
    VALUES(
        trim(p_nombre),
        p_activo
    )
    RETURNING clienteid
    INTO v_clienteid;

    RETURN v_clienteid;

END;
$$ LANGUAGE plpgsql;

--Consultar ultimos 5
CREATE OR REPLACE FUNCTION sp_consultar_clientes()
RETURNS TABLE(
    clienteid int,
    clientenombre varchar,
    clienteactivo boolean,
    clientefechacreacion timestamptz
)
AS
$$
BEGIN

    RETURN QUERY

    SELECT
        c.clienteid,
        c.clientenombre,
        c.clienteactivo,
        c.clientefechacreacion
    FROM cliente c
    ORDER BY c.clienteid DESC
    LIMIT 5;

END;
$$ LANGUAGE plpgsql;

--Actualizar cliente
CREATE OR REPLACE FUNCTION sp_actualizar_cliente(
    p_clienteid int,
    p_nombre varchar,
    p_activo boolean
)
RETURNS int
AS
$$
DECLARE
    v_rows int;
BEGIN

    UPDATE cliente
    SET
        clientenombre = trim(p_nombre),
        clienteactivo = p_activo,
        clientefechamodificacion = now()
    WHERE clienteid = p_clienteid;

    GET DIAGNOSTICS v_rows = ROW_COUNT;

    RETURN v_rows;

END;
$$ LANGUAGE plpgsql;

--CONSIGNATARIO
--Insertar
CREATE OR REPLACE FUNCTION sp_agregar_consignatario(
    p_clienteid int,
    p_nombre varchar,
    p_activo boolean
)
RETURNS int
AS
$$
DECLARE
    v_consignatarioid int;
BEGIN

    IF NOT EXISTS (
        SELECT 1
        FROM cliente
        WHERE clienteid = p_clienteid
    ) THEN

        RAISE EXCEPTION
        'El cliente no existe';

    END IF;

    INSERT INTO consignatario(
        clienteid,
        consignatarioactivo,
        consignatarionombre
    )
    VALUES(
        p_clienteid,
        p_activo,
        trim(p_nombre)
    )
    RETURNING consignatarioid
    INTO v_consignatarioid;

    RETURN v_consignatarioid;

END;
$$ LANGUAGE plpgsql;

--Consultar
CREATE OR REPLACE FUNCTION sp_consultar_consignatarios()
RETURNS TABLE(
    clienteid int,
    consignatarioid int,
    consignatarionombre varchar,
    consignatarioactivo boolean
)
AS
$$
BEGIN

    RETURN QUERY

    SELECT
        c.clienteid,
        c.consignatarioid,
        c.consignatarionombre,
        c.consignatarioactivo
    FROM consignatario c
    ORDER BY c.consignatarioid DESC
    LIMIT 5;

END;
$$ LANGUAGE plpgsql;

--Actualizar
CREATE OR REPLACE FUNCTION sp_actualizar_consignatario(
    p_clienteid int,
    p_consignatarioid int,
    p_nombre varchar,
    p_activo boolean
)
RETURNS int
AS
$$
DECLARE
    v_rows int;
BEGIN

    UPDATE consignatario
    SET
        consignatarionombre = trim(p_nombre),
        consignatarioactivo = p_activo,
        consignatariofechamodificacion = now()
    WHERE clienteid = p_clienteid
    AND consignatarioid = p_consignatarioid;

    GET DIAGNOSTICS v_rows = ROW_COUNT;

    RETURN v_rows;

END;
$$ LANGUAGE plpgsql;