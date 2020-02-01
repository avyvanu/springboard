package util;


import util.Dbconfiguration;
public class ReadAndPrintXMLFile{

    public static void CallXML()
    {
    	Dbconfiguration dbconfiguration = new Dbconfiguration();

    	//****************************************************************//
    	
		//String ipaddress = "jdbc:mysql://172.30.0.87:3306"; // LIVE SERVER
	   String ipaddress = "jdbc:mysql://172.30.0.77:3306"; // Staging server
		  System.out.println("ipaddress::::"+ipaddress);
		//****************************************************************//
		//****************************************************************//
		  
		String schema = "247recruitmentnew";
		String finalurl = ipaddress+"/"+schema;
		Dbconfiguration.setURl(finalurl);
		    
		//****************************************************************//
		//****************************************************************//
		   		    
		String username = "risuser"; // LIVE SERVER
		dbconfiguration.setUsername(username);
		
		//****************************************************************//
		//****************************************************************//
		
		//String passwordstr = "r!suser";  // LIVE SERVER
		String passwordstr = "risuser"; // Staging Server
		dbconfiguration.setPassword(passwordstr);   
    }

}