<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
  	String USER_Name = null;
  	String User_Type_Id = null;
  	try
  	{
  	USER_Name =(String)session.getAttribute("USER_Name");
  	if(USER_Name == null)
  	{
  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
  	}
  	User_Type_Id = (String)session.getAttribute("User_Type_Id");
     if(User_Type_Id == null)
	  	{
	  	  response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	  	}
	 }
	 catch(Exception e)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	}
%>
<html>
  <head>
  <title>[24]7 SPRINGBOARD</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Recruiter.css">
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
	        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;">
	            <a href="<%=recruitPath%>jsp/Home_Page.jsp">Home </a> >
	             
	            </font>
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;">
	            <a href="<%=recruitPath%>jsp/Admin_Home_Page.jsp">Administration</a> > 
	             
	            </font>
	            <font class="nonLink">Manage Language Tests</font>
	        </td>
	        <td align="right" style="padding-right:10px;">
				<b><span class="recName"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/LogoutServletV" style="cursor: hand; cursor: pointer;">Logout</a></font>
			</td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center" valign="top">
	        <br/>
	            <table width="900px" border="0" cellpadding="0" cellspacing="0">
		            <tr>
						<td style="width:450px;">
							  <iframe src="<%=recruitPath%>jsp/Admin_Add_LanguageListLeft.jsp" name="left" width="450px" height="400px" scrolling="auto" frameborder="0" ></iframe>
						</td>
						<td style="width:450px;">
							<iframe src="<%=recruitPath%>jsp/Admin_Add_LanguageListRight.jsp" name="right" width="450px" height="400px" scrolling="no" frameborder="0" ></iframe>
						</td>
					</tr>
	            </table>
	        <br/>
	        </td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	     <tr class="footerBackColor" >
	       <td align="left" valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="1">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
			<td align="right" valign="middle" style="background-color:#808080;height:21px; padding-right:5px;">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<%if(User_Type_Id.equalsIgnoreCase("1") || User_Type_Id.equalsIgnoreCase("99") ) 
							{
							%>
							<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
						    <%
						    }
						    else if(User_Type_Id.equalsIgnoreCase("2")) 
						    {
						     %>
						     <a onclick="return ShowDoc('<%=HelpDocVPathLND%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
						   <%
						    }
						    else if(User_Type_Id.equalsIgnoreCase("3"))
						    {
						   %>
						   <a onclick="return ShowDoc('<%=HelpDocVPathOPS%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
						  <%
						   }
						   %>
						</td>
						<td style="width: 5px;"></td>
						<td>
							<%if(User_Type_Id.equalsIgnoreCase("1") || User_Type_Id.equalsIgnoreCase("99") ) 
							{
							%>
							<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
							<%
						    }
						    else if(User_Type_Id.equalsIgnoreCase("2")) 
						    {
						    %>
						    <a onclick="return ShowDoc('<%=HelpDocVPathLND%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
						    <%
						    }
						    else if(User_Type_Id.equalsIgnoreCase("3"))
						    {
						   %>
						   <a onclick="return ShowDoc('<%=HelpDocVPathOPS%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
						  <%
						   }
						   %>
						 </td>
					</tr>
				</table>
			</td>
	    </tr>
	</table>
   </body>
</html>