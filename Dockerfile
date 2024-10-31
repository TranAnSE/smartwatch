# Base image for SQL Server
FROM mcr.microsoft.com/mssql/server:2022-latest as db

USER root

# Install curl and dependencies
RUN apt-get update && \
    apt-get install -y curl gnupg2 openjdk-17-jdk && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y mssql-tools18 unixodbc-dev && \
    rm -rf /var/lib/apt/lists/*

# Set up ODBC configuration
RUN echo "[ODBC Driver 18 for SQL Server]" > /etc/odbc.ini && \
    echo "Driver = ODBC Driver 18 for SQL Server" >> /etc/odbc.ini && \
    echo "TrustServerCertificate = yes" >> /etc/odbc.ini && \
    echo "Encrypt = no" >> /etc/odbc.ini

# Add SQL Server tools to PATH
ENV PATH="/opt/mssql-tools18/bin:${PATH}"

# Copy init script
COPY ./scripts/init.sql /docker-entrypoint-initdb.d/
COPY ./scripts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Tomcat installation
FROM tomcat:10.1-jdk17-temurin as tomcat

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy war file to webapps
COPY dist/*.war /usr/local/tomcat/webapps/ROOT.war

# Start both SQL Server and Tomcat
COPY --from=db /entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose ports for Tomcat and SQL Server
EXPOSE 8080 1433

# Start the combined services
CMD ["/entrypoint.sh"]
