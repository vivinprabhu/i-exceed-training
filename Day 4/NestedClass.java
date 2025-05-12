// non-static inner class 
// there will be no static inner class

class NestedClass {
	public static void main(String[] args) {
		
		OuterClass o = new OuterClass();
		OuterClass.InnerClass i = o.new InnerClass();
		
		i.displayInner(20, "Tiruppur");
		
		
		// static inner class
		
		OuterClass.StaticInner s = new OuterClass.StaticInner();
		s.display(); // assign inside the inner class
		
		// pass values 
		
		s.displayByPassValue("77085");
	}
}



// outer class must be public
// let inner class variables can be any access specfier


class OuterClass {
	
	String name;
	
	OuterClass () {
		this.name = "vivin";
		System.out.println("Name : " + name);
	}
	
	class InnerClass {
		private int age;
		String city;
		
		InnerClass() {
			this.age = age;
			this.city = city;
		}
		
		public void displayInner(int age, String city) {
			System.out.println("Age : " + age);
			System.out.println("City : " + city);
		}
	}
	
	static class StaticInner {
		static String address = "4D/12";
		
		public void display() {
			System.out.println("Address : " + address);
		}
		
		String mobile;
		
		public void displayByPassValue(String mobile) {
			System.out.println("Mobile : " + mobile);
		}
	}
}


/*

Output

Name : vivin
Age : 20
City : Tiruppur
Address : 4D/12
Mobile : 77085

*/