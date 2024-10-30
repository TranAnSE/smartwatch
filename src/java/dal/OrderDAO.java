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
import model.Order;
import model.Watch;
import model.OrderDetails;

/**
 *
 * @author an
 */
public class OrderDAO extends DBContext_Backup {

    public void createOrder(String orderID, double totalMoney, String username) {
        String sql = "INSERT INTO orders (OrderID, TotalMoney, Username) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, orderID);
            statement.setDouble(2, totalMoney);
            statement.setString(3, username);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void createOrderDetails(String orderID, List<Cart> carts) {
        String sql = "INSERT INTO order_details (OrderID, WatchID, Quantity) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            for (Cart cart : carts) {
                if (cart != null && cart.getWatch() != null && cart.getQuantity() > 0) {
                    statement.setString(1, orderID);
                    statement.setInt(2, cart.getWatch().getWatchID());
                    statement.setInt(3, cart.getQuantity());
                    statement.addBatch();
                }
            }
            statement.executeBatch();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<OrderDetails> getOrderDetailsByOrderID(String orderID) {
        List<OrderDetails> orderDetailsList = new ArrayList<>();
        String sql = "SELECT od.OrderDetailID, od.OrderID, od.WatchID, od.Quantity, w.WatchName, w.Thumbnail, w.Price FROM order_details od JOIN watches w ON od.WatchID = w.WatchID WHERE od.OrderID = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, orderID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                OrderDetails orderDetails = new OrderDetails();
                orderDetails.setOrderDetailID(rs.getInt("OrderDetailID"));
                orderDetails.setOrderID(rs.getString("OrderID"));
                orderDetails.setQuantity(rs.getInt("Quantity"));

                Watch watch = new Watch();
                watch.setWatchID(rs.getInt("WatchID"));
                watch.setWatchName(rs.getString("WatchName"));
                watch.setThumbnail(rs.getString("Thumbnail"));
                watch.setPrice(rs.getInt("Price"));

                orderDetails.setWatch(watch);
                orderDetailsList.add(orderDetails);
            }
            rs.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetailsList;
    }

    public List<Order> getOrdersByUsername(String username) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE Username = ?";
        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orders.add(new Order(rs.getString("OrderID"), rs.getInt("TotalMoney"), rs.getInt("Payment"), rs.getTimestamp("CreatedAt"), username));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    public Order getOrderById(String orderId) {
        Order order = null;
        String sql = "SELECT * FROM orders WHERE OrderID = ?";
        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, orderId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                order = new Order(rs.getString("OrderID"), rs.getInt("TotalMoney"), rs.getInt("Payment"), rs.getTimestamp("CreatedAt"), rs.getString("Username"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return order;
    }

    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders ORDER BY CreatedAt DESC";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                orders.add(new Order(rs.getString("OrderID"), rs.getInt("TotalMoney"), rs.getInt("Payment"), rs.getTimestamp("CreatedAt"), rs.getString("Username")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public void updatePayment(String orderID) {
        String sql = "UPDATE orders SET Payment = 1 WHERE OrderID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, orderID);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteOrder(String orderID) {
        String sql = "DELETE FROM order_details WHERE OrderID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, orderID);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String sql1 = "DELETE FROM orders WHERE OrderID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql1)) {
            statement.setString(1, orderID);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
