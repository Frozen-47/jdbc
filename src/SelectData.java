import java.sql.*;

public class SelectData {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/workers_db",
                    "root",
                    "6369611789"
            );
            Statement stmp = con.createStatement();
            String sql = "SELECT department, min(salary) as avgg FROM workers GROUP BY department ORDER BY avgg ASC;";
            ResultSet rs = stmp.executeQuery(sql);
            while (rs.next()) {
                String dept = rs.getString("department");
                int sal = rs.getInt("avgg");

                System.out.println("Department: " + dept + " | Lowest Salary: " + sal);
            }

            rs.close();
            stmp.close();
            con.close();
        } catch (Exception e) {
            System.out.print("Error Occurs : " + e);
        }
    }
}
