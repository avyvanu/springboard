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
String pagevalue=(String)session.getAttribute("page");
System.out.println("pagevalue==="+pagevalue);

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

.logo

{

height: 69px;

width: 143px;

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
	            <img src="<%=recruitPath%>images/247_Logo_left.jpg" alt="Logo" />
	        </td>
	        <td align="right">
	            <img src="<%=recruitPath%>images/Springboard_LOG.jpg" alt="Logo" />
	        </td>
	    </tr>
	    <tr class="tBackColor">
	        <td align="left" colspan="2" style="height:10px;">
				
			</td>
			
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr>
	        <td align="left" style="padding-left:15px;">
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > <a href="<%=recruitPath%>jsp/SIM_Home.jsp">SIM</a> > <a href="<%=recruitPath%>jsp/LD_PrecScore.jsp">Select Candidate</a> ></font>
	            <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Score Precis Success</font>
	        </td>
	        <td align="right" style="padding-right: 10px;">
                <b><span class="recName"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
				</td>
	    </tr>
	    <tr>
	         <td colspan="2" style="padding-top:20px; padding-left:30px; padding-right:30px;">
	        
	        <!-- ############################################ -->

<form>

	<table width="100%" border="0">
		<tr class="theader" valign="middle">
			<td height="32"  align="left" style="font-style:Arial, Helvetica, sans-serif; font-weight: bold; font-size: 13px; padding-left: 5px;">
	      			<b>Scored Successfully</b>
	      	</td>	
		</tr>
	<tr>
	<td height="100" style="background-color:#F7F7F7 ;font-family: Arial,Helvetica,sans-serif;font-size: 12px; color: #41383C;pa">
	<b style="padding-left: 5px">
	You have successfully Scored for Precis.
	</b><br/>
	<ul>
	
<li> <a href="<%=recruitPath%>jsp/LD_PrecScore.jsp" style="color: gray"><b>Score another Candidate</b></a><br/></li>
 <li><a href="<%=recruitPath%>jsp/Home_Page.jsp" style="color: gray"><b>Home Page</b></a></li>
 
 </ul>
	</td>
	</tr>
	</table>
	<table width="100%" border="0">
	<tr>
	<td width="52%"  align="center">
	 
	</td>

	<td width="48%" align="center">
	 
	  </td>
	</tr>
	</table>
</form>


			<!-- ############################################ -->    
	        </td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr class="footerBackColor" valign="middle">
	        <td align="left" valign="middle" style="background-color:#666666; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="1">
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
