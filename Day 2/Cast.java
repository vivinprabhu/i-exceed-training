class Cast {
	public static void main(String[] args) {
		
		// upcasting subclass to super (parent)
		
		// A a = new B();
		// a.display();

		B b = new B();
		A a = (A)b;
		a.display();
		
	}
}

class A {
	public void display() {
		System.out.println("A");
	}
}

class B extends A {
	public void display() {
		System.out.println("B");
	}
}