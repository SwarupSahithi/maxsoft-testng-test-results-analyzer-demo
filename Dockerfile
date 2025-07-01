# Use Maven image with JDK 8
FROM maven:3.6.3-jdk-8 AS build

# Set working directory
WORKDIR /app

# Copy the pom.xml and download dependencies
COPY pom.xml .

# Download dependencies first (to cache them)
RUN mvn dependency:go-offline

# Copy the rest of the project files
COPY . .

# Build the project and run tests
RUN mvn clean test

# You can also copy the compiled jar or reports if needed
# Example: COPY target/*.jar /output/
