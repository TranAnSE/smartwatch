#!/bin/bash
set -e

# Start SQL Server
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
COUNTER=0
MAX_TRIES=60
until test_connection || [ $COUNTER -eq $MAX_TRIES ]; do
    echo "Attempt $COUNTER of $MAX_TRIES..."
    ((COUNTER++))
    sleep 1
done

if [ $COUNTER -eq $MAX_TRIES ]; then
    echo "Failed to connect to SQL Server after $MAX_TRIES attempts"
    exit 1
fi

echo "SQL Server is ready"

# Verify SQL Server connection and password
echo "Verifying SQL Server connection..."
/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -Q "SELECT @@VERSION" -C -N || {
    echo "Failed to connect to SQL Server with provided credentials"
    exit 1
}

# Run initialization script
echo "Running initialization script..."
/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -i /docker-entrypoint-initdb.d/init.sql -C -N -t 30

# Start Tomcat
echo "Starting Tomcat..."
/usr/local/tomcat/bin/catalina.sh run
