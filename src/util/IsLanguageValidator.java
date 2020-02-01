package util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class IsLanguageValidator {
	
	public static boolean typingTestValidator(int CandidateId)
	{
		boolean typingTestStatus = false;
	    try
		{
			Connection con = ConnectDatabase.getConnection();
			String userQuery = "select User_Id from bpo_user_typing_test_attempt where User_Id = '"+CandidateId+"'";
			System.out.println("Typing Test Qry:::"+userQuery);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(userQuery);
			if(rs.next())
			{
				typingTestStatus = true;
			}
			System.out.println("typingTestStatus:::"+typingTestStatus);
			rs.close();
			stmt.close();
			con.close();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return typingTestStatus;
	}
	
	public static boolean readingCompValidator(int CandidateId)
	{
		boolean readingCompStatus = false;
	    try
		{
			Connection con = ConnectDatabase.getConnection();
			String userQuery = "select User_Id from bpo_user_reading_comp_test_attempt where User_Id = '"+CandidateId+"'";
			System.out.println("Reading Comprehension Qry:::"+userQuery);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(userQuery);
			if(rs.next())
			{
				readingCompStatus = true;
			}
			System.out.println("readingCompStatus:::"+readingCompStatus);
			rs.close();
			stmt.close();
			con.close();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return readingCompStatus;
	}
	
	public static boolean engGrammarValidator(int CandidateId)
	{
		boolean engGrammerStatus = false;
	    try
		{
			Connection con = ConnectDatabase.getConnection();
			String userQuery = "select User_Id from bpo_user_eng_comp_test_attempt where User_Id = '"+CandidateId+"'";
			System.out.println("English Grammar Qry:::"+userQuery);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(userQuery);
			if(rs.next())
			{
				engGrammerStatus = true;
			}
			System.out.println("engGrammerStatus:::"+engGrammerStatus);
			rs.close();
			stmt.close();
			con.close();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return engGrammerStatus;
	}
	
	public static boolean precisTestValidator(int CandidateId)
	{
		boolean precisWritingStatus = false;
	    try
		{
			Connection con = ConnectDatabase.getConnection();
			String userQuery = "select User_Id from precis_test_attempt_master where User_Id = '"+CandidateId+"'";
			System.out.println("Precis Writing Qry:::"+userQuery);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(userQuery);
			if(rs.next())
			{
				precisWritingStatus = true;
			}
			System.out.println("precisWritingStatus:::"+precisWritingStatus);
			rs.close();
			stmt.close();
			con.close();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return precisWritingStatus;
	}
	
	public static boolean LanguageValidator(int CandidateId)
	{
		boolean languageStatus = false;
	    try
		{
			Connection con = ConnectDatabase.getConnection();
			String userQuery = "select Cand_id from language_test_attempt_master where Cand_Id="+CandidateId+"";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(userQuery);
			if(rs.next())
			{
				languageStatus = true;
			}
			System.out.println("languageStatus:::"+languageStatus);
			rs.close();
			stmt.close();
			con.close();	
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return languageStatus;
	}
	public static boolean mockChatValidator(int CandidateId)
	{
		boolean mockChatStatus = false;
	    try
		{
			Connection con = ConnectDatabase.getConnection();
			String userQuery = "select User_Id from mock_chat_test_attempt_master where User_Id = '"+CandidateId+"'";
			System.out.println("Mock Chat Qry:::"+userQuery);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(userQuery);
			if(rs.next())
			{
				mockChatStatus = true;
			}
			System.out.println("mockChatStatus:::"+mockChatStatus);
			rs.close();
			stmt.close();
			con.close();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return mockChatStatus;
	}
}
