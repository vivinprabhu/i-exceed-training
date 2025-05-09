// Day 1

class Main {
public static void main(String[] viv) {
	//Encapsulation this keyword
	//  Main1("vivin" , 20).display(); 
	//  Main1("prabhu" , 21).display();
	
	//Priority of block
	//new Main2().display();
	
	
		
	}
}

class Main3 {
	
}

class Main2 {
	
	//priority of block calling
	
	// static will be 1st, empty block will be 2nd, constructor will be 3rd, and method block will be last
	
	{
		System.out.println("Empty block");
	}
	
	static {
		System.out.println("Static 0 block");
	}
	
	static {
		System.out.println("Static 2 block");
	}
	
	Main2() {
		this(10,20); //constructor chaining - calls next constructor (no 2 constructors should be same)
		System.out.println("Constructor is called");
	}
	
	Main2(int x, int y) {
		System.out.println(x+y);
	}

	public void display() {
		System.out.println("Display block");
	}
}

class Main1 {
	String name;
	int age;
	
	Main1(String name, int age){
		this.name = name;  //this keyword refering current object (what parameter is passing)
		this.age = age;
		System.out.println(name + " " + age);
	}
	
	public void display() {
		System.out.println("Displaying");
		System.out.println("Name : " + name);
		System.out.println("Age : " + age);
	}
}