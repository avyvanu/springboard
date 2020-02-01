package servelets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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


public class PrecisWritingScore extends HttpServlet {


protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
	{
	
	HttpSession session = req.getSession();
	
	int pagevalue = Integer.parseInt(req.getParameter("pagevalue"));	
	int CandidateId = Integer.parseInt(req.getParameter("candidateid"));
	String CandidateGeneratedID = req.getParameter("CandidateGeneratedID");
	System.out.println("CandidateGeneratedID:::::"+CandidateGeneratedID);
	String recruiterid = req.getParameter("recruitername");
	String programname = req.getParameter("programsnames");
	int ClarityLogical = Integer.parseInt(req.getParameter("ClarityLogical"));
	int punctuation = Integer.parseInt(req.getParameter("punctuation"));
	int spellings = Integer.parseInt(req.getParameter("spellings"));
	int sentencecontruction = Integer.parseInt(req.getParameter("sentencecontruction"));
	String comments=req.getParameter("comments");
	String  status=req.getParameter("select");
	int totalscore=Integer.parseInt(req.getParameter("display"));
	Connection con=null;
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
	
	
	CallableStatement proc=null;
	boolean checkDuplicate=false;
	String CandidateStatus=null;
	if(status!=null)
	{
		if(status.equals("1"))
		   {
			   CandidateStatus="Select";
		   }
		   if(status.equals("2"))
		   {
			   CandidateStatus="Hold";
		   }
		   if(status.equals("3"))
		   {
			   CandidateStatus="Reject";
		   }
	}
	else
	{
		status = "0";
	}
	try
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
		checkDuplicate=Userexists.validateUserExistsprecis(CandidateId);
	    if(checkDuplicate==true)
	    {
	    	
			req.setAttribute("DuplicateCheck","Already_Inserted");				
			RequestDispatcher rd1=req.getRequestDispatcher("247Recruit/jsp/PrecisWritingScore.jsp?candidateid="+CandidateGeneratedID+"");
			rd1.forward(req,resp);
	    }else
	    {   con = ConnectDatabase.getConnection();
		    proc = con.prepareCall("{call precis_score_proc(?,?,?,?,?,?,?,?,?,?)}");
		    System.out.println(proc);
		    proc.setInt(1,CandidateId);
		    proc.setString(2,recruiterid);
		    proc.setString(3,programname);
		    proc.setInt(4,ClarityLogical);
		    proc.setInt(5,punctuation);
		    proc.setInt(6,spellings);
		    proc.setInt(7,sentencecontruction);
		    proc.setString(8,comments);
		    proc.setString(9,status);
		    proc.setInt(10,totalscore);
		    proc.execute();
		    System.out.println("inserted sucessfully");
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
		    rss.close();
	        stmts.close();
	        con.close();
		    String msg=null;
		    msgLNDName=""+RecruiterName+"  compltd evaluation for,";
		    msgsms=msgLNDName+" "+CandidateFirstname+" ("+CadidateId+")";
			msg="<HTML><BODY>"+RecruiterName+" has completed evaluation for, "+Candidatename+", Candidate Id : "+CadidateId+", for Communication Ability (Non-Voice-Precis) round on [24]7 career.<b> Mobile Number </b>:"+Phonenumber+". <b>Result</b> :"+CandidateStatus+"<br/><br/>Regards,<br/>Team [24]7</BODY></HTML>";
		    String subject="[24]7 Career Precis Score Confirmation";
		    if(checkEmailAvlable > 0)
		    {
			    for(int j=0;j<Phonenumbers.size();j++)
			    {
			    SMSFunction.sendSMSLNDPrecis(Phonenumbers.get(j).toString(),msgsms,Phonenumber,CandidateStatus);
			    }
		        EmailDemo.sendMail(username1,password1,RecruiterEmailId,msg,subject);
		    }
	        RequestDispatcher rd=req.getRequestDispatcher("247Recruit/jsp/PrecisScoreSuccess.jsp");
			rd.forward(req,resp);
		    
	   }
		}
		else if(pagevalue==2)
		{
		con = ConnectDatabase.getConnection();
		PreparedStatement Pst = con.prepareStatement("update  candidate_precis_writing_score set  Cand_Id='"+CandidateId +"', Recruiter_Id='"+recruiterid +"',Program_Id='"+programname +"', Precis_PPA1="+ClarityLogical  +" ,Precis_PPA2="+punctuation +",Precis_PPA3="+spellings +",Precis_PPA4="+sentencecontruction +",Comments='"+comments +"',Statusi="+status+",Total_score="+totalscore+",Last_scored_Date=now() where Cand_Id='"+CandidateId+"'");
	    System.out.println(Pst);
	    Pst.executeUpdate();
	    System.out.println("Updated  candidate_chat_score table::sucessfully");
	    PreparedStatement PbpoUpdate=con.prepareStatement("update bpo_candidatesreg_details set MarkPrecReScore=0 where AutoID="+CandidateId+"");
        System.out.println(" update bpo_candidatesreg_details set MarkPrecReScore=0"+PbpoUpdate);
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
	    msgLNDName=""+RecruiterName+"  compltd evaluation for,";
	    msgsms=msgLNDName+" "+CandidateFirstname+" ("+CadidateId+")";
		msg="<HTML><BODY>"+RecruiterName+" has completed evaluation for, "+Candidatename+", Candidate Id : "+CadidateId+", for Communication Ability (Non-Voice-Precis) round on [24]7 career. <b>Mobile Number </b>:"+Phonenumber+". <b>Result </b>:"+CandidateStatus+"<br/><br/>Regards,<br/>Team [24]7</BODY></HTML>";
	    String subject="[24]7 Career Precis Score Confirmation";
	    if(checkEmailAvlable > 0)
	    {
		    for(int j=0;j<Phonenumbers.size();j++)
		    {
		    SMSFunction.sendSMSLNDPrecis(Phonenumbers.get(j).toString(),msgsms,Phonenumber,CandidateStatus);
		    }
	        EmailDemo.sendMail(username1,password1,RecruiterEmailId,msg,subject);
		    }
	    RequestDispatcher rd=req.getRequestDispatcher("247Recruit/jsp/PrecisRescoreSuccess.jsp");
		rd.forward(req,resp);
		
		}
		con = ConnectDatabase.getConnection();
		String userQuerychk = "select cand_id from candidate_chat_score where cand_id="+CandidateId+"";
		System.out.println(userQuerychk);
		System.out.println("query "+userQuerychk);
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(userQuerychk);
		boolean checkvalue=rs.next();
		System.out.println("check value(Boolean):::::"+checkvalue);
		if(checkvalue==true)
		{
			PreparedStatement PBpoUpdate=con.prepareStatement("update bpo_candidatesreg_details set cand_Status=6 where AutoID="+CandidateId+"");
	        System.out.println(" updated bpo_candidatesreg_details candidate status to value 6 =="+PBpoUpdate);
	        PBpoUpdate.executeUpdate();
	        PBpoUpdate.close(); 
		}
		else
		{
			System.out.println("No Value:::::"+checkvalue);

		}
		con.close();
	}

	catch(Exception ex)
	{
		System.out.println(ex.getMessage());
		ex.printStackTrace();
	}
	
}
}

