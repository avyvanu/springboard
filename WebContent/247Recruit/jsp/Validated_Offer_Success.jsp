<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
	 if(USER_Name == null)
		{
			response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		}
System.out.println("USER_Name in validate offer success::::"+USER_Name);
String CandidateId = (String) request.getParameter("CandidateId");
System.out.println("CandidateId:::;"+CandidateId);
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
 
 function validateCandInfo()
	{
		if(confirm('Please click "OK" to Print, else "cancel".'))
		{
		var url = "<%=request.getContextPath()%>/247Recruit/jsp/Candidate_Complete_Info.jsp?CandidateId=<%=CandidateId%>"
		someWindow = window.open(url,'ReasonWindow','height=600,width=900,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
		return true;
		}
		else
		{
		return false;
		}
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
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > <a href="<%=recruitPath%>jsp/Candidate_HROps_Round.jsp">Validate Candidate Offer</a> > 
	            <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Success</font>
	        </td>
	       <td align="right" style="padding-right:10px;">
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
	      			<b>Validated Successfully</b>
	      	</td>	
		</tr>
	<tr>
	<td height="100" style="background-color:#F7F7F7 ;font-family: Arial,Helvetica,sans-serif;font-size: 12px; color: #41383C;">
		<b style="padding-left: 5px">
		     You have successfully Validated for Candidate Id:&nbsp; <%=CandidateId %>.
		</b><br/>
	<ul>
 <li><b><a style="text-align: right;color: maroon;" onclick="validateCandInfo()">Print</a></b></li>	
 <li> <a href="<%=recruitPath%>jsp/Candidate_HROps_Round.jsp" style="color: gray"><b>Validated another Candidate</b></a><br/></li>
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
	    <tr class="footerBackColor">
	        <td align="left" valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="1">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
			<td align="right" valign="middle" style="background-color:#808080;height:21px; padding-right:5px;">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<!-- <a onclick="return ShowDoc('<%=HelpDocVPathLND%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a> -->
						</td>
						<td style="width: 5px;"></td>
						<td>
							<!-- <a onclick="return ShowDoc('<%=HelpDocVPathLND%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a> -->
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
