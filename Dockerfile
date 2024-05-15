# Use the official Tomcat image from the Docker Hub
FROM tomcat:9.0

# Remove the default webapps from Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file to the Tomcat webapps directory
COPY path/to/your-app.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
