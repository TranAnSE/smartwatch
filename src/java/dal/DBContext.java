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
            // Edit URL, username, password to authenticate with your MS SQL Server
            String url = "jdbc:sqlserver://localhost:1433;databaseName=smartwatch;trustServerCertificate=true;encrypt=optional;integratedSecurity=false";
            String username = "sa";
            String password = "YourStrong@Passw0rd";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }
}

//Test Database Connection

//package dal;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.SQLException;
//
///**
// *
// * @author an
// */
//public class DBContext {
//    protected Connection connection;
//
//    public DBContext() {
//        try {
//            // Edit URL, username, password to authenticate with your MS SQL Server
//            String url = "jdbc:sqlserver://localhost:1433;databaseName=smartwatch";
//            String username = "sa";
//            String password = "123456789";
//            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//            connection = DriverManager.getConnection(url, username, password);
//            System.out.println("Connection successful!");
//        } catch (ClassNotFoundException | SQLException ex) {
//            System.out.println("Connection failed: " + ex.getMessage());
//        }
//    }
//
//    // Method to test the connection
//    public boolean testConnection() {
//        try {
//            if (connection != null && !connection.isClosed()) {
//                System.out.println("Database connection is active.");
//                return true;
//            } else {
//                System.out.println("Database connection is closed or null.");
//            }
//        } catch (SQLException ex) {
//            System.out.println("Error checking connection: " + ex.getMessage());
//        }
//        return false;
//    }
//
//    public static void main(String[] args) {
//        DBContext dbContext = new DBContext();
//        dbContext.testConnection();
//    }
//}