package s06;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.closeTo;
import static org.hamcrest.Matchers.is;
import static org.junit.jupiter.api.Assertions.assertThrows;

import java.sql.SQLException;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * Assuming schema me, table coders initialized via migration.sql script
 * 
 */
class StoredProcedureTest {
    private StoredProcedure sp;

    @BeforeEach
    void init() {
        this.sp = new StoredProcedure();
    }

    @Test
    void getCoderSalaryPlain() throws SQLException {

        /*-
         * # coder_id, first_name, last_name, hire_date, salary
         * 107, Diana, Lorentz, 2007-02-07, 4210.00
         */
        int coderId = 107;
        double expected = 5460.0;

        double actual = sp.getCoderSalary(coderId);
        assertThat(actual, closeTo(expected, 0.0001));
    }

    @Test
    void getCoderSalaryMissingMySql() throws SQLException {
        if (!("MySQL".equals(sp.getDatabaseName()))) {
            System.out.println("getCoderSalaryMissingMySql() skipped");
            return;
        }

        int coderId = 22070;
        double expected = 0.0;

        double actual = sp.getCoderSalary(coderId);
        assertThat(actual, is(expected));
    }

    @Test
    void getCoderSalaryMissingOracle() {
        if (!("Oracle".equals(sp.getDatabaseName()))) {
            System.out.println("getCoderSalaryMissingOracle() skipped");
            return;
        }

        int coderId = 22070;

        var exc = assertThrows(SQLException.class, () -> sp.getCoderSalary(coderId));
        assertThat(exc.getErrorCode(), is(1403));

    }
}
