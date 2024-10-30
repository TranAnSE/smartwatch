#!/bin/bash
set -e

# Start SQL Server
/opt/mssql/bin/sqlservr & 

# Wait for SQL Server to start
echo "Waiting for SQL Server to start..."
sleep 30

# Run initialization script
echo "Running initialization script..."
/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -i /docker-entrypoint-initdb.d/init.sql

# Keep container running
wait $!