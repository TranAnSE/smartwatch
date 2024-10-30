# Tomcat 10.1 with JDK 17
FROM tomcat:10.1-jdk17-temurin

# Remove default Tomcat Application
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy war file into webapps
COPY dist/*.war /usr/local/tomcat/webapps/ROOT.war

# Create setenv.sh to pass environment variables to Tomcat
RUN echo '#!/bin/bash\n\
JAVA_OPTS="$JAVA_OPTS \
-DDB_HOST=$DB_HOST \
-DDB_PORT=$DB_PORT \
-DDB_NAME=$DB_NAME \
-DDB_USER=$DB_USER \
-DDB_PASSWORD=$DB_PASSWORD"\n\
export JAVA_OPTS' > /usr/local/tomcat/bin/setenv.sh

RUN chmod +x /usr/local/tomcat/bin/setenv.sh

# Create a wrapper script
RUN echo '#!/bin/bash\n\
source /usr/local/tomcat/bin/setenv.sh\n\
exec catalina.sh run' > /usr/local/tomcat/bin/startup.sh

RUN chmod +x /usr/local/tomcat/bin/startup.sh

# Expose port 8080
EXPOSE 8080

# Start Tomcat using the wrapper script
CMD ["/usr/local/tomcat/bin/startup.sh"]