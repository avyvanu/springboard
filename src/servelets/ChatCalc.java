package servelets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.ConnectDatabase;
import util.ConnectionDAO;

public class ChatCalc extends HttpServlet {

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession httpSession=request.getSession(true);
		Connection connection=ConnectDatabase.getConnection();
		String userid=(String)httpSession.getAttribute("USERID2");
		Integer count=0;
		
		
		
		Statement stmt=null;
		
		ResultSet rs=null;
		if(userid!=null)
		{
			
			try{
				
				String replString=null;
				String answeString=null;
				
			String query1="select replays,question_id,Answer from chatsavetable where USER_ID='"+userid+"' and status='0' and replays is not null"; 		
				
			 stmt=connection.createStatement();			
			 rs=stmt.executeQuery(query1);
			while(rs.next())
			{
				replString=rs.getString("replays");
				answeString=rs.getString("Answer");
				if(answeString.equalsIgnoreCase(replString))
				{
					count++;
					
				}
				
				
				String storeresult=count.toString();
				PreparedStatement pst=connection.prepareStatement("update result_total set chaterror=? where USER_ID='"+userid+"'"  );
				pst.setString(1, storeresult);
				int finalstatus=pst.executeUpdate();
				if(finalstatus!=0)
				{
					
					response.sendRedirect("sucess2.jsp");
				}
				
			}
				
			}
			
			catch (Exception e) {
				// TODO: handle exception
			}
			finally
			{
				  ConnectionDAO.closeConnection(connection, stmt, rs);				 
				
			}
			
			
		}
		
		
		
		

		
	}

}
