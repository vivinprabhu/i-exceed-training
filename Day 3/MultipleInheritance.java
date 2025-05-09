// Multiple inheritance using interface

class MultipleInheritance {
	public static void main(String[] args) {
		Demo d = new Demo();
		d.display();
		d.display1();
	}
}


// interface are : static (no object required) and final (immutable)

// interface has no constructors

interface A {
	String name = "vivi";
	public void display();
}

interface B {
	int age = 20;
	public void display1();
}



class Demo implements A,B {
	
	@Override // no need to type explicitly
	
	public void display() {
		System.out.println("Name : " + name);
	}
		
	public void display1() {
		System.out.println("Age : " + age);
	}
}