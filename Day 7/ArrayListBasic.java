import java.util.*;

class ArrayListBasic {
	public static void main(String[] args) {
		ArrayList<String> l = new ArrayList<>();
		l.add("prabhu");
		l.add("vivin");	
		l.add("sanjay");
		l.add("javad");
		l.add("java");
		
		// remove by two types
		
		l.remove(1); 
		l.remove("java");
		
		// update 
		l.set(0, "prabha"); // l.set(index number, replace value);
		
		// get
		System.out.println(l);
		System.out.println(l.get(0));
		
		Collections.sort(l);
		System.out.println("Sorted list : " + l);
		
				
		Collections.reverse(l);
		System.out.println("Reverse list : " + l);
		
		System.out.println(l.contains("prabha")); //true -- returns boolean
		System.out.println(l.indexOf("prabha")); // return index number
		
		// remove all
		l.clear();
		System.out.println(l.isEmpty());
	}String[] array = l.toArray(new String[0]);
}