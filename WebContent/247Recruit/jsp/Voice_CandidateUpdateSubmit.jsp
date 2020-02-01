<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%@page import="util.EmailDemo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.SMSFunction"%>
<%@ include file="GlobalDeclareNEW.jsp" %>
<%
			Connection connection=ConnectDatabase.getConnection();		
			String canId= (String) session.getAttribute("Bpo_Cand_Id");
			String USER_ID = (String)session.getAttribute("USER_ID");
			 if(USER_ID == null)
			  	{
			  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
			  	}
			 System.out.println("USER_ID in home page::::"+USER_ID);
			String querycan="select AutoID from bpo_candidatesreg_details where Bpo_Cand_Id='" + canId + "'";
			Statement stmtcand=connection.createStatement();
			ResultSet rscand=stmtcand.executeQuery(querycan);
			int CandautoId=0;
			if(rscand.next())
		  	{
				CandautoId=rscand.getInt("AutoID");
				System.out.println("CandautoId::::::"+CandautoId);
		  	}
			String username1="247RecruitmentIS@247customer.com";
			String password1="123456@abc";
			//String EDKey="[24]7";
			//String EDKPass="247Cust0m3r"; 
			
			int status=Integer.parseInt(request.getParameter("select"));
			System.out.println("status::::::"+status);
			int program = Integer.parseInt(request.getParameter("selForProgram"));
			System.out.println("program::::::"+program);

			String query="update bpo_candidatesreg_details set Init_Result="+status+",Init_Selected_Program="+program+",Recruiter_Cand_Select_ID='"+USER_ID+"',Recruiter_Cand_Select_Date=now() where Bpo_Cand_Id='" + canId + "'";
			System.out.println("query"+query);
			Statement stmt=connection.createStatement();
			stmt.executeUpdate(query);
			System.out.println("Updated successfully");
            String CandidateFirstname=null;
			String CandidateEmail=null;
			String Phonenumber=null;
			String msgsms=null;
			int LocationId=0;
			Statement stmts=null;
			ResultSet rss = null;
			CallableStatement cs=null;
			try
			{
				connection=ConnectDatabase.getConnection();				 					
				stmts = connection.createStatement();
				String strProcedure="{call CandEmailPhone_Encrypt_Proc(?,?,?)}"; //your procedure name
				System.out.println("strProcedure"+strProcedure);
				cs=connection.prepareCall(strProcedure);
				cs.setInt(1,CandautoId);
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
			 CandidateEmail=rss.getString("Email");
			 Phonenumber=rss.getString("Phone");
			 LocationId=rss.getInt("Location");
		 }
		   //***************************////
		    String ContactPhoneNo=null;
		    String ContactEmailId=null;
		    String QueryRecConInfo= "select Contact_Phone_No,Contact_Email_Id from cand_query_contact_info where Center_Id='"+ LocationId + "'";
			System.out.println("QueryRecConInfo " + QueryRecConInfo);
			Statement stmtContactInfo = connection.createStatement();
			ResultSet rssContactInfo = stmtContactInfo.executeQuery(QueryRecConInfo);
			if (rssContactInfo.next())
			 {
				 ContactPhoneNo=rssContactInfo.getString("Contact_Phone_No");
				 ContactEmailId=rssContactInfo.getString("Contact_Email_Id");
			 }
		 ///*********************//////
            String msg=null;
		    if(status==1)
		    {
		    msgsms="Congratulations!!! You are successfully through to the final round of interview. Our recruitment team will be reaching out to you shortly with further instructions.";
		    msg="<HTML><BODY>Hi "+CandidateFirstname+",<br/><br/> Congratulations!!! You are successfully through to the final round of interview. Our recruitment team will be reaching out to you shortly with further instructions. We would request you to upload a copy of your scanned documents by loging into out career website(http://careers-india.247-inc.com/). For any questions or clarifications please feel free to reach out to us on:<br/><b>Email:</b> '"+ContactEmailId+"'<br/><b>Phone:</b> '"+ContactPhoneNo+"'<br/><br/>Regards,<br/>Team [24]7</BODY></HTML>";
		    String subject="[24]7 Career";
		    SMSFunction.sendSMSVoiceSelection(Phonenumber,msgsms);
	        EmailDemo.sendMailNew(username1,password1,CandidateEmail,msg,subject);
            }
            rss.close();
			stmts.close();
			rscand.close();
			stmtcand.close();

%>
<%
	connection.close();
				 %>

<html>
  <head>
     <title>[24]7 Candidate Selection</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<script type="text/javascript" language="javascript">
    alert("Candidate Selection Updated Successfully."); 
    parent.location.href= "<%=recruitPath%>jsp/Voice_Candidate_Selection.jsp";

  </script>
  </head>
<!-- Old Google Analytics Code -->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-15437724-1']);
  _gaq.push(['_setDomainName', 'none']);
  _gaq.push(['_setAllowLinker', true]);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<!-- Old Google Analytics Code -->  
  <body>
    
  </body>
</html>
