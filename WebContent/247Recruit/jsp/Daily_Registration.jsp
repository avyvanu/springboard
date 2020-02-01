<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" isELIgnored="false" import="java.sql.*,java.util.*,util.ConnectDatabase,java.util.Date,java.text.SimpleDateFormat" pageEncoding="utf-8"%>
<%@page import="java.text.DateFormat"%>
<%@ include file="GlobalDeclare.jsp" %>


<%
  	String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
	     if(USER_Name==null)
		  	{
		  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		  	}
	System.out.println("USER_Name in Reports home page::::"+USER_Name);		  	
//	String User_Center_Id = (String)session.getAttribute("User_Center_Id");
//	if(User_Center_Id==null)
 // 	{
 // 	 	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
 // 	}
//	System.out.println("User_Center_Id  >>>>>>>>\t"+User_Center_Id);
	String location = request.getParameter("location");
	if(location == null)
	{
		location = "3";	
	}
	System.err.println(">>>location " + location);
	DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
	System.err.println(">>>>>>>>\t"+df.format(new Date()));
	//String EDKey="[24]7";
    // String EDKPass="247Cust0m3r";
	String FromDAte=request.getParameter("ReoprtVOICEfrom");
	String ToDAte=request.getParameter("ReoprtVOICEto");
	Connection con = null;
	if(FromDAte==null || FromDAte.equalsIgnoreCase(""))
	{
		FromDAte=df.format(new Date());
		System.err.println(">>>>11111111111111>>>>\t"+FromDAte);
		ToDAte=FromDAte;
		System.err.println(">>>>22222222222>>>>\t"+ToDAte);
	}
	String[] forFROMSplit=null;
	String[] forToSplit=null;
	String strFrom=null;
	String strTo=null;
	try
	{
		forFROMSplit=FromDAte.split("-");
		strFrom=forFROMSplit[2]+"-"+forFROMSplit[1]+"-"+forFROMSplit[0];
		System.out.println("strFrom \t"+strFrom);	
		
		request.setAttribute("F",FromDAte);
	
	}
	catch(Exception e)
	{
		System.out.println(e.getMessage());
		e.printStackTrace();
	}
	try
	{
		con=ConnectDatabase.getConnection();
		
		forToSplit=ToDAte.split("-");
		strTo=forToSplit[2]+"-"+forToSplit[1]+"-"+forToSplit[0];
		System.out.println("strTo \t"+strTo);
		request.setAttribute("T",ToDAte);
	}
	catch(Exception e)
	{
		System.out.println(e.getMessage());
		e.printStackTrace();
	}
%>


<html>
  <head>
    <title>[24]7 Voice DWS Report</title>
    
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
	<style>
.tblGRID 
{ 
    width: 100%; 
    background-color: #fff; 
    margin: 5px 0 10px 0; 
    border: solid 1px #525252; 
    border-collapse:collapse; 
}
.tblGRID td { 
    padding: 2px; 
    border: solid 1px #c1c1c1; 
    color: #333333; 
    font-size: 12px; 
}
.tblGRID th { 
    padding: 4px 2px; 
    color: #fff; 
    background-color: #424242; 
    border-left: solid 1px #525252; 
    font-size: 12px; 
}
html,body

{

margin: 0px;

}
	</style>
		<!-- jQuery for Datepicker -->
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/demos/demos.css" rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/base/jquery.ui.all.css" rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/jquery.ui.theme.css" rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/base/jquery.ui.theme.css"  rel="stylesheet" />

	
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/jquery-1.4.2.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.core.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.datepicker.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.tabs.js"></script>
	<!-- End jQuery for Datepicker -->
	
			<script type="text/javascript">
		$(function() {
		$("#ReoprtVOICEfrom").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1970:2050',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true		
		    });
	    });
	   </script>  
		<!-- end birth_City calender  -->
		
		<!--  from date and to date start -->
		<script type="text/javascript">
		$(function() {
		$("#ReoprtVOICEto").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1970:2050',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true
		
		    });

	    });
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
  
  <body onload="callDailyReg()">
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
	            <font class="nonLink">Daily Registration Report</font>
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
			            	<form action="" method="post" name="dailyFrmName" id="dailyFrmName">
			            	<table>
			            		<tr>
			            			<td>From:<input type="text" name="ReoprtVOICEfrom" id="ReoprtVOICEfrom" value="${F}"/></td>
			            			<td> To:<input type="text" name="ReoprtVOICEto" id="ReoprtVOICEto" value="${T}"/> </td>
						            <td>
						            	 <span style="font-size: 12px;">Location:</span>						
											<select name="location" id="location">
									    	<option value="3">All</option>
									    	<%  
											
												Statement smt = con.createStatement();
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
			            			<td>
			            			<input type="hidden" name="daily_Reg" id="daily_Reg" value="<%=location%>"/>
			            			<input type="submit" name="searchCand" class="buttonSmall" value="Go"/></td>
			            		
			            			<td nowrap="nowrap"></td>
			            		</tr>
			            	</table>
			            	</form>
						    <table cellpadding="5" cellspacing="0" rules="all" class="tblGRID" width="100%">
						    <%
													    		
								
								ResultSet rs=null;
								Statement stmt=null;
								String query=null;
								CallableStatement cs=null;
								try
								{
																		
									stmt=con.createStatement();
									String strProcedure="{call Get_DWSReport(?,?,?,?,?)}"; //your procedure name
									cs=con.prepareCall(strProcedure);
									cs.setString(1,strFrom);
									cs.setString(2,strTo);
									cs.setString(3,location);
									cs.setString(4,EDKey);
									cs.setString(5,EDKPass);
									rs=cs.executeQuery();
						    	}
						    	catch(Exception e)
						    	{
						    		e.printStackTrace();
						    	}	
						    %>
						    	<tr>
						    		<th>
						    			Sl No  <!-- 1 -->
						    		</th>
						    		<th>
						    			Date Of Registration <!-- 2 -->
						    		</th>
						    		<th>
						    			Candidate Id <!-- 3 -->
						    		</th>						    		
						    		<th>
						    			Candidate Name <!-- 3 -->
						    		</th>						    		
						    		<th>
						    			Telephone Number <!-- 4 -->
						    		</th>
						    		<th>
						    			Email Id <!-- 5 -->
						    		</th>
						    		<th>
						    			Date of Birth <!-- 6  -->
						    		</th>
						    		<th>
						    			Educational Qualification <!-- 7 -->
						    		</th>
						    		<th>
						    			Current Status <!-- 8 -->
						    		</th>	
						    		<th>
						    			Applying For <!-- 9 -->
						    		</th>
						    		<th>
						    			Primary Source <!-- 9 -->
						    		</th>			    		
						    	</tr>
						    	<%
						    	try
						    	{
						    		int iCounter=0;
						    		while(rs.next())
						    		{
						    			iCounter=iCounter+1;
						    	 %>
						    	<tr>
						    	
						    		<td nowrap="nowrap">
						    			<%=iCounter%>	<!-- 1 -->	
						    		</td>
						    		<td nowrap="nowrap">
					    			<%
						    			Date dateStr2 = rs.getDate("DOR");
						    			
						  				SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
						    			String DOR = formatter.format(dateStr2);				    			
					    			 %>
						    		
						    			<%=DOR%>	<!-- 2 -->	
						    		</td>
						    		<td nowrap="nowrap">
						    			<%=rs.getString("CANDID")%>	<!-- 3 -->	
						    		</td>
						    		<td nowrap="nowrap">
						    			<%=rs.getString("CandidateName")%>	<!--4 -->	
						    		</td>
						    		
						    		<td nowrap="nowrap">
						    			<%=rs.getString("Phone")%>	<!-- 5 -->	
						    		</td>
						    		<td nowrap="nowrap">
						    			<%=rs.getString("Email")%>	<!-- 6 -->
						    		</td>
						    		<td nowrap="nowrap">
						    		<%
						    			Date dateStrDOB = rs.getDate("Cand_DOB");
						    			System.out.println("DOB>>>"+dateStrDOB);
						  				SimpleDateFormat formatterDOB = new SimpleDateFormat("dd-MMM-yyyy");
						    			String DOB = formatterDOB.format(dateStrDOB);				    			
						    		 %>
						    			<%=DOB%>	<!-- 7 -->
						    		</td>						    		
						    		<td nowrap="nowrap">
						    			<%=rs.getString("Qualification")%>	<!-- 8 -->
						    		</td>
						    		<td nowrap="nowrap">
						    			<%=rs.getString("CandidateStatus")%>	<!-- 9 -->
						    		</td>	
						    		<td nowrap="nowrap">
						    		<%
						    			String appFor=rs.getString("Applying_For");
						    			if(appFor.equalsIgnoreCase("0"))
						    			{
						    		%>
						    		 	NA
						    			<%
						    			}
						    			else if(appFor.equalsIgnoreCase("1"))
						    			{
						    		%>
						    		 	Voice
					    			<%
						    			}
						    			else
						    			{
					    			%>
						    		 	SIM
					    			<%
						    			}
					    			%>
						    		</td>
						    		<td>
						    		
						    		<%=rs.getString("PrimarySource")%>
						    		</td>
						    		<%
						    		}
						    		}
						    		catch(Exception e)
						    		{
						    		e.printStackTrace();
						    		}
						    		 %>
						    	</tr>	
						    	
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
 <script type="text/javascript">
 function callDailyReg()
 {
	 var hidVal = document.getElementById("daily_Reg").value;
	 if(hidVal == '3')
	 {
		 dailyFrmName.location.selectedIndex = 0;	 
	 }
	 else
	 {
		 dailyFrmName.location.selectedIndex = hidVal;	 
	 }
 }
 </script> 	
  </body>
</html>
