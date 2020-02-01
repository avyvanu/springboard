package servelets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
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

@SuppressWarnings("serial")
public class EditMockChatTestStatus extends HttpServlet 
{
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		String chatScriptId = request.getParameter("chatScriptId");
		String Mockstatus_new = request.getParameter("Mockstatus");
		String mockStatusID_old = request.getParameter("mockStatusID");
		String USER_ID = (String)session.getAttribute("USER_ID");

		Connection con = null;
		PreparedStatement ps = null;
		Statement st = null;
		ResultSet rs = null;
		int getIsActiveCount = 0;
		boolean doedit = false;
		CallableStatement callforAll = null;
		try
		{
			if(Mockstatus_new.equalsIgnoreCase("0"))
			{
				getIsActiveCount = (Integer)session.getAttribute("ActiveTestCount");
				if(getIsActiveCount > 1)
				{
					doedit = true;					
				}
				else
				{
					session.setAttribute("MockChat", "0");
				}			
			}
			else
			{
				doedit = true;				
			}
			if(doedit)
			{
				con = ConnectDatabase.getConnection();	// mockchat_test_master_history_proc			
				callforAll = con.prepareCall("call mock_chat_script_master_History_Proc(?,?,?,?)");				
				callforAll.setString(1, chatScriptId);
				callforAll.setString(2, Mockstatus_new);
				callforAll.setString(3, mockStatusID_old);
				callforAll.setString(4, USER_ID);				
				int chk = callforAll.executeUpdate();
				if(chk > 0)
				{
					System.out.println(" Inside the Called procedure successfully for All ");
					session.setAttribute("MockChat", "1");
					request.getRequestDispatcher("/247Recruit/jsp/EditMockChatStatus.jsp").forward(request, response);
				}
				System.out.println(" --------------- DONE ---------------------");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			ConnectionDAO.closeConnection(con, st, rs);
		}
	}
}
