package servelets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
import util.IsLanguageValidator;

public class ChatScore extends HttpServlet {


protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		System.out.println(" START THE ChatScore SERVLET PAGE ");
		HttpSession session = req.getSession();
		
		
		String chatScriptInHtml = req.getParameter("Chat_texaHTML");
		System.out.println(chatScriptInHtml);
		
		String CandidateGeneratedID = req.getParameter("CandidateGeneratedID");
		//       System.out.println("CandidateGeneratedID:::::"+CandidateGeneratedID);
		int CandidateId = Integer.parseInt(req.getParameter("candidateid"));
		//       //       System.out.println("CandidateId"+CandidateId);
		String recruiterid = req.getParameter("recruitername");
		String programnames = req.getParameter("programnames");
		if(programnames == null)
		{
			programnames = "0";
		}
		int pagevalue = Integer.parseInt(req.getParameter("pagevalue"));
		//       //       System.out.println("pagevalue::::::"+pagevalue);
		float appropraiteOpening =Float.parseFloat(req.getParameter("appropraiteOpening"));
		float appropriateClosing=Float.parseFloat(req.getParameter("appropriateClosing"));
		float Candidateownership=Float.parseFloat(req.getParameter("Candidateownership"));
		float candidateAssistance=Float.parseFloat(req.getParameter("candidateAssistance"));
		
		float candidatepolite =Float.parseFloat(req.getParameter("candidatepolite"));
		float candidateEmpathize=Float.parseFloat(req.getParameter("candidateEmpathize"));
		float candidateComprehend=Float.parseFloat(req.getParameter("candidateComprehend"));
		float candidateconcise=Float.parseFloat(req.getParameter("candidateconcise"));
		int totalerror1 = Integer.parseInt(req.getParameter("totalerror1"));
		int totalerror2 = Integer.parseInt(req.getParameter("totalerror2"));
		float grammarscore=Float.parseFloat(req.getParameter("display1"));
		float sentenceconstruction=Float.parseFloat(req.getParameter("display2"));
		
		String chat_partC_Comments = req.getParameter("chat_partC_Comments");
		
		
		String comments=req.getParameter("comments");
		String status=req.getParameter("select");
		//       System.out.println("status"+status);
		double totalscore=Double.parseDouble(req.getParameter("display"));		
		String username1="247RecruitmentIS@247customer.com";
		String password1="123456@abc";
		int checkEmailAvlable=0;
		boolean languageAvailable = false;
        languageAvailable=IsLanguageValidator.LanguageValidator(CandidateId);
		//       System.out.println("languageAvailable:::::"+languageAvailable);
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

		
		Connection con=null;
		CallableStatement proc=null;
		boolean checkDuplicate=false;
		  
		
	   String CandidateStatus=null;
	  if(status != null)
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
			
			//establish the connecion
			con = ConnectDatabase.getConnection();
			//Recruiter Scored Name//
			//String RecruiterName=null;
			String RecruiterName = ((String)session.getAttribute("USER_Name")).trim();
			System.out.println("RecruiterName \t"+RecruiterName);

/*			String secQsnrecname = "SELECT  Emp_Name FROM  user_master where Emp_Id='"+recruiterid+"'";
			//       System.out.println("secQsnrec " + secQsnrecname);
			Statement stmtrecname = con.createStatement();
			ResultSet rssrecname = stmtrecname.executeQuery(secQsnrecname);
			if (rssrecname.next())
			 {
				 RecruiterName=rssrecname.getString("Emp_Name");
				 //       System.out.println("RecruiterScoredName::"+RecruiterName);
			
			 }
*/			//Recruiter Scored Name//
			if(pagevalue==1)
			{
			 checkDuplicate=Userexists.validateUserExistschat(CandidateId);
		    if(checkDuplicate==true)
		    {
		    	
				req.setAttribute("DuplicateCheck","Already_Inserted");				
				RequestDispatcher rd1=req.getRequestDispatcher("247Recruit/jsp/ChatScore.jsp?candidateid="+CandidateGeneratedID+"");
				rd1.forward(req,resp);
		    }
		    else
		    {
		  System.out.println("calling procedure by ChatScore java ");
		    	con = ConnectDatabase.getConnection();
			    proc = con.prepareCall("{call Chat_Score_Proc(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}"); 
			    //       System.out.println(proc);
			    proc.setInt(1,CandidateId);
			    proc.setString(2,recruiterid);
			    proc.setString(3,programnames);
			    proc.setFloat(4,appropraiteOpening);
			    proc.setFloat(5,appropriateClosing);
			    proc.setFloat(6,Candidateownership);
			    proc.setFloat(7,candidateAssistance);
			    proc.setFloat(8,candidatepolite);
			    proc.setFloat(9,candidateEmpathize);
			    proc.setFloat(10,candidateComprehend);
			    proc.setFloat(11,candidateconcise);
			    proc.setFloat(12,grammarscore);
			    proc.setFloat(13,sentenceconstruction);
			    proc.setInt(14,totalerror1);
			    proc.setInt(15,totalerror2);
			    proc.setString(16,comments);
			    proc.setString(17,status);
			    proc.setString(18,chatScriptInHtml);
			    proc.setString(19,chat_partC_Comments);
			    proc.setDouble(20,totalscore);
			    proc.execute();
			    
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
				//       System.out.println("strProcedure"+strProcedure);
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
			//       System.out.println("secQsnrec " + secQsnrec);
			Statement stmtrec = con.createStatement();
			ResultSet rssrec = stmtrec.executeQuery(secQsnrec);
			while (rssrec.next())
			 {
			 Recruiterphone=rssrec.getString("Emp_Mobile_No");
			 Phonenumbers.add(Recruiterphone);
			 //       System.out.println("Phone Numbers::"+Phonenumbers);
			 RecruiterEmailId+=rssrec.getString("Emp_email")+",";
			 //       System.out.println(Phonenumbers.size());
			 checkEmailAvlable=checkEmailAvlable+1;
			 //       System.out.println("checkEmailAvlable"+checkEmailAvlable);
			 }
			rss.close();
		    stmts.close();
		    con.close();
		    String msg=null;
		    msgLNDName=""+RecruiterName+"  compltd evaluation for,";
		    msgsms=msgLNDName+" "+CandidateFirstname+" ("+CadidateId+")";
			msg="<HTML><BODY>"+RecruiterName+" has completed evaluation for, "+Candidatename+", Candidate Id : "+CadidateId+", for Communication Ability (Non-Voice-Mock Chat) round on [24]7 career.<b> Mobile Number </b> :"+Phonenumber+". <b>Result </b>:"+CandidateStatus+"<br/><br/>Regards,<br/>Team [24]7</BODY></HTML>";
		    String subject="[24]7 Career Chat Score Confirmation";
			  if(checkEmailAvlable>0)
			    {
				    for(int j=0;j<Phonenumbers.size();j++)
				    {
					    //       System.out.println("j"+j);
					    SMSFunction.sendSMSLNDChat(Phonenumbers.get(j).toString(),msgsms,Phonenumber,CandidateStatus);
				    }
		    EmailDemo.sendMail(username1,password1,RecruiterEmailId,msg,subject);
			   }
	        RequestDispatcher rd=req.getRequestDispatcher("247Recruit/jsp/ChatScoreSuccess.jsp");
			rd.forward(req,resp);
			con.close();
		    }
		    } 
			else if(pagevalue==2)
			{
				con = ConnectDatabase.getConnection();
				PreparedStatement Pst = con.prepareStatement("update  candidate_chat_score set  Cand_Id='"+CandidateId+"', Recruiter_ID='"+recruiterid+"',Program_Id='"+programnames+"', Chat_PPA1="+appropraiteOpening +" ,Chat_PPA2="+appropriateClosing+",Chat_PPA3="+Candidateownership+",Chat_PPA4="+candidateAssistance+",Chat_PPB1="+candidatepolite +",Chat_PPB2="+candidateEmpathize+",Chat_PPB3="+candidateComprehend+",Chat_PPB4="+candidateconcise+",Chat_PPC1_Score="+grammarscore+",Chat_PPC2_Score="+sentenceconstruction+",Chat_Totalerror1="+totalerror1+",Chat_Totalerror2="+totalerror2+",Comments='"+comments+"',Statusi="+status+",Total_score="+totalscore+",Last_Scored_Date=now() where Cand_Id='"+CandidateId+"'");
			    //       System.out.println(Pst);
			    Pst.executeUpdate();
			    //       System.out.println("Updated  candidate_chat_score table::sucessfully");
			    Pst.close();
			    PreparedStatement PbpoUpdate=con.prepareStatement("update bpo_candidatesreg_details set MarkChatReScore=0 where AutoID="+CandidateId+"");
		        //       System.out.println(" update bpo_candidatesreg_details set MarkChatReScore=0"+PbpoUpdate);
		        PbpoUpdate.executeUpdate();
		        //       System.out.println("Updated  bpo_candidatesreg_details table::sucessfully");
		        PbpoUpdate.close();
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
					//       System.out.println("strProcedure"+strProcedure);
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
				//       System.out.println("secQsnrec " + secQsnrec);
				Statement stmtrec = con.createStatement();
				ResultSet rssrec = stmtrec.executeQuery(secQsnrec);
				while (rssrec.next())
				 {
					 Recruiterphone=rssrec.getString("Emp_Mobile_No");
					 Phonenumbers.add(Recruiterphone);
					 //       System.out.println("Phone Numbers::"+Phonenumbers);
					 RecruiterEmailId+=rssrec.getString("Emp_email")+",";
					 //       System.out.println(Phonenumbers.size());
					 checkEmailAvlable=checkEmailAvlable+1;
					 //       System.out.println("checkEmailAvlable:::::"+checkEmailAvlable);
				 }	
			    //       System.out.println("RecruiterEmailId"+RecruiterEmailId);
			    rssrec.close();
			    stmtrec.close();
				rss.close();
			    stmts.close();
			    //       System.out.println("Now complite the all exam !");
			    String msg=null;
			    //       System.out.println("CandidateStatus::"+CandidateStatus);;
			    msgLNDName=""+RecruiterName+"  compltd evaluation for,";
			    msgsms=msgLNDName+" "+CandidateFirstname+" ("+CadidateId+")";
				msg="<HTML><BODY>"+RecruiterName+" has completed evaluation for, "+Candidatename+", Candidate Id : "+CadidateId+", for Communication Ability (Non-Voice-Mock Chat) round on [24]7 career. <b>Mobile Number </b>:"+Phonenumber+".<b> Result </b>:"+CandidateStatus+"<br/><br/>Regards,<br/>Team [24]7</BODY></HTML>";
			    String subject="[24]7 Career Chat Rescore Confirmation";
			    if(checkEmailAvlable>0)
			    {
				    for(int j=0;j<Phonenumbers.size();j++)
				    {
				    SMSFunction.sendSMSLNDChat(Phonenumbers.get(j).toString(),msgsms,Phonenumber,CandidateStatus);
				    }
		        EmailDemo.sendMail(username1,password1,RecruiterEmailId,msg,subject);
			    }
		        RequestDispatcher rd=req.getRequestDispatcher("247Recruit/jsp/ChatRescoreSuccess.jsp");
				rd.forward(req,resp);
			    
				
			}
				con = ConnectDatabase.getConnection();
				boolean checkvalue=false;
				String userQuerychk=null;
				if(!languageAvailable )
				{
				//****Precis  Writing Score******//
				userQuerychk = "select cand_id from candidate_precis_writing_score where cand_id="+CandidateId+"";
				//       System.out.println("Precis query "+userQuerychk);
				}
				
				else
				{
				//****Language Writing Score******//
				userQuerychk = "select cand_id from candidate_language_testscore where cand_id="+CandidateId+"";
				//       System.out.println("Chatscore"+userQuerychk);
				}
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(userQuerychk);
				checkvalue=rs.next();
				//       System.out.println("check value(Boolean):::::"+checkvalue);
				if(checkvalue==true)
				{
					PreparedStatement PBpoUpdate=con.prepareStatement("update bpo_candidatesreg_details set cand_Status=6 where AutoID="+CandidateId+"");
			        //       System.out.println(" updated bpo_candidatesreg_details candidate status to value 6 =="+PBpoUpdate);
			        PBpoUpdate.executeUpdate();
			        PBpoUpdate.close(); 
				}
				else
				{
					//       System.out.println("No Value:::::"+checkvalue);
	
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

