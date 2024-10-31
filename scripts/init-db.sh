set -e

# Start SQL Server
/opt/mssql/bin/sqlservr &

# Wait for SQL Server to be ready
for i in {1..50};
do
  if /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -Q "SELECT 1" &> /dev/null; then
      echo "SQL Server is ready"
      break
  fi
  echo "Waiting for SQL Server to start..."
  sleep 1
done

# Create and initialize the database
echo "Initializing database..."
/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -i /usr/src/app/init.sql -C -N -b

# Keep container running
tail -f /dev/null