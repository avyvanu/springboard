package servelets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServletV extends HttpServlet {

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession session = req.getSession();
		session.invalidate();
		
		System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<< ALL THE SESSION VALUE BECOME INVALIDATE >>>>>>>>>>>>>>>>>>>");
		
		//req.getRequestDispatcher("/jsp/Login.jsp").forward(req, resp);
		resp.sendRedirect("jsp/Login.jsp");
	}

}
