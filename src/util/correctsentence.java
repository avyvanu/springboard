package util;

public class correctsentence {
	
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) 
	{
		int i =  doRawRandomNumberforfirstcorrectsentence();
		System.out.println(i);
	}
	 public static int doRawRandomNumberforfirstcorrectsentence() {

	        int rawRandomNumbercorrect=0;
	        int randomNumbercorrect =0;
	        int min = 26;
	        
	        int max=50;
	   // int max =CountQ.correctsentence();
	       // int max =50;
	        System.out.println("MAX="+max);
	        

	        for (int i = 0; i < 2; i++) {
	        	rawRandomNumbercorrect = (int) (Math.random() * (max - min + 1) ) + min;
	        	randomNumbercorrect = rawRandomNumbercorrect;
	           
	        }
	        return randomNumbercorrect;
	    }


	
	

}
