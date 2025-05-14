import java.io.ByteArrayInputStream;

class ByteArrayinputStream {
	public static void main(String[] args) {
		byte x[] = {66, 67, 68, 70};
		ByteArrayInputStream bias = new ByteArrayInputStream(x);
		
		// System.out.println(bias.read()); // print first byte only
		
		for(int i=0;i<x.length;i++) {
			System.out.println(bias.read());
		}
	}
}