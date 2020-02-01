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
	
	String locId = request.getParameter("location");
	if(locId == null)
	{
		locId = "3";	
	}
	System.out.println("locId  "+locId);	
		
	
	if(User_Center_Id==null)
  	{
  	 	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
  	}
	System.out.println("User_Center_Id  >>>>>>>>\t"+User_Center_Id);
	Connection connection=ConnectDatabase.getConnection();
	ResultSet rs;
	
	String strProcedure="{call rptEmpRefWalkinandJoinees(?)}"; //your procedure name
	CallableStatement cs=connection.prepareCall(strProcedure);
	cs.setString(1,locId);
	rs=cs.executeQuery();
%>


<html>
  <head>
    <title>[24]7 Emp Ref Walk In & Joinees Report</title>
    
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
  
  <body onload="empref_Report()">
  <form id="frmName">
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
	            <font class="nonLink">Emp Ref Walk In & Joinees Report</font>
	        </td>
	        <td align="right" class="recName" style="padding-right:10px;">
				<b><span class="username"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>
	    </tr>
	    <tr>
	    	<td colspan="2" style="padding: 10px;">
				<table cellspacing="0" cellpadding="0" border="0">
	            	<tr style="font-size: 14px; font-family: cursivenew;">
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
						<input type="hidden" name="report_EmpREF" id="report_EmpREF" value="<%=locId%>"/>
						<input type="submit" id="sub" value="Go" class="buttonSmall">
					</td>
	            </tr>
	        </table>
			<table width="100%">
		            <tr>
			            <td colspan="2">
						    <table cellpadding="5" cellspacing="0" rules="all" class="tblGRID" width="100%">
						    	<tr>
						    		
						    		<th>
						    			Month
						    		</th>
						    		<th>
						    			Walk IN
						    		</th>
						    		<th>
						    			Voice Offers
						    		</th>
						    		<th>
						    			SIM Offers
						    		</th>
						    		<th>
						    			Total Offers
						    		</th>
						    		<th>
						    			Voice Joinees
						    		</th>
						    		<th>
						    			SIM Joinees
						    		</th>
						    		<th>
						    			Total Joinees
						    		</th>
						    		<th>
						    			Conversion
						    		</th>
						    		
						    	</tr>
						    	<%
   		
   		while(rs.next())
   		{
   			
   				%>
		        <tr>
		            <td align="center" style="font-weight: bold;">
		            	<%=rs.getString("SystemDate")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("Walkin")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("Voiceoffer")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("SimOffer")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("TotalOffer")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("VoiceJoinee")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("SimJoinee")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("TotalJoinee")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("Conversion")%>
		            </td>
		            
		                  
		        </tr>
		        
		        <%
   			
        }
        rs.close();
         %>
						    </table>
			            </td>
		            </tr>
	            </table>
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
 <script type="text/javascript">
 function empref_Report()
 {
	 var hidVal = document.getElementById("report_EmpREF").value;
	 if(hidVal == '3')
	 {
		 frmName.location.selectedIndex = 0;	 
	 }
	 else
	 {
		 frmName.location.selectedIndex = hidVal;	 
	 }
 }
 </script> 	

</form>
  </body>
</html>
 