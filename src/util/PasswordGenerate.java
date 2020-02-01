package util;

import java.util.Random;

public class PasswordGenerate 
{
	  public static String getPassword(int n) {
	    char[] pw = new char[n];
	    int c  = 'A';
	    int  r1 = 0;
	    for (int i=0; i < n; i++)
	    {
	      r1 = (int)(Math.random() * 3);
	      switch(r1) {
	        case 0: c = '0' +  (int)(Math.random() * 10); break;
	        case 1: c = 'a' +  (int)(Math.random() * 26); break;
	        case 2: c = 'A' +  (int)(Math.random() * 26); break;
	      }
	      pw[i] = (char)c;
	    }
	    return new String(pw);
	  }
	  
	  public static void main(String[] args) {
	    int len = 8; // default 8 on unix, more is useless
	    
	    /*if (args.length >= 1)
	    {
	      try
	      {
	        len = Integer.parseInt(args[0]);
	      }
	      catch (NumberFormatException nfe){
	      }
	    }*/
	    System.out.println(getPassword(len));
	    System.out.println(generateRandomKey(2));
	  }
	  public static String generateRandomKey(int length)
		{
			String sKey="";	
			Random random=new Random(System.currentTimeMillis());
			long r1 = random.nextLong();
	 		long r2 = random.nextLong();
	 		String hash1 = Long.toHexString(r1);
			//String hash2 = Long.toHexString(r2);
			sKey = hash1;
			if(sKey.length()>length)
			{
				sKey=sKey.substring(0,length);
			}
			return sKey.toUpperCase();
		}
	} 