/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetails;
import model.Watch;

/**
 *
 * @author an
 */
public class OrderDetailsDAO extends DBContext_Backup {

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

    public Watch getWatchById(int watchId) {
        Watch watch = null;
        String sql = "SELECT * FROM watches WHERE WatchID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, watchId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                watch = new Watch(rs.getInt("WatchID"), rs.getString("WatchName"), rs.getString("Thumbnail"), rs.getString("Description"), rs.getInt("Price"), rs.getString("Trademark"), rs.getInt("CategoryID"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return watch;
    }
}
