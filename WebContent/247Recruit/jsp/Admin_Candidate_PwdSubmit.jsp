<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<%@page import="util.*" %>
<%

String canId = (String) session.getAttribute("CandID");
if(canId == null)
  	{
  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
  	}
String USER_ID=(String)session.getAttribute("USER_ID");
if(USER_ID == null)
  	{
  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
  	}
System.out.println("USER_ID"+USER_ID);
String CandFName= (String) request.getParameter("canFName");
System.out.println("CandFName"+CandFName);
String canMobile= (String) request.getParameter("canMobile");
	if(canMobile == null)
	{
		canMobile = "";
	}
System.out.println("canMobile"+canMobile+canMobile.length());
String canEmail= (String) request.getParameter("canEmail");
	if(canEmail == null)
	{
		canEmail = "";
	}
System.out.println("canEmail"+canEmail+canEmail.length());

String username1="247RecruitmentIS@247customer.com";
String password1="123456@abc";
String candGenPassword = PasswordGenerate.getPassword(8);
System.out.println("candGenPassword:::::"+candGenPassword);



Connection connection=null;	
 CallableStatement pwResetproc=null;
 
	  try
	    {
		  connection= ConnectDatabase.getConnection();
		  pwResetproc = connection.prepareCall("{ call cand_PWReset_Proc(?,?,?,?)}");
		  pwResetproc.setString(1, canId);
		  pwResetproc.setString(2, candGenPassword);
		  pwResetproc.setString(3, EDKey);
		  pwResetproc.setString(4, EDKPass);
		  pwResetproc.execute();
		  pwResetproc.close();
		  System.out.println("Update  sucessfully");
		  
		  PreparedStatement pwResetInsert_Proc=connection.prepareStatement("insert into candidate_pwreset_change(Candidate_ID, Recruiter_ID) values(?,?)");
		  pwResetInsert_Proc.setString(1, canId);
		  pwResetInsert_Proc.setString(2, USER_ID);
		  pwResetInsert_Proc.executeUpdate();
		  pwResetInsert_Proc.close();
		  System.out.println("Inserted  sucessfully");
	   }
	catch(Exception ex)
	 {
	  ex.printStackTrace();
	 }
 
    String msg=new String();
	msg="<HTML><BODY>Hi "+CandFName+",<br/><br/>Your Password has been successfully reset.<br/><br/><b>Id:</b>&nbsp;"+canId+"<br/><b>Password:</b>&nbsp;"+candGenPassword+"<br/><br/>Regards,<br/>Team [24]7</BODY></HTML>";
	String subject="Password Reset";
	if(canMobile.length() != 0)
	{
		SMSFunction.sendSMSPWReset(canMobile,candGenPassword,canId);
	}
	if(canEmail.length() != 0)
	{
		EmailDemo.sendMailNew(username1,password1,canEmail,msg,subject);
	}
String redURL=recruitPath+ "jsp/Admin_Candidate_PwdReset.jsp";
%>


<html>
  <head>
    <base href="<%=basePath%>">
    
      <title>[24]7 SPRINGBOARD</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript" language="javascript">
   		alert("Candidate Password Successfully reset !");
   		parent.location.href= "<%=redURL%>";
   </script>
  </head>
  <body>
  </body>
  <%
     connection.close();
				 %>
</html>
