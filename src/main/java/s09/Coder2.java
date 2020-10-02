package s09;

/**
 * Another JavaBean for the CODERS table
 * implements Comparable<Coder2> <- add if you want to do sort with comparable
 * @author egall
 */
public class Coder2 {
    private String firstName;
    private String lastName;
    private double salary;

    public Coder2() {
    }

    public Coder2(String firstName, String lastName, double salary) {
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

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Coder2)) {
            return false;
        }
        Coder2 other = (Coder2) obj;

        if (this.lastName.equals(other.lastName) && this.firstName.equals(other.firstName)
                && this.salary == other.salary) {
            return true;
        }
        return false;
    }

    @Override
    public String toString() {
        return "Coder2 [firstName=" + firstName + ", lastName=" + lastName + ", salary=" + salary + "]";
    }


//    @Override
//    public int compareTo(Coder2 other) {
//        int check = lastName.compareTo(other.lastName);
//        if (check == 0) {
//            check = firstName.compareTo(other.firstName);
//        }
//
//        return check;
//    }
}