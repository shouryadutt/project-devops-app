# Stage 1: Build the application using Maven
FROM maven:3.8.4-openjdk-11 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml and source code to the container
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package

# Stage 2: Run the application using Tomcat
FROM tomcat:9.0-jdk11-openjdk-slim

# Copy the WAR file from the Maven build stage to the Tomcat webapps directory
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]

