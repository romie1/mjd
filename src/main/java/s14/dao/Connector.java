package s14.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Connector {
    private static final Logger LOG = LoggerFactory.getLogger(Connector.class);

    /** MySQL */
//  private static final String URL = "jdbc:mysql://localhost:3306/me";
    /** Oracle DB */
    private static final String URL = "jdbc:oracle:thin:@127.0.0.1:1521/xe";
    private static final String USER = "me";
    private static final String PASSWORD = "password";

    public static Connection getConnection() {
        try {
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException se) {
            LOG.error("Can't connect to database", se);
            throw new IllegalStateException("No database connection");
        }
    }
}
