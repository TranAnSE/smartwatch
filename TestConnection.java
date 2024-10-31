import java.sql.Connection;
import java.sql.DriverManager;

public class TestConnection {
    public static void main(String[] args) {
        try {
            String url = "jdbc:sqlserver://localhost:1433;"
                + "database=smartwatch;"
                + "trustServerCertificate=true;"
                + "encrypt=false;"
                + "loginTimeout=30;";
            String user = "sa";
            String password = "AnPassw0rd@123";

            System.out.println("Attempting connection...");
            Connection conn = DriverManager.getConnection(url, user, password);
            System.out.println("Connection successful!");
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
