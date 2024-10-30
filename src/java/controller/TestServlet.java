package controller; // Thay đổi package name theo project của bạn

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

@WebServlet(name = "TestServlet", urlPatterns = {"/test"})
public class TestServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Database Connection Test</title>");
            out.println("<style>");
            out.println("body { font-family: Arial, sans-serif; margin: 20px; }");
            out.println("h1 { color: #333; }");
            out.println(".section { margin-bottom: 20px; }");
            out.println(".variable { margin: 5px 0; padding: 5px; background-color: #f5f5f5; }");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            
            // Tiêu đề
            out.println("<h1>Database Connection Test</h1>");
            
            // System Properties
            out.println("<div class='section'>");
            out.println("<h2>System Properties:</h2>");
            out.println("<div class='variable'>DB_HOST: " + System.getProperty("DB_HOST") + "</div>");
            out.println("<div class='variable'>DB_PORT: " + System.getProperty("DB_PORT") + "</div>");
            out.println("<div class='variable'>DB_NAME: " + System.getProperty("DB_NAME") + "</div>");
            out.println("<div class='variable'>DB_USER: " + System.getProperty("DB_USER") + "</div>");
            out.println("</div>");
            
            // Environment Variables
            out.println("<div class='section'>");
            out.println("<h2>Environment Variables:</h2>");
            out.println("<div class='variable'>DB_HOST: " + System.getenv("DB_HOST") + "</div>");
            out.println("<div class='variable'>DB_PORT: " + System.getenv("DB_PORT") + "</div>");
            out.println("<div class='variable'>DB_NAME: " + System.getenv("DB_NAME") + "</div>");
            out.println("<div class='variable'>DB_USER: " + System.getenv("DB_USER") + "</div>");
            out.println("</div>");
            
            // All Environment Variables
            out.println("<div class='section'>");
            out.println("<h2>All Environment Variables:</h2>");
            Map<String, String> env = System.getenv();
            for (String key : env.keySet()) {
                out.println("<div class='variable'>" + key + ": " + env.get(key) + "</div>");
            }
            out.println("</div>");
            
            // Test Database Connection
            out.println("<div class='section'>");
            out.println("<h2>Database Connection Test:</h2>");
            try {
                dal.DBContext dbContext = new dal.DBContext(); // Thay đổi package name nếu cần
                if (dbContext.testConnection()) {
                    out.println("<div class='variable' style='color: green;'>Database connection successful!</div>");
                } else {
                    out.println("<div class='variable' style='color: red;'>Database connection failed!</div>");
                }
            } catch (Exception e) {
                out.println("<div class='variable' style='color: red;'>Error: " + e.getMessage() + "</div>");
                out.println("<div class='variable'>Stack trace:");
                out.println("<pre>");
                e.printStackTrace(new PrintWriter(out));
                out.println("</pre></div>");
            }
            out.println("</div>");
            
            out.println("</body>");
            out.println("</html>");
        }
    }
}