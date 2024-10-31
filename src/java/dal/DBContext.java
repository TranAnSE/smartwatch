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
            String host = System.getenv("DB_HOST") != null ? System.getenv("DB_HOST") : "localhost";
            String port = System.getenv("DB_PORT") != null ? System.getenv("DB_PORT") : "1433";
            String dbName = System.getenv("DB_NAME") != null ? System.getenv("DB_NAME") : "smartwatch";
            String username = System.getenv("DB_USER") != null ? System.getenv("DB_USER") : "sa";
            String password = System.getenv("DB_PASSWORD") != null ? System.getenv("DB_PASSWORD") : "YourStrong@Passw0rd";

            String url = String.format("jdbc:sqlserver://%s:%s;databaseName=%s;trustServerCertificate=true;encrypt=true;integratedSecurity=false",
                    host, port, dbName);

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }
}