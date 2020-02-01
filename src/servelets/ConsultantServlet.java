package servelets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.ConnectDatabase;

public class ConsultantServlet extends HttpServlet 
{
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String chkURI=request.getHeader("Referer");
		boolean beTrue = true;
		if(chkURI==null){
			request.getRequestDispatcher("/247Recruit/jsp/Index.jsp").forward(request, response);
			//response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Index.jsp");
			beTrue = false;
		}else{
			chkURI = chkURI.toLowerCase();
			if(chkURI.indexOf(request.getContextPath().toLowerCase()) < 1){
				//response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Index.jsp");
				request.getRequestDispatcher("/247Recruit/jsp/Index.jsp").forward(request, response);
				beTrue = false;
			}
		}
		if(beTrue){
			String FullURL = request.getRequestURL()+"?"+request.getQueryString();
			FullURL = FullURL.toLowerCase();
			if(FullURL.indexOf("sessionid") > 0 || FullURL.indexOf("%3cscript%3e") > 0){
				//response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Index.jsp");
				request.getRequestDispatcher("/247Recruit/jsp/Index.jsp").forward(request, response);
				beTrue = false;
			}
		}

		HttpSession session = request.getSession();
		String USER_ID = (String)session.getAttribute("USER_ID");
		Object old_consId = session.getAttribute("CONSID");
		Object old_consName = session.getAttribute("CONSNAME");
		String old_consIsActive = (String)session.getAttribute("CONSACTIVE");
		System.out.println(old_consId+"<<<<<<<<\t"+old_consName+"<<<<<<<<\t"+old_consIsActive);
		
		String cid = request.getParameter("cid");
		String ids = request.getParameter("id");
		String addNewConsultName = request.getParameter("addn");
		String isActive = request.getParameter("act");
		String deleteReason = request.getParameter("delr");
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;

		PreparedStatement ps = null;
		CallableStatement call = null;
		System.out.println("ID:\t   "+ids+"   New Consult Name:\t   "+addNewConsultName+"   Selected Status:\t"+isActive+"   Delete Reason\t"+deleteReason);
	if(beTrue)
	{
	try
	{
		con = ConnectDatabase.getConnection();
		st = con.createStatement();
		if(ids.equalsIgnoreCase("1"))
		{
			System.out.println(" ++++++++++++++++++++    NEW ADDED CONSULTANT    ++++++++++++++++++++++ ");
			int getCons = 0;
			String getMaxConsultId = "SELECT COUNT(Consultant_Value) AS Consultant_Value FROM consultant_master";
			rs = st.executeQuery(getMaxConsultId);
			if(rs.next())
			{
				getCons = rs.getInt("Consultant_Value");
				System.out.println("Get Count Of Consultant Value \t"+getCons);
			}
			rs.close();
			getCons = getCons+1;
			
			ps = con.prepareStatement("INSERT INTO consultant_master(Consultant_Value, Consultant_Name, Is_Active, Added_by, Added_on) VALUES(?,?,?,?,now())");
			ps.setInt(1,getCons);
			ps.setString(2,addNewConsultName);
			ps.setInt(3,1);	
			ps.setString(4,USER_ID);	
			int insrt = ps.executeUpdate();
			if(insrt > 0)
			{
				session.setAttribute("CONS_MSG", "1");
				request.getRequestDispatcher("247Recruit/jsp/Admin_Consult_Messages_Page.jsp").forward(request, response);
			}
			ps.close();			
		}
		else if(ids.equalsIgnoreCase("2"))
		{
			System.out.println(" ++++++++++++++++++++    UPDATED CONSULTANT    ++++++++++++++++++++++ ");
			call = con.prepareCall("call Updated_ConsultName_Proc(?,?,?)");
			
			call.setInt(1, Integer.parseInt(cid));
			call.setInt(2, Integer.parseInt(isActive));
			call.setString(3, USER_ID);
			int x = call.executeUpdate();			
			if(x > 0)
			{
				session.setAttribute("CONS_MSG", "2");
				request.getRequestDispatcher("247Recruit/jsp/Admin_Consult_Messages_Page.jsp").forward(request, response);
			}
			call.close();
			
		}
		else if(ids.equalsIgnoreCase("3"))
		{
			System.out.println(" ++++++++++++++++++++    DELETED CONSULTANT    ++++++++++++++++++++++ ");

			call = con.prepareCall("call Deleted_ConsultName_Proc(?,?,?)");			
			call.setInt(1, Integer.parseInt(cid));
			call.setString(2, deleteReason);
			call.setString(3, USER_ID);
			int x = call.executeUpdate();			
			if(x > 0)
			{
				session.setAttribute("CONS_MSG", "3");
				request.getRequestDispatcher("247Recruit/jsp/Admin_Consult_Messages_Page.jsp").forward(request, response);
			}
			call.close();
		}
	}	
	catch(Exception ex)
	{
		ex.printStackTrace();
	}
   } 
}

}
