# Use an official Maven image as the base image
FROM maven:3.8.4-openjdk-17-slim AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the source code files into the container
COPY pom.xml .
COPY src ./src

# Build the application with Maven
RUN mvn clean package

# Use an official Tomcat image as the base image for the final image
FROM tomcat:9.0.59-jdk17-openjdk-slim

# Copy the WAR file from the builder stage to the Tomcat webapps directory
COPY --from=builder /app/target/devops-app.war /usr/local/tomcat/webapps/

# Expose port 8080 to access the web application
EXPOSE 8080

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]
