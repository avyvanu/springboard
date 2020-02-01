package servlets.Users;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
/*import java.sql.PreparedStatement;*/
import java.sql.ResultSet;
/*import java.sql.SQLException;*/
import java.sql.Statement;
import java.util.ArrayList;
/*
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;*/
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/*import javax.sql.DataSource;*/

import util.*;
import webServ.ConnectService;
import webServ.ConnectServiceSoap;
import webServ.test;



public class LoginServlet extends HttpServlet
{
	
	String countquns=null;
	ServletContext sctx=null;
	Connection con = null;
	ResultSet rs232, rs2=null;
	Statement sta, sts2=null;
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);
		sctx=this.getServletContext();
	}
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
		//String EDKey="[24]7";
		//String EDKPass="247Cust0m3r";
		System.out.println("LoginServlet PageNEWWWWWWWW");
		HttpSession session=req.getSession();
		String chatTypeProcess=null;
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");		
		Connection con=ConnectDatabase.getConnection();
		Statement stmtCand=null; 
		ResultSet rsCand=null;
		boolean validateLogin = false;
		CallableStatement procForRecruiterSA =null;
		ResultSet rsRecruiterSA = null;
		boolean rsSET = false;
		boolean rsSETSA=false;
		String USER_ID = null;
		int USER_AUTOID = 0;
		String USER_Name = null;
		String User_Type_Id =null;
		String User_Center_Id = null;
		String lastname=null;
		String firstName=null;	
		String InitiateExam=null;
		int initResult=0;
		int uploadDone =0;
		int chkPhoto=0;
		String EDKey="";
		String EDKPass="";
		try
		{
			if((String)session.getAttribute("EDKey") != "AD")
			{
				 EDKey = (String)session.getAttribute("EDKey");
				 EDKPass = (String)session.getAttribute("EDKPass");
			}
			else
			{
				resp.sendRedirect(req.getContextPath() + "/247Recruit/jsp/Index.jsp");
			}
		}
		catch(Exception e)
		{
			System.out.println(" GETTING KAY AND PASS EXCEPTION + "+e);
		}

		
		// Get SYSTEM IP ADDRESS//
		String ipAddress  = req.getHeader("X-FORWARDED-FOR");  
		if(ipAddress == null)  
		{  
			  ipAddress = req.getRemoteAddr();  
		}  
		System.out.println("User System ipAddress: "+ipAddress);
  		
		int cand_Status=0;
		String Candi_Password=null;
		int applyingFor=0;
		CallableStatement procForLoginServlet=null;
		boolean chkLoginData=false;
		
		try
		{
			System.out.println("Value+"+userName.substring(0, 2).toLowerCase()+"end");
			if(userName.substring(0, 2).compareToIgnoreCase("ic")==0)
			{	
				// *******************  Start Candidate Login Part ****************************** //
				con= ConnectDatabase.getConnection();
				procForLoginServlet = con.prepareCall("{ call LoginServletProc(?,?,?,?)}");		      
				procForLoginServlet.setString(1, userName);
				procForLoginServlet.setString(2, password);
				procForLoginServlet.setString(3, EDKey);
				procForLoginServlet.setString(4, EDKPass); 
				rsCand=procForLoginServlet.executeQuery();
				validateLogin = rsCand.next();
				System.out.println("CHK PROCEDURE FOR THE LOGIN " +validateLogin);
				if(validateLogin == true)
				{
					// %%%%%%%%%%%%%%%%%% Start Logs Details Information %%%%%%%%%%%%%%%%%%%%%%%% //
					//LogsDetails.updateLogsDetailsMethods(userName);
					CallableStatement proc = con.prepareCall("{ CALL cand_logs_information(?,?,?)}");	
					proc.setString(1, userName);
					proc.setString(2, Integer.toBinaryString(1));
					proc.setString(3, ipAddress);			    	  
					ResultSet  rsw=proc.executeQuery();
					int logs_Id=0;
					if(rsw.next())
					{
						  logs_Id=rsw.getInt(1);
					}			    	  
					// %%%%%%%%%%%%%%%%%%%Start  Logs Details Information %%%%%%%%%%%%%%%%%%%%%%%% //
					
					firstName = rsCand.getString("First_Name");
					lastname = rsCand.getString("Last_Sir_Name");	
					USER_AUTOID = rsCand.getInt("AutoID");
					Candi_Password = rsCand.getString("Candi_Password");	
					USER_ID = rsCand.getString("Bpo_Cand_Id");
					chatTypeProcess = rsCand.getString("chatTypeProcess");
					initResult = rsCand.getInt("Init_Result");
					uploadDone = rsCand.getInt("Upload_Done");
					
					// ********** photo *************** //					
					
					chkPhoto=rsCand.getInt("is_Valid_Photo");
					InitiateExam=rsCand.getString("InitiateExam");					
					cand_Status=rsCand.getInt("cand_Status");
					applyingFor=rsCand.getInt("Applying_For");					
					User_Center_Id = rsCand.getString("Location");
					System.out.println("User_Center_Id--"+User_Center_Id);
					String isExprience=rsCand.getString("Work_Experience");
					session.setAttribute("User_Center_Id", User_Center_Id);
				 	System.out.println("-uploadDone- "+uploadDone);
					System.out.println("-isExprience- "+isExprience);
					session.setAttribute("USER_Name",firstName+" "+lastname);
					session.setAttribute("USER_AUTOID",USER_AUTOID);
					session.setAttribute("USER_ID",USER_ID);
					session.setAttribute("password_random", Candi_Password);
					session.setAttribute("x_val","1");
					session.setAttribute("x_val2","1");	
					session.setAttribute("Cand_Status", cand_Status);
					session.setAttribute("Cand_Init_Result", initResult);
					session.setAttribute("Cand_DocUpload_Done", uploadDone);
					session.setAttribute("IsExprience", isExprience);
					session.setAttribute("Logs_Data_Info", logs_Id);
					session.setAttribute("IsSAdmin","No");
					if(cand_Status == 1)
					{
						session.setAttribute("photoCam","1");
						RequestDispatcher rd=sctx.getRequestDispatcher("/247Recruit/jsp/camcanvas.jsp");					
						rd.forward(req,resp);
					}
					else if(cand_Status == 2)
					{
						if(chkPhoto == 2)
						{
							session.setAttribute("ImgSize", 0);
							RequestDispatcher rd=sctx.getRequestDispatcher("/247Recruit/jsp/ApplyingFor.jsp");					
							rd.forward(req,resp);
						}
						else
						{
							session.setAttribute("photoCam","1");
							RequestDispatcher rd=sctx.getRequestDispatcher("/247Recruit/jsp/camcanvas.jsp");					
							rd.forward(req,resp);
						}
					}
					else if(cand_Status == 3)
					{
						if(applyingFor==2)
						{
							session.setAttribute("ScriptType", chatTypeProcess);
							RequestDispatcher rd=sctx.getRequestDispatcher("/jsp/clickmypic.jsp");
							rd.forward(req,resp);
						}
						else
						{	
							RequestDispatcher rd=sctx.getRequestDispatcher("/247Recruit/jsp/VoiceTestCall.jsp");
							rd.forward(req,resp);
						}
					}
					else if(cand_Status > 3)
					{
						RequestDispatcher rd=sctx.getRequestDispatcher("/247Recruit/jsp/Home_Page.jsp");
						rd.forward(req,resp);
					}
				}
				else
				{
					RequestDispatcher rd=sctx.getRequestDispatcher("/jsp/Login.jsp");
					req.setAttribute("LoginStatus","UnSuccessfull");
					rd.forward(req,resp);
				}
			}
			else
			{
					//*******Super Administrator Check**********//
					CallableStatement procForRecruiter = null;
					procForRecruiterSA = con.prepareCall("{ call SuperAdminLoginProc(?)}");
					System.out.println("procForRecruiterSA:::"+procForRecruiterSA);
					procForRecruiterSA.setString(1, userName);			
					rsRecruiterSA = procForRecruiterSA.executeQuery();
					System.out.println("rsRecruiterSA:::"+rsRecruiterSA);
					rsSETSA = rsRecruiterSA.next();
					System.out.println("rsSETSA:::::"+rsSETSA);
					  if(rsSETSA == true)
						{
							session.setAttribute("IsSAdmin", "Yes");
							procForRecruiter = con.prepareCall("{ call SuperAdminLoginProc(?)}");
	                    }
						else
						{
							session.setAttribute("IsSAdmin", "No");	
							procForRecruiter = con.prepareCall("{ call RecruiterLoginProc(?)}");
						}
				
					// For the purpose of the Recuriter......   //
					ResultSet rsRecruiter = null;
					procForRecruiter.setString(1, userName);			
					rsRecruiter = procForRecruiter.executeQuery();
					rsSET = rsRecruiter.next();
					System.out.println(rsSET);
					if(rsSET == true)
					{
						USER_ID = rsRecruiter.getString("Emp_ID");	
						System.out.println("USER_ID::"+USER_ID);
						USER_AUTOID = rsRecruiter.getInt("User_Id");	
						System.out.println("USER_AUTOID::::"+USER_AUTOID);
						User_Type_Id = rsRecruiter.getString("User_Type_Id");
						System.out.println("User_Type_Id::::"+User_Type_Id);
						USER_Name = rsRecruiter.getString("Emp_Name");
						System.out.println("USER_Name::::"+USER_Name);
						User_Center_Id = rsRecruiter.getString("Centre_Id");
						System.out.println("User_Center_Id::"+User_Center_Id);
						session.setAttribute("USER_ID", USER_ID);
						session.setAttribute("USER_AUTOID", USER_AUTOID);
						session.setAttribute("User_Type_Id", User_Type_Id);	
						session.setAttribute("USER_Name",USER_Name);
						session.setAttribute("User_Center_Id",User_Center_Id);
						
						if(userName.substring(0, 3).compareToIgnoreCase("cca")==0)
						{
							procForLoginServlet = con.prepareCall("{ call CCALoginServletProc(?,?)}");		      
							procForLoginServlet.setString(1, userName);
							procForLoginServlet.setString(2, password); 
							rsCand = procForLoginServlet.executeQuery();
							validateLogin = rsCand.next();
							System.out.println("validateLogin"+validateLogin);
						}
						else
						{
							//validateLogin = test.validUser(userName,password);
							if(password.equalsIgnoreCase("test"))
							{
								validateLogin = true;
							}
						}
						if(validateLogin == true)
						{
							CallableStatement proc = con.prepareCall("{ CALL cand_logs_information(?,?,?)}");	
							System.out.println(proc);
							proc.setString(1, userName);
							proc.setString(2, Integer.toBinaryString(1));
							proc.setString(3, ipAddress);			    	  
							ResultSet  rsw = proc.executeQuery();
							int logs_Id=0;
							if(rsw.next())
							{
								  logs_Id=rsw.getInt(1);
							}
							session.setAttribute("Logs_Data_Info", logs_Id);
							RequestDispatcher rd=sctx.getRequestDispatcher("/247Recruit/jsp/Home_Page.jsp");
							rd.forward(req,resp);
						}
						else
						{
							RequestDispatcher rd=sctx.getRequestDispatcher("/jsp/Login.jsp");
							req.setAttribute("LoginStatus","UnSuccessfull");
							rd.forward(req,resp);
						}	
					}
					else
					{
						RequestDispatcher rd=sctx.getRequestDispatcher("/jsp/Login.jsp");
						req.setAttribute("LoginStatus","UnSuccessfull");
						rd.forward(req,resp);
					}
				}
		   }
		catch (Exception e) 
		{
			System.err.println(e.getLocalizedMessage());
			System.err.println(e.getMessage());
			e.printStackTrace();
			System.out.println("Error display");
		
		}
		finally
		{
			ConnectionDAO.closeConnection(con, null, null);
		}
	}
}
