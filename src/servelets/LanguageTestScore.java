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


public class LanguageTestScore extends HttpServlet {


protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
	{
	
	HttpSession session = req.getSession();

	// part B scoring data 
	// Start edited by vishnu // 
	String b_BlueMarks_Error = req.getParameter("Clarity_valueB");
	String b_BlueMarks_Score = req.getParameter("blueColorB");
	System.out.println(">>>>>> start "+b_BlueMarks_Error +"\t"+b_BlueMarks_Score);
	
	
	String b_OrangeMarks_Error = req.getParameter("Punctuation_valueB");
	String b_OrangeMarks_Score = req.getParameter("orangeColorB");
	System.out.println(b_OrangeMarks_Error +"\t"+b_OrangeMarks_Score);
	
	String b_PurpleMarks_Error = req.getParameter("Sentance_Cons_valueB");
	String b_PurpleMarks_Score = req.getParameter("purpleColorB");
	System.out.println(b_PurpleMarks_Error +"\t"+b_PurpleMarks_Score);
	
	
	// part C scoring data 
	String c_BlueMarks_Error = req.getParameter("Clarity_valueC");
	String c_BlueMarks_Score = req.getParameter("blueColorC");
	System.out.println(c_BlueMarks_Error +"\t"+c_BlueMarks_Score);

	
	String c_OrangeMarks_Error = req.getParameter("Punctuation_valueC");
	String c_OrangeMarks_Score = req.getParameter("orangeColorC");
	System.out.println(c_OrangeMarks_Error +"\t"+c_OrangeMarks_Score);
	
	String c_PurpleMarks_Error = req.getParameter("Sentance_Cons_valueC");
	String c_PurpleMarks_Score = req.getParameter("purpleColorC");
	System.out.println(c_PurpleMarks_Error +"\t"+c_PurpleMarks_Score);
	
	
	String PartBtexaHTML = req.getParameter("PartBtexaHTML");
	String PartCtexaHTML = req.getParameter("PartCtexaHTML");
	System.out.println("PartBtexaHTML \t"+PartBtexaHTML);
	System.out.println("PartCtexaHTML \t"+PartCtexaHTML);
	// End edited by vishnu // 
	
	float PartB_Score=Float.parseFloat(req.getParameter("PartB_Score"));
	System.out.println("PartB_Score \t"+PartB_Score);
    String PartB_Comments = req.getParameter("PartB_Comments");
	System.out.println("PartB_Comments \t"+PartB_Comments);
	float PartC_Score=Float.parseFloat(req.getParameter("PartC_Score"));
	System.out.println("PartC_Score \t"+PartC_Score);
	String PartC_Comments = req.getParameter("PartC_Comments");
	System.out.println("PartC_Comments \t"+PartC_Comments);
	String comments=req.getParameter("comments");

	String status=req.getParameter("select");
	System.out.println("status \t"+status);
	float totalscore=Float.parseFloat(req.getParameter("display"));
	System.out.println("totalscore \t"+totalscore);
	
	
	int pagevalue = Integer.parseInt(req.getParameter("pagevalue"));	
	int CandidateId = Integer.parseInt(req.getParameter("candidateid"));
	String CandidateGeneratedID = req.getParameter("CandidateGeneratedID");
	System.out.println("CandidateGeneratedID:::::"+CandidateGeneratedID);
	
	String recruiterid = req.getParameter("recruitername");
	String programname = req.getParameter("programsnames");
	String partA_RS[] = {"","","","","","","","","",""};
	int PartA_RS_Total = Integer.parseInt(req.getParameter("PartAtotalscore"));
	System.out.println("PartA_RS_Total"+PartA_RS_Total);
	
	for(int i=0;i<10;i++)
	{
		partA_RS[i] = req.getParameter("AnsSlctQ"+(i+1));
		if(partA_RS[i]==null)
		{
			partA_RS[i]="0";
		}
	System.out.println("AnsSlctQ"+i);
	System.out.println(partA_RS[i]);
	}
	Connection con=null;
	String username1="247RecruitmentIS@247customer.com";
	String password1="123456@abc";
	int checkEmailAvlable=0;
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
		//********Recruiter Scored Name*******//
		String RecruiterName=((String)session.getAttribute("USER_Name")).trim();
		System.out.println("RecruiterName \t"+RecruiterName);


		//********Recruiter Scored Name*******//
		if(pagevalue==1)
		{
			  checkDuplicate=Userexists.validateUserExistslang(CandidateId);
		      if(checkDuplicate==true)
		      {
		    	req.setAttribute("DuplicateCheck","Already_Inserted");				
				RequestDispatcher rd1=req.getRequestDispatcher("247Recruit/jsp/LanguageTestScore.jsp?candidateid="+CandidateGeneratedID+"");
				rd1.forward(req,resp);
		      }
		      else
	          {  
		    	con = ConnectDatabase.getConnection();
			    proc = con.prepareCall("{call Language_TestScore_Proc(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			    //      System.out.println(proc);
			    proc.setInt(1,CandidateId);
			    proc.setString(2,recruiterid);
			    proc.setString(3,programname);
			    proc.setString(4,partA_RS[0]);
			    proc.setString(5,partA_RS[1]);
			    proc.setString(6,partA_RS[2]);
			    proc.setString(7,partA_RS[3]);
			    proc.setString(8,partA_RS[4]);
			    proc.setString(9,partA_RS[5]);
			    proc.setString(10,partA_RS[6]);
			    proc.setString(11,partA_RS[7]);
			    proc.setString(12,partA_RS[8]);
			    proc.setString(13,partA_RS[9]);
			    proc.setInt(14,PartA_RS_Total);
			    proc.setFloat(15,PartB_Score);
			    proc.setString(16,PartB_Comments);
			    proc.setFloat(17,PartC_Score);
			    proc.setString(18,PartC_Comments);
			    proc.setString(19,comments);
			    proc.setString(20,PartBtexaHTML);
			    proc.setString(21,PartCtexaHTML);
			    
			    if(!b_BlueMarks_Error.equals("") || b_BlueMarks_Error != null){
			    	proc.setInt(22,Integer.parseInt(b_BlueMarks_Error));
				}else{
					proc.setNull(22,java.sql.Types.INTEGER);
				}
			    
			    if(!b_BlueMarks_Score.equals("") || b_BlueMarks_Score != null){
			    	proc.setInt(23,Integer.parseInt(b_BlueMarks_Score));
				}else{
					proc.setNull(23,java.sql.Types.INTEGER);
				}
			    
			    if(!b_OrangeMarks_Error.equals("") || b_OrangeMarks_Error != null){
			    	proc.setInt(24,Integer.parseInt(b_OrangeMarks_Error));
				}else{
					proc.setNull(24,java.sql.Types.INTEGER);
				}
			    
			    if(!b_OrangeMarks_Score.equals("") || b_OrangeMarks_Score != null){
			    	proc.setInt(25,Integer.parseInt(b_OrangeMarks_Score));
				}else{
					proc.setNull(25,java.sql.Types.INTEGER);
				}
			    
			    if(!b_PurpleMarks_Error.equals("") || b_PurpleMarks_Error != null){
			    	proc.setInt(26,Integer.parseInt(b_PurpleMarks_Error));
				}else{
					proc.setNull(26,java.sql.Types.INTEGER);
				}
			    
			    if(!b_PurpleMarks_Score.equals("") || b_PurpleMarks_Score != null){
			    	proc.setInt(27,Integer.parseInt(b_PurpleMarks_Score));
				}else{
					proc.setNull(27,java.sql.Types.INTEGER);
				}
			    
			    if(!c_BlueMarks_Error.equals("") || c_BlueMarks_Error != null){
			    	proc.setInt(28,Integer.parseInt(c_BlueMarks_Error));
				}else{
					proc.setNull(28,java.sql.Types.INTEGER);
				}
			    
			    if(!c_BlueMarks_Score.equals("") || c_BlueMarks_Score != null){
			    	proc.setInt(29,Integer.parseInt(c_BlueMarks_Score));
				}else{
					proc.setNull(29,java.sql.Types.INTEGER);
				}
			   
			    if(!c_OrangeMarks_Error.equals("") || c_OrangeMarks_Error != null){
			    	proc.setInt(30,Integer.parseInt(c_OrangeMarks_Error));
				}else{
					proc.setNull(30,java.sql.Types.INTEGER);
				}
			   
			    if(!c_OrangeMarks_Score.equals("") || c_OrangeMarks_Score != null){
			    	proc.setInt(31,Integer.parseInt(c_OrangeMarks_Score));
				}else{
					proc.setNull(31,java.sql.Types.INTEGER);
				}
			  
			    if(!c_PurpleMarks_Error.equals("") || c_PurpleMarks_Error != null){
			    	proc.setInt(32,Integer.parseInt(c_PurpleMarks_Error));
				}else{
					proc.setNull(32,java.sql.Types.INTEGER);
				}
			    
			    if(!c_PurpleMarks_Score.equals("") || c_PurpleMarks_Score != null){
			    	proc.setInt(33,Integer.parseInt(c_PurpleMarks_Score));
				}else{
					proc.setNull(33,java.sql.Types.INTEGER);
				}
			    
			    proc.setString(34,status);
			    proc.setFloat(35,totalscore);
			    proc.execute();
			    
			    //      System.out.println("inserted sucessfully");
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
				//      System.out.println("strProcedure"+strProcedure);
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
				 System.out.println("checkEmailAvlable:::::"+checkEmailAvlable);
			 
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
	        RequestDispatcher rd=req.getRequestDispatcher("247Recruit/jsp/LanguageScoreSuccess.jsp");
			rd.forward(req,resp);
		    
	   }
		}
		else if(pagevalue==2)
		{
		con = ConnectDatabase.getConnection();
		PreparedStatement Pst = con.prepareStatement("update  candidate_language_testscore set  Cand_Id='"+CandidateId +"', Recruiter_Id='"+recruiterid +"',Program_Id='"+programname +"', PartA_RS1="+partA_RS[0]+", PartA_RS2="+partA_RS[1]+", PartA_RS3="+partA_RS[2]+", PartA_RS4="+partA_RS[3]+", PartA_RS5="+partA_RS[4]+", PartA_RS6="+partA_RS[5]+", PartA_RS7="+partA_RS[6]+", PartA_RS8="+partA_RS[7]+", PartA_RS9="+partA_RS[8]+", PartA_RS10="+partA_RS[9]+", PartA_RS_Total="+PartA_RS_Total+", PartB_Score="+PartB_Score+" ,PartB_Comments='"+PartB_Comments +"',PartC_Score="+PartC_Score +",PartC_Comments='"+PartC_Comments +"',Comments='"+comments +"',Statusi="+status+",Total_score="+totalscore+",Last_scored_Date=now() where Cand_Id='"+CandidateId+"'");
	  System.out.println(Pst);
	    Pst.executeUpdate();
	    System.out.println("Updated  candidate_chat_score table::sucessfully");
	    PreparedStatement PbpoUpdate=con.prepareStatement("update bpo_candidatesreg_details set MarkLangReScore=0 where AutoID="+CandidateId+"");
        System.out.println(" update bpo_candidatesreg_details set MarkLangReScore=0"+PbpoUpdate);
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
			//      System.out.println("strProcedure"+strProcedure);
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
		//      System.out.println("secQsnrec " + secQsnrec);
		Statement stmtrec = con.createStatement();
		ResultSet rssrec = stmtrec.executeQuery(secQsnrec);
		while (rssrec.next())
		 {
			 Recruiterphone=rssrec.getString("Emp_Mobile_No");
			 Phonenumbers.add(Recruiterphone);
			 //      System.out.println("Phone Numbers::"+Phonenumbers);
			 RecruiterEmailId+=rssrec.getString("Emp_email")+",";
			 //      System.out.println(Phonenumbers.size());
			 checkEmailAvlable = checkEmailAvlable + 1;
			 //      System.out.println("checkEmailAvlable"+checkEmailAvlable);
		 
		 } 
		//      System.out.println("RecruiterEmailId"+RecruiterEmailId);
	    rssrec.close();
	    stmtrec.close();
		rss.close();
        stmts.close();
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
		    
		    RequestDispatcher rd=req.getRequestDispatcher("247Recruit/jsp/LanguageReScoreSuccess.jsp");
			rd.forward(req,resp);
		
		}
		con = ConnectDatabase.getConnection();
		String userQuerychk = "select cand_id from candidate_chat_score where cand_id="+CandidateId+"";
		//      System.out.println(userQuerychk);
		//      System.out.println("query "+userQuerychk);
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(userQuerychk);
		boolean checkvalue=rs.next();
		//      System.out.println("check value(Boolean):::::"+checkvalue);
		if(checkvalue==true)
		{
			PreparedStatement PBpoUpdate=con.prepareStatement("update bpo_candidatesreg_details set cand_Status=6 where AutoID="+CandidateId+"");
	        //      System.out.println(" updated bpo_candidatesreg_details candidate status to value 6 =="+PBpoUpdate);
	        PBpoUpdate.executeUpdate();
	        PBpoUpdate.close(); 
		}
		else
		{
			//      System.out.println("No Value:::::"+checkvalue);
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

