package servelets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import util.ConnectDatabase;
import util.ConnectionDAO;

public class EditLanguageStatus extends HttpServlet 
{
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		System.out.println("------------- Inside EditLanguageStatus Servlet ----------");
		HttpSession session = request.getSession();
		String languageID = request.getParameter("languageID");
		String langStutas = request.getParameter("langStutas");
		
		Connection con = null;
		PreparedStatement ps = null;
		Statement st = null;
		ResultSet rs = null;
		int getIsActiveCount = 0;
		boolean doedit = false;
		try
		{
			if(langStutas.equalsIgnoreCase("0"))
			{
				getIsActiveCount = (Integer)session.getAttribute("ActiveTestCount");
				if(getIsActiveCount > 1)
				{
					doedit = true;
				}
				else
				{
					session.setAttribute("ZERO", "0");
				}			
			}
			else
			{
				doedit = true;				
			}
			if(doedit)
			{
				con = ConnectDatabase.getConnection();
				String updateLangStatus = "update language_test_master set Is_Active = ? where Lang_Test_Id = ?";
				ps = con.prepareStatement(updateLangStatus);
				ps.setString(1, langStutas);
				ps.setString(2, languageID);			
				int chkUpdate = ps.executeUpdate();
				if(chkUpdate > 0 )
				{
					System.out.println("update language status successfully ");
					session.setAttribute("ZERO", "1");
				}
				ps.close();				
				
				String languageIDStatus = request.getParameter("languageIDStatus");
				String USER_ID = (String)session.getAttribute("USER_ID");
				String editHistQuery = "INSERT INTO language_test_edit_history(Lang_test_id,Lang_test_status,Updated_on,Updated_by,Updated_status) VALUES(?,?,now(),?,?)";
				PreparedStatement psEdit = con.prepareStatement(editHistQuery);
				psEdit.setString(1, languageID);
				psEdit.setString(2, languageIDStatus);
				psEdit.setString(3, USER_ID);
				psEdit.setString(4, langStutas);
				psEdit.execute();
				psEdit.close();
			}
			request.getRequestDispatcher("/247Recruit/jsp/EditLanguageStatus.jsp").forward(request, response);
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
