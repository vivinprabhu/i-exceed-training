public class Encapsulation {
	
	public static void main(String[] args) {
		Msg msg = new Msg();
		msg.setDate("May 9");
		msg.setDay("Friday");
		
		System.out.println(msg.getDate());
		System.out.println(msg.getDay());
	}
}

class Msg {
	private String date, day;
	
	public void setDate(String date) {
		this.date = date;
	}

	public void setDay(String day) {
		this.day = day;
	}
	
	public String getDate() {
		return date;
	}	

	public String getDay() {
		return day;
	}	
}