package util;


import util.CountQ;


public class RandCount {

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
	        int max =CountQ.returnRan();
	        System.out.println("MAX="+max);
	        

	        for (int i = 0; i < 4; i++) {
	            rawRandomNumber = (int) (Math.random() * (max - min + 1) ) + min;
	            randomNumber = rawRandomNumber;
	           
	        }
	        return randomNumber;
	    }
	 

}
