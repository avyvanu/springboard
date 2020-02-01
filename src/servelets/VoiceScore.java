package servelets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.ConnectDatabase;
import util.Dbconfiguration;
import util.Userexists;
import util.SMSFunction;
import util.EmailDemo;



@SuppressWarnings("serial")
public class VoiceScore extends HttpServlet 
{


protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
	{
	
	HttpSession session = req.getSession();
	int pagevalue = Integer.parseInt(req.getParameter("pagevalue"));	
	int CandidateId = Integer.parseInt(req.getParameter("candidateid"));
	String recruiterid = req.getParameter("recruitername");
	//String programname = req.getParameter("programname");
	
	String StartTime = req.getParameter("starttime");
	System.out.println("Start time is:::::"+StartTime);
	String CandidateGeneratedID = req.getParameter("CandidateGeneratedID");
	System.out.println("CandidateGeneratedID:::::"+CandidateGeneratedID);
	
	int sentencestructure = Integer.parseInt(req.getParameter("sentencestructure"));
	int clarityThought = Integer.parseInt(req.getParameter("clarityThought"));
	int pronunciation = Integer.parseInt(req.getParameter("pronunciation"));
	int claritySpeech = Integer.parseInt(req.getParameter("claritySpeech"));
	int RateOfSpeech = Integer.parseInt(req.getParameter("RateOfSpeech"));
	int creativity = Integer.parseInt(req.getParameter("creativity"));
	
	String comments=req.getParameter("comments");
//	int status=Integer.parseInt(req.getParameter("select"));
//	System.out.println("status"+status);
	int totalscore=Integer.parseInt(req.getParameter("display"));
	String username1="247RecruitmentIS@247customer.com";
	String password1="123456@abc";
	int checkEmailAvlable=0;
//	String EDKey="[24]7";
//	String EDKPass="247Cust0m3r";

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
	
	Connection con=null;
	CallableStatement proc=null;
	boolean checkDuplicate=false;
	String CandidateStatus=null;
/*	   if(status==1)
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
	
*/	try
	{
		
		    con = ConnectDatabase.getConnection();
		  //Recruiter Scored Name//
			String RecruiterName=null;
			String secQsnrecname = "SELECT  Emp_Name FROM  user_master where Emp_Id='"+recruiterid+"'";
			System.out.println("secQsnrec " + secQsnrecname);
			Statement stmtrecname = con.createStatement();
			ResultSet rssrecname = stmtrecname.executeQuery(secQsnrecname);
			if (rssrecname.next())
			 {
				 RecruiterName=rssrecname.getString("Emp_Name");
				 System.out.println("RecruiterScoredName::"+RecruiterName);
			 }
			//Recruiter Scored Name//
		    if(pagevalue==1)
		    {
		    checkDuplicate=Userexists.validateUserExists(CandidateId);
		    if(checkDuplicate==true)
		    {
		    	
				req.setAttribute("DuplicateCheck","Already_Inserted");				
				RequestDispatcher rd1=req.getRequestDispatcher("247Recruit/jsp/VoiceScore.jsp?candidateid="+CandidateGeneratedID+"");
				rd1.forward(req,resp);
		    }
		    else
		    {
		    con = ConnectDatabase.getConnection();
		    proc = con.prepareCall("{call voice_Score_proc(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
		    System.out.println(proc);
		    proc.setInt(1,CandidateId);
		    proc.setString(2,recruiterid);
		    proc.setString(3,"0");
		    proc.setInt(4,sentencestructure);
		    proc.setInt(5,clarityThought);
		    proc.setInt(6,pronunciation);
		    proc.setInt(7,claritySpeech);
		    proc.setInt(8,RateOfSpeech);
		    proc.setInt(9,creativity);
		    proc.setString(10,comments);
		    proc.setInt(11,0);  // status
		    proc.setInt(12,totalscore);
		    proc.setString(13,StartTime);
		    proc.execute();
		    proc.close();
		    System.out.println("inserted sucessfully");
		    
		    PreparedStatement Pupdatebpo=con.prepareStatement("update bpo_candidatesreg_details set cand_Status=6 where AutoID="+CandidateId+"");
			System.out.println("candidate status updated in bpo_candidatesreg_details "+Pupdatebpo);
			Pupdatebpo.executeUpdate();
			Pupdatebpo.close(); 
		    
			
		    String Recruiterphone=null;
			String RecruiterEmailId=null;
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
				 checkEmailAvlable = checkEmailAvlable+1;
				 System.out.println("checkEmailAvlable"+checkEmailAvlable);
			 
			 }	
		    rss.close();
		    stmts.close();
		    con.close();
		    String msg=null;
		    msgLNDName=""+RecruiterName+" compltd evaluation for,";
		    msgsms=msgLNDName+" "+CandidateFirstname+" ("+CadidateId+")";
			msg="<HTML><BODY>"+RecruiterName+" has completed evaluation for, "+Candidatename+", Candidate Id : "+CadidateId+", for Communication Ability (Voice) round on [24]7 career. <b>Mobile Number </b>:"+Phonenumber+". <b>Result </b>:"+CandidateStatus+"<br/><br/>Regards,<br/>Team [24]7</BODY></HTML>";
		    String subject="[24]7 Career Voice Confirmation";
            if(checkEmailAvlable > 0)
            {
			    for(int j=0;j<Phonenumbers.size();j++)
			     {
			    SMSFunction.sendSMSLNDVoice(Phonenumbers.get(j).toString(),msgsms,Phonenumber,CandidateStatus);
			     }
		        EmailDemo.sendMail(username1,password1,RecruiterEmailId,msg,subject);
            }
		    RequestDispatcher rd=req.getRequestDispatcher("247Recruit/jsp/VoiceScoreSuccess.jsp");
			rd.forward(req,resp);
			
		    }
		   }
		    else if(pagevalue==2)
			{
		    	con = ConnectDatabase.getConnection();
		    	proc = con.prepareCall("{call voice_Rescore_proc(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			    System.out.println(proc);
			    proc.setInt(1,CandidateId);
			    proc.setString(2,recruiterid);
			    proc.setString(3,"0");
			    proc.setInt(4,sentencestructure);
			    proc.setInt(5,clarityThought);
			    proc.setInt(6,pronunciation);
			    proc.setInt(7,claritySpeech);
			    proc.setInt(8,RateOfSpeech);
			    proc.setInt(9,creativity);
			    proc.setString(10,comments);
			    proc.setInt(11,0);
			    proc.setInt(12,totalscore);
			    proc.setString(13,StartTime);
			    proc.execute();
			    proc.close();
			    System.out.println("Updated  candidate_chat_score table::sucessfully");
			    PreparedStatement PbpoUpdate=con.prepareStatement("update bpo_candidatesreg_details set MarkVoiceReScore=0 where AutoID="+CandidateId+"");
		        System.out.println(" update bpo_candidatesreg_details set MarkVoiceReScore=0"+PbpoUpdate);
		        PbpoUpdate.executeUpdate();
		        System.out.println("Updated  bpo_candidatesreg_details table::sucessfully");
		        PbpoUpdate.close();
			    String Recruiterphone=null;
				String RecruiterEmailId=null;
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
			 System.out.println("checkEmailAvlable"+checkEmailAvlable);
			 }	
	         	rssrec.close();
			    stmtrec.close();
			    rss.close();
			    stmts.close();
			    con.close();
			    String msg=null;
			    msgLNDName=""+RecruiterName+" compltd evaluation for,";
			    msgsms=msgLNDName+" "+CandidateFirstname+" ("+CadidateId+")";
				msg="<HTML><BODY>"+RecruiterName+" has completed evaluation for, "+Candidatename+", Candidate Id : "+CadidateId+", for Communication Ability (Voice) round on [24]7 career. <b>Mobile Number </b>:"+Phonenumber+". <b>Result </b>:"+CandidateStatus+"<br/><br/>Regards,<br/>Team [24]7</BODY></HTML>";
			    String subject="[24]7 Career Voice ReScore Confirmation";
			    if(checkEmailAvlable > 0)
			    {
				    for(int j=0;j<Phonenumbers.size();j++)
				    {
				    SMSFunction.sendSMSLNDVoice(Phonenumbers.get(j).toString(),msgsms,Phonenumber,CandidateStatus);
				    }
			        EmailDemo.sendMail(username1,password1,RecruiterEmailId,msg,subject);
			    }
		        RequestDispatcher rd=req.getRequestDispatcher("247Recruit/jsp/VoiceRescoreSuccess.jsp");
			    rd.forward(req,resp);	
			    
			}
	}
	catch(Exception ex)
	{
		System.out.println(ex.getMessage());
		ex.printStackTrace();
	}
	
}
}


