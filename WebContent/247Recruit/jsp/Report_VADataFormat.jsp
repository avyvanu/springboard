<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.util.Date,java.text.SimpleDateFormat" pageEncoding="utf-8"%>
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


Connection connection=ConnectDatabase.getConnection();
ResultSet rs, rsDOI, rsSource1,rsSource2, rsProg, rsPersDetails, rsTypeTotal, rsTypeScore, rsPrecScore, rsMockScore;
Statement stmt=connection.createStatement();
String query;

// String strProcedure="{call GetVAData()}"; //your procedure name
CallableStatement cs=connection.prepareCall("call GetVAData(?)");
cs.setString(1,User_Center_Id);
rs=cs.executeQuery();
%>

<html>
  <head>
    <title>[24]7 V&A Data Format Report</title>
    
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
		someWindow = window.open(Filepath,'ReasonWindow','height=635,width=605,scrollbars=no,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
	</script>
   <!-- End of Opening PDF Help Document  -->
	<style>
		.tblGRID { 
    width: 100%; 
    background-color: #fff; 
    margin: 5px 0 10px 0; 
    border: solid 1px #525252; 
    border-collapse:collapse; 
}
.tblGRID td { 
    padding: 2px; 
    border: solid 1px #c1c1c1; 
    color: #717171; 
}
.tblGRID th { 
    padding: 4px 2px; 
    color: #fff; 
    background: #424242 url(../images/grd_head.png) repeat-x top; 
    border-left: solid 1px #525252; 
    font-size: 0.9em; 
}
html,body

{

margin: 0px;

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
	        <td align="left" colspan="2" style="height:12px;">
				
			</td>
			
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr>
	        <td align="left" style="padding-left:10px;">
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > <a href="<%=recruitPath%>jsp/Reports_Home_Page.jsp">Reports</a> > </font>
	            <font class="nonLink">V&A Data Format Report</font>
	        </td>
	        <td align="right"  style="padding-right:10px;">
				<b><span class="recName"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>

	    </tr>
	    <tr>
	        <td colspan="2" style="padding-left:10px;padding-right: 10px;" align="center">
	        <br/>
	            <table width="1200px">
		            <tr>
			            <td colspan="2">
				              
						    <table cellpadding="5" cellspacing="0" rules="all" class="tblGRID" width="100%">
						    	<tr>
						    		<th>
						    			Sl No
						    		</th>
						    		<th>
						    			Date
						    		</th>
						    		<th>
						    			V&A Name
						    		</th>
						    		
						    		<th>
						    			Candidate Name
						    		</th>
						    		<th>
						    			Score
						    		</th>
						    		
						    		<th>
						    			Attempts
						    		</th>
						    		<th>
						    			Recruiter Name
						    		</th>
						    		<th>
						    			Consultant Name
						    		</th>
						    		<th>
						    			Timings
						    		</th>
						    		<th>
						    			Taken Time in Mins
						    		</th>
						    		
						    		
						    	</tr>
						    	<%
						    		int iCounter=0;
						    		while(rs.next())
						    		{
						    			iCounter=iCounter+1;
						    			
						    			String canName=rs.getString("First_Name")+ " " +rs.getString("Middle_Name")+ " " +rs.getString("Last_Sir_Name");
						    			
						    			
						    			
						    			
						    			
										String DOV;
										Date dateStr2 = rs.getDate("Last_Scored_Date");
						  				SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yy");
						    			DOV = formatter.format(dateStr2);
						    			
						    			
						    	 %>
						    	<tr>
						    		<td>
						    			<%=iCounter%>
						    		</td>
						    		<td>
						    			<%=DOV%>
						    		</td>
						    		<td>
						    			
						    		</td>
						    		
						    		<td>
						    			<%=canName%>
						    		</td>
						    		<td>
						    			<%=rs.getString("Total_score")%>
						    		</td>
						    		<td>
						    			
						    		</td>
						    		<td>
						    			<%=rs.getString("Recruiter_ID")%>
						    		</td>
						    		
						    			<%
						    				if(rs.getString("Primary_Source")!=null)
							    			 {
							    			 	if(rs.getString("Primary_Source")=="4")
							    			 	{
							    			 		%>
							    			 			<td>
							    			 				<%=rs.getString("Primary_Source_Info")%>
							    			 			</td>
							    			 		<%
							    			 	}
							    			 	else
							    			 	{
							    			 		%>
							    			 			<td>
							    			 				
							    			 			</td>
							    			 		<%
							    			 	}
							    			 	
							    			 }
							    			 else
						    			 	{
						    			 		%>
						    			 			<td>
						    			 				
						    			 			</td>
						    			 		<%
						    			 	}
						    			 %>
						    		
						    		
						    		<td>
						    			
						    		</td>
						    		<td>
						    			<%=rs.getString("Time_in_mins")%>
						    		</td>
						    	</tr>
						    	
						    	<%
						    		}
						    		rs.close();
						    		
						    		connection.close();
						    	 %>
						    </table>
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
	        <td align="left" valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="1">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
			<td align="right" valign="middle" style="background-color:#808080;height:21px; padding-right:5px;">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px; font-family:Arial;">HELP</font></a>
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
