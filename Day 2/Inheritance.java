// Day 2

//Inheritance (super and this)

// super keyword is used in child class to call parent class's constructor 
// this keyword is used to refer the current class variable with the passed argument 
// this is also used to pass vales to same class constructor


// Notes

// "Creating an object automatically calls all constructors in the class and parent class"
// Wrong — Java does not call all constructors. It only calls one constructor per class in the inheritance chain, based on what you specify.

class Inheritance {
	public static void main(String[] args) {
		new B(1,"vivi",21,10000).display();	
	}
}

class A {
	int id;
	String name;
	int age;
	
	A() {
		System.out.println("A constructor.............................................."); // this won't print 'coz one constructor will at a time in inheritance
	} // default constructor is created manually to check the explict of calling super class by JVM automatically
	
	A(int id, String name, int age) {
		this(age,age);
		this.id = id;
		this.name = name;
		this.age = age;
	}
	
	A(int age1, int age2) {
		System.out.println(age1 + age2);
	}
	
		
	public void displayA() {
		System.out.println("Id A: " + id);
		System.out.println("Name A: " + name);
		System.out.println("Age A: " + age);
	}
}

class B extends A {
	
	int salary;
	
	B() {
		System.out.println("B constructor.................................................."); // this won't print
	}
	
	
	B(int id, String name, int age, int salary) {
		super(id,name,age); // to print Id B, Name B, Age B and inaddition pass name,is, age to the method DisplayA parameters
		this.salary = salary;
	}
	
	public void display() {
		super.displayA(); // to print method DisplayA (to call method of super class)
		System.out.println("Salary : " + salary);
		
		System.out.println("Id B: " + id);
		System.out.println("Name B: " + name);
		System.out.println("Age B: " + age);
	}
}

