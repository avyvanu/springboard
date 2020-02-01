package servelets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.*;
import javax.servlet.http.*;
import util.ConnectDatabase;
import util.ConnectionDAO;


public class AddChatQuestion extends HttpServlet 
{
	private static final long serialVersionUID = 1042694291656683790L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		@SuppressWarnings("unused")
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();		
		String USER_ID = (String)session.getAttribute("USER_ID");
		String TestName = request.getParameter("TestName");
		@SuppressWarnings("unused")
		String noOfQues = request.getParameter("noOfQues");
		
		
		String chatQues[] = request.getParameterValues("chatQues");
		if(chatQues != null)
		{
			System.out.println(chatQues.length);
			// chatQues chatQues
			
			Connection con = null;
			Statement st = null;
			ResultSet rs = null;
			ResultSet rs2 = null;
			PreparedStatement psmt = null;
			PreparedStatement psmt1 = null;
			int getLastQues = 0;
			int getLastCount = 0;
			try
			{
				con = ConnectDatabase.getConnection();			
				
				con.setAutoCommit(false);
				
				String getTotalSm = "SELECT COUNT(*) AS scriptMaxId FROM mock_chat_script_master ";
				st = con.createStatement();
				rs2 = st.executeQuery(getTotalSm);
				if(rs2.last())
				{
					getLastCount = rs2.getInt("scriptMaxId");
				}			
				getLastCount += 1;
				System.out.println("Question master script Count \t"+getLastCount);		
				
				psmt1 = con.prepareStatement("INSERT INTO mock_chat_script_master(Chat_Script_Id, Chat_Type_Id, Chat_Description, Is_Active, Added_by, Added_on) VALUES(?, ?, ?, ?, ?, now())");
				psmt1.setInt(1, getLastCount);
				psmt1.setInt(2, 0);			
				psmt1.setString(3, TestName);
				psmt1.setInt(4, 1);				
				psmt1.setString(5, USER_ID);			
				
				int upDMSt = psmt1.executeUpdate();
				if(upDMSt > 0)
				{
					System.out.println("added master script type \t"+getLastCount);		
				}
				
				String getTotalQues = "SELECT DISTINCT(chat_script_id) AS totalQues FROM mock_chat_scripts";
				st = con.createStatement();
				rs = st.executeQuery(getTotalQues);
				if(rs.last())
				{
					getLastQues = rs.getInt("totalQues");
				}			
				getLastQues += 1;
				System.out.println("Question Count \t"+getLastQues);			
				int a = 1;
				for(int i = 0; i<chatQues.length; i++)
				{				
					if(!chatQues[i].isEmpty() || !chatQues[i].equals(""))
					{					
						psmt = con.prepareStatement("INSERT INTO mock_chat_scripts (Chat_Script_Id, Chat_Question_Id, Chat_Question, Is_Active, QAdded_by, QAdded_on) VALUES (?,?,?,?,?,now())");
						psmt.setInt(1, getLastQues);
						psmt.setInt(2, a);
						psmt.setString(3, chatQues[i]);
						psmt.setString(4, "1");
						psmt.setString(5, USER_ID);
						psmt.execute();			
					}
					a = a+1;
				}
			
				con.setAutoCommit(true);			
				session.setAttribute("MockChat", "4");
				
			request.getRequestDispatcher("/247Recruit/jsp/EditMockChatStatus.jsp").forward(request, response);
			}
			catch(Exception e)
			{
				e.printStackTrace();
				try 
				{
					con.rollback();
				} 
				catch (Exception esa) 
				{
					esa.printStackTrace();
				}
			}
			
			finally
			{
				ConnectionDAO.closeConnection(con, st, rs);
				
			}
		}
		else
		{
			request.setAttribute("NODATE", "ONE");
			request.getRequestDispatcher("/247Recruit/jsp/Admin_Add_MockChat_Test.jsp").forward(request, response);
		}
	}
}
