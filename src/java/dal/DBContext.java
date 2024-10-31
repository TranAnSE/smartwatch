/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author an
 */
public class DBContext {

    protected Connection connection;

    public DBContext() {
        try {
            // Lấy biến môi trường
            String host = System.getenv().getOrDefault("DB_HOST", "localhost");
            String port = System.getenv().getOrDefault("DB_PORT", "1433");
            String dbName = System.getenv("DB_NAME");
            String username = System.getenv("DB_USER");
            String password = System.getenv("DB_PASSWORD");

            // Kiểm tra nếu biến môi trường bị thiếu
            if (dbName == null || username == null || password == null) {
                throw new IllegalArgumentException("Missing environment variables for DB connection.");
            }

            // Kết nối URL
            String url = String.format("jdbc:sqlserver://%s:%s;"
                    + "database=%s;"
                    + "trustServerCertificate=true;"
                    + "encrypt=false;"
                    + "integratedSecurity=false;" // Thêm dòng này
                    + "loginTimeout=30;",
                    host, port, dbName);

            System.out.println("Attempting to connect to the database...");
            // Nạp driver và kết nối
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
            System.out.println("Database connected successfully");
            System.out.println("Connection URL: " + url);
            System.out.println("Username: " + username);
            System.out.println("Database Name: " + dbName);

        } catch (ClassNotFoundException ex) {
            System.out.println("Database Connection Creation Failed: Driver not found");
            ex.printStackTrace();
        } catch (SQLException ex) {
            System.out.println("Database Connection Creation Failed");
            System.out.println("Error message: " + ex.getMessage());
            ex.printStackTrace();
        } catch (IllegalArgumentException ex) {
            System.out.println("Configuration error: " + ex.getMessage());
        }
    }

    public void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException ex) {
            System.out.println("Error closing connection: " + ex.getMessage());
        }
    }

    // Phương thức kiểm tra kết nối
    public boolean testConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                System.out.println("Database connection is active.");
                return true;
            }
        } catch (SQLException ex) {
            System.out.println("Error checking connection: " + ex.getMessage());
        }
        return false;
    }
}
