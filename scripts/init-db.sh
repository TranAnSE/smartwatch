#!/bin/bash
set -e

# Start SQL Server
/opt/mssql/bin/sqlservr &

# Wait for SQL Server to start
echo "Waiting for SQL Server to start..."
sleep 30s

# Run the initialization script with SSL trust
/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -d master -i /usr/src/app/init.sql -C -N

# Keep container running
tail -f /dev/null