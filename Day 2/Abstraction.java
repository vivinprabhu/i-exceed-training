class Abstraction {
	public static void main(String[] args) {
		new B().display();
	}
}

abstract class A {
	abstract public void display();
}

class B extends A {
	public void display() {
		System.out.println("Displaying");
	}
}