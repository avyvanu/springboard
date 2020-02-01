<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="util.*" %>

<%@ include file="GlobalDeclare.jsp" %>

<%	
	try
	{
		String logOUT = request.getContextPath()+ "/247Recruit/jsp/Logout.jsp";
		String USER_Name =((String)session.getAttribute("USER_Name")).trim();
		System.out.println("USER_Name : "+USER_Name);
		
		int USER_AUTOID =(Integer)session.getAttribute("USER_AUTOID");
		System.out.println("USER_AUTOID : "+USER_AUTOID);
		
	    String USER_ID =(String) session.getAttribute("USER_ID");
	    System.out.println("USER_ID : "+USER_ID);
	    
	    String password_random=(String) session.getAttribute("password_random");
		System.out.println("password_random : "+password_random);
%>

<html>
  <head>
	<title>[24]7 SPRINGBOARD</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
	
	<script type="text/javascript">
	function goToChatProcess()
	{
		 window.location.href ="<%=request.getContextPath() %>/247Recruit/jsp/ApplyingFor.jsp";
	}

	function goToWelcomePage()
	{
		 window.location.href ="<%=request.getContextPath()%>/247Recruit/jsp/Welcome_Page.jsp";
	}
	
	</script>

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
		height: 240px;
	}
	</style>
	
  </head>
  
  <body>
  	 <table border="0" cellpadding="0" cellspacing="0" width="100%">
	   <tr>
	        <td align="left">
	            <img src="<%=recruitPath%>images/247_Logo_left.jpg" alt="Logo" />
	        </td>
	        <td align="right">
	            <img src="<%=recruitPath%>images/Springboard_LOG.jpg" alt="Logo" />
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
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Registration > </font>
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
					  <form id="canvasForm" name="canvasForm" method="post" action="">
					    <table width="100%" border="0"  cellpadding="6" cellspacing="6" frame="void" class="tPersonal">
					    	<tr class="allTdBackColor">
					    	   <td valign="top" align="left">
					    	     <p><b>Congratulations on registering with us.</b> Please note the following details for all further interview rounds.</p>										
								 <p>Your Candidate Id number is: <b><%=USER_ID%></b></p>
								 <p>Password: <b><%=password_random %></b></p>		     
								 <p>This confirmation has also been sent to your personal email address as updated by you on the Personal Information Page. You will again receive this information on your registered mobile number as well.</p>
								 <p>NOTE:<b style="color: red;"> PLEASE REMEMBER THIS IDENTIFICATION NUMBER.</b></p>	
					    	   </td>
					        </tr>
					        <tr>
					        	<td style="height: 10px">
					        	</td>
					        </tr>
					        <tr>
					        	<td align="center" style="height: 41px">
					        	<%
					        		String uIP = request.getHeader("X-FORWARDED-FOR");
									if(uIP == null)  
									{  
										uIP = request.getRemoteAddr();  
									}
									System.out.println(" Inside Confirmation Page IP Adress\t"+uIP);
									
									if(uIP.startsWith("172.30."))
									{
								%>
					        		<input type="button" class="buttonLarge320" name="GoIntra" id="GoIntra" value="Get In Touch With Your Career Counselor" onclick="goToWelcomePage()"/>
					        	<%
									}
									else
									{
								%>
					        		<input type="button" class="buttonLarge240" name="confirmation" id="confirmation" value="Take The Next Step :NOW!" onclick="goToChatProcess()"/>
					        	<%
									}
								%>
					        	</td>
					        </tr>
				        </table>
					</form>
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

  </body>
</html>

  	<%
		}
		catch(Exception ex)
		{
			response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		}
	%>   
