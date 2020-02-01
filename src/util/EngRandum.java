package util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class EngRandum {
	/**
	 * @param args
	 */
	public static void main(String[] args) 
	{
		int i =  doRawRandomNumber();
		System.out.println(i);
	}
	 public static int doRawRandomNumber()
	 {

	        int rawRandomNumber=0;
	        int randomNumber =0;
	        int min = 01;
	        int max =CountQ.englishRandumNumber();
	        String READING_COMP_MASTER_ID=null;
	        System.out.println("MAX="+max);
	        ConnectDatabase connectDatabase=new ConnectDatabase();
	       
	        Connection connection=connectDatabase.getConnection();
	        //Statement statement=connection.createStatement();
	       
	        
	        
	        try
	        {
	        String regQry = "SELECT READING_COMP_MASTER_ID FROM bpo_eng_comp_master order by READING_COMP_MASTER_ID  desc limit 1";
	        
	        
	        Statement stmt = connection.createStatement();
	        ResultSet rs = stmt.executeQuery(regQry);
	        if(rs.next())
	        {
	        	READING_COMP_MASTER_ID=	rs.getString("READING_COMP_MASTER_ID");
	        
	        } 
	        }
	        catch(Exception e)
	        {
	        e.printStackTrace();
	        }
	        
	        
	        
	       
	        for (int i = 0; i < Integer.parseInt(READING_COMP_MASTER_ID); i++) 
	        	
	        {
	            rawRandomNumber = (int) (Math.random() * (max - min +1 ) ) + min;
	            randomNumber = rawRandomNumber;
	           
	        }
	        System.out.println("ranNum from java "+randomNumber);
	        return randomNumber;
	    }
}
