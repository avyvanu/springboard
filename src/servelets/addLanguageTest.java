package servelets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import util.ConnectDatabase;
import util.ConnectionDAO;

public class addLanguageTest extends HttpServlet 
{
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		System.out.println("--- Inside the Add Language Test ---");
		HttpSession session = request.getSession();
		CallableStatement callAddLangTest = null;
		Connection con = null;

		try
		{
			int PartAPart1QCount = Integer.parseInt(request.getParameter("PartAPart1QCount"));
			String USER_ID = (String)session.getAttribute("USER_ID");
			String TestName = request.getParameter("TestName");
			
			String ParagraphText = request.getParameter("ParagraphText");
			
			// PART A Module		
			String PartAHeader = request.getParameter("PartAHeader");

			String PartAPart1Header = request.getParameter("PartAPart1Header");

			String PartAPart2Header = request.getParameter("PartAPart2Header");

			String PartAPart1Q[] = request.getParameterValues("PartAPart1Q");
		
			String PartAPart2Q[] = request.getParameterValues("PartAPart2Q");
			
			String PartAQs[][] = {{"","","","","","","","","",""},{"","","","","","","","","",""}};
			
			for(int i = 0; i < PartAPart1QCount; i++)
			{
				PartAQs[0][i] = "1";
				PartAQs[1][i] = PartAPart1Q[i];
			}
			for(int j = 0; j < (10-PartAPart1QCount); j++)
			{
				PartAQs[0][PartAPart1QCount+j] = "2";
				PartAQs[1][PartAPart1QCount+j] = PartAPart2Q[j];
			}
			
			// Part B Module		
			String PartBHeader = request.getParameter("PartBHeader"); // 
			String PartBQuestion = request.getParameter("PartBQuestion");
			
			// Part C Module		
			String PartCHeader = request.getParameter("PartCHeader");
			String PartCQuestion[] = request.getParameterValues("PartCQuestion");			
			String partCQ[] ={"","",""}; 
			for(int k = 0; k < PartCQuestion.length; k++)
			{
				partCQ[k] = PartCQuestion[k];
			}

			con = ConnectDatabase.getConnection();
			callAddLangTest = con.prepareCall("call Add_LanguageTest_Question(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			callAddLangTest.setString(1, TestName);
			callAddLangTest.setString(2, ParagraphText);
			
			callAddLangTest.setString(3, PartAHeader);
			callAddLangTest.setString(4, PartAPart1Header);
			callAddLangTest.setString(5, PartAPart2Header);
			
			callAddLangTest.setString(6, PartAQs[1][0]);
			callAddLangTest.setString(7, PartAQs[0][0]);
			
			callAddLangTest.setString(8, PartAQs[1][1]);
			callAddLangTest.setString(9, PartAQs[0][1]);
			
			callAddLangTest.setString(10, PartAQs[1][2]);
			callAddLangTest.setString(11, PartAQs[0][2]);
			
			callAddLangTest.setString(12, PartAQs[1][3]);
			callAddLangTest.setString(13, PartAQs[0][3]);

			callAddLangTest.setString(14, PartAQs[1][4]);
			callAddLangTest.setString(15, PartAQs[0][4]);
			
			callAddLangTest.setString(16, PartAQs[1][5]);
			callAddLangTest.setString(17, PartAQs[0][5]);
			
			callAddLangTest.setString(18, PartAQs[1][6]);
			callAddLangTest.setString(19, PartAQs[0][6]);
			
			callAddLangTest.setString(20, PartAQs[1][7]);
			callAddLangTest.setString(21, PartAQs[0][7]);
			
			callAddLangTest.setString(22, PartAQs[1][8]);
			callAddLangTest.setString(23, PartAQs[0][8]);
			
			callAddLangTest.setString(24, PartAQs[1][9]);
			callAddLangTest.setString(25, PartAQs[0][9]);
			
			callAddLangTest.setString(26, PartBHeader);
			callAddLangTest.setString(27, PartBQuestion);
			
			callAddLangTest.setString(28, PartCHeader);
			callAddLangTest.setString(29, partCQ[0]);
			callAddLangTest.setString(30, partCQ[1]);
			callAddLangTest.setString(31, partCQ[2]);
			callAddLangTest.setString(32, USER_ID);
			callAddLangTest.executeQuery();
		}
		catch(Exception e)
		{
			e.getMessage();
			e.getCause();
			e.printStackTrace();			
		}
		finally
		{
			ConnectionDAO.closeConnection(con, null, null);
		}
		System.out.println(" Admin Added successfully questions in Language test ");
		session.setAttribute("ZERO", "5");
		request.getRequestDispatcher("/247Recruit/jsp/EditLanguageStatus.jsp").forward(request, response);
		System.out.println(" After Forwarding the request add language test");
	}
}
