import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;

class ByteArrayoutputStream {
	public static void main(String[] args) throws Exception {
		
		ByteArrayOutputStream c = new ByteArrayOutputStream();

		String s = "Hello vivin 123 true";
		byte[] barr = s.getBytes();
		
 		FileOutputStream a = new FileOutputStream("file1.txt");
        FileOutputStream b = new FileOutputStream("file2.txt");
		
		c.write(barr);
		c.writeTo(a);
		c.writeTo(b);
		
		c.flush();
	}
}