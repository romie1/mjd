package s03;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DriverManagerConnector {
    private static final Logger LOG = LoggerFactory.getLogger(DriverManagerConnector.class);

    /**
     * MySQL time zone set in my.ini as: default-time-zone="+02:00" otherwise add
     * "?serverTimezone=Europe/Rome" (or other time zone) to the URL
     */
//    private static final String URL = "jdbc:mysql://localhost:3306/me";

    /** Oracle DB */
    private static final String URL = "jdbc:oracle:thin:@127.0.0.1:1521/xe";

    private static final String USER = "me";
    private static final String PASSWORD = "password";

    /**
     * The following static initializer should not be required anymore
     */
//    static {
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//        } catch (ClassNotFoundException cnfe) {
//            cnfe.printStackTrace();
//            throw new IllegalStateException("Can't load JDBC driver " + cnfe.getMessage());
//        }
//    }

    public static void main(String[] args) {
        System.out.println(getInfo());
    }

    public static String getInfo() {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {

            String db = conn.getMetaData().getDatabaseProductName();

            String schema = conn.getCatalog(); // MySQL
            if (schema == null) {
                schema = conn.getSchema(); // Oracle
            }

            return String.format("Connected to %s database, schema %s", db, schema);
        } catch (SQLException e) {
            LOG.error("Failure accessing DB", e);
            throw new IllegalStateException("Can't get schema name");
        }
    }
}
