#!/bin/bash
set -e

# Start SQL Server
/opt/mssql/bin/sqlservr &

# Wait for SQL Server to start
echo "Waiting for SQL Server to start..."
sleep 30s

# Initialize the database with SSL certificate verification disabled
/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -i /usr/src/app/init.sql -C -N -b

# Keep container running
tail -f /dev/null