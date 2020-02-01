package util;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class WithCamWithoutCam extends HttpServlet 
{

	private ServletRequest session;

	public void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{
		
		HttpSession httpSession=request.getSession(true);

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String WithCam=request.getParameter("WithCam");
		System.out.println("for with cam"+WithCam);
		
		
		Connection con= null;
		Statement st=null;
		ResultSet rs=null, WebInfors=null;
		PreparedStatement pstmt=null;
		
		
		System.out.println(httpSession.getAttribute("USERID"));
	
		Long userID=(Long)httpSession.getAttribute("USERID");
		HttpSession sessionWebInfo=request.getSession();
		sessionWebInfo.setAttribute("WithCam",WithCam);
		
		
		String webCamQuery1="update bpo_user set Web_info='"+WithCam+"' where USER_ID="+userID ;
		System.out.println(""+webCamQuery1);
		try
		{
			
			
			System.out.println("in java session ====");
			
			con = ConnectDatabase.getConnection();
			st=con.createStatement();
			int status=st.executeUpdate(webCamQuery1);
			
				if(WithCam.equals("Yes"))
				{
					RequestDispatcher rd=request.getRequestDispatcher("/jsp/clickmypic.jsp");
					rd.forward(request, response);
				}
				else 
				{
					RequestDispatcher rd=request.getRequestDispatcher("/jsp/instruction.jsp");
					rd.forward(request, response);
				}
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
	
		
	}


}
