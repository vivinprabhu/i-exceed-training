class FunctionalInterface1 implements Functional {
	public static void main(String args[]) {
		FunctionalInterface1 fi = new FunctionalInterface1();
		fi.display();
	}
	
	@Override 
	public void display() {
		System.out.println("Functional Interface should not be the class name so that this will get print");
	}
}

@FunctionalInterface
interface Functional {
	public void display();
}


