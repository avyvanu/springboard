<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<html>
  <head>
  	<title>[24]7 SPRINGBOARD</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/Common.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/MasterTheme.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/NoBack.js"></script>
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
		System.out.println("Session Time Out Called.........");
		session.removeAttribute("USER_AUTOID");
		session.removeAttribute("USER_ID");	
		session.removeAttribute("password_random");	
		session.removeAttribute("USER_Name");
		session.removeAttribute("User_Type_Id");
		session.removeAttribute("User_Center_Id");
		session.invalidate();	
	%>   
   	 <table cellpadding="0" cellspacing="0" width="100%">
	   <tr>
	        <td align="left">
	            <img src="<%=request.getContextPath()%>/247Recruit/images/logo-24-7.gif" alt="Logo" />
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
	        <td colspan="2" align="left" style="padding-left:10px;">
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=request.getContextPath()%>/247Recruit/jsp/Welcome_Page.jsp">Home</a></font>
	        </td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center">
	        <br/>  
	          <div class="wrapper">
					<div class="contentSize">
					    <table width="100%" border="0"  cellpadding="6" cellspacing="6" frame="void" class="tPersonal">
					    	<tr class="allTdBackColor">
					    	   <td align="center" valign="middle"><b>Session Timed Out !!</b></td>
					        </tr>
				        </table>
					</div>
				  </div>
			      <br/>  
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
