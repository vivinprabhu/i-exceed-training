class Polymorphism {
	public static void main(String[] args) {
		new B().display(); //Overriding
		new C().print(); //Overloading
		new D().print(3,7);
	}
}

class A {
	public void display() {
		System.out.println("A display");
	}
}


class B extends A{
	public void display() {
		System.out.println("B display");
	}
}

class C {
	public void print() {
		System.out.println("Overloading...");
	}
}

class D {
	public void print(int a, int b) {
		System.out.println("Overloading with multiplication : " + (a*b) );
	}
}