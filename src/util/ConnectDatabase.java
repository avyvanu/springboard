package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import util.Dbconfiguration;

/**
 * make this class as Singleton
 * @author common
 *
 */
public class ConnectDatabase {
	
	

	 static String CONNECTION_URL=null;
	 

	//final static String CONNECTION_URL = "jdbc:mysql://localhost:3306/medidb";
	
	public static Connection getConnection(){
		ReadAndPrintXMLFile.CallXML();
		CONNECTION_URL=Dbconfiguration.getURl();
	//System.out.println("CONNECTION_URL>>>>"+CONNECTION_URL);
		Connection con = null;
		
		try{
	
			if ( con == null){
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				con = DriverManager.getConnection(CONNECTION_URL, Dbconfiguration.getUsername(), Dbconfiguration.getPassword());
				//System.out.println("DB CONNECTION SUCESSFULL !!!");
			}
			
		}catch(SQLException sqlex){
			System.out.println("ConnectDatabase class SQL Error" +sqlex);
		}catch(Exception classex){
			System.out.println("ConnectDatabase class Driver Error");
		}
		return con;
	}
   public static void main(String[] args) {
	  System.out.println(getConnection());
}

}
