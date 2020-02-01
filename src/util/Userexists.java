package util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class Userexists {
	public static boolean validateUserExists(int CandidateId)
	{
		System.out.println("Validate the user data already entered");
		boolean status12=false;
	    
		
		try
		{
			Connection con= ConnectDatabase.getConnection();
			String userQuery = "select * from candidate_voice_score where cand_id="+CandidateId+"";
			System.out.println(userQuery);
			System.out.println("query "+userQuery);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(userQuery);
			if(rs.next())
			{
				status12=true;
			}
		}
		
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return status12;
	}
	public static boolean validateUserExistschat(int CandidateId)
	{
		System.out.println("Validate the user data already entered");
		boolean status12=false;
	    try
		{
			Connection con= ConnectDatabase.getConnection();
			String userQuery = "select * from candidate_chat_score where cand_id="+CandidateId+"";
			System.out.println(userQuery);
			System.out.println("query "+userQuery);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(userQuery);
			if(rs.next())
			{
				status12=true;
			}
		}
		
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return status12;
	}
	public static boolean validateUserExistsprecis(int CandidateId)
	{
		System.out.println("Validate the user data already entered");
		boolean status12=false;
	    
		
		try
		{
			Connection con= ConnectDatabase.getConnection();
			String userQuery = "select * from candidate_precis_writing_score where cand_id="+CandidateId+"";
			System.out.println(userQuery);
			System.out.println("query "+userQuery);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(userQuery);
			if(rs.next())
			{
				status12=true;
			}
		}
		
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return status12;
	}
	public static boolean validateUserExistslang(int CandidateId)
	{
		System.out.println("Validate the user data already entered");
		boolean status12=false;
	    
		
		try
		{
			Connection con= ConnectDatabase.getConnection();
			String userQuery = "select * from candidate_language_testscore where Cand_Id="+CandidateId+"";
			System.out.println(userQuery);
			System.out.println("query "+userQuery);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(userQuery);
			if(rs.next())
			{
				status12=true;
			}
		}
		
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return status12;
	}
	public static boolean validatestabilityid(int CandidateId)
	{
		System.out.println("Validate the user data already entered");
		boolean status12=false;
	   try
		{
			Connection con= ConnectDatabase.getConnection();
			String userQuery = "select End_Date from stability_chk_master where Candidate_ID="+CandidateId+" AND End_Date IS NOT NULL";
			System.out.println("query "+userQuery);
			Statement stmts = con.createStatement();
			ResultSet rss = stmts.executeQuery(userQuery);
			if(rss.next())
			{
				status12=true;
				System.out.println("status12"+status12);
			}
		}
		
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return status12;
	}
	public static boolean validateoperationsid(int CandidateId)
	{
		System.out.println("Validate the user data already entered");
		boolean status12=false;
	   try
		{
			Connection con= ConnectDatabase.getConnection();
			String userQuery = "select End_Date from operations_interview_master where Candidate_ID="+CandidateId+"  AND End_Date IS NOT NULL";
			System.out.println(userQuery);
			System.out.println("query "+userQuery);
			Statement stmts = con.createStatement();
			ResultSet rss = stmts.executeQuery(userQuery);
			if(rss.next())
			{
				status12=true;
				System.out.println("status12"+status12);
			}
		}
		
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return status12;
	}
	
	
}


