/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author an
 */
public class RegisterController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Register</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("username") != null) {
            response.sendRedirect("home");
            return;
        }
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        // Check if passwords match
        if (!password1.equals(password2)) {
            setErrorAttributes(request, username, fullname, phone, email, "Passwords do not match");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Check username length
        if (username.length() < 5 || username.length() > 20) {
            setErrorAttributes(request, username, fullname, phone, email, "Username must be between 5 and 20 characters");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Check password length
        if (password1.length() < 8 || password2.length() < 8 || password1.length() >= 64 || password2.length() >= 64) {
            setErrorAttributes(request, username, fullname, phone, email, "Password must be between 8 and 64 characters");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Check fullname length and words count
        if (fullname.length() < 3 || fullname.length() > 30 || fullname.trim().split("\\s+").length < 2) {
            setErrorAttributes(request, username, fullname, phone, email, "Full name must be between 3 and 30 characters and contain at least 2 words");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Check phone validity
        if (!phone.matches("\\d{10}")) {
            setErrorAttributes(request, username, fullname, phone, email, "Phone number must be 10 digits");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // If all validations pass, insert user
        UserDAO userDAO = new UserDAO();
        User user = new User(username, password1, fullname, phone, email, 1, 2);
        userDAO.insertUser(user);

        // Set success message and forward to register.jsp
        request.setAttribute("success", "Registration successful! Redirecting to login page in 5 seconds...");
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
// Helper method to set error attributes

    private void setErrorAttributes(HttpServletRequest request, String username, String fullname, String phone, String email, String error) {
        request.setAttribute("username", username);
        request.setAttribute("fullname", fullname);
        request.setAttribute("phone", phone);
        request.setAttribute("email", email);
        request.setAttribute("error", error);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
