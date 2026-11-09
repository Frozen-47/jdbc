import  java.sql.*;
public class DeleteData {
    static void main(String[] args) {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/student_db",
                    "root",
                    "6369611789"
            );
            Statement stmp = con.createStatement();
            String sql = "delete from employee where id = 102";
            stmp.executeUpdate(sql);
            System.out.println("Data Deleted Successfully");
        } catch (Exception e) {
            System.out.print("Error Occurs : "+e);
        }
    }
}
