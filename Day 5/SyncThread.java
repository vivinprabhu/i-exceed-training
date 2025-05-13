class SyncThread {
    public static void main(String[] args) throws Exception {
		Thread t = new Thread();
				
		A a = new A();        
		B b1 = new B(a, "Hello.........................");
		B b2 = new B(a, "I......................");
		B b3 = new B(a, "am...........................");
		B b4 = new B(a, "viv.............................");
		
		Thread t1 = new Thread(b1);
		Thread t2 = new Thread(b2);
		Thread t3 = new Thread(b3);
		Thread t4 = new Thread(b4);
		
		t1.start();
		t1.join();
		t2.start();
		t2.join();
		t3.start();
		t3.join();
		t4.start();
		t4.join();
		
    }
}


class A {
	synchronized public void display(String msg) {
		System.out.println("[");
		System.out.println(msg);
		System.out.println("]");
	}
}

class B extends Thread{
	A a;
	String msg;
	
	B(A a, String msg) {
		this.a = a;
		this.msg = msg;
	}
	
	public void run() {
		System.out.println("Running B class run()");
		a.display(msg);
	}
}