package s10;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import s09.Coder;
import s09.Coder2;

class PreparedSelectorTest {
    private PreparedSelector ps;

    @BeforeEach
    void init() {
        this.ps = new PreparedSelector();
    }

    @Test
    void getCodersBySalary6000() throws SQLException {
        int minSalary = 6000;
        String[] expectedNames = { "Alexander", "Bruce" };
        int[] expectedSalaries = { 9000, 6000 };

        List<Coder> actual = ps.getCodersBySalary(minSalary);

        assertThat(actual.size(), is(expectedNames.length));
        for (int i = 0; i < actual.size(); i++) {
            Coder current = actual.get(i);
            assertThat(current.getFirstName(), is(expectedNames[i]));
            assertThat(current.getSalary(), is(expectedSalaries[i]));
        }
    }

    @Test
    void getCodersWithLetterInQ() throws SQLException {
        char letter = 'u';
        List<Coder2> expected = new ArrayList<>(3);
        expected.add(new Coder2("Alexander", "Hunold", 9000.0));
        expected.add(new Coder2("Bruce", "Ernst", 6000.0));
        expected.add(new Coder2("David", "Austin", 4800.0));

        List<Coder2> actual = ps.getCodersWithLetterIn(letter);
        System.out.println(actual);
        assertThat(actual, is(expected));
    }
    
//    @Test
//    void getCoderHire2007() throws SQLException{
//    	int year = 2007;
//    	List<Coder3> expected = new ArrayList<>();
//    	expected.add(new Coder3("Bruce", "Ernst", LocalDate.of(2007, 05, 21)));
//    	expected.add(new Coder3("Diana", "Lorentz", LocalDate.of(2007, 02, 07)));
//    	
//    	List<Coder3> actual = ps.getCodersHired2007(year);
//    	System.out.println(actual);
//    	assertThat(actual,	is(expected));
//    }
}
