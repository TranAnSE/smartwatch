/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author an
 */
public class Watch {

    private int watchID;
    private String watchName;
    private String thumbnail;
    private String description;
    private int price;
    private String trademark;
    private int categoryID;

    public Watch() {
    }

    public Watch(String watchName, String thumbnail, String description, int price, String trademark, int categoryID) {
        this.watchName = watchName;
        this.thumbnail = thumbnail;
        this.description = description;
        this.price = price;
        this.trademark = trademark;
        this.categoryID = categoryID;
    }

    public Watch(int watchID, String watchName, String thumbnail, String description, int price, String trademark, int categoryID) {
        this.watchID = watchID;
        this.watchName = watchName;
        this.thumbnail = thumbnail;
        this.description = description;
        this.price = price;
        this.trademark = trademark;
        this.categoryID = categoryID;
    }

    public int getWatchID() {
        return watchID;
    }

    public void setWatchID(int watchID) {
        this.watchID = watchID;
    }

    public String getWatchName() {
        return watchName;
    }

    public void setWatchName(String watchName) {
        this.watchName = watchName;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getTrademark() {
        return trademark;
    }

    public void setTrademark(String trademark) {
        this.trademark = trademark;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

}
