
package servlets.Users;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bl.UserManager;

import util.ConnectDatabase;
import util.Dbconfiguration;
import util.PasswordGenerate;
import util.SMSFunction;

public class ForgotpassServlet extends HttpServlet
{
	static long userID=0;
	static long user_detail_id = 0;
	ServletContext sctx=null;
	 
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);
		sctx=this.getServletContext();
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException 
	{
		/**
		 * Input values from the user
		 */
		System.out.println("i am in forgotpassword.java");
		System.out.println("User Registration");
		String pass=null;
		String emailAddr = req.getParameter("mailaddr");
		String securityQsn=req.getParameter("securityQsn1");
		String ansSecurityQsn=req.getParameter("answer1");
		String host1=null;
		String emailform=null;
		String port=null;
		String emailpass=null;
		
		
		Connection con= null;
		System.out.println("emailARR"+emailAddr);
		
		try
			{
				con = ConnectDatabase.getConnection();
				
				String regQry = "select USER_PASSWORD from bpo_user where EMAIL='"+emailAddr+"' and SECURITY_QUESTION='"+securityQsn+"'and SECURITY_ANSWER='"+ansSecurityQsn+"'";
				System.out.println("query "+regQry);
				System.out.println("password is ="+1);
				Statement stmt = con.createStatement();
				System.out.println("password is ="+ 2);
				ResultSet rs = stmt.executeQuery(regQry);
				System.out.println("password is ="+ 3);
				String forgotPass="forgotpassword";			
				
				
				
				while(rs.next())
				{
					pass=rs.getString(1);
					System.out.println("password is ="+pass);
					
					if(pass!=null)
					{
				
						
						RequestDispatcher rd1 = sctx.getRequestDispatcher("/jsp/Login.jsp");
						req.setAttribute("LoginStatus", "forgotpassword");
						req.setAttribute("passwordFor",pass);
						rd1.forward(req, resp);
						
					}
				}
				if(pass==null)
				{
					
					RequestDispatcher rd1 = sctx.getRequestDispatcher("/jsp/forgot_pass.jsp");
					req.setAttribute("wrongEmailID", "The information you have entered does not match, please recheck and enter your details once again");
					//req.setAttribute("passwordFor",pass);
					rd1.forward(req, resp);
					
				}
				
							
			}catch (Exception e) 
				{
					e.printStackTrace();
					
				}
					
			}
}
					
					
	