#!/bin/bash
set -e

# Start SQL Server in the background
/opt/mssql/bin/sqlservr -T 4022 & 

# Wait for SQL Server to start
echo "Waiting for SQL Server to start..."
sleep 30

# Function to test SQL connection
function test_connection() {
    /opt/mssql-tools18/bin/sqlcmd \
        -S localhost \
        -U sa \
        -P "$MSSQL_SA_PASSWORD" \
        -Q "SELECT @@VERSION" \
        -C \
        -N \
        -t 30 \
        -b \
        -E
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

# Verify SQL Server configuration
echo "Verifying SQL Server configuration..."
/opt/mssql-tools18/bin/sqlcmd \
    -S localhost \
    -U sa \
    -P "$MSSQL_SA_PASSWORD" \
    -Q "SELECT name, value, value_in_use FROM sys.configurations WHERE name LIKE '%certificate%' OR name LIKE '%encrypt%'" \
    -C \
    -N

# Run initialization script
echo "Running initialization script..."
/opt/mssql-tools18/bin/sqlcmd \
    -S localhost \
    -U sa \
    -P "$MSSQL_SA_PASSWORD" \
    -i /docker-entrypoint-initdb.d/init.sql \
    -C \
    -N \
    -b
    
# Start Tomcat
echo "Starting Tomcat..."
/usr/local/tomcat/bin/catalina.sh run
