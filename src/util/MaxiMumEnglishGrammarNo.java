


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



public class MaxiMumEnglishGrammarNo extends HttpServlet 
{

	
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String MaxiMumEnglishGrammarNo=request.getParameter("MaxiMumEnglishGrammarNo");
		String noQuestionEnglishGrammar=request.getParameter("noQuestionEnglishGrammar");
		//String testDurationEnglishGrammar=request.getParameter("testDurationEnglishGrammar");
		
		String queryStr="insert into maximum_english_grammar(Max_Score_Marks, No_of_Question) values(?,?) ";
		System.out.println(queryStr);
		
		String update="update maximum_english_grammar set Max_Score_Marks='"+MaxiMumEnglishGrammarNo+"', No_of_Question='"+noQuestionEnglishGrammar+"' where MaxiMum_EnglishGrammar_ID=1";
		
		String getValue="select Max_Score_Marks, No_of_Question  from maximum_english_grammar where MaxiMum_EnglishGrammar_ID=1";
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
				ps.setString(1,MaxiMumEnglishGrammarNo);
				ps.setString(2,noQuestionEnglishGrammar);
				//ps.setString(3,testDurationEnglishGrammar);
				ps.executeUpdate();
			
				
			}
			RequestDispatcher rd=request.getRequestDispatcher("jsp/z.jsp");
			rd.forward(request, response);
			System.out.println("u added sucessfully..number for MaxiMumEnglishGrammar ");
			
		}
		catch(Exception EX)
		{
			EX.printStackTrace();
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
