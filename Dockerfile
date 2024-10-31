FROM tomcat:10.1.31-jdk17

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Install wget to download JDBC driver
RUN apt-get update && apt-get install -y wget

# Download and install SQL Server JDBC driver
RUN wget https://go.microsoft.com/fwlink/?linkid=2245145 -O /usr/local/tomcat/lib/mssql-jdbc.jar

# Copy your WAR file to webapps directory
COPY dist/*.war /usr/local/tomcat/webapps/ROOT.war

# Create Tomcat user
RUN groupadd -r tomcat && \
  useradd -r -g tomcat tomcat && \
  chown -R tomcat:tomcat /usr/local/tomcat

# Switch to non-root user
USER tomcat

# Expose port 8080
EXPOSE 8080