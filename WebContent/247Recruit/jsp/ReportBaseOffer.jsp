<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp"%>

<html>
  <head>
    <title>[24]7 SPRINGBOARD</title>
 <%
  	String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
	if(USER_Name==null)
		  	{
		  	 	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		  	}
	System.out.println("USER_Name in Reports home page::::"+USER_Name);		  	
	String User_Center_Id = (String)session.getAttribute("User_Center_Id");
	if(User_Center_Id==null)
		  	{
		  	 	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		  	}
	System.out.println("User_Center_Id  >>>>>>>>\t"+User_Center_Id);
  	
  	String query="SELECT DISTINCT(DATE_FORMAT(DATE(system_date_time),'%b-%Y')) AS 'DDDates' FROM bpo_candidatesreg_details"; 

	Connection connection=ConnectDatabase.getConnection();		
	Statement stmt=connection.createStatement();
	ResultSet rs=stmt.executeQuery(query);
   %>
	<!-- Opening PDF Help Document  -->
	<script type="text/javascript">
	function ShowDoc(Filepath)
	{
		someWindow =  window.open(Filepath,'ReasonWindow','height=635,width=605,scrollbars=no,resizable=no,menuba r=no,location=no,titlebar=no,toolbar=no');
	}
	</script>
   <!-- End of Opening PDF Help Document  -->	
 	<script type="text/javascript">
		function logout()
		{
			top.window.location.href = "<%=request.getContextPath()%>/LogoutServletV";
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
	        <td align="left" colspan="2" style="height:12px;">
				
			</td>
			
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;">
	        </td>
	    </tr>
	    <tr>
	        <td align="left" style="padding-left:10px;">
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > <a href="<%=recruitPath%>jsp/Reports_Home_Page.jsp">Reports</a> > </font>
	            <font class="nonLink">Source Wise Joinees Report</font>
	        </td>
	        <td align="right" class="recName" style="padding-right:10px;">
				<b><span class="username"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>
	    </tr>
 	    <tr>
	        <td colspan="2" style="padding: 10px;">
					        
				<!-- ************************************************************************************ -->	        
					    
				<iframe src="<%=recruitPath%>jsp/ReportOffer.jsp" name="right" width="100%" height="525px" frameborder="0" ></iframe>	    
					        
				<!-- ************************************************************************************ -->	        
					        
	        </td>
	    </tr>
	    <tr class="footerBackColor">
	          <td align="left" valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="1">
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
   
  </body>
</html>
