import java.io.*;

public class BufferStream {
    public static void main(String[] args) throws Exception {
            BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream("bufferstream.dat"));
            bos.write("Hello 123".getBytes());
            bos.flush();

            BufferedInputStream bis = new BufferedInputStream(new FileInputStream("bufferstream.dat"));
            int data;
            while ((data = bis.read()) != -1) {
                System.out.print((char) data);
            }
    }
}