<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%@page import="util.*" %>
<%@ include file="GlobalDeclare.jsp"%>
<%

Connection connection=ConnectDatabase.getConnection();	
String CandidateId =(String)request.getParameter("CandidateId");
System.out.println("CandidateId value::"+CandidateId);
String USER_ID = (String)session.getAttribute("USER_ID");
if(USER_ID == null)
 	{
 		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
 	}	
PreparedStatement validatedInfoInsert = null;		
String WorkExperience =(String)request.getParameter("hidExp");
System.out.println("WorkExperience value::"+WorkExperience);		
String resumechk =(String)request.getParameter("resumechk");
System.out.println("resumechk value::"+resumechk);
String photochk =(String)request.getParameter("photochk");
System.out.println("photochk value::"+photochk);

String idproofchk =(String)request.getParameter("idproofchk");
System.out.println("idproofchk value::"+idproofchk);
String addresschk =(String)request.getParameter("addresschk");
System.out.println("addresschk value::"+addresschk);

String birthchk =(String)request.getParameter("birthchk");
System.out.println("birthchk value::"+birthchk);
String educationchk =(String)request.getParameter("educationchk");
System.out.println("educationchk value::"+educationchk);
String employementchk = "";
String employement1chk = "";
String employement2chk = "";
String employement3chk = "";
String payslipchk = "";
	if(WorkExperience.equalsIgnoreCase("N"))
	{
		employementchk =(String)request.getParameter("employementchk");
		System.out.println("employementchk value::"+employementchk);
	}
	if(WorkExperience.equalsIgnoreCase("Y"))
	{
		employement1chk =(String)request.getParameter("employement1chk");
		System.out.println("employement1chk value::"+employement1chk);
		employement2chk =(String)request.getParameter("employement2chk");
		System.out.println("employement2chk value::"+employement2chk);
		employement3chk =(String)request.getParameter("employement3chk");
		System.out.println("employement3chk value::"+employement3chk);
		payslipchk =(String)request.getParameter("payslipchk");
		System.out.println("payslipchk value::"+payslipchk);
	}
	String transportchk =(String)request.getParameter("transportchk");
	System.out.println("transportchk value::"+transportchk);
try
{
connection=ConnectDatabase.getConnection();	
	if(WorkExperience.equalsIgnoreCase("Y"))
	 {
		validatedInfoInsert =connection.prepareStatement("insert into validate_candidate_offer_master(CandidateID, Validate_By, Validate_On, ResumeChk, PhotosChk, IdProofChk, AddressProofChk, DOBchk, EducationChk, Experience1Chk, Experience2Chk, Experience3Chk, PaySlipChk, TransportChk) values(?,?,now(),?,?,?,?,?,?,?,?,?,?,?)");
		validatedInfoInsert.setString(1,CandidateId);
		validatedInfoInsert.setString(2,USER_ID);
		validatedInfoInsert.setString(3,resumechk);
		validatedInfoInsert.setString(4,photochk);
		validatedInfoInsert.setString(5,idproofchk);
		validatedInfoInsert.setString(6,addresschk);
		validatedInfoInsert.setString(7,birthchk);
		validatedInfoInsert.setString(8,educationchk);
		validatedInfoInsert.setString(9,employement1chk);
		validatedInfoInsert.setString(10,employement2chk);
		validatedInfoInsert.setString(11,employement3chk);
		validatedInfoInsert.setString(12,payslipchk);
		validatedInfoInsert.setString(13,transportchk);
	 } 
	if(WorkExperience.equalsIgnoreCase("N"))
	 {
		validatedInfoInsert =connection.prepareStatement("insert into validate_candidate_offer_master(CandidateID, Validate_By, Validate_On, ResumeChk, PhotosChk, IdProofChk, AddressProofChk, DOBchk, EducationChk, Experience1Chk,TransportChk) values(?,?,now(),?,?,?,?,?,?,?,?)");
		validatedInfoInsert.setString(1,CandidateId);
		validatedInfoInsert.setString(2,USER_ID);
		validatedInfoInsert.setString(3,resumechk);
		validatedInfoInsert.setString(4,photochk);
		validatedInfoInsert.setString(5,idproofchk);
		validatedInfoInsert.setString(6,addresschk);
		validatedInfoInsert.setString(7,birthchk);
		validatedInfoInsert.setString(8,educationchk);
		validatedInfoInsert.setString(9,employementchk);
		validatedInfoInsert.setString(10,transportchk);
		
	 } 	
		validatedInfoInsert.executeUpdate();
		validatedInfoInsert.close();
		System.out.println("Inserted Successfully::::");
}
catch(Exception exception)
{
exception.printStackTrace();
}
connection.close();
				 %>

<html>
  <head>
    <title>[24]7 SPRINGBOARD</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  <script type="text/javascript" language="javascript">
    parent.location.href= "<%=recruitPath%>jsp/Validated_Offer_Success.jsp?CandidateId=<%=CandidateId%>";
    var url = "<%=request.getContextPath()%>/247Recruit/jsp/Candidate_Complete_Info.jsp?CandidateId=<%=CandidateId%>"
    someWindow = window.open(url,'ReasonWindow','height=600,width=900,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
  </script>
  </head>
  
  <body>
    
  </body>
</html>
