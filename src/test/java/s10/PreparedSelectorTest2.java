package s10;

import static org.hamcrest.Matchers.is;
import static org.hamcrest.MatcherAssert.assertThat;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import s09.Coder3;

class PreparedSelectorTest2 {

	private PreparedSelector ps;

	@BeforeEach
	void init() {
		this.ps = new PreparedSelector();
	}

	@Test
	void testGetCodersHired2007() throws SQLException {
		int year = 2007;
		List<Coder3> expected = new ArrayList<>();
		expected.add(new Coder3("Bruce", "Ernst", LocalDate.of(2007, 05, 21)));
		expected.add(new Coder3("Diana", "Lorentz", LocalDate.of(2007, 02, 07)));

		List<Coder3> actual = ps.getCodersHired2007(year);
		System.out.println(actual);
		assertThat(actual, is(expected));
	}

}
