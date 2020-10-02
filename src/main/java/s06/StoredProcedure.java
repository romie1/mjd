package s06;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Scanner;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import s10.PreparedSelector;

public class StoredProcedure {
	private static final Logger LOG = LoggerFactory.getLogger(PreparedSelector.class);

	/** MySQL */
//    private static final String URL = "jdbc:mysql://localhost:3306/me";
	/** Oracle DB */
	private static final String URL = "jdbc:oracle:thin:@127.0.0.1:1521:xe";

	private static final String USER = "me";
	private static final String PASSWORD = "password";

	private static final String GET_CODER_SALARY = "{call get_coder_salary(?, ?)}";

	/**
	 * Get the database name for the connection
	 * 
	 * Useful for testing specific DBMS features
	 */
	String getDatabaseName() {
		try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
			return conn.getMetaData().getDatabaseProductName();
		} catch (SQLException e) {
			LOG.error("Failure accessing DB", e);
			throw new IllegalStateException("Can't get database name");
		}
	}

	/**
	 * Coder salary
	 * 
	 * @param id the coder id
	 * @return coder salary, 0 if the specified coder id is not available
	 * @throws SQLException
	 */
	public double getCoderSalary(int id) throws SQLException {
		try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
				CallableStatement callStmt = conn.prepareCall(GET_CODER_SALARY)) {
			callStmt.setInt(1, id); // questo è parametro in, 1 convenzione sql
			callStmt.registerOutParameter(2, Types.DECIMAL); // questo è parametro out

			LOG.debug(callStmt.toString());
			callStmt.executeUpdate();
			LOG.debug(callStmt.toString());

			return callStmt.getDouble(2);
		}
	}

	/*
	 * Exercise:
	 * 
	 * Implement main to run this functionality from command line.
	 * 
	 * if args.length is 1 then use the passed parameter (integer!) as coder id (in
	 * case of wrong call, the user should get adequate feedback) otherwise use
	 * Scanner to get a viable input
	 */
	public static void main(String[] args) {
		StoredProcedure storedProcedure = new StoredProcedure();
		int coder_id = 0;

		if (args.length == 1) {
			coder_id = Integer.parseInt(args[0]);
			try {
				System.out.println(
						"Coder with id " + coder_id + " has salary " + storedProcedure.getCoderSalary(coder_id));
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {

			try (Scanner scanner = new Scanner(System.in);) {
				do {
					System.out.print("Enter coder id (-1 to exit): ");
					coder_id = scanner.nextInt();
					System.out.println("Coder with id " + coder_id + " has salary " + storedProcedure.getCoderSalary(coder_id));
				} while (coder_id != -1);
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}

	}
}
