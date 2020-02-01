<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
   String USER_Name=((String)session.getAttribute("USER_Name")).trim();
  	if(USER_Name==null)
  	{
  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
  	}
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
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Recruiter.css">
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
	        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;">
	            <a href="<%=recruitPath%>jsp/Home_Page.jsp">Home > </a>
	            </font>
	            <font class="nonLink">Candidate Resume Upload</font>
	        </td>
	        <td align="right" style="padding-right:10px;">
				<b><span class="recName"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>
	    </tr>
	    <tr>
	        <td colspan="2" height="10"></td>
	    </tr>
	    <tr align="center">
	        <td colspan="2" align="center">
	        	<iframe src="<%=recruitPath%>jsp/RecFileUploadUI.jsp" name="center" width="500px" height="60px" scrolling="auto" frameborder="0" ></iframe>
			</td>
	    </tr>
	    
	    <tr class="footerBackColor">
	        <td colspan="2" align="left" valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;">
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
