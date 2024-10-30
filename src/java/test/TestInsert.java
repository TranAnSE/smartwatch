/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

/**
 *
 * @author an
 */
import dal.UserDAO;
import model.User;

public class TestInsert {

    public static void main(String[] args) {
        // Test user data
        String username = "testUser";
        String password = "testPassword";
        String fullName = "Test User";
        String phone = "1234567890";
        String email = "testuser@example.com";
        int status = 1; // Active user
        int role = 2; // User role

        // Create User object
        User testUser = new User(username, password, fullName, phone, email, status, role);

        // Insert user into database
        UserDAO userDAO = new UserDAO();
        userDAO.insertUser(testUser);

        System.out.println("Test user inserted successfully.");
    }
}
