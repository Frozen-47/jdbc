
import java.sql.*;

public class InsertData {
    public static void main(String[] args) {

        try {
            // Step 1: Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Step 2: Establish Connection
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/student_db",
                    "root",
                    "6369611789"
            );

            // Step 3: Create Statement
            Statement stmt = con.createStatement();

            // Step 4: Write INSERT query
            String sql = "insert into employee values (103,'Gotham',30)";

            // Step 5: Execute Query
            stmt.executeUpdate(sql);
            System.out.println("Data inserted successfully");

            // Step 6: Close Connection
            stmt.close();
            con.close();

        } catch (Exception e) {
            System.out.println("\nError occurs :" + e);
        }
    }
}
