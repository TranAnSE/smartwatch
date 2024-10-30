## How to deploy with Docker:

1. **Windows Server:**
   - Step 1: Install Docker Desktop
     ```
     winget install Docker.DockerDesktop
     ```
   - Step 2: Clone your repository and start the project
     ```
     git clone https://github.com/TranAnSE/smartwatch.git
     cd smartwatch
     docker compose up -d
     ```

2. **Ubuntu/Debian Server:**
   - Step 1: Install Docker and Docker Compose
     ```
     curl -fsSL https://get.docker.com -o get-docker.sh
     sudo sh get-docker.sh
     sudo apt-get install docker-compose-plugin
     ```
   - Step 2: Clone your repository and start the project
     ```
     git clone https://github.com/TranAnSE/smartwatch.git
     cd smartwatch
     docker compose up -d
     ```
   - Check SQL server status:
     ```
     chmod +x scripts/wait-for-it.sh
     ```
   - Check container log:
     ```
     docker-compose logs db
     ```