<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
  	String username=((String)session.getAttribute("RecUserName")).trim();
  	if(username==null)
  	{
  		response.sendRedirect("../../jsp/Login.jsp");
  		
  	}
  	
   %>



<html>
  <head>
    <title>[24]7 Select Voice Test to Score</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript" language="javascript">	
		function logout()
		{
			location.href = "<%=logoutPage%>";
		}
	</script>
	
	<!-- Opening PDF Help Document  -->
	<script type="text/javascript">
	function ShowDoc(Filepath)
	{
	someWindow = window.open(Filepath,'ReasonWindow','height=635,width=605,scrollbars=no,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
	</script>
   <!-- End of Opening PDF Help Document  -->
   
  </head>
  
  <body>
    
  
    <table cellpadding="0" cellspacing="0" width="100%">
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
	         <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">
	            <a href="<%=recruitPath%>jsp/LD_Home_Page.jsp">Home > </a>
	            <a href="<%=recruitPath%>jsp/LD_Voice_Options.jsp">Voice > </a>
	           </font>
	            <font class="nonLink">Select Candidate</font>
	        </td>
	        <td align="right" style="padding-right:10px;">
				<b><span class="recName"><%=username%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>
	    </tr>
	    <tr>
	         <td colspan="2" align="center" valign="top">
	        <br/>
	            <table width="900px" border="0" cellpadding="0" cellspacing="0">
		            <tr>
						<td style="width:450px;">
							  <iframe src="<%=recruitPath%>jsp/LD_ReVoiceScoreLeft.jsp" name="left" width="450px" height="450px" scrolling="auto" frameborder="0" ></iframe>
							  
						</td>
						<td style="width:450px;">
							<iframe src="<%=recruitPath%>jsp/LD_ReVoiceScoreRight.jsp" name="right" width="450px" height="450px" scrolling="auto" frameborder="0" ></iframe>
						</td>
					</tr>
	            </table>
	        </td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr class="footerBackColor">
	        <td align="left" class="footerText" colspan="1">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
			<td align="right" valign="middle" style="background-color:#666666;height:21px; padding-right:5px;">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<a onclick="return ShowDoc('<%=HelpDocVPathLND%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
						</td>
						<td style="width: 5px;"></td>
						<td>
							<a onclick="return ShowDoc('<%=HelpDocVPathLND%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
						</td>
					</tr>
				</table>
			</td>
	    </tr>
	</table>
	
  </body>
</html>
