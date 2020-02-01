


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



public class MaxiMumReadingCompNo extends HttpServlet 
{

	
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String MaxiMumReadingCompNo=request.getParameter("MaxiMumReadingCompNo");
		String noQuestionReadingComp=request.getParameter("noQuestionReadingComp");
		//String testDurationReadingComp=request.getParameter("testDurationReadingComp");
		String queryStr="insert into maximum_read_assement_no(MaxScoreMarks, No_of_Question ) values(?,?) ";
		System.out.println(queryStr);
		
		String update="update maximum_read_assement_no set MaxScoreMarks='"+MaxiMumReadingCompNo+"', No_of_Question='"+noQuestionReadingComp+"' where Maximum_read_assement_ID=1";
		
		String getValue="select MaxScoreMarks,No_of_Question from ipc_online_chat.maximum_read_assement_no where Maximum_read_assement_ID=1";
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
				
				st.executeUpdate(update);
			
			}
			else
			{
				ps=con.prepareStatement(queryStr);
				ps.setString(1,MaxiMumReadingCompNo);
				ps.setString(2,noQuestionReadingComp);
				//ps.setString(3,testDurationReadingComp);
				ps.executeUpdate();
			
				
			}
			RequestDispatcher rd=request.getRequestDispatcher("jsp/z2.jsp");
			rd.forward(request, response);
			
		}
		catch(Exception EX)
		{
			EX.printStackTrace();
		}

	}

	
}
