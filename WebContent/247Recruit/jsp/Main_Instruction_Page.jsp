<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String recruitPath = path + "/247Recruit/";
	
	session.removeAttribute("USER_Name");
	session.removeAttribute("USER_AUTOID");
	session.removeAttribute("USER_ID");
	session.removeAttribute("x_val");
	session.removeAttribute("x_val2");
	session.removeAttribute("ScriptType");
	session.removeAttribute("password_random");
	session.setAttribute("photoCam","0");
	session.setAttribute("Logs_Data_Info","0");
	
	Object Logs_Data_Info = session.getAttribute("Logs_Data_Info");
	System.out.println("\t vishnu "+Logs_Data_Info);
%>

<html>
  <head>
    <title>[24]7 SPRINGBOARD</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
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
	    padding: 0px;
	    width: 100%;
	}
	.headder
	{
		margin: 0px;
    	width: 100%;
	}

	.wrapper
	{
		border: 0px solid #FFFFFF;
		margin: 0 auto;
    	width: 100%;
	}

	.w100p
	{
		width: 100%;
	}

	.tPersonal
	{
		width: 935px;
		height: 120px;
	}
	</style>
	
	<script type="text/javascript">
	function redirectBack()
	{
		window.location.href ="<%=request.getContextPath()%>/247Recruit/jsp/Welcome_Page.jsp";
	}
	function redirectNext()
	{
		window.location.href ="<%=request.getContextPath()%>/247Recruit/jsp/CandidateRegPage.jsp";
	}
	</script>

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
	        <td align="left" colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr>
	        <td align="left" style="padding-left:10px;">
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Registration > </font>
	            <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Instructions</font>
	        </td>
	        <td></td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center">
	 <br/>
	        
	        <!-- ############################################ -->
	        
	            <div class="wrapper">
						    <div class="contentSize">
						   
						    <table border="0" cellpadding="6" cellspacing="6" class="tPersonal" align="center">
						    	<tr>
						    		<td align="left" valign="top" colspan="2" class="allTdBackColor" style="padding-left: 15px;padding-top: 15px;">
							    		<b>
											Welcome to the [24]7 recruitment experience.
										<br/><br/>	
											Thank you for taking time out to register.
										<br/><br/>
											Please follow the next steps carefully to continue with the interview process.
										</b>
						    		</td>
						    	</tr>
						    </table>
						    </div>
			    </div>
			    
	 <br/>
			    
			<!-- ############################################ -->    
	        </td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height: 41px;">
			    <table border="0" cellpadding="0" cellspacing="0" class="w100p">
			    	<tr>
			    		<td style="padding-left: 10px;" align="left" valign="middle"><input type="button" name="cancel" id="cancel" class="buttonMedium" value="Cancel" onclick="redirectBack()"/></td>
			    		<td style="padding-right: 10px;" align="right" valign="middle"><input type="button" name="next" id="next" class="buttonMedium" value="Next" onclick="redirectNext()"/></td>
			   		</tr>
			    </table>
	        </td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr class="footerBackColor">
	        <td valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="2">
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
