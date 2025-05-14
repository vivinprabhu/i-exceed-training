import java.io.FileOutputStream;
import java.io.FileInputStream;

import java.io.DataInputStream;
import java.io.DataOutputStream;

class DataReadWrite {
	public static void main(String[] args) throws Exception {
		
		// .dat -- Primitive data types like int, double, boolean is commonly used for files that store binary data (non-human-readable content) 	
		DataOutputStream dos = new DataOutputStream(new FileOutputStream("myfiledata.dat")); 
		dos.writeInt(41); //4 bytes
		dos.writeDouble(55.42); // 8 bytes
		
		DataInputStream dis = new DataInputStream(new FileInputStream("myfiledata.dat"));
		
		int n = dis.readInt();
		double d = dis.readDouble();
		
		System.out.println("Number : " + n);
		System.out.println("Decimal : " + d);
		
	}
}