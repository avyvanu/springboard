package servelets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import util.ConnectDatabase;
import util.ConnectionDAO;

@SuppressWarnings("serial")
public class ApplyingFor extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("Do Applying For...");
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		String skillSet = request.getParameter("skillSet");
		String voiceProcess = request.getParameter("voiceProcess");
		String chatProcess = request.getParameter("chatProcess");
		String ProcessType = null;
		String ForwardToPage = null;
		System.out.println("Skill Set : " + skillSet + ", Voice : " + voiceProcess + ", Chat : " + chatProcess);
		int USER_AUTOID = (Integer)session.getAttribute("USER_AUTOID");			
		System.out.println("USER_AUTOID:::::"+USER_AUTOID);
		Connection con = null;
		java.sql.PreparedStatement ps=null;
		try
		{
			if(!skillSet.equals("0"))
			{
				String queryApplyingFor = "update bpo_candidatesreg_details set cand_Status = ?, Applying_For = ?";
				if(skillSet.equals("1"))
				{
					queryApplyingFor = queryApplyingFor + ", voiceTypeProcess=?";
					ProcessType = voiceProcess;
					ForwardToPage = "247Recruit/jsp/VoiceTestCall.jsp";
				}
				else
				{
					queryApplyingFor = queryApplyingFor + ", chatTypeProcess=?";
					ProcessType = chatProcess;
					session.setAttribute("ScriptType", chatProcess);
					ForwardToPage = "247Recruit/jsp/ForwardToclickmypic.jsp";
				}				
				queryApplyingFor = queryApplyingFor + ", InitiateExam=? where AutoID=?";
				System.out.println("Query ::: "+queryApplyingFor);
				con = ConnectDatabase.getConnection();
				ps = con.prepareStatement(queryApplyingFor);
				ps.setInt(1, 3);
				ps.setString(2, skillSet);
				ps.setString(3, ProcessType);
				ps.setString(4, "1");
				ps.setInt(5, USER_AUTOID);
				int a = ps.executeUpdate();
				ps.close();
				if(a > 0)
				{
					RequestDispatcher rdafs = request.getRequestDispatcher(ForwardToPage);
					rdafs.forward(request, response);
				}
				else
				{
					if(skillSet.equals("2"))
					{
						session.removeAttribute("ScriptType");
					}
					RequestDispatcher rdaff = request.getRequestDispatcher("247Recruit/jsp/ApplyingFor.jsp");
					rdaff.forward(request, response);
				}
			}
			else
			{
				RequestDispatcher rdaf = request.getRequestDispatcher("247Recruit/jsp/ApplyingFor.jsp");
				rdaf.forward(request, response);
			}
		}
		catch(Exception ex)
		{
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
		finally
		{
			ConnectionDAO.closeConnection(con, null, null);	
		}
	}
}
