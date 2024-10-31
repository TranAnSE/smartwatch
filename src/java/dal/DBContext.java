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
            String host = System.getenv("DB_HOST");
            String port = System.getenv("DB_PORT");
            String dbName = System.getenv("DB_NAME");
            String username = System.getenv("DB_USER");
            String password = System.getenv("DB_PASSWORD");

            String url = String.format("jdbc:sqlserver://%s:%s;"
                    + "database=%s;"
                    + "user=%s;"
                    + "password=%s;"
                    + "trustServerCertificate=true;"
                    + "encrypt=false;"
                    + "loginTimeout=30;",
                    host, port, dbName, username, password);

            System.out.println("Attempting to connect with URL: " + url);

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url);
            System.out.println("Database connected successfully");
        } catch (ClassNotFoundException ex) {
            System.out.println("Database Connection Creation Failed: Driver not found");
            ex.printStackTrace();
        } catch (SQLException ex) {
            System.out.println("Database Connection Creation Failed");
            System.out.println("Error message: " + ex.getMessage());
            System.out.println("SQL State: " + ex.getSQLState());
            System.out.println("Error Code: " + ex.getErrorCode());
            ex.printStackTrace();
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
