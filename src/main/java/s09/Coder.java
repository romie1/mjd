package s09;

/**
 * A JavaBean for the CODERS table
 * 
 * Notice that, intentionally, salary here is int, even if the column is a
 * DECIMAL(8,2)
 * 
 * @author egall
 */
public class Coder {
    private String firstName;
    private String lastName;
    private int salary; // ?!

    public Coder() {}

    public Coder(String firstName, String lastName, int salary) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.salary = salary;
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

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    @Override
    public String toString() {
        return "Coder [firstName=" + firstName + ", lastName=" + lastName + ", salary=" + salary + "]";
    }
}