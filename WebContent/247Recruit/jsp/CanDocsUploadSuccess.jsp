<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
	String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
     if(USER_Name == null)
	  	{
	  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	  	}
System.out.println("USER_Name in chat Score sucess::::"+USER_Name);
%>

<html>
  <head>
    <title>[24]7 SPRINGBOARD</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/Common_ritesh.css">

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
	 
	<style type="text/css">
		html,body
		{
			margin: 0px;
		}
		.theader
		{
			background: url("<%=request.getContextPath() %>/247Recruit/images/header_BG.jpg") repeat-x scroll 0 0 transparent;color: #FFFFFF;
		}
	</style>

  </head>
  
  <body>
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
	        <td align="left" colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr>
	        <td align="left" style="padding-left:10px;">
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > </font>
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Cand_Docs_Upload.jsp">Candidate Documents Upload</a> > </font>
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Upload Documents > </font>
	            <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Confirmation</font>
	        </td>
	        <td align="right" style="padding-right: 10px;">
                <b><span class="recName"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center">
		        <br/>
				<table border="0" cellpadding="0" cellspacing="0" width="90%" class="theader">
					<tr>
			      		<td align="left" valign="middle" height="32" style="padding-left:10px;">
			      			<font style="color:#FFFFFF; font-weight:bold; font-size:15px; font-family:Arial;"><b>Documents Uploaded Successfully</b></font>
			      		</td>
					</tr>
					<tr>
						<td height="100" style="padding-left:15px; background-color:#F7F7F7 ;font-family: Arial,Helvetica,sans-serif;font-size: 12px; color: #41383C;pa">
							<b>You have successfully uploaded the candidate's documents.</b>
							<br/>
							<ul>
								<li><a href="<%=recruitPath%>jsp/Cand_Docs_Upload.jsp" style="color: gray"><b>Upload Another Candidate's Documents</b></a><br/></li>
								<li><a href="<%=recruitPath%>jsp/Home_Page.jsp" style="color: gray"><b>Home Page</b></a></li>
							</ul>
						</td>
					</tr>
				</table>
		       <br/>
	        </td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr class="footerBackColor">
	        <td align="left"  valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="1">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
			<td align="right" valign="middle" style="background-color:#808080;height:21px; padding-right:5px;">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
						</td>
						<td style="width: 5px;"></td>
						<td>
							<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
						</td>
					</tr>
				</table>
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