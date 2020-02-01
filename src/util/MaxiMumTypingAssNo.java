


package util;

import java.awt.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.bcel.internal.generic.GETSTATIC;

import sun.security.action.GetBooleanAction;



public class MaxiMumTypingAssNo extends HttpServlet 
{

	
	
	public void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		
		String MaxiMumTypingAssNo=request.getParameter("MaxiMumTypingAssNo").trim();
		//String testDurationTypingTest=request.getParameter("testDurationTypingTest").trim();
		
	
		
		String queryStr="insert into maximum_typing_ass_no (Max_Score) values(?)";
		System.out.println(queryStr);
		
		String update="update maximum_typing_ass_no set Max_Score='"+MaxiMumTypingAssNo+"' where MaxiMumTypingAss_Id=1";
		System.out.println("Update query   :"+update);
		
		String getValue="select Max_Score from ipc_online_chat.maximum_typing_ass_no where MaxiMumTypingAss_Id=1";
		System.out.println(getValue);
	
		
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
			
				st.executeUpdate(update);
			
			}
			else
			{
				ps=con.prepareStatement(queryStr);
				ps.setString(1,MaxiMumTypingAssNo);
				//ps.setString(2,testDurationTypingTest);
				ps.executeUpdate();
			
				
			}
			RequestDispatcher rd=request.getRequestDispatcher("jsp/z3.jsp");
			rd.forward(request, response);
			
		}
		catch(Exception EX)
		{
			EX.printStackTrace();
		}

	}

	
}
