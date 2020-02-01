<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="util.*" %>
<%@ include file="GlobalDeclare.jsp" %>

<html>
  <head>
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
	<style type="text/css">
		html,body,form
		{
			margin: 0px;
		}
		
		.contentSize
		{
			border: 0px solid #FFFFFF;
		    clear: both;
		    display: block;
		    overflow: hidden;
		    width: 100%;
		}
	
		.wrapper
		{
			margin: 0 auto;
	    	width: 100%;
		}
	
		.tPersonal
		{
			width: 900px;
		}
	</style>
</head>
 
	<%
		try
		{
			int USER_AUTOID =(Integer)session.getAttribute("USER_AUTOID");
			System.out.println("USER_AUTOID : "+USER_AUTOID);
			if(USER_AUTOID == 0)
			{
				response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
			}
			
		    String USER_ID = ((String) session.getAttribute("USER_ID")).trim();
		    System.out.println("USER_ID : "+USER_ID);
		    
		    String password_random=(String) session.getAttribute("password_random");
			System.out.println("password_random : "+password_random);
			
			String USER_Name =(String)session.getAttribute("USER_Name");
			System.out.println("USER_Name : "+USER_Name);
	 %>
  	
	        <!-- ############################################ -->
	 <body>
	   	 <table cellpadding="0" cellspacing="0" width="100%">
	    <tr>
	       <td align="left">
	            <img src="<%=request.getContextPath()%>/247Recruit/images/247_Logo_left.jpg" alt="Logo" />
	        </td>
	        <td align="right">
	            <img src="<%=request.getContextPath()%>/247Recruit/images/Springboard_LOG.jpg" alt="Logo" />
	        </td>
	    </tr>
	    <tr class="tBackColor">
	        <td align="left" colspan="2" style="height:12px;">
				
			</td>
			
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr>
	        <td align="left" style="padding-left:10px;">
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Post Registration > </font>
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Chat Process Tests > </font>
	            <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Confirmation</font>
	        </td>
	        <td align="right" style="padding-right:10px;">
				<b><span class="recName"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;">&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/LogoutServletV" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>
	    </tr>
	    <tr>

	        <td colspan="2" align="center">
	        <br/>  
	        <!-- ############################################ -->

     <div class="wrapper">
		<div class="contentSize">
	   		 <table width="100%" border="0"  cellpadding="6" cellspacing="6" frame="void" class="tPersonal" align="center">
			  <tr class="allTdBackColor">
	    	 	<td valign="top">
	    	    	 <p>Thank you for completing the "Communication Ability" round. if you have sucessfully completed this <br/> round - you will receive a confirmation for the next round in your personal email id and your mobile <br/> number registered with us. </p>										
					 <p>Please note down your ID for all further communication in future</p>
					 <p>Your Candidate Id number is:  <b><%=USER_ID%></b></p>				
			   </td>
	        </tr>
	        <tr>
	        	<td style="height: 10px">
	        	</td>
	        </tr>	        <tr>
	        	<td align="center" style="height: 41px">
	        		
	        		<input type="button" name="btnNewWindow" class="buttonLarge" value="Visit [24]7 Website" onClick="parent.window.open('http://www.247-inc.com', '_self');">
	        	</td>
	        </tr>
	        </table>
      	</div>
	</div>
		<!-- ############################################ -->    
	       </td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr class="footerBackColor">
	        <td align="left" valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="2">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
	    </tr>
	</table>	       
 	<%
			session.removeAttribute("USERID");
			session.removeAttribute("Bpo_Cand_Id");	
			session.removeAttribute("password_random");	
			session.removeAttribute("username");	
		}
		catch(Exception ex)
		{
			response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		}
	%>   
  </body>
</html>
