class Customer {
	public static void main(String[] args) {
		bank b = new bank("SBI","hw88","5678");
		CustomerDetails cd = new CustomerDetails("vivin",20,b);
		cd.display();
	}
}

class CustomerDetails {
	String name;
	int age;
	bank b;
	
	CustomerDetails(String name, int age, bank b) {
		this.name = name;
		this.age = age;
		this.b = b;
		
	}
	
	public void display() {
		System.out.println("Name : " + name);
		System.out.println("Age : " + age);
		b.displayBankDetails();
	}
}