CREATE TABLE cliente (

clienteid serial,

clienteactivo bool NOT NULL,

clientenombre varchar NOT NULL,

clientefechacreacion timestamptz(3) NOT NULL DEFAULT now(),

clientefechamodificacion timestamptz(3) NOT NULL DEFAULT now(),

CONSTRAINT cliente_pkey PRIMARY KEY (clienteid)

);

CREATE TABLE consignatario (

clienteid int4 NOT NULL,

consignatarioid serial,

consignatarioactivo bool NOT NULL,

consignatarionombre varchar NOT NULL,

consignatariofechacreacion timestamptz(3) NOT NULL DEFAULT now(),

consignatariofechamodificacion timestamptz(3) NOT NULL DEFAULT now(),

CONSTRAINT consignatario_pkey PRIMARY KEY (clienteid, consignatarioid),

constraint consignatario_clienteid_fk FOREIGN KEY (clienteid)
REFERENCES cliente(clienteid)

);