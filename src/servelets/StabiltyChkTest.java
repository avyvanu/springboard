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
import util.Dbconfiguration;
import util.EmailDemo;
import util.SMSFunction;
import util.Userexists;


public class StabiltyChkTest  extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
	{
		
		HttpSession session = req.getSession();
		Connection con=null;
		boolean checkDuplicate=false;
		int CandidateId = Integer.parseInt(req.getParameter("candidateid"));
		String CandidateGeneratedID = req.getParameter("CandidateGeneratedID");
		System.out.println("CandidateGeneratedID:::::"+CandidateGeneratedID);
		String recruitername=req.getParameter("recruitername");
		int status=Integer.parseInt(req.getParameter("select"));
		String overallcomments=req.getParameter("comments");
		int score=Integer.parseInt(req.getParameter("display"));
		String StartTime = req.getParameter("starttime");
		System.out.println("StartTime"+StartTime);
		int Stabilityid=0;
		String pids=req.getParameter("hPIDs");
		String QIDs=req.getParameter("hQIDs");
		String QCounts=req.getParameter("hQCounts");
		String  tmpQInfo[] = QCounts.split("-");
		String  tmpPIDInfo[] = pids.split("-");
		String tmpQIDInfo[] = QIDs.split("-");
		String username1="247RecruitmentIS@247customer.com";
		String password1="123456@abc";
		int checkEmailAvlable=0;
//		String EDKey="[24]7";
//		String EDKPass="247Cust0m3r";
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
		String userQuerystabilityId = "select Stability_Chk_ID from stability_chk_master where Candidate_ID="+CandidateId+"";
		System.out.println("query "+userQuerystabilityId);
		Statement stmtstability = con.createStatement();
		ResultSet rssstability = stmtstability.executeQuery(userQuerystabilityId);
		if(rssstability.next())
		{
			Stabilityid=rssstability.getInt("Stability_Chk_ID");
			System.out.println("Stabilityid"+Stabilityid);
		}
			checkDuplicate=Userexists.validatestabilityid(CandidateId);
		    System.out.println("Status check if data already present::"+checkDuplicate);
		    if(checkDuplicate==true)
		    {
		    	req.setAttribute("DuplicateCheck","Already_Inserted");				
				RequestDispatcher rd1=req.getRequestDispatcher("247Recruit/jsp/StabilityCheckScore.jsp?candId="+CandidateGeneratedID+"");
				rd1.forward(req,resp);
		    }else
		    {
			con = ConnectDatabase.getConnection();
			PreparedStatement Pst = con.prepareStatement("update stability_chk_master set Start_Date='"+StartTime+"',End_Date=now(),Overall_Comment='"+overallcomments+"',score="+score+",Result_Status="+status+" where Stability_Chk_ID='"+Stabilityid+"'");
	        System.out.println(Pst);
	        Pst.executeUpdate();
	        System.out.println("Updated  stability_chk_master table::sucessfully");
			System.out.println("Stabilityid:::::"+Stabilityid);
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
					String queryinsrt="insert into stability_chk_part_qustn_scores(Stability_Chk_Id,Part_Id,Question_Id,Comments,Score) values("+Stabilityid+","+tmpPIDInfo[i-1]+","+tmpQIDInfo[counter]+",'"+tempComment+"',"+tempScore+");";
					Statement stmt=con.createStatement();
					stmt.execute(queryinsrt);
					System.out.println("Inserted successfully!"+queryinsrt);
					counter = counter + 1;
				 }
			 }
		        k = true;
		        PreparedStatement Pupdatebpo=con.prepareStatement("update bpo_candidatesreg_details set cand_Status=5 where AutoID="+CandidateId+"");
				System.out.println("candidate status updated in bpo_candidatesreg_details to 5 for stability check::"+Pupdatebpo);
				Pupdatebpo.executeUpdate();
				Pupdatebpo.close(); 
				String LNDphone=null;
				String LNDEmailId="";
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
				String secQsnrec = "SELECT  Emp_email,Emp_Mobile_No FROM  user_master where User_Type_Id=2 and SendAlerts=1 and Is_Active=1 and Centre_Id='"+Location+"'";
				System.out.println("secQsnrec " + secQsnrec);
				Statement stmtrec = con.createStatement();
				ResultSet rssrec = stmtrec.executeQuery(secQsnrec);
				while (rssrec.next())
				 {
				 LNDphone=rssrec.getString("Emp_Mobile_No");
				 Phonenumbers.add(LNDphone);
				 System.out.println("Phone Numbers::"+Phonenumbers);
				 LNDEmailId+=rssrec.getString("Emp_email")+",";
				 System.out.println(Phonenumbers.size());
				 checkEmailAvlable = checkEmailAvlable + 1;
				 System.out.println("checkEmailAvlable::::"+checkEmailAvlable);
				 }
				rssrec.close();
				stmtrec.close();
			    rss.close();
				stmts.close();
				con.close();
			    String msg=null;
			    msgLNDName=""+recruitername+" compltd evaluation for,";
			    msgsms=msgLNDName+" "+CandidateFirstname+" ("+CadidateId+")";
				msg="<HTML><BODY>"+recruitername+" has completed evaluation for, "+Candidatename+", Candidate Id : "+CadidateId+", for Stability round on [24]7 career. <b>Mobile Number :</b>"+Phonenumber+". <b>Result :</b>"+CandidateStatus+"<br/><br/>Regards,<br/>Team [24]7</BODY></HTML>";
			    String subject="[24]7 Career Stability Check Confirmation";
			    if(checkEmailAvlable > 0)
			    {
			    for(int j=0;j<Phonenumbers.size();j++)
			    {
			    SMSFunction.sendSMSRecStability(Phonenumbers.get(j).toString(),msgsms,Phonenumber,CandidateStatus);
			    }
		        EmailDemo.sendMail(username1,password1,LNDEmailId,msg,subject);
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
			    RequestDispatcher rd=req.getRequestDispatcher("/247Recruit/jsp/StabilityScoreSuccess.jsp");
			    rd.forward(req, resp);
			}
		}
	}
}
