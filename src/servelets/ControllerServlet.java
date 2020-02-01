package servelets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class ControllerServlet extends HttpServlet
{
	
	
	
	protected void service(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
	{
	String target = req.getParameter("target");
	String methodName = req.getParameter("methodName");
	System.out.println((new StringBuilder("target Name")).append(target).toString());
	System.out.println((new StringBuilder("Method Name")).append(methodName).toString());
	
	System.out.println("Controller Servlet Start Page");
			if(target.trim().equalsIgnoreCase("Login"))
			target = "/Login";
			if(target.trim().equalsIgnoreCase("Registration"))
			{
				System.out.println("Registration");
				target = "/jsp/Registration.jsp";
				
			}
			if(target.trim().equalsIgnoreCase("ComprehensionTest"))
			{
				System.out.println("Comprehension Test");
				target = "/ComprehensionTest";
			}

			//Ankush has added this code for grammer test
			if(target.trim().equalsIgnoreCase("CommonsFileUploadServlet"))
			{
				System.out.println("CommonsFileUploadServlet Test");
				target = "/CommonsFileUploadServlet";
			}
			if(target.trim().equalsIgnoreCase("EnglishGrammerTest"))
			{
				System.out.println("EnglishGrammer Test");
				target = "/EnglishGrammerTest";
			}
			//---for web and without web cam
			if(target.trim().equalsIgnoreCase("WithCamWithoutCam"))
			{
				System.out.println("WithCamWithoutCam ");
				target = "/WithCamWithoutCam";
			}
			// WithCamWithoutCam
			if(target.trim().equalsIgnoreCase("MaxiMumEnglishGrammarNo"))
			{
				System.out.println("MaxiMumEnglishGrammarNo Test");
				target = "/MaxiMumEnglishGrammarNo";
			}
			
			if(target.trim().equalsIgnoreCase("MaxiMumTypingAssNo"))
			{
				System.out.println("MaxiMumTypingAssNo Test");
				target = "/MaxiMumTypingAssNo";
			}
			if(target.trim().equalsIgnoreCase("MaxiMumReadingCompNo"))
			{
				System.out.println("MaxiMumReadingCompNo Test");
				target = "/MaxiMumReadingCompNo";
			}
			
			if(target.trim().equalsIgnoreCase("MaxiMumLanguageNo"))
			{
				System.out.println("MaxiMumLanguageNo Test");
				target = "/MaxiMumLanguageNo";
			}
			if(target.trim().equalsIgnoreCase("TypingTest"))
			{
				target = "/TypingTest";
			}
			if(target.trim().equalsIgnoreCase("PrecisWritingTest"))
			{
				System.out.println("PrecisWritingTest");
				target = "/PrecisWritingTest";
			}
			// candidate Regis Page
			// end this page
			if(target.trim().equalsIgnoreCase("Logout"))
			{
				HttpSession sessionob = req.getSession(true);
				sessionob.removeAttribute("USER_ID");
				sessionob.removeAttribute("USER_Name");
				
				target = "/Login";
			}
		System.out.println("Controller Servlet End Page");
		ServletContext sctx=this.getServletContext();
		System.out.println(sctx.getRequestDispatcher(target));
		RequestDispatcher rd=sctx.getRequestDispatcher(target);
		System.out.println(rd);
		rd.forward(req,resp);
	}
}
