package servelets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import util.ConnectDatabase;
import util.ConnectionDAO;

public class EditComprehensionStatus extends HttpServlet 
{
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		System.out.println("------------- Inside EditComprehensionStatus Servlet ----------");
		HttpSession session = request.getSession();
		String comprehensionID = request.getParameter("comprehensionID");
		String compStatus = request.getParameter("compStatus");
		String compIDStatus = request.getParameter("compIDStatus");
		String USER_ID = (String)session.getAttribute("USER_ID");
		Connection con = null;
		PreparedStatement ps = null;
		Statement st = null;
		ResultSet rs = null;
		int getIsActiveCount = 0;
		boolean doedit = false;
		try
		{
			if(compStatus.equalsIgnoreCase("0"))
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
				String editHistQuery = "INSERT INTO bpo_reading_comp_master_history(READING_COMP_MASTER_ID,Test_Name,Test_Header,PASSAGE,Is_Alive,Is_Deleted,Updated_By,Updated_On) select READING_COMP_MASTER_ID,Test_Name,Test_Header,PASSAGE,Is_Alive,Is_Deleted,Updated_By,Updated_On from bpo_reading_comp_master where READING_COMP_MASTER_ID = ?";
				PreparedStatement psEdit = con.prepareStatement(editHistQuery);
				psEdit.setString(1, comprehensionID);
				psEdit.execute();
				psEdit.close();
				
				String updateCompStatus = "update bpo_reading_comp_master set Is_Alive = ?, Updated_By = ?, Updated_On = now() where READING_COMP_MASTER_ID = ?";
				ps = con.prepareStatement(updateCompStatus);
				ps.setString(1, compStatus);
				ps.setString(2, USER_ID);
				ps.setString(3, comprehensionID);			
				int chkUpdate = ps.executeUpdate();
				if(chkUpdate > 0 )
				{
					System.out.println("update language status successfully ");
					session.setAttribute("ZERO", "1");
				}
				ps.close();				
			}
			request.getRequestDispatcher("/247Recruit/jsp/EditComprehensionStatus.jsp").forward(request, response);
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
