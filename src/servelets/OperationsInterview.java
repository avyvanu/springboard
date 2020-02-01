package servelets;


import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.ConnectDatabase;
import util.EmailDemo;
import util.SMSFunction;
import util.Userexists;

public class OperationsInterview extends HttpServlet {

protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
	{
		Connection con=null;
		boolean checkDuplicate=false;
		int operationsChkid=0;
		
		HttpSession session = req.getSession();
		
		//int operationsChkid=Integer.parseInt(req.getParameter("operationsChkid"));
		int CandidateId = Integer.parseInt(req.getParameter("candidateid"));
		System.out.println("CandidateId"+CandidateId);
		String prgmvalues=req.getParameter("prgmvalues");
		String StartDateTime = req.getParameter("starttime");
		int status=Integer.parseInt(req.getParameter("select"));
		String overallcomments=req.getParameter("comments");
		String OPSname=(req.getParameter("recruitername")).trim();
		int score=Integer.parseInt(req.getParameter("display"));
		String pids=req.getParameter("hPIDs");
		String QIDs=req.getParameter("hQIDs");
		String QCounts=req.getParameter("hQCounts");
		String  tmpQInfo[] = QCounts.split("-");
		String  tmpPIDInfo[] = pids.split("-");
		String tmpQIDInfo[] = QIDs.split("-");
		String username1="247RecruitmentIS@247customer.com";
		String password1="123456@abc";
		int checkEmailAvlable=0;
		//String EDKey="[24]7";
		//String EDKPass="247Cust0m3r";
		
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
		
		boolean k = false;
		
		String CandidateStatus=null;
		   if(status==1)
		   {
			   CandidateStatus="Select";
		   }
		   if(status==2)
		   {
			   CandidateStatus="Hold";
		   }
		   if(status==3)
		   {
			   CandidateStatus="Reject";
		   }
		try
		{   
			con = ConnectDatabase.getConnection();	
			String OPSProgramname=null;
			String secQsnrecprogname = "SELECT  Program_name FROM  program_names_master where Program_id='"+prgmvalues+"'";
			System.out.println("secQsnrec " + secQsnrecprogname);
			Statement stmtprogname = con.createStatement();
			ResultSet rssprogname = stmtprogname.executeQuery(secQsnrecprogname);
				if (rssprogname.next())
				 {
					OPSProgramname=rssprogname.getString("Program_name");
				 }
			rssprogname.close();
			stmtprogname.close();
			String userQueryoperationsId = "select operations_interview_ID from operations_interview_master where Candidate_ID="+CandidateId+"";
			System.out.println("query "+userQueryoperationsId);
			Statement stmtoperations = con.createStatement();
			ResultSet rssoperations = stmtoperations.executeQuery(userQueryoperationsId);
			if(rssoperations.next())
			{
				operationsChkid=rssoperations.getInt("operations_interview_ID");
				System.out.println("operationsChkid"+operationsChkid);
			}
			checkDuplicate=Userexists.validateoperationsid(CandidateId);
		    System.out.println("Status check if data already present::"+checkDuplicate);
		    if(checkDuplicate==true)
		    {
		    	req.setAttribute("DuplicateCheck","Already_Inserted");				
				RequestDispatcher rd1=req.getRequestDispatcher("247Recruit/jsp/OperationsInterview.jsp");
				rd1.forward(req,resp);
		    }
		    else
		    {
			con = ConnectDatabase.getConnection();
			PreparedStatement Pst = con.prepareStatement("update operations_interview_master set Program_Id = ?,Start_Date = ?,End_Date=now(),Overall_Comment = ?,score = ?,Result_Status = ? where operations_interview_ID = ?");
			Pst.setString(1,prgmvalues);
			Pst.setString(2,StartDateTime);
			Pst.setString(3,overallcomments);
			Pst.setInt(4,score);
			Pst.setInt(5,status);
			Pst.setInt(6,operationsChkid);
			System.out.println(Pst);
	        Pst.executeUpdate();
	        Pst.close();
	        System.out.println("Updated  operations_interview_master table::sucessfully");
			System.out.println("operationsChkid:::::"+operationsChkid);
		    int counter=0;
		    for(int i=1;i<=tmpQInfo.length;i++)
			 {
				for(int j=1;j<=Integer.parseInt(tmpQInfo[i-1]);j++)
				 { 
					String tempComment = req.getParameter("P"+i+"Q"+j+"Comment");
					if(tempComment==null)
					{
						tempComment="";
					}
					int tempScore = Integer.parseInt(req.getParameter("P"+i+"Q"+j+"Score"));
					PreparedStatement pstOpsQns = con.prepareStatement("insert into operations_interview_part_qustn_scores(operations_interview_Id,Part_Id,Question_Id,Comments,Score) values(?,?,?,?,?)");
					pstOpsQns.setInt(1,operationsChkid);
					pstOpsQns.setString(2,tmpPIDInfo[i-1]);
					pstOpsQns.setString(3,tmpQIDInfo[counter]);
					pstOpsQns.setString(4,tempComment);
					pstOpsQns.setInt(5,tempScore);
					System.out.println(pstOpsQns);
					pstOpsQns.executeUpdate();
					pstOpsQns.close();
					counter = counter + 1;
				 }
			 }
		     	k = true;
		     	PreparedStatement Pupdatebpo=con.prepareStatement("update bpo_candidatesreg_details set cand_Status = 7 where AutoID = ?");
		     	Pupdatebpo.setInt(1,CandidateId);
		     	System.out.println("candidate status updated in bpo_candidatesreg_details to 7 for Operations check::"+Pupdatebpo);
				Pupdatebpo.executeUpdate();
				Pupdatebpo.close(); 
				String Recruiterphone=null;
				String RecruiterEmailId="";
				ArrayList<String> Phonenumbers = new ArrayList<String>();
			    String Candidatename=null;
				String CandidateFirstname=null;
				String CandidateMiddlename=null;
				String CadidateId=null;
				String Phonenumber=null;
				String msgsms=null;
				String msgLNDName=null;
				int Location=0;
				Statement stmts=null;
				ResultSet rss = null;
				CallableStatement cs=null;
				try
				{
					con=ConnectDatabase.getConnection();									
					stmts = con.createStatement();
					String strProcedure="{call CandPhone_Encrypt_Proc(?,?,?)}"; //your procedure name
					System.out.println("strProcedure"+strProcedure);
					cs=con.prepareCall(strProcedure);
					cs.setInt(1,CandidateId);
			        cs.setString(2,EDKey);
			        cs.setString(3,EDKPass);
					rss=cs.executeQuery();
		    	}
		    	catch(Exception e)
		    	{
		    		e.printStackTrace();
		    	}
				if (rss.next())
				 {
					 CandidateFirstname=rss.getString("First_Name");
					 CandidateMiddlename=rss.getString("Middle_Name");
					 if(CandidateMiddlename==null)
					 {
						 CandidateMiddlename="";
					 }
					 Candidatename=CandidateFirstname+" "+CandidateMiddlename+" "+rss.getString("Last_Sir_Name");
					 CadidateId=rss.getString("Bpo_Cand_Id");
					 Phonenumber=rss.getString("Phone");
					 Location=rss.getInt("Location");
				 }
				String secQsnrec = "SELECT  Emp_email,Emp_Mobile_No FROM  user_master where User_Type_Id=1 and SendAlerts=1 and Is_Active=1 and Centre_Id='"+Location+"'";
				System.out.println("secQsnrec " + secQsnrec);
				Statement stmtrec = con.createStatement();
				ResultSet rssrec = stmtrec.executeQuery(secQsnrec);
				while (rssrec.next())
				 {
				 Recruiterphone=rssrec.getString("Emp_Mobile_No");
				 Phonenumbers.add(Recruiterphone);
				 System.out.println("Phone Numbers::"+Phonenumbers);
				 RecruiterEmailId+=rssrec.getString("Emp_email")+",";
				 System.out.println(Phonenumbers.size());
				 checkEmailAvlable = checkEmailAvlable + 1;
				 System.out.println("checkEmailAvlable:::::::"+checkEmailAvlable);
				 }
			    rssrec.close();
			    stmtrec.close();
			    rss.close();
			    stmts.close();
			    con.close();
			    System.out.println("Now complite the all exam !");
			    String msg=null;
			    msgLNDName=""+OPSname+", from "+OPSProgramname+" compltd evaluation for,";
			    msgsms=msgLNDName+" "+CandidateFirstname+" ("+CadidateId+")";
				msg="<HTML><BODY>"+OPSname+", from "+OPSProgramname+" has completed evaluation for, "+Candidatename+", <b>Candidate Id </b> : "+CadidateId+", for Operations round on [24]7 career. <b>Mobile Number</b> :"+Phonenumber+". <b>Result </b>:"+CandidateStatus+"<br/><br/>Regards,<br/>Team [24]7</BODY></HTML>";
			    String subject="[24]7 Career Operations Interview Confirmation";
			    if(checkEmailAvlable > 0)
			    {
				    for(int j=0;j<Phonenumbers.size();j++)
				    {
				    SMSFunction.sendSMSLNDOPS(Phonenumbers.get(j).toString(),msgsms,Phonenumber,CandidateStatus);
				    }
			        EmailDemo.sendMail(username1,password1,RecruiterEmailId,msg,subject); 
			    }
		    }
		    con.close();
		}
		catch(Exception ex)
		{
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
		finally
		{
	     if(k == true)
           	{
			    RequestDispatcher rd=req.getRequestDispatcher("/247Recruit/jsp/OperationsInterviewSuccess.jsp");
			    rd.forward(req, resp);
			}
		}
	}
}
