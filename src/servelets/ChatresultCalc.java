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

import util.ConnectDatabase;

public class ChatresultCalc extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ChatresultCalc() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		  Connection connection=ConnectDatabase.getConnection();
	      //  String userid=(String)session.getAttribute("USERID2");
	      String userid="4";
	      Statement stmt=null;
			
		  ResultSet rs=null;
	   
	      Integer count=0;
			if(userid!=null)
			{
				
			try
			{			
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
				} 
			
				String query22="update bpo_user_chat_test_attempt set  END_DATE_ACTIVE=sysdate() where user_id='"+userid+"'";
				System.out.println("query22"+query22);
				Statement stamtss=connection.createStatement();			
			    //int status =stamtss.executeUpdate(query22);
	          	//String storeresult=count.toString();
				PreparedStatement pst=connection.prepareStatement("update result_total set chaterror=? where USER_ID='"+userid+"'");
				System.out.println("pst"+pst);
				pst.setString(1, "0");
				int finalstatus=pst.executeUpdate();
				//response.sendRedirect("sucess2.jsp");
				if(finalstatus!=0)
				{
					
					response.sendRedirect("sucess2.jsp");
				}
			}
			catch (Exception e) 
				{
						// TODO: handle exception
				}
		
			}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
