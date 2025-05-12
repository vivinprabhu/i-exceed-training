import java.util.*;

class Loop {
	public static void main(String[] args) {
		
		int arr[] = {1,4,5,6,2,4,21,665,78,543,657,95};
		int len = arr.length;
		for(int i=0;i<len;i++) {
			System.out.println("For loop : " + arr[i]);
		}
		
		int j = 0;
		while(j<len) {
			System.out.println("While loop : " + arr[j]);
			j++;
		}
		
		int k = 0;
		do {
			System.out.println("Do while loop : " + arr[k]);
			k++;
		} while(k<len);
	}
}