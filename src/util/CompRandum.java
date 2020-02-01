package util;
import java.sql.ResultSet;
import util.ConnectDatabase;
import java.sql.Connection;
import java.sql.Statement;



public class CompRandum {

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
	        int max =CountQ.CompRandumNumber();
	        String READING_COMP_MASTER_ID=null;
	        System.out.println("MAX="+max);
	        ConnectDatabase connectDatabase=new ConnectDatabase();
	        Connection connection=connectDatabase.getConnection();
	        try
	        {
	        String regQry = "SELECT READING_COMP_MASTER_ID FROM bpo_reading_comp_master where Is_Alive = 1 and Is_Deleted = 0 order by READING_COMP_MASTER_ID  desc limit 1";
	        System.out.println("regQry::::::::"+regQry);
	        Statement stmt = connection.createStatement();
	        ResultSet rs = stmt.executeQuery(regQry);
	        if(rs.next())
	        {
	        	READING_COMP_MASTER_ID=	rs.getString("READING_COMP_MASTER_ID");
	        	System.out.println("READING_COMP_MASTER_ID:::"+READING_COMP_MASTER_ID);
	        } 
	        }
	        catch(Exception e)
	        {
	        e.printStackTrace();
	        }
	        for (int i = 0; i < Integer.parseInt(READING_COMP_MASTER_ID); i++) 
	        	
	        {
	            rawRandomNumber = (int) (Math.random() * (max - min ) ) + min;
	            System.out.println("rawRandomNumber:::"+rawRandomNumber);
	            randomNumber = rawRandomNumber;
	            System.out.println("randomNumber:::"+randomNumber);
	        }
	        return randomNumber;
	    }
}
