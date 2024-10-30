/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 *
 * @author an
 */
public class Helper {

    // Extensions
    public static String Status(boolean isCheck, String vTrue, String vFalse) {
        return isCheck ? "<span class='badge badge-success'>" + vTrue + "</span>" : "<span class='badge badge-danger'>" + vFalse + "</span>";
    }

    public static String Span(boolean isCheck, String vTrue, String vFalse) {
        return isCheck ? "<span class='badge badge-primary'>" + vTrue + "</span>" : "<span class='badge badge-warning'>" + vFalse + "</span>";
    }

    public static String Currency(Object value) {
        return NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(value);
    }

    public static String Date(String value) throws Exception {
        Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").parse(value);
        return new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(date);
    }

    public static void main(String[] args) {
        try {
            String sqlDate = "2024-07-15 09:58:08.653";
            String formattedDate = Date(sqlDate);
            System.out.println(formattedDate);  // Output: 15/07/2024 09:58:08
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
