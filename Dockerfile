# Use Tomcat 10.1.31 with JDK 17
FROM tomcat:10.1.31-jdk17

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file to webapps directory
COPY dist/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080