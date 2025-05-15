class StrHeapSCP {
	public static void main(String[] args) {
		String s1 = "vivin"; // String Constant pool
		String s2 = "vivin"; // String Constant pool
		String s3 = new String("vivin"); // Heap
		String s4 = new String("vivin").intern(); // .intern() checks if the String already exists in the String pool and if exists, gives the same reference to it	
		
		// == checks reference as well the value
		// s.equals(s1) checks only the value
		
		System.out.println(s1==s3); // false
		System.out.println(s1==s4); // true
	}
}