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
import model.Watch;

/**
 *
 * @author an
 */
public class WatchDAO extends DBContext_Backup {

    public List<Watch> getRecentWatches() {
        List<Watch> watches = new ArrayList<>();
        String sql = "SELECT TOP 8 * FROM watches ORDER BY WatchID DESC";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Watch watch = new Watch();
                watch.setWatchID(rs.getInt("WatchID"));
                watch.setWatchName(rs.getString("WatchName"));
                watch.setThumbnail(rs.getString("Thumbnail"));
                watch.setDescription(rs.getString("Description"));
                watch.setPrice(rs.getInt("Price"));
                watch.setTrademark(rs.getString("Trademark"));
                watch.setCategoryID(rs.getInt("CategoryID"));
                watches.add(watch);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return watches;
    }

    public List<Watch> searchWatches(String search) {
        List<Watch> watches = new ArrayList<>();
        String sql = "SELECT * FROM watches WHERE WatchName LIKE ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + search + "%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Watch watch = new Watch();
                watch.setWatchID(rs.getInt("WatchID"));
                watch.setWatchName(rs.getString("WatchName"));
                watch.setThumbnail(rs.getString("Thumbnail"));
                watch.setDescription(rs.getString("Description"));
                watch.setPrice(rs.getInt("Price"));
                watch.setTrademark(rs.getString("Trademark"));
                watch.setCategoryID(rs.getInt("CategoryID"));
                watches.add(watch);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return watches;
    }

    public List<Watch> getWatchesByCategory(int categoryID) {
        List<Watch> watches = new ArrayList<>();
        String sql = "SELECT * FROM watches WHERE CategoryID = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, categoryID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Watch watch = new Watch();
                watch.setWatchID(rs.getInt("WatchID"));
                watch.setWatchName(rs.getString("WatchName"));
                watch.setThumbnail(rs.getString("Thumbnail"));
                watch.setDescription(rs.getString("Description"));
                watch.setPrice(rs.getInt("Price"));
                watch.setTrademark(rs.getString("Trademark"));
                watch.setCategoryID(rs.getInt("CategoryID"));
                watches.add(watch);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return watches;
    }

    public List<Watch> getAllWatches() {
        List<Watch> watches = new ArrayList<>();
        try {
            String sql = "SELECT * FROM watches";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Watch watch = new Watch(
                        rs.getInt("WatchID"),
                        rs.getString("WatchName"),
                        rs.getString("Thumbnail"),
                        rs.getString("Description"),
                        rs.getInt("Price"),
                        rs.getString("Trademark"),
                        rs.getInt("CategoryID")
                );
                watches.add(watch);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return watches;
    }

    public Watch getWatchByID(int id) {
        Watch watch = null;
        try {
            String sql = "SELECT * FROM watches WHERE WatchID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                watch = new Watch(
                        rs.getInt("WatchID"),
                        rs.getString("WatchName"),
                        rs.getString("Thumbnail"),
                        rs.getString("Description"),
                        rs.getInt("Price"),
                        rs.getString("Trademark"),
                        rs.getInt("CategoryID")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return watch;
    }

    public void addWatch(Watch watch) {
        try {
            String sql = "INSERT INTO watches (WatchName, Thumbnail, Description, Price, Trademark, CategoryID) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, watch.getWatchName());
            statement.setString(2, watch.getThumbnail());
            statement.setString(3, watch.getDescription());
            statement.setInt(4, watch.getPrice());
            statement.setString(5, watch.getTrademark());
            statement.setInt(6, watch.getCategoryID());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateWatch(Watch watch) {
        try {
            String sql = "UPDATE watches SET WatchName = ?, Thumbnail = ?, Description = ?, Price = ?, Trademark = ?, CategoryID = ? WHERE WatchID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, watch.getWatchName());
            statement.setString(2, watch.getThumbnail());
            statement.setString(3, watch.getDescription());
            statement.setInt(4, watch.getPrice());
            statement.setString(5, watch.getTrademark());
            statement.setInt(6, watch.getCategoryID());
            statement.setInt(7, watch.getWatchID());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteWatch(int id) {
        try {
            String sql = "DELETE FROM watches WHERE WatchID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
