#!/bin/bash
set -e

# Start SQL Server in the background
/opt/mssql/bin/sqlservr & 

# Wait for SQL Server to start
echo "Waiting for SQL Server to start..."
sleep 30

# Function to test SQL connection
function test_connection() {
    /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -Q "SELECT 1" -C -N > /dev/null 2>&1
    return $?
}

# Wait for SQL Server to be ready
echo "Waiting for SQL Server to be ready..."
for i in {1..60}; do
    if test_connection; then
        echo "SQL Server is ready"
        break
    fi
    echo "Waiting... $i/60"
    sleep 1
done

# Run initialization script
echo "Running initialization script..."
/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -i /docker-entrypoint-initdb.d/init.sql -C -N -t 30

# Start Tomcat
echo "Starting Tomcat..."
catalina.sh run
