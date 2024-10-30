# Tomcat 10.1 with JDK 17
FROM tomcat:10.1-jdk17-temurin

# Remove default Tomcat Application
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy war file into webapps
COPY dist/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Khởi động Tomcat
CMD ["catalina.sh", "run"]
