<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
	String F5_REFERSH_before =((String)session.getAttribute("F5_REFERSH"));
	System.out.println("F5_REFERSH_before : "+F5_REFERSH_before);
	session.removeAttribute("F5_REFERSH");
	session.setAttribute("F5_REFERSH", "1");
	String F5_REFERSH_after =((String)session.getAttribute("F5_REFERSH"));
	System.out.println("F5_REFERSH_after : "+F5_REFERSH_after);
    String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
	System.out.println("USER_Name : "+USER_Name);
%>
<html>
	<head>
		<title>[24]7 Online Test</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/Common_ritesh.css">
		
 <style type="text/css">
        
  html,body
	{
		margin: 0px;
	}
	 
       	  .contentSize
	{
		clear: both;
	    display: block;
	    overflow: hidden;
	    padding: 6px 4px;
	     width: 720px;
	}
	.wrapper
	{
		margin: 0 auto;
    	width: 720px;
	}
	
	.tPersonal
	{
		width: 720px;
	}
	.content
	{
		clear: both;
	    display: block;
	    overflow: hidden;
	    padding: 6px 4px;
	    
	}
   	 </style>
   	 <script type="text/javascript">
   	 function displayProcess()
   	 {
 		document.getElementById("linkDIV").style.display="none";
		document.getElementById("processDIV").style.display="";   	 	
   	 }
   	 </script>
   	 
	</head>
 <body>
 <table border="0" width="100%" style="padding-top: 5px;">
	 <tr>
	        <td align="left" style="padding-left:10px;">
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">English Grammar Test > </font>
	            <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Success</font>
	        </td>
	        <td align="right" style="padding-right:10px;">
				<b><span class="recName"><%=USER_Name%></span></b>
			</td>
	    </tr>
</table>

		<div class="wrapper">
		<div class="content">
		<table width="700px" height="100px" cellspacing="1" cellpadding="6" border="0">
				<tbody>
					<tr align="left" style="font-size: 15px;font-family: Arial,Helvetica,sans-serif; color:white;">
						<th colspan="2" style="background-image:url(<%=request.getContextPath()%>/247Recruit/images/header_BG.jpg)">
							Congratulations
						</th>
					</tr>
	
	<% 
	int USER_AUTOID = (Integer)session.getAttribute("USER_AUTOID");
	String engmessage = request.getParameter("engmessage");
	if(engmessage!=null)
	{
		if(engmessage.equalsIgnoreCase("engTestComplete"))
		{
			System.out.println("Finish logic");
			String upQry="UPDATE bpo_user_eng_comp_test_attempt set END_DATE_ACTIVE=sysdate() where USER_ID="+USER_AUTOID;
			System.out.println("Qry :"+upQry);
			Connection con=null;
			try
			{
			  con = ConnectDatabase.getConnection();
			  PreparedStatement enPst = con.prepareStatement(upQry);
			  int l = enPst.executeUpdate();
		 	  if(l>0)
			  {
			  		System.out.println("SucessFully Updated END_DATE_ACTIVE English Grammar test!");
			  }
				  
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
%>
					<tr>
						<td colspan="2" align="center" style="background:none repeat scroll 0 0 #F7F7F7;color: #666666;">
							<h3 style="display: block;font-size: 14px;font-family: Arial,Helvetica,sans-serif; margin: 0 0 10px;">
                     			You have completed the English Grammar Test !
							</h3>
	<div id="linkDIV"><h4 style="font-size: 17px;font-family: Arial,Helvetica,sans-serif;">Please click <a href="<%=request.getContextPath()%>/jsp/instruction.jsp" style="color: #F28900;text-decoration: underline" onclick="displayProcess();">here</a> to go back to home page.</h4></div>
	<div id="processDIV" style="display:none;"><h4 style="font-size: 13px;font-family: Arial,Helvetica,sans-serif;"><a  style="color: black;">Processing, please wait...</a></h4></div>
					   </td>
					</tr>    
<%
     } 
   }
%>						
					

				</tbody>
		</table>
		</div>
	</div>
</body>
</html>
