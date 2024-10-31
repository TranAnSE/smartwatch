# Use OpenJDK as base image
FROM openjdk:17-jdk-slim

# Install required tools
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

# Set up Tomcat
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

WORKDIR $CATALINA_HOME

# Download and install Tomcat
RUN curl -o /tmp/tomcat.tar.gz https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.31/bin/apache-tomcat-10.1.31.tar.gz && \
    tar xzvf /tmp/tomcat.tar.gz -C $CATALINA_HOME --strip-components=1 && \
    rm /tmp/tomcat.tar.gz && \
    ls -la $CATALINA_HOME/bin && \
    chmod +x $CATALINA_HOME/bin/*.sh

# Remove default webapps
RUN rm -rf $CATALINA_HOME/webapps/*

# Copy application WAR file
COPY dist/*.war $CATALINA_HOME/webapps/ROOT.war

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]