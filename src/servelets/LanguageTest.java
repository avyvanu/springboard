package servelets;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;


import util.ConnectDatabase;
import util.ConnectionDAO;


public class LanguageTest extends HttpServlet 
{
	protected void service(HttpServletRequest req, HttpServletResponse resp)
	{
		System.out.println(" ********************* INSIDE LANGUAGE TEST SERVLET **********************");
		HttpSession session = req.getSession();
		int USER_AUTOID =(Integer)session.getAttribute("USER_AUTOID");
		String partAAs[] = {"","","","","","","","","",""};
		String LangTestID = req.getParameter("LangTestID");	
		int countPart1 = Integer.parseInt(req.getParameter("countPart1"));
		System.out.println("countPart1\t"+countPart1);
		System.out.println(countPart1);
		for(int i=0;i<countPart1;i++)
		{
			partAAs[i] = req.getParameter("partA"+(i+1));
			System.out.println(partAAs[i]);
		}
		for(int i=countPart1;i<10;i++)
		{
			partAAs[i] = req.getParameter("truFalse"+(i+1));
			System.out.println("initial val:::::"+partAAs[i]);
			if(partAAs[i]==null)
			{
				partAAs[i]="";
			}
			System.out.println("changed val:::::"+partAAs[i]);
		}
		String PartB_A = req.getParameter("partBQ");		
		String PartC_A = req.getParameter("partCQ");
		System.out.println(" Part B Data "+PartB_A);
		System.out.println(" Part C Data "+PartC_A);
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		try
		{
			con = ConnectDatabase.getConnection();
			CallableStatement callLang = con.prepareCall("call Language_Test_Proc(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			callLang.setString(1, LangTestID);
			callLang.setString(2, partAAs[0]);
			callLang.setString(3, partAAs[1]);
			callLang.setString(4, partAAs[2]);
			callLang.setString(5, partAAs[3]);
			callLang.setString(6, partAAs[4]);
			callLang.setString(7, partAAs[5]);
			callLang.setString(8, partAAs[6]);
			callLang.setString(9, partAAs[7]);
			callLang.setString(10, partAAs[8]);
			callLang.setString(11, partAAs[9]);
			callLang.setString(12, PartB_A);
			callLang.setString(13, PartC_A);
			callLang.setInt(14, USER_AUTOID);			
			callLang.execute();
			RequestDispatcher rd=req.getRequestDispatcher("247Recruit/jsp/LanguageSuccessPage.jsp");
			rd.forward(req,resp);	
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println(e.getMessage());
			System.out.println(e.getCause());
		}
		finally
		{
			ConnectionDAO.closeConnection(con, null, rs);
		}
	}
}
