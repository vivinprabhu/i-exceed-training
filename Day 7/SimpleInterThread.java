class SimpleInterThread {
	public static void main(String[] args) {
		Sample s = new Sample();
				
		new Thread() {
			public void run() {
				s.Thread1(10);
			}
		}.start();
		
		new Thread() {
			public void run() {
				s.Thread2(15);
			}
		}.start();
		
	}
}

class Sample {
	int n = 10;
	
	synchronized public void Thread1(int n) {
		
		try {
			this.n = this.n + n;
			
			if(this.n<50) {
				System.out.println("Value of n in Thread1 : " + this.n);
				wait();
			}
			System.out.println("Value of n is : " + this.n);
		} catch (Exception e) {
			System.out.println("Error : " + e);
		}
	}
	
	synchronized public void Thread2(int n) {
		
		try {
			this.n = this.n + n;
			
			if(this.n<50) {
				System.out.println("Value of n in Thread 2 (1) : " + this.n);
				wait();
			} else {
				System.out.println("Value of n in Thread 2 (2) : " + this.n);
				notify();
			}
		} catch (Exception e) {
			System.out.println("Error : " + e);
		}
	}
}