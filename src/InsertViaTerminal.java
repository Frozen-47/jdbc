import java.util.*;
import java.sql.*;

public class InsertViaTerminal{
    static Scanner in = new Scanner(System.in);
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


            System.out.print("Enter Employee Name : ");
            String name = in.nextLine();
            System.out.print("Enter Employee ID : ");
            int id = in.nextInt();
            System.out.print("Enter Employee Age : ");
            int age = in.nextInt();

            // Step 3: Write INSERT query
            String sql = "insert into employee values (?,?,?)";
            System.out.print("123");

            // Step 4: Prepare Statement
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            ps.setString(2,name);
            ps.setInt(3,age);
            ps.executeUpdate();


            // Step 5: Execute Query
            System.out.print("456");
            System.out.print("\nData inserted successfully");

            // Step 6: Close Connection
            ps.close();
            con.close();

        } catch (Exception e) {
            System.out.println("\nError occurs :" + e);
        }
    }
}
