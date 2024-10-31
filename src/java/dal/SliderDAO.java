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
import model.Slider;

/**
 *
 * @author an
 */
public class SliderDAO extends DBContext {

    public List<Slider> getActiveSliders() {
        List<Slider> sliders = new ArrayList<>();
        String sql = "SELECT * FROM sliders WHERE Status = 1";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Slider slider = new Slider();
                slider.setSliderID(rs.getInt("SliderID"));
                slider.setSliderName(rs.getString("SliderName"));
                slider.setDescription(rs.getString("Description"));
                slider.setThumbnail(rs.getString("Thumbnail"));
                sliders.add(slider);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sliders;
    }

    public List<Slider> getAllSliders() {
        List<Slider> sliders = new ArrayList<>();
        String sql = "SELECT * FROM sliders";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                sliders.add(new Slider(rs.getInt("SliderID"), rs.getString("SliderName"), rs.getString("Description"), rs.getString("Thumbnail"), rs.getInt("Status")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sliders;
    }

    public void addSlider(Slider slider) {
        String sql = "INSERT INTO sliders (SliderName, Description, Thumbnail, Status) VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, slider.getSliderName());
            statement.setString(2, slider.getDescription());
            statement.setString(3, slider.getThumbnail());
            statement.setInt(4, slider.getStatus());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateSlider(Slider slider) {
        String sql = "UPDATE sliders SET SliderName = ?, Description = ?, Thumbnail = ?, Status = ? WHERE SliderID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, slider.getSliderName());
            statement.setString(2, slider.getDescription());
            statement.setString(3, slider.getThumbnail());
            statement.setInt(4, slider.getStatus());
            statement.setInt(5, slider.getSliderID());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteSlider(int id) {
        String sql = "DELETE FROM sliders WHERE SliderID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Slider getSliderById(int id) {
        String sql = "SELECT * FROM sliders WHERE SliderID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return new Slider(
                        rs.getInt("SliderID"),
                        rs.getString("SliderName"),
                        rs.getString("Description"),
                        rs.getString("Thumbnail"),
                        rs.getInt("Status")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
