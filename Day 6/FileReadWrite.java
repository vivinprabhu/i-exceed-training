import java.io.FileOutputStream;
import java.io.FileInputStream;

// FileOutputStream -- Writes raw bytes to a file 
// FileInputStream -- Reads raw bytes to a file

class FileReadWrite {
	public static void main(String[] args) throws Exception {
		FileOutputStream fos = new FileOutputStream("myfile.txt");
		String text = "My file name is myfile.txt. Here I am adding abcd.";
		fos.write(text.getBytes());
		
		FileInputStream fis = new FileInputStream("myfile.txt");
		int n;
		while( (n=fis.read()) != -1 ) {
			System.out.print((char)n);
		}
	}
}