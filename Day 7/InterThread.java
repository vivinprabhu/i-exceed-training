// Inter thread communication -- happens using wait() and notify()

// semaphore or mutual exclusion 


import java.util.*;

class InterThread {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		RailwayReservation r = new RailwayReservation();
		
		System.out.println("Select the number of the coach : \n1) Sleeper AC \n2) Sleeper non AC\n3) Seater AC\n4) Seater non A/C");
		int coachSelected = sc.nextInt();
		
		new Thread() {
			public void run() {
				r.ticketStatus(coachSelected);
			}
		}.start();
		
		new Thread() {
			public void run() {
				r.updateCoach(coachSelected);
			}
		}.start();
		
	}
}

class RailwayReservation {
	boolean ticket = false;

	int a=1, b=1, c=0, d=0;
		
	synchronized public void ticketStatus(int coach) {
		switch(coach) {
			case 1: 
				if(a==1) {
					this.ticket = true;
				} else {
					this.ticket = false;
				}
				break;
			case 2:
				if(b==1) {
					this.ticket = true;
				} else {
					this.ticket = false;
				}
				break;
			case 3 :
				if(c==1) {
					this.ticket = true;
				} else {
					this.ticket = false;
				}
				break;
			case 4 :
				if(d==1) {
					this.ticket = true;
				} else {
					this.ticket = false;
				}
				break;
		}
		
		try {
			if(ticket) {
				System.out.println("Ticket available at " + coach);
			} else {
				System.out.println("Not available. No seats available.");
				wait();
			}
		} catch(Exception e) {
		}
		
	}
	
	synchronized public void updateCoach(int coach) {
		switch(coach) {
			case 1:
				a=1;
				break;
			case 2:
				b=1;
				break;
			case 3:
				c=1;
				break;
			case 4:
				d=1;
				break;
		}
		System.out.println("Coach is updating : " + coach);
		notify();
	}
}