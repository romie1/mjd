package s09;

import java.time.LocalDate;

public class Coder3 {
	private String firstName;
	private String lastName;
	private LocalDate hireDate;

	public Coder3() {
	}

	public Coder3(String firstName, String lastName, LocalDate hireDate) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.hireDate = hireDate;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public LocalDate getHireDate() {
		return hireDate;
	}

	public void setHireDate(LocalDate hireDate) {
		this.hireDate = hireDate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("\n First Name = ").append(firstName).append(" - Last Name = ").append(lastName)
				.append(" - Hire Date = ").append(hireDate).append("\n");
		return builder.toString();
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (!(obj instanceof Coder3)) {
			return false;
		}

		Coder3 other = (Coder3) obj;

		if (this.firstName.equals(other.firstName) && this.lastName.equals(other.lastName)
				&& this.hireDate.equals(other.hireDate)) {
			return true;
		}
		return false;
	}

}
