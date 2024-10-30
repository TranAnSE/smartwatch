/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author an
 */
public class CategoryDAO extends DBContext_Backup {

    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM categories";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryID(rs.getInt("CategoryID"));
                category.setCategoryName(rs.getString("CategoryName"));
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    public void addCategory(String name) {
        String sql = "INSERT INTO categories (CategoryName) VALUES (?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setNString(1, name);
            statement.executeUpdate();
            statement.close();
            System.out.println("Category added successfully");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateCategory(int id, String name) {
        String sql = "UPDATE categories SET CategoryName = ? WHERE CategoryID = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setNString(1, name);
            statement.setInt(2, id);
            statement.executeUpdate();
            statement.close();
            System.out.println("Category updated successfully");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCategory(int id) {
        String sql = "DELETE FROM categories WHERE CategoryID = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
            statement.close();
            System.out.println("Category deleted successfully");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
