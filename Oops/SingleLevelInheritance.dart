void main() {
    Employee e = Employee("Vivin", 20, 12000.0, "i-Exceed", "Bengaluru");
    e.displayDetails();
}

class Company {  // parent class
    String? companyName;
    String? companyLocation;

    Company(String companyName, String companyLocation) {
        this.companyName = companyName;
        this.companyLocation = companyLocation;
    }
}

class Employee extends Company {  // child class
    String? employeeName;
    int? age;
    double? salary;

    Employee(String employeeName, int age, double salary, String companyName, String companyLocation) : super(companyName, companyLocation) {
        this.employeeName = employeeName;
        this.age = age;
        this.salary = salary;
    }

    void displayDetails() {
        print("My name is ${employeeName}, ${age} years old, working in ${companyName}, ${companyLocation} getting salary of ${salary}");
    }
}
