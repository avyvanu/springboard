


package util;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class MaxiMumLanguageNo extends HttpServlet 
{

	
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String MaxiMumLanguageNo=request.getParameter("MaxiMumLanguageNo");
		String noQuestionLanguageAss=request.getParameter("noQuestionLanguageAss");
		//String testDurationLanguageAss=request.getParameter("testDurationLanguageAss");
		String queryStr="insert into maximum_language_assessment(Max_Score_Marks, No_of_Question ) values(?,?) ";
		System.out.println(queryStr);
		
		String update="update maximum_language_assessment set Max_Score_Marks='"+MaxiMumLanguageNo+"', No_of_Question='"+noQuestionLanguageAss+"'  where Maximum_Language_Assessment_ID=1";
		
		String getValue="select Max_Score_Marks, No_of_Question from maximum_language_assessment where Maximum_Language_Assessment_ID=1";
		System.out.println(getValue);
		
		//String UpdateValue="update ipc_online_chat.total_maximum_marks ";
		
		PreparedStatement ps=null;
		Statement st=null;
	    ResultSet rs=null;
		
		try
		{
			Connection con=ConnectDatabase.getConnection();
			
			ps=con.prepareStatement(getValue);
			System.out.println(ps);
			
			rs=ps.executeQuery();
			
			if(rs.next())
			{
				st=con.createStatement();
				//ps.setString(1,maximumNum);
				st.executeUpdate(update);
			
			}
			else
			{
				ps=con.prepareStatement(queryStr);
				ps.setString(1,MaxiMumLanguageNo);
				ps.setString(2,noQuestionLanguageAss);
				//ps.setString(3,testDurationLanguageAss);
				ps.executeUpdate();
			
				
			}
			RequestDispatcher rd= request.getRequestDispatcher("jsp/z1.jsp");
			rd.forward(request, response);
			
		}
		catch(Exception EX)
		{
			EX.printStackTrace();
		}

	}


}
