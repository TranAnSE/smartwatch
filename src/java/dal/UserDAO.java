/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

/**
 *
 * @author an
 */
public class UserDAO extends DBContext {

    public User authenticate(String username, String password) {
        String sql = "SELECT * FROM users WHERE Username = ? AND Password = HASHBYTES('MD5', ?) AND Status = 1";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUsername(rs.getString("Username"));
                user.setFullName(rs.getString("Fullname"));
                user.setRole(rs.getInt("Role"));
                user.setStatus(rs.getInt("Status"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void insertUser(User user) {
//        String sql = "INSERT INTO users (username, password, fullName, phone, email, status, role) VALUES (?, md5(?), ?, ?, ?, ?, ?)";
        String sql = "INSERT INTO users (Username, Password, Fullname, Phone, Email, Status, Role) VALUES (?, HASHBYTES('MD5', ?), ?, ?, ?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFullName());
            statement.setString(4, user.getPhone());
            statement.setString(5, user.getEmail());
            statement.setInt(6, user.getStatus());
            statement.setInt(7, user.getRole());
            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

    public User getUserByUsername(String username) {
        User user = null;
        String sql = "SELECT * FROM users WHERE Username = ?";
        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User(rs.getString("Username"), rs.getString("Password"), rs.getString("FullName"), rs.getString("Phone"), rs.getString("Email"), rs.getInt("Status"), rs.getInt("Role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setUsername(resultSet.getString("Username"));
                user.setFullName(resultSet.getString("FullName"));
                user.setPhone(resultSet.getString("Phone"));
                user.setEmail(resultSet.getString("Email"));
                user.setStatus(resultSet.getInt("Status"));
                user.setRole(resultSet.getInt("Role"));
                users.add(user);
            }
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public void updateUser(String username, int status, int role) {
        String sql = "UPDATE users SET Status = ?, Role = ? WHERE Username = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, status);
            statement.setInt(2, role);
            statement.setString(3, username);
            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUser(User user) {
        String sql = "UPDATE users SET Fullname = ?, Phone = ?, Email = ? WHERE Username = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, user.getFullName());
            statement.setString(2, user.getPhone());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getUsername());
            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
