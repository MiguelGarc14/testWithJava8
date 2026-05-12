FROM maven:3.8.6-openjdk-8-slim AS build

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

RUN ls -la /app/target

FROM tomcat:9.0-jdk8-temurin

COPY --from=build \
/app/target/efectivale-app.war \
/usr/local/tomcat/webapps/efectivale-app.war

EXPOSE 8080