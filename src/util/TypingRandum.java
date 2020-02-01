package util;

public class TypingRandum {
	

	

		/**
		 * @param args
		 */
		public static void main(String[] args) 
		{
			int i =  doRawRandomNumberforfirst();
			System.out.println(i);
		}
		 public static int doRawRandomNumberforfirst() {

		        int rawRandomNumber=0;
		        int randomNumber =0;
		        int min = 01;
		      int max =CountQ.randumselectfirsttime();
		    //    int max=25;
		        System.out.println("MAX="+max);
		        

		        for (int i = 0; i < 2; i++) {
		            rawRandomNumber = (int) (Math.random() * (max - min + 1) ) + min;
		            randomNumber = rawRandomNumber;
		           
		        }
		        return randomNumber;
		    }
	
	
	
	
	

}
