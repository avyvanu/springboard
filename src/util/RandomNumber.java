package util;
import util.CountQ;


public class RandomNumber {

	/**
	 * @param args
	 */
	public static void main(String[] args) 
	{
		int i =  doRawRandomNumber();
		System.out.println(i);
	}
	 public static int doRawRandomNumber() {

	        int rawRandomNumber=0;
	        int randomNumber =0;
	        int min = 01;
	        int max =04;
	        

	        for (int i = 0; i < 10; i++) {
	            rawRandomNumber = (int) (Math.random() * (max - min + 1) ) + min;
	            randomNumber = rawRandomNumber;
	           
	        }
	        return randomNumber;
	    }
	 

}
