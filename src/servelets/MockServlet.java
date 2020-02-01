package servelets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.ConnectDatabase;

public class MockServlet extends HttpServlet 
{
	protected  void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		HttpSession session=request.getSession();
		int USER_AUTOID = (Integer) session.getAttribute("USER_AUTOID"); // session id
		System.out.println("USER_AUTOID::========::"+USER_AUTOID);
		
		String transcriptdump=(String)request.getParameter("transcriptdump").trim();
		transcriptdump = transcriptdump.replaceAll("\\s+", " ");
		System.out.println(transcriptdump);

		System.out.println("transcriptdump== :\t"+transcriptdump);
		
		
		String hidQID[]=request.getParameterValues("hidQID");
		String hidQ[]=request.getParameterValues("hidQ");
		String hidA[]=request.getParameterValues("hidA");
		
		String AutoScriptID=request.getParameter("AutoScriptID");
		System.out.println("AutoScriptID== :\t"+AutoScriptID);
		Connection con=null;
		PreparedStatement psmt=null;
		try
		{
			for(int i=0;i<hidQID.length; i++)
			{
				 con=ConnectDatabase.getConnection();
				 String queryForMOKTESTDETAILS="insert into mock_chat_test_details(User_Id, Chat_Test_Attempt_Id, Chat_Question_Id, Chat_Question, User_Reply) value(?,?,?,?,?)"; 
				 
				 psmt=con.prepareStatement(queryForMOKTESTDETAILS);
				 psmt.setInt(1, USER_AUTOID);
				 psmt.setString(2,AutoScriptID);
				 psmt.setString(3, hidQID[i].trim());
				 psmt.setString(4,hidQ[i].trim());
				 psmt.setString(5,hidA[i].trim());
		    	 int chkUpdated=psmt.executeUpdate();
		    	 if(chkUpdated>0)
		    	 {
		    		 System.out.println("  **  mock_chat_test_details Data inserted ** ");
		    	 }
		    	 psmt.close();
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("+++++++++++++++++  \t "+e.getMessage());
		}
		
		
		
		
		// *********************** transcript Complete Dump ********************************
		try
		{
			String insertQuery="update  mock_chat_test_attempt_master set End_date_test=sysdate(),transcript=? where user_id='"+USER_AUTOID+"'";
			PreparedStatement Pst = con.prepareStatement(insertQuery);
			Pst.setString(1,transcriptdump); 
	        int k=Pst.executeUpdate();
		    System.out.println("inserted sucessfully"); 
			
		    if(k!=0)
           	{
		    	RequestDispatcher rd=request.getRequestDispatcher("/247Recruit/jsp/MockChatSucessPage.jsp");
		    	rd.forward(request, response);
           	}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("+++++++++++++++++  \t "+e.getMessage());
		}

	}


}
