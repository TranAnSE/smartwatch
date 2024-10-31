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
import model.Cart;
import model.Watch;

/**
 *
 * @author an
 */
public class CartDAO extends DBContext {

    public void addToCart(String username, int watchID) {
        String sql = "INSERT INTO carts (Username, WatchID, Quantity) VALUES (?, ?, 1)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setInt(2, watchID);
            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateCart(int cartID, int quantity) {
        String sql = "UPDATE carts SET Quantity = ? WHERE CartID = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, quantity);
            statement.setInt(2, cartID);
            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteFromCart(int cartID) {
        String sql = "DELETE FROM carts WHERE CartID = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, cartID);
            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Cart> getCartsByUsername(String username) {
        List<Cart> carts = new ArrayList<>();
        String sql = "SELECT carts.CartID, carts.Quantity, watches.WatchID, watches.WatchName, watches.Thumbnail, watches.Price FROM carts JOIN watches ON carts.WatchID = watches.WatchID WHERE carts.Username = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Cart cart = new Cart();
                cart.setCartID(rs.getInt("CartID"));
                cart.setQuantity(rs.getInt("Quantity"));
                cart.setUsername(username);

                Watch watch = new Watch();
                watch.setWatchID(rs.getInt("WatchID"));
                watch.setWatchName(rs.getString("WatchName"));
                watch.setThumbnail(rs.getString("Thumbnail"));
                watch.setPrice(rs.getInt("Price"));

                cart.setWatch(watch);
                carts.add(cart);
            }
            rs.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carts;
    }

    public void clearCart(String username) {
        String sql = "DELETE FROM carts WHERE Username = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
