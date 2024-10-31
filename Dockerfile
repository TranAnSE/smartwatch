# Sử dụng image SQL Server làm base
FROM mcr.microsoft.com/mssql/server:2022-latest

# Cài đặt các công cụ cần thiết
USER root
RUN apt-get update && apt-get install -y curl gnupg2 openjdk-17-jdk && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y mssql-tools18 unixodbc-dev && \
    rm -rf /var/lib/apt/lists/*

# Thêm SQL Server tools vào PATH
ENV PATH="/opt/mssql-tools18/bin:${PATH}"

# Cấu hình driver ODBC cho SQL Server
RUN echo "[ODBC Driver 18 for SQL Server]" > /etc/odbc.ini && \
    echo "Driver = ODBC Driver 18 for SQL Server" >> /etc/odbc.ini && \
    echo "TrustServerCertificate = yes" >> /etc/odbc.ini && \
    echo "Encrypt = no" >> /etc/odbc.ini

# Thiết lập Tomcat
RUN mkdir -p /usr/local/tomcat
ENV CATALINA_HOME /usr/local/tomcat
RUN curl -o /tmp/tomcat.tar.gz https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.31/bin/apache-tomcat-10.1.31.tar.gz && \
    tar xzvf /tmp/tomcat.tar.gz -C /usr/local/tomcat --strip-components=1 && \
    rm /tmp/tomcat.tar.gz
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy ứng dụng vào thư mục webapps của Tomcat
COPY dist/*.war /usr/local/tomcat/webapps/ROOT.war

# Copy các script khởi động và script SQL
COPY ./scripts/init.sql /docker-entrypoint-initdb.d/init.sql
COPY ./scripts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose các cổng cần thiết
EXPOSE 8080 1433

# Khởi động SQL Server và Tomcat từ entrypoint script
ENTRYPOINT ["/entrypoint.sh"]