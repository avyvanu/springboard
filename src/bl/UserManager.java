package bl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import util.ConnectDatabase;

import beans.CompTestDTO;
import beans.LoginBean;
import beans.TypingTestDTO;

public class UserManager 
{
	Connection con=null;
	public boolean userLogin(LoginBean loginBean)
	{
		System.out.println("Login"+loginBean.getUserName());
		boolean status=false;
		
		try
		{
			con= ConnectDatabase.getConnection();
			String userQuery = "select EMAIL,USER_PASSWORD,USER_ID from bpo_user where EMAIL='"+loginBean.getUserName()+"' and USER_PASSWORD='"+loginBean.getPassword()+"'";
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
	public ArrayList compList(int compId,int qid)
	{
		ArrayList list = new ArrayList();
		try
		{
			con= ConnectDatabase.getConnection();
			Statement stmt = null;
			Statement stmt12 = null;
			ResultSet resultSet = null;
		
			String compQry = "select a.READING_COMP_MASTER_ID,a.PASSAGE,b.PASSAGE_QUESTION,b.READING_COMP_QUESTION_MASTER_ID from bpo_reading_comp_master a,bpo_reading_comp_question_master b  where a.READING_COMP_MASTER_ID=b.READING_COMP_MASTER_ID and a.READING_COMP_MASTER_ID="+compId+" and b.READING_COMP_QUESTION_MASTER_ID="+qid;
			System.out.println("new Query"+compQry);
			stmt = con.createStatement();
			resultSet=stmt.executeQuery(compQry);
			if(resultSet.next())
			{
				CompTestDTO compTestDTO= new CompTestDTO();
				compTestDTO.setCompId(resultSet.getInt("READING_COMP_MASTER_ID"));
				compTestDTO.setCompPassage(resultSet.getString("PASSAGE"));
				compTestDTO.setCompQsnId(resultSet.getInt("READING_COMP_QUESTION_MASTER_ID"));
				compTestDTO.setCompPassageQsn(resultSet.getString("PASSAGE_QUESTION"));
				list.add(compTestDTO);
			}
			else
			{
				qid =qid-1;
				String compQry12 = "select a.READING_COMP_MASTER_ID,a.PASSAGE,b.PASSAGE_QUESTION,b.READING_COMP_QUESTION_MASTER_ID from bpo_reading_comp_master a,bpo_reading_comp_question_master b  where a.READING_COMP_MASTER_ID=b.READING_COMP_MASTER_ID and a.READING_COMP_MASTER_ID="+compId+" and b.READING_COMP_QUESTION_MASTER_ID="+qid;
				System.out.println("new Query"+compQry12);
				stmt12 = con.createStatement();
				resultSet=stmt12.executeQuery(compQry12);
				
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList typingTestList()
	{
		ArrayList list = new ArrayList();
		try
		{
			con= ConnectDatabase.getConnection();
			Statement stmt = null;
			ResultSet resultSet = null;
		
			String compQry = "SELECT * FROM bpo_typing_master WHERE is_Active= 1 AND Is_Deleted = 0 ORDER BY RAND() LIMIT 1";
			System.out.println(compQry);
			stmt = con.createStatement();
			resultSet=stmt.executeQuery(compQry);
			if(resultSet.next())
			{
				TypingTestDTO typingTestDTO= new TypingTestDTO();
				typingTestDTO.setTypeId(resultSet.getInt("TYPING_MASTER_ID"));
				typingTestDTO.setPassage(resultSet.getString("PASSAGE"));
				list.add(typingTestDTO);
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return list;
	}
	public boolean validateUser(String emailAddr)
	{
		//System.out.println("Login"+loginBean.getUserName());
		boolean status=false;
		
		try
		{
			con= ConnectDatabase.getConnection();
			String userQuery = "select *from bpo_user_details where RE_ENTER_EMAIL_ADDRESS='"+emailAddr+"'";
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
	public boolean validateIdentificationCode(String code)
	{
		//System.out.println("Login"+loginBean.getUserName());
		boolean status=false;
		
		try
		{
			con= ConnectDatabase.getConnection();
			String userQuery = "select *from bpo_user_details where PHOTO_NUMBER='"+code+"'";
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
	
	//vishnu create-------------------------
	public boolean validateFirstNameLastNameDob(String firstname, String lastname, String DOB)
	{
		System.out.println("validateFirstNameLastNameDOB....validateFirstNameLastNameDOB....validateFirstNameLastNameDOB....");
		boolean status12=false;
	
		String str[]=DOB.split("-");    
		String date_in_correct_format=str[2]+"-"+str[1]+"-"+str[0];
		try
		{
			
			
			con= ConnectDatabase.getConnection();
			String userQuery = "select * from bpo_user_details where FIRST_NAME='"+firstname+"' and LAST_NAME='"+lastname+"' and DOB='"+date_in_correct_format+"'";
			//String userQuery = "select *from ipc_online_chat.bpo_user_details where FIRST_NAME="+firstname+" and LAST_NAME="+lastname+" and DOB="+DOB+";";
			
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
}
