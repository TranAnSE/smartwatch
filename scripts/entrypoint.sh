#!/bin/bash

# Start SQL Server
/opt/mssql/bin/sqlservr & 

# Wait for SQL Server to start
sleep 30s

# Run initialization script with TrustServerCertificate=yes
/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -i /docker-entrypoint-initdb.d/init.sql -C -N -t 30 -b -e

# Keep container running
wait $!