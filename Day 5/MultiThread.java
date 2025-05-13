class T extends Thread {
	public void run() {
		for(int i=1;i<=5;i++) {
			System.out.println("class T : " + i);
		}
	}
}


class JoinThread extends Thread {
	public void run() {
		for(int i=11;i<=15;i++) {
			try {
				System.out.println("Joint thread : " + i);
				Thread.sleep(500);
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}
}

class MultiThread {
    public static void main(String[] args) {
 		new T().start(); // no priority or no join
		for(int i=1;i<=5;i++) {
			System.out.println("class main : " + i);
		}
		
		/*
		class T : 1
		class T : 2
		class T : 3
		class T : 4
		class main : 1
		class main : 2
		class main : 3
		class main : 4
		class main : 5
		class T : 5

		*/
		
		JoinThread j1 = new JoinThread();
		JoinThread j2 = new JoinThread();
		JoinThread j3 = new JoinThread();

		/*
		 join will pause the upcoming threads to pause until the current is fully executed
		 join(1000) we can also do like this

		
		 if i use join() after start individually
		
		 11 12 13 14 15 
		 thread j1 is completed 
		 11 12 13 14 15 
		 thread j2 is completed 
		 11 12 13 14 15 
		 thread j3 is completed  
		
		else 11 11 11 12 12 12 13 13 13 14 14 14 15 15 15 
		j1 is completed 
		j2 is completed
		j3 is completed
		*/
		
		j1.start();
		
		try {
		j1.join();
			System.out.println("thread j1 is completed.......");
		} catch (Exception e) {
			System.out.println("Error : " + e);
		}
		
		j2.start();
		
		try {
			j2.join();
			System.out.println("thread j2 is completed.......");
		} catch (Exception e) {
			System.out.println("Error : " + e);
		}
		
		j3.start();
		
		try {
			j3.join();
			System.out.println("thread j3 is completed.......");
		} catch (Exception e) {
			System.out.println("Error : " + e);
		}
		
    }
}