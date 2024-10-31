package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    protected Connection connection;

    public DBContext() {
        try {
            String host = System.getenv("DB_HOST") != null ? System.getenv("DB_HOST") : "localhost";
            String port = System.getenv("DB_PORT") != null ? System.getenv("DB_PORT") : "1433";
            String dbName = System.getenv("DB_NAME") != null ? System.getenv("DB_NAME") : "smartwatch";
            String username = System.getenv("DB_USER") != null ? System.getenv("DB_USER") : "sa";
            String password = System.getenv("DB_PASSWORD") != null ? System.getenv("DB_PASSWORD") : "YourStrong@Passw0rd";

            // Build connection URL with boolean values as "true" or "false" strings
            String connectionUrl = String.format(
                "jdbc:sqlserver://%s:%s;"
                + "database=%s;"
                + "user=%s;"
                + "password=%s;"
                + "encrypt=true;"  // Changed from false to true
                + "trustServerCertificate=true",  // Removed semicolon from the end
                host, port, dbName, username, password);

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(connectionUrl);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Database Connection Error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }
}