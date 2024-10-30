package dal;

import dal.DBContext_Backup;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DashboardDAO extends DBContext_Backup {

    public int getCategoryCount() throws SQLException {
        String sql = "SELECT COUNT(*) AS count FROM categories";
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet rs = statement.executeQuery();
        if (rs.next()) {
            return rs.getInt("count");
        }
        return 0;
    }

    public int getWatchCount() throws SQLException {
        String sql = "SELECT COUNT(*) AS count FROM watches";
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet rs = statement.executeQuery();
        if (rs.next()) {
            return rs.getInt("count");
        }
        return 0;
    }

    public int getOrderCount() throws SQLException {
        String sql = "SELECT COUNT(*) AS count FROM orders";
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet rs = statement.executeQuery();
        if (rs.next()) {
            return rs.getInt("count");
        }
        return 0;
    }

    public int getSliderCount() throws SQLException {
        String sql = "SELECT COUNT(*) AS count FROM sliders";
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet rs = statement.executeQuery();
        if (rs.next()) {
            return rs.getInt("count");
        }
        return 0;
    }

    public List<CategoryCount> getCategoryWatchCount() throws SQLException {
        String sql = "SELECT CategoryName, COUNT(WatchID) AS count FROM categories LEFT JOIN watches ON categories.CategoryID = watches.CategoryID GROUP BY CategoryName";
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet rs = statement.executeQuery();
        List<CategoryCount> list = new ArrayList<>();
        while (rs.next()) {
            list.add(new CategoryCount(rs.getString("CategoryName"), rs.getInt("count")));
        }
        return list;
    }

    public List<MonthCount> getOrderCountByMonth() throws SQLException {
        String sql = "SELECT DATENAME(MONTH, CreatedAt) AS MonthName, COUNT(OrderID) AS count "
                + "FROM orders WHERE YEAR(CreatedAt) = YEAR(GETDATE()) "
                + "GROUP BY MONTH(CreatedAt), DATENAME(MONTH, CreatedAt)";
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet rs = statement.executeQuery();
        List<MonthCount> list = new ArrayList<>();
        while (rs.next()) {
            list.add(new MonthCount(rs.getString("MonthName"), rs.getInt("count")));
        }
        return list;
    }

    public List<MonthRevenue> getRevenueByMonth() throws SQLException {
        String sql = "SELECT DATENAME(MONTH, CreatedAt) AS MonthName, ISNULL(SUM(TotalMoney), 0) AS money "
                + "FROM orders WHERE YEAR(CreatedAt) = YEAR(GETDATE()) "
                + "GROUP BY MONTH(CreatedAt), DATENAME(MONTH, CreatedAt)";
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet rs = statement.executeQuery();
        List<MonthRevenue> list = new ArrayList<>();
        while (rs.next()) {
            list.add(new MonthRevenue(rs.getString("MonthName"), rs.getDouble("money")));
        }
        return list;
    }

    public class CategoryCount {

        private String categoryName;
        private int count;

        public CategoryCount(String categoryName, int count) {
            this.categoryName = categoryName;
            this.count = count;
        }

        public String getCategoryName() {
            return categoryName;
        }

        public int getCount() {
            return count;
        }
    }

    public class MonthCount {

        private String monthName;
        private int count;

        public MonthCount(String monthName, int count) {
            this.monthName = monthName;
            this.count = count;
        }

        public String getMonthName() {
            return monthName;
        }

        public int getCount() {
            return count;
        }
    }

    public class MonthRevenue {

        private String monthName;
        private double money;

        public MonthRevenue(String monthName, double money) {
            this.monthName = monthName;
            this.money = money;
        }

        public String getMonthName() {
            return monthName;
        }

        public double getMoney() {
            return money;
        }
    }
}
