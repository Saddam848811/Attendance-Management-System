# Use an official Maven image to build the project
FROM maven:3.9.9-ibm-semeru-23-jammy AS build

# Set the working directory
WORKDIR /app

# Copy the Maven POM file and source code
COPY . /app

# Run Maven to build the project and package it as a JAR
RUN mvn clean install

# Use a slim Java runtime image to run the JAR file
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the build container
COPY --from=build /app/target/attendanceback01-0.0.1-SNAPSHOT.jar /app/attendanceback01.jar

# Expose the application port (default Spring Boot port is 8080)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "attendanceback01.jar"]
