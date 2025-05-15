// StringBuffer is slower because it's synchronized (thread-safe)
// StringBuilder is faster but not thread-safe — suitable for single-threaded use.

class StrBuffBuild {
	public static void main(String[] args) {
	
		StringBuffer sbuf = new StringBuffer("welcome ");
		StringBuilder sbul = new StringBuilder("welcome ");
	
		long s1 = System.currentTimeMillis();
		
		for(int i=0;i<1000000;i++) {
			sbuf.append("to");
		}
		
		long s2 = System.currentTimeMillis();
				
		for(int i=0;i<1000000;i++) {
			sbul.append("to");
		}
		
		long stringBufferTime = System.currentTimeMillis() - s1;
		long stringBuilderTime = System.currentTimeMillis() - s2;

		System.out.println("StringBuffer : " + stringBufferTime + " ms");
		System.out.println("StringBuilder : " + stringBuilderTime + " ms");
	}
}