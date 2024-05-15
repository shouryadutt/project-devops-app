# First stage: Build the WAR file using Maven
FROM maven:3.8.1-openjdk-11 AS build
WORKDIR /app

# Copy the Maven project files to the build context
COPY pom.xml .
COPY src ./src

# Package the application as a WAR file
RUN mvn clean package

# Check if the WAR file exists (optional but useful for debugging)
RUN ls -l target/

# Second stage: Create a lightweight runtime image
FROM tomcat:9.0-jdk11-adoptopenjdk-hotspot

# Copy the WAR file from the build stage to the Tomcat webapps directory
COPY --from=build /app/target/devops-app.war /usr/local/tomcat/webapps/

# Expose the port that the Tomcat server will run on
EXPOSE 8080

# Start the Tomcat server
CMD ["catalina.sh", "run"]

