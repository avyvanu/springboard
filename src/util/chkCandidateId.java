package util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;



public class chkCandidateId 
{
	boolean status=false;
	public static void main(String p[])
	{
		// sendMailNew("vishnuniit2010@gmail.com","3210132101vishnumistry#123","vishnuniit2010@gmail.com,ravi.object.tech@gmail.com,vishnuvihangamyoga@gmail.com","hi vishnu","hi msg for u");
	}
	public boolean validateIdentificationCode(int Passed_User_Auto_Id) 
	{
		
	try
	{
		Connection con= ConnectDatabase.getConnection();
		String userQuery = "SELECT * FROM cand_personal_details_final where Cand_Passed_Auto_Id='"+Passed_User_Auto_Id+"'";
		System.out.println(userQuery);
		System.out.println("query "+userQuery);
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(userQuery);
		if(rs.next())
		{
			status=true;
		}
	}
	catch (Exception e) 
	{
		e.printStackTrace();
	}
	return status;
	}
	
	
	/*
	public boolean chekWebServiceValidation(String userName, String password) 
	{
		
	try
	{
		Connection con= ConnectDatabase.getConnection();
		String userQuery = "SELECT * FROM cand_personal_details_final where Cand_Passed_Auto_Id='"+Passed_User_Auto_Id+"'";
		System.out.println(userQuery);
		System.out.println("query "+userQuery);
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(userQuery);
		if(rs.next())
		{
			status=true;
		}
	}
	catch (Exception e) 
	{
		e.printStackTrace();
	}
	return status;
	}*/
}
