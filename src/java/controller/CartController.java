/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Cart;

/**
 *
 * @author an
 */
public class CartController extends HttpServlet {

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
            out.println("<title>Servlet Cart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Cart at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        String username = (String) request.getSession().getAttribute("username");

        CartDAO cartDAO = new CartDAO();

        if (username == null) {
            response.sendRedirect(request.getContextPath() + "/client/login.jsp"); // Redirect to login if the user is not logged in
            return;
        }

        if ("add".equals(action) && id != null) {
            cartDAO.addToCart(username, Integer.parseInt(id));
            response.sendRedirect("cart");
            return;
        }

        if ("delete".equals(action) && id != null) {
            cartDAO.deleteFromCart(Integer.parseInt(id));
            response.sendRedirect("cart");
            return;
        }

        if ("update".equals(action) && id != null) {
            String quantityStr = request.getParameter("quantity");
            if (quantityStr != null) {
                int quantity = Integer.parseInt(quantityStr);
                cartDAO.updateCart(Integer.parseInt(id), quantity);
            }
            response.sendRedirect("cart");
            return;
        }

        List<Cart> carts = cartDAO.getCartsByUsername(username);
        request.setAttribute("carts", carts);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
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
        processRequest(request, response);
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