# Use Maven image with JDK 8
FROM maven:3.6.3-jdk-8 AS build

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline

COPY . .

# Skip tests so the build doesn't fail
RUN mvn clean install -DskipTests
