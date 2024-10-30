package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DatabaseTest {
    public static void main(String[] args) {
        String url = "jdbc:sqlserver://localhost:1433;databaseName=smartwatch";
        String username = "sa";
        String password = "quocan12";

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection connection = DriverManager.getConnection(url, username, password);
            if (connection != null) {
                System.out.println("Connected to the database!");
                // Optional: Run a simple query to verify the connection further
                String query = "SELECT 1";
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                if (rs.next()) {
                    System.out.println("Query executed successfully!");
                }
                rs.close();
                stmt.close();
            } else {
                System.out.println("Failed to connect to the database.");
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
