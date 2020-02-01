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
		html,body
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
			height: 150px;
		}
	
		.wrapper
		{
			margin: 0 auto;
	    	width: 100%;
		}
	
		.tPersonal
		{
			width: 900px;
			height: 150px;
		}
		</style>
	</head>
  <body>
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
  	 <table cellpadding="0" cellspacing="0" width="100%">
	   <tr>
	        <td align="left">
	            <img src="<%=recruitPath%>images/logo-24-7.gif" alt="Logo" />
	        </td>
	        <td align="right" valign="bottom" style="color:#666666; font-size:16px; font-family:Arial; padding-right:30px; padding-bottom:15px;">
	            The Intuitive Consumer Experience Company™ 
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
				<b><span class="recName"><%=USER_Name%></span></b>
			</td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center">
	        <br/>  
	        <!-- ############################################ -->
	          <div class="wrapper">
					<div class="contentSize">
					
					
					
					  <form id="canvasForm" name="canvasForm" method="post" action="">
	
	    <table width="100%" border="0"  cellpadding="6" cellspacing="6" frame="void" class="tPersonal">

	   			   		  
	    	<tr class="allTdBackColor">
	    	
	    	   <td valign="top">
	    	     <p>Thank you for initiating the test. Please note down your ID for all further communication.</p>										
				 <p>Your Candidate Id number is:  <b><%=USER_ID%></b></p>
	    	   </td>
	       		 						
	        </tr>
	        <tr>
	        	<td style="height: 10px">
	        	</td>
	        </tr>	        <tr>
	        	<td align="center" style="height: 41px">
	        		
	        		<input type="button" name="btnNewWindow" class="buttonLarge" value="Visit [24]7 Website" onClick="window.open('http://www.247-inc.com', '_self');">
	        	</td>
	        </tr>
	        </table>
		</form>
      	</div>
			  </div>
	      <br/>  

			<!-- ############################################ -->    
	        </td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr class="footerBackColor">
	         <td align="left" valign="middle" style="background-color:#666666; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="2">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
	    </tr>
	</table>
 	<%
		}
		catch(Exception ex)
		{
			response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		}
		session.removeAttribute("USERID");
		session.removeAttribute("Bpo_Cand_Id");	
		session.removeAttribute("password_random");	
		session.removeAttribute("username");	
	%>   
  </body>
</html>
