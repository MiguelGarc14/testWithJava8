#Test Efectivale con Java 8

Aplicación web enterprise clásica desarrollada con Java 8 utilizando arquitectura MVC con Spring Framework, PostgreSQL y despliegue en Docker.

---

# Arquitectura

Stack tecnológico alineado a entornos enterprise híbrido:

- Java 8
- Spring MVC
- Spring JDBC
- JSP + JSTL
- Apache Tomcat 9
- PostgreSQL
- HikariCP
- Bootstrap 5
- jQuery + Ajax
- Docker Compose

---

# Estructura del Proyecto

```text
testWithJava8/
│
├── docker-compose.yml
├── README.md
│
├── db/
│   ├── init.sql
│   └── procedures.sql
│
└── app/
    ├── Dockerfile
    ├── pom.xml
    │
    └── src/
        └── main/
            ├── java/
            │   └── com/evser/
            │       ├── config/
            │       ├── controller/
            │       ├── dao/
            │       ├── model/
            │       ├── service/
            │       └── util/
            │
            ├── resources/
            │   └── application.properties
            │
            └── webapp/
                ├── WEB-INF/
                │   ├── views/
                │   │   ├── clientes.jsp
                │   │   └── consignatarios.jsp
                │   │
                │   ├── dispatcher-servlet.xml
                │   └── web.xml
                │
                └── assets/
                    ├── js/
                    └── css/
```

---

# Características del Proyecto

## Gestión de Clientes

- Alta de clientes
- Listado de clientes
- Validaciones frontend con jQuery
- Validaciones backend
- Persistencia mediante Stored Procedures

---

## Gestión de Consignatarios

- Alta de consignatarios
- Relación con clientes
- Listado de últimos registros
- AJAX con jQuery
- Respuestas JSON

---

# Arquitectura Aplicada

El proyecto sigue una arquitectura MVC clásica:

| Capa | Responsabilidad |
|---|---|
| Controller | Manejo HTTP |
| Service | Lógica de negocio |
| DAO | Acceso a datos |
| Model | Entidades |
| Config | Beans y configuración Spring |

---

# Base de Datos

## PostgreSQL

La aplicación utiliza PostgreSQL con:

- tablas normalizadas
- stored procedures
- timestamps automáticos
- soft delete mediante campo `activo`

---

## Scripts SQL

### init.sql

Contiene:

- creación de tablas
- llaves primarias
- constraints
- índices

### procedures.sql

Contiene:

- stored procedures
- inserts
- updates
- consultas

---

# Configuración Docker

## docker-compose.yml

Servicios:

- PostgreSQL
- Aplicación Tomcat

---

# Requisitos Previos

Instalar:

- Docker Desktop
- Docker Compose

Verificar instalación:

```bash
docker --version
docker compose version
```

---

# Cómo Ejecutar el Proyecto

## 1. Clonar repositorio

```bash
git clone <URL_DEL_REPOSITORIO>
```

---

## 2. Entrar al proyecto

```bash
cd testWithJava8
```

Desde la raíz ejecutar:

```bash
docker compose up --build
```

---

# Acceso a la Aplicación

## Clientes

```text
http://localhost:8080/efectivale-app/clientes
```

## Consignatarios

```text
http://localhost:8080/efectivale-app/consignatarios
```

---

# Configuración de Base de Datos

Variables principales:

```properties
db.url=jdbc:postgresql://postgres:5432/evser
db.username=postgres
db.password=postgres
```

---

# Configuración Maven

Compilación Java 8:

```xml
<maven.compiler.source>1.8</maven.compiler.source>
<maven.compiler.target>1.8</maven.compiler.target>
```

Empaquetado:

```xml
<packaging>war</packaging>
```

---

# Dependencias Principales

## Backend

- Spring MVC
- Spring JDBC
- PostgreSQL Driver
- HikariCP
- Jackson Databind

---

## Frontend

- Bootstrap 5
- jQuery
- JSTL

---

# Flujo General

```text
JSP + jQuery
      ↓
Spring MVC Controller
      ↓
Service Layer
      ↓
DAO Layer
      ↓
Stored Procedures
      ↓
PostgreSQL
```

---

# Compatibilidad

| Tecnología | Versión |
|---|---|
| Java | 8 |
| Tomcat | 9 |
| PostgreSQL | 15 |
| Spring Framework | 5.x |
| Bootstrap | 5.3 |

---

# Validaciones Implementadas

## Frontend

- campos requeridos
- longitud mínima
- validaciones numéricas
- checkbox booleanos

## Backend

- validaciones DAO
- control de excepciones
- respuestas JSON estructuradas

---

# Mejoras Futuras

## Backend

- Spring Security
- JWT
- Swagger/OpenAPI
- Hibernate/JPA
- Tests unitarios

---

## Frontend

- Migración a React
- SPA Architecture
- Axios
- Componentización

---

# Capturas Recomendadas para README

Se recomienda agregar:

<img width="709" height="401" alt="image" src="https://github.com/user-attachments/assets/34e71b02-bc46-424a-8453-e1c77a8113b1" />

<img width="1104" height="577" alt="image" src="https://github.com/user-attachments/assets/bcc551fe-9e0a-415a-b6f1-bbf9c7fc6805" />

- formularios AJAX

<img width="675" height="942" alt="image" src="https://github.com/user-attachments/assets/c5767fe6-d8c1-4382-a5ea-fd5d56720298" />

- Docker containers corriendo
<img width="1571" height="879" alt="image" src="https://github.com/user-attachments/assets/790ed3f8-46ec-4de9-ac30-16d3c32f797c" />

- PostgreSQL conectado
<img width="1357" height="292" alt="image" src="https://github.com/user-attachments/assets/a60c4cba-7597-4316-9478-289f19a229a9" />
<img width="1357" height="292" alt="image" src="https://github.com/user-attachments/assets/5ce02a26-6f08-4166-a91a-44d1b2c4cb64" />

- estructura MVC
  <img width="380" height="755" alt="image" src="https://github.com/user-attachments/assets/341caef8-f7fd-4f7f-8a8c-2bca1d66f5e4" />


---

# Objetivo Técnico del Proyecto

Proyecto orientado a demostrar experiencia en:

- Java enterprise clásico
- Spring MVC tradicional
- JDBC puro
- arquitectura multicapa
- integración PostgreSQL
- Dockerización
- mantenimiento de aplicaciones legacy enterprise

---

# Autor

Proyecto desarrollado como ejercicio técnico full stack Java 8.
