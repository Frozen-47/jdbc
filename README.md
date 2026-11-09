# JDBC Learning

A simple repository for learning and practicing **Java Database Connectivity (JDBC)** with MySQL.

---

## 📂 Project Structure

```text
JDBC/
├── src/
│   ├── CreateTable.java        # Create table in database
│   ├── InsertData.java         # Insert data using Statement
│   ├── InsertViaTerminal.java  # Insert data with user input (PreparedStatement)
│   ├── SelectData.java         # Fetch and read data (ResultSet)
│   └── DeleteData.java         # Delete records from table
├── .idea/                      # IntelliJ IDEA configuration
├── JDBC.iml                    # IntelliJ module file
└── README.md
```

---

## 🔄 Core Steps in JDBC

Every JDBC program follows these basic steps:

1. **Load the Driver**
   ```java
   Class.forName("com.mysql.cj.jdbc.Driver");
   ```
2. **Establish Connection**
   ```java
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_db", "root", "password");
   ```
3. **Create Statement**
   ```java
   Statement stmt = con.createStatement();
   // or
   PreparedStatement ps = con.prepareStatement(sql);
   ```
4. **Execute Query**
   - For `INSERT`, `UPDATE`, `DELETE`, `CREATE`:
     ```java
     stmt.executeUpdate(sql);
     ```
   - For `SELECT`:
     ```java
     ResultSet rs = stmt.executeQuery(sql);
     ```
5. **Close Connection**
   ```java
   stmt.close();
   con.close();
   ```

---

## 🗄️ Database Setup

Make sure MySQL is running locally on port `3306`.

```sql
-- Database used for CreateTable, InsertData, InsertViaTerminal, DeleteData
CREATE DATABASE student_db;

-- Database used for SelectData
CREATE DATABASE workers_db;
```

---

## 🚀 How to Run in IntelliJ IDEA

1. **Add MySQL Driver**:
   - Download the MySQL Connector/J JAR file.
   - Go to **File** → **Project Structure** → **Modules** → **Dependencies**.
   - Click **+** → **JARs or Directories**, select the JAR file, and click **OK**.

2. **Update Credentials**:
   - Change `"root"` and `"password"` in the `.java` files to your MySQL username and password.

3. **Run**:
   - Right-click any `.java` file in `src/` and select **Run**.
