/* * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template */package dal;import java.net.Socket;import java.sql.ResultSet;import java.sql.Statement;import java.sql.Connection;import java.sql.DriverManager;import java.sql.SQLException;import java.util.Map;import java.util.Properties;/** * * @author an */public class DBContext {    protected Connection connection;    public DBContext() {        try {            // Debug environment variables            System.out.println("=== Environment Variables ===");            System.out.println("DB_HOST (env): " + System.getenv("DB_HOST"));            System.out.println("DB_HOST (prop): " + System.getProperty("DB_HOST"));            // Try to get host from both environment and system properties            String host = System.getProperty("DB_HOST");            if (host == null || host.trim().isEmpty()) {                host = System.getenv("DB_HOST");            }            if (host == null || host.trim().isEmpty()) {                host = "db"; // default value            }            // Get other connection parameters            String port = getConnectionParameter("DB_PORT", "1433");            String dbName = getConnectionParameter("DB_NAME", "smartwatch");            String username = getConnectionParameter("DB_USER", "sa");            String password = getConnectionParameter("DB_PASSWORD", "CZR#1*QZMpN0zx0b");            System.out.println("=== Connection Parameters ===");            System.out.println("Host: " + host);            System.out.println("Port: " + port);            System.out.println("Database: " + dbName);            System.out.println("Username: " + username);            String url = String.format("jdbc:sqlserver://%s:%s;"                    + "databaseName=%s;"                    + "encrypt=true;"                    + "trustServerCertificate=true;"                    + "loginTimeout=30;",                    host, port, dbName);            System.out.println("Connection URL: " + url);            // Test network connectivity            try {                System.out.println("Testing network connectivity to " + host + ":" + port);                Socket socket = new Socket(host, Integer.parseInt(port));                System.out.println("Network connection successful!");                socket.close();            } catch (Exception e) {                System.out.println("Network connection failed: " + e.getMessage());                e.printStackTrace();            }            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");            connection = DriverManager.getConnection(url, username, password);            System.out.println("Database connected successfully");        } catch (ClassNotFoundException | SQLException ex) {            System.out.println("Database Connection Creation Failed : " + ex.getMessage());            ex.printStackTrace();        }    }    private String getConnectionParameter(String key, String defaultValue) {        String value = System.getProperty(key);        if (value == null || value.trim().isEmpty()) {            value = System.getenv(key);        }        if (value == null || value.trim().isEmpty()) {            System.out.println("Warning: Parameter " + key + " not found, using default: " + defaultValue);            return defaultValue;        }        return value;    }    public boolean testConnection() {        try {            if (connection != null && !connection.isClosed()) {                // Test the connection                try (java.sql.Statement stmt = connection.createStatement()) {                    java.sql.ResultSet rs = stmt.executeQuery("SELECT 1");                    return rs.next();                }            }        } catch (java.sql.SQLException e) {            System.out.println("Test connection failed: " + e.getMessage());            e.printStackTrace();        }        return false;    }}