package s11;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Transactor {
    private static final Logger LOG = LoggerFactory.getLogger(Transactor.class);

    /** MySQL */
//  private static final String URL = "jdbc:mysql://localhost:3306/me";
    /** Oracle DB */
    private static final String URL = "jdbc:oracle:thin:@127.0.0.1:1521/xe";
    private static final String USER = "me";
    private static final String PASSWORD = "password";

    public static void selectAllAndPrint(Statement stmt) throws SQLException {
        System.out.print("[");
        try (ResultSet rs = stmt.executeQuery("SELECT coder_id, first_name, last_name FROM coders")) {
            while (rs.next()) {
                System.out.print(String.format("(%d: %s %s)", //
                        rs.getInt("coder_id"), // 1
                        rs.getString("first_name"), // 2
                        rs.getString("last_name"))); // 3
            }
        } finally {
            System.out.println("]");
        }
    }

    public static void main(String[] args) {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                Statement stmt = conn.createStatement()) {
            System.out.print("By default, autocommit is " + conn.getAutoCommit());
            conn.setAutoCommit(false);
            System.out.println(". Here is set it to " + conn.getAutoCommit() + ".");

            try {
                System.out.println("Inserting new coder ...");
                // MySQL-specific query
//                stmt.executeUpdate("INSERT INTO coders VALUES(301, 'John', 'Coltrane', CURDATE(), 6000)");
                // Oracle-specific query
                stmt.executeUpdate("INSERT INTO coders VALUES(301, 'John', 'Coltrane', SYSDATE, 6000)");

                selectAllAndPrint(stmt);
                doSomethingDangerous();
                conn.commit();
            } catch (Exception ex) {
                LOG.error("Can't insert new coder", ex);
                System.out.println("Rollback");
                conn.rollback();
                selectAllAndPrint(stmt);
            }
        } catch (SQLException se) {
            LOG.error("DBMS error", se);
        }
    }

    private static void doSomethingDangerous() {
        throw new IllegalStateException("Something bad happened");
    }
}