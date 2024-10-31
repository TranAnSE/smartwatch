# Use official OpenJDK image as base
FROM openjdk:17-jdk

# Install required tools and update GPG keys
RUN apt-get update && \
    apt-get install -y wget gnupg2 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 648ACFD622F3D138 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DCC9EFBF77E11517 && \
    apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

# Set up Tomcat
RUN mkdir -p /usr/local/tomcat
ENV CATALINA_HOME /usr/local/tomcat

# Download and install Tomcat
RUN curl -o /tmp/tomcat.tar.gz https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.31/bin/apache-tomcat-10.1.31.tar.gz && \
    tar xzvf /tmp/tomcat.tar.gz -C /usr/local/tomcat --strip-components=1 && \
    rm /tmp/tomcat.tar.gz

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy application WAR file
COPY dist/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]