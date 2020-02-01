<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>

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



<html>
  <head>
    <title>[24]7 Source Wise Report</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Recruiter.css">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
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
		someWindow =  window.open(Filepath,'ReasonWindow','height=635,width=605,scrollbars=no,resizable=no,menuba r=no,location=no,titlebar=no,toolbar=no');
	}
	</script>
   <!-- End of Opening PDF Help Document  -->	
<script type="text/javascript">
function locValidation()
{
	var locVal = document.getElementById("location").value;
	if(locVal == '' || locVal.trim().length == 0)
	{
		alert('Please select location !');
		return false;
	}
}
</script>
   <script type="text/javascript">
//   function disableMonth() onload="disableMonth()"
 //  {
//	 FinalCheckForm.selMonth.selectedIndex = 0;
//	 FinalCheckForm.location.selectedIndex = 0;
 // 	 document.getElementById('selMonth').disabled = true;
 // 	 document.getElementById('sub').disabled = true;
 //  }
   </script>
   <script type="text/javascript">
 //  function onchangeLoc(obj)
 //  {
//
//		txt = obj.options[obj.selectedIndex].value;
//		if(txt == '' || txt == null || txt.length == 0) 
//		{			
//			document.getElementById('selMonth').disabled = true;
//			FinalCheckForm.selMonth.selectedIndex = 0;
//			document.getElementById('sub').disabled = true;
//		}
//		else
//		{			
//			document.getElementById('selMonth').disabled = false;
//			document.getElementById('sub').disabled = false;
//		}
		
   
 //  }
   </script>
   
  </head>
  
  <body onload="return fillReport();">
 	<form name="FinalCheckForm" id="FinalCheckForm">
  
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
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > <a href="<%=recruitPath%>jsp/Reports_Home_Page.jsp">Reports</a> > </font>
	            <font class="nonLink">Source Wise Report</font>
	        </td>
	        <td align="right" class="recName" style="padding-right:10px;">
				<b><span class="username"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>
	    </tr>
	    
	    <tr>
	        <td colspan="2"  style="padding: 10px;">
	        	 <table cellspacing="0" cellpadding="0" border="0">
	            	<tr style="font-size: 14px; font-family: cursivenew;">
		           
				     <td>	
			            	<span style="font-size: 12px;">Month:</span>
			            	<select name="selMonth" id="selMonth">		            	    
		            	  <%
							if(rs.last())
						    {								
							 %>
								<option value="<%=rs.getString("DDDates")%>"><%=rs.getString("DDDates")%></option>
							 <%
								while(rs.previous())
							    {								
								 %>
									<option value="<%=rs.getString("DDDates")%>"><%=rs.getString("DDDates")%></option>
								 <%
								}
							}
							rs.close();
							%>
						 
						</select>
					</td>
		               <td>&nbsp;&nbsp;</td>
		            <td>
		            	 <span style="font-size: 12px;">Location:</span>						
							<select name="location" id="location">							
					    	<option value="3">All</option>
					    	<%  
							
								Statement smt = connection.createStatement();
			              		String qry = "SELECT centre_id,centre_name FROM centre_master WHERE is_alive=1";
								System.out.println("query "+qry);
								ResultSet rst = smt.executeQuery(qry);
								while(rst.next())
								{
							%>
									<option value="<%=rst.getString("centre_id")%>"><%=rst.getString("centre_name")%></option>	
					   		<%
								}
								rst.close();
		                	%>
		                
				        	</select>
				     </td>
				 
					<td>&nbsp;&nbsp;</td>
					<td>	
						<input type="button" id="sub" value="Go" class="buttonSmall" onclick="locValidation(), fillReport()">
					</td>
	            </tr>
	        	 </table>
	        	 <table width="100%">
		            <tr>
		            	<td colspan="3">
		            		<iframe name="bottom" width="100%" height="500px" scrolling="auto" frameborder="0" ></iframe>
		            	</td>
		            </tr>
		            
	            </table>
	        </td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr class="footerBackColor">
	        <td align="left" class="footerText">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
			<td align="right" valign="middle" style="background-color:#666666;height:21px; padding-right:5px;">
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
	<script type="text/javascript"> 	
		
		// document.FinalCheckForm.selMonth.onchange = fillReport; 
				
	
		function fillReport() 
		{ 
			var locationval = document.getElementById('location').value;
			var obj_sel = document.FinalCheckForm.selMonth.value; 
			
			var url="<%=recruitPath%>jsp/Report_SourceWise.jsp";
			url=url+"?monthFilter="+obj_sel;
			url=url+"&LocId="+locationval;
			url=url+"&sid="+Math.random();
			if(obj_sel=="select")
			{
				alert("Please select month and year filter.");
				return false;
			} 
			else
			{
				parent.bottom.location.href = url;
				
			}
			
		} 
	</script>
	</form>
  </body>
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
  
</html>

