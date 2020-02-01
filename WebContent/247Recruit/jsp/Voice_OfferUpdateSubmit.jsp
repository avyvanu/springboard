<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%@page import="util.*" %>
<%@ include file="GlobalDeclareNEW.jsp" %>
<%
			Connection connection=ConnectDatabase.getConnection();		
			String canId= (String) session.getAttribute("Bpo_Cand_Id");
			String USER_ID = (String)session.getAttribute("USER_ID");
			 if(USER_ID == null)
			  	{
			  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
			  	}
			 System.out.println("USER_ID in Voice Offer page::::"+USER_ID);
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
			PreparedStatement userWebserviceUpdate = null;
			String FinalRegState = request.getParameter("finalreg");
			System.out.println("FinalRegState::::::"+FinalRegState);
			int WebService_SubmitState=0;
			String program = request.getParameter("selForProgram");
			System.out.println("program::::::"+program);
			int programid=0;
			int subprogramid=0;
			String secQsnQry = "select  mst_programid,mst_subprogramid from program_names_master where program_id="+program+"";
			System.out.println("query " + secQsnQry);
			Statement stmtprog = connection.createStatement();
			ResultSet rsprog = stmtprog.executeQuery(secQsnQry);
			if (rsprog.next()) {
			programid=rsprog.getInt("mst_programid");
			System.out.println("programid::::::"+programid);
			subprogramid=rsprog.getInt("mst_subprogramid");
			System.out.println("subprogramid::::::"+subprogramid);
			}
			if(FinalRegState.equalsIgnoreCase("true"))
			{
			ImageMakerVoice.createImage(canId,EDKey,EDKPass); 
			WebService.CandidateSave(canId,USER_ID,programid,subprogramid,EDKey,EDKPass);
			session.setAttribute("CandidateId",canId);
            String CandidateFirstname=null;
			String CandidateEmail=null;
			String Phonenumber=null;
			String msgsms=null;
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
			 WebService_SubmitState=rss.getInt("WebService_SubmitState");
		 }
            rss.close();
			stmts.close();
			rscand.close();
			stmtcand.close();
            String msg=null;
            if(WebService_SubmitState==1)
            {
           	userWebserviceUpdate =connection.prepareStatement("update bpo_candidatesreg_details set cand_Status = ?,Program = ?,SubProgram = ? where Bpo_Cand_Id = ?");
			userWebserviceUpdate.setInt(1,9);
			userWebserviceUpdate.setInt(2,programid);
			userWebserviceUpdate.setInt(3,subprogramid);
			userWebserviceUpdate.setString(4,canId);
			userWebserviceUpdate.executeUpdate();
			userWebserviceUpdate.close();
			System.out.println("Update Successfully::::");
            
           	msgsms="Congratulations!!! You have successfully cleared the Operations round. Our recruitment team will be reaching out to you shortly with the offer letter details.";
		    msg="<HTML><BODY>Hi "+CandidateFirstname+",<br/><br/> Congratulations!!! You have successfully cleared the Operations round. This was the last round of interviews. Our recruitment team will be reaching out to you shortly with the offer letter details.<br/><br/>Regards,<br/>Team [24]7</BODY></HTML>";
		    String subject="[24]7 Career Offer Details";
		    SMSFunction.sendSMSOffer(Phonenumber,msgsms);
	        EmailDemo.sendMailNew(username1,password1,CandidateEmail,msg,subject);
	        }
            
}

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
    <% if(WebService_SubmitState==1) {%>
    alert("Candidate Selection Updated Successfully."); 
    <%} else {%>
     alert("Not Updated Successfully. Please retry after some time."); 
     <%}%> 
    parent.location.href= "<%=recruitPath%>jsp/Voice_Candidate_Offer.jsp";

  </script>
  </head>
  
  <body>
    
  </body>
</html>
