#!/bin/bash

# Start SQL Server
/opt/mssql/bin/sqlservr &

# Run the setup script
./setup.sh

# Keep container running
tail -f /dev/null