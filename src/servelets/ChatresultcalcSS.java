package servelets;

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
import javax.servlet.http.HttpSession;

import util.ConnectDatabase;
import util.ConnectionDAO;

public class ChatresultcalcSS extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
	    int USER_AUTOID =(Integer)session.getAttribute("USER_AUTOID");
		String USER_Name =(String) session.getAttribute("USER_Name");
		System.out.println("Chat Calculation Page-------"+USER_AUTOID+"-----------"+USER_Name);
		if(USER_AUTOID == 0)
        {
			response.sendRedirect("jsp/Login.jsp");
        }
	   	String transcrptQuery = request.getParameter("transcrptQuery");
	   	System.out.println("transcript data-------"+transcrptQuery);
	   	Connection connection=ConnectDatabase.getConnection();
	   	Statement stmtscriptid = null;
		ResultSet rssscriptid = null;
           
	if(USER_AUTOID!=0)
	{
		try
		{	
				
			String scriptid=null;
	      	String mokscriptid = "SELECT scriptid FROM mokchat_scriptid_archive where userid='"+USER_AUTOID+"'";
	      	System.out.println("Script id ::"+mokscriptid);
	      	stmtscriptid = connection.createStatement();
			rssscriptid = stmtscriptid.executeQuery(mokscriptid);
	      	if(rssscriptid.next())
	      	{
	      		scriptid=rssscriptid.getString(1);
		        System.out.println("Mok script Id ::"+scriptid);			      	
	      	}	
				String insertQuery="update  mock_chat_test_attempt_master set End_date_test=sysdate(),chat_script_id='"+scriptid+"', Transcript='"+transcrptQuery+"' where user_id='"+USER_AUTOID+"'";
				PreparedStatement Pst = connection.prepareStatement(insertQuery);						 
			    int chk=Pst.executeUpdate();
			    
			    if(chk>0)
			    {
			    	System.out.println("inserted sucessfully");
			        response.sendRedirect("jsp/Chat_Sucess.jsp");			    	
			    }
			    Pst.close();
			    
	}
	catch (Exception e) 
		{
			System.out.println("pst:sss"+e.getMessage());	
		}
	finally
	{
		  ConnectionDAO.closeConnection(connection, stmtscriptid, rssscriptid);		
		  
	}
	

	}
	}

	
}
