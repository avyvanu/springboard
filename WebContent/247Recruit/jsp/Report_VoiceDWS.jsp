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
// String User_Center_Id = (String)session.getAttribute("User_Center_Id");
// if(User_Center_Id==null)
// {
//  	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
// }
// System.out.println("User_Center_Id  >>>>>>>>\t"+User_Center_Id);
DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
System.err.println(">>>>>>>>\t"+df.format(new Date()));
String location = request.getParameter("location");
if(location == null)
{
	location = "3";	
}
System.out.println(">>>location " + location);
String FromDAte=request.getParameter("ReoprtVOICEfrom");
String ToDAte=request.getParameter("ReoprtVOICEto");
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
	Connection connection=ConnectDatabase.getConnection();
	ResultSet rs, rsDOI, rsSource1,rsSource2, rsProg, rsPersDetails, rsSourceFrom;
	Statement stmt=connection.createStatement();
	String query;
	//String EDKey="[24]7";
	//String EDKPass="247Cust0m3r";
	String strProcedure="{call GetVoice_DWSReport(?,?,?,?,?)}"; //your procedure name
	System.out.println("strProcedure:::::::;GetVoice_DWSReport::::"+strProcedure);
	CallableStatement cs=connection.prepareCall(strProcedure);
	cs.setString(1,strFrom);
	cs.setString(2,strTo);
	cs.setString(3,location);
	cs.setString(4,EDKey);
	cs.setString(5,EDKPass);
	rs=cs.executeQuery();
	

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
.tblGRID td 
{ 
    padding: 2px; 
    border: solid 1px #c1c1c1; 
    color: #717171; 
}
.tblGRID th 
{ 
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
  
  <body onload="return callDailyReg();">
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
	            <font class="nonLink">Voice DWS Report</font>
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
			            	<form action="" method="post" name="voiceFrm" id="voiceFrm">
			            	<table>
			            		<tr>
			            			<td>From:<input type="text" name="ReoprtVOICEfrom" id="ReoprtVOICEfrom" value="${F}"/></td>
			            			<td>To:<input type="text" name="ReoprtVOICEto" id="ReoprtVOICEto" value="${T}"/></td>
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
			            			<td>
			            				<input type="hidden" name="voice_report" id="voice_report" value="<%=location%>"/>
			            				<input type="submit" name="searchCand" class="buttonSmall" value="Go" style="vertical-align: center;"/>
			            			</td>
			            		</tr>
			            	</table>
			            	</form>
						    <table cellpadding="5" cellspacing="0" rules="all" class="tblGRID" width="100%">
						    	<tr>
						    		<th>
						    			Sl No
						    		</th>
						    		<th>
						    			Date Of Registration
						    		</th>
						    		<th>
						    			HR Recruiter
						    		</th>
						    		<th>
						    			Voice
						    		</th>
						    		<th>
						    			Program
						    		</th>
						    		<th>
						    			Candidate Name
						    		</th>
						    		<th>
						    			Gender
						    		</th>
						    		<th>
						    			Date Of Birth (DD/MM/YY) 
						    		</th>
						    		<th>
						    			Age
						    		</th>
						    		<th>
						    			Fathers Name
						    		</th>
						    		<th>
						    			Contact Number
						    		</th>
						    		<th>
						    			Previous Employer
						    		</th>
						    		<th>
						    			Total Work Experience
						    		</th>
						    		<th>
						    			Relevant Experience in Months
						    		</th>
						    		<th>
						    			Non Relevant Experience in Months
						    		</th>
						    		<th>
						    			Current Salary
						    		</th>
						    		<th>
						    			Expected Salary
						    		</th>
						    		<th>
						    			Primary Source
						    		</th>
						    		
						    		<th>
						    			Employee ID
						    		</th>
						    		<th>
						    			ERP Number
						    		</th>
						    		<th>
						    			Education Qualification
						    		</th>
						    		<th>
						    			HR Select / Reject
						    		</th>
						    		<th>
						    			V & A Name
						    		</th>
						    		<th>
						    			V & A Score
						    		</th>
						    		<th>
						    			V & A (Select / Reject)
						    		</th>
						    		<th>
						    			Ops Name
						    		</th>
						    		<th>
						    			Ops Status (Select / Reject)
						    		</th>
						    		<th>
						    			Expected Date Of Joining (DD/MM/YY)
						    		</th>
						    		<th>
						    			Reject Stage
						    		</th>
						    		<th>
						    			Second Month Gross
						    		</th>
						    		<th>
						    			Ops & On hold Comments
						    		</th>
						    		<th>
						    			Stability Questions Scores
						    		</th>
						    		<th>
						    			Joining Status
						    		</th>
						    	</tr>
						    	<%
						    		int iCounter=0;
						    		while(rs.next())
						    		{
						    			iCounter=iCounter+1;
						    			int autoId=rs.getInt("AutoID");
						    			String SourceId=rs.getString("Primary_Source");
						    			String ProgID=rs.getString("Program_Id");
						    			String canName=rs.getString("First_Name")+ " " +rs.getString("Middle_Name")+ " " +rs.getString("Last_Sir_Name");
						    			
										String primary_source,second_source, primary_Source_Info, DOR, sourceFrom, recNames, progName, DOB, sourceName,SourceDate;
										
										Date dateStr2 = rs.getDate("Cand_DOB");
						  				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yy");
						    			DOB = formatter.format(dateStr2);
						    			
						    			Date today = new Date();
						    		    long diff = today.getTime() - dateStr2.getTime();
										long days=(diff/(1000*60*60*24));
						    			double days2=Math.round((days/365));
										
										Date dateDOR = rs.getDate("DOR");
						  				SimpleDateFormat formaDOR = new SimpleDateFormat("dd-MMM-yyyy");
						  				SimpleDateFormat formSource = new SimpleDateFormat("yyyy-MM-dd");
						    			DOR = formaDOR.format(dateDOR);	
						    			SourceDate = formSource.format(dateDOR);
										
					    			//    System.out.println("SourceDate \t"+SourceDate);
							    		primary_source = rs.getString("Primary_Source");
							    		//    System.out.println("primary_source  \t"+primary_source);
							    		second_source = rs.getString("Secondary_Source");
							    		if(second_source.equals(""))
							    		{
							    			second_source = "0";
							    		}
							    		primary_Source_Info = rs.getString("Primary_Source_Info");
										CallableStatement call = connection.prepareCall("call get_Recruit_Name(?,?,?)");
										call.setString(1,primary_source);
										call.setString(2,second_source);
										call.setString(3,SourceDate);											
										rsSource2=call.executeQuery();
							    		recNames=""; 
										while(rsSource2.next())
										{
											if(recNames.equals(""))
											{
												recNames = rsSource2.getString("RecName").trim();
											}
											else
											{
												recNames = recNames + ", " + rsSource2.getString("RecName").trim();
											}
										}
										
										
										query="select Program_name from program_names_master where Program_id='" + ProgID + "'"; 
										System.out.println("query <><><><>< ===  "+query);
										rsProg=stmt.executeQuery(query);
										if(rsProg.next())
										{
											progName=rsProg.getString("Program_name");
										}
										else
										{
											progName="";
										}
										
										String fatherName;
										query="select * from cand_personal_details_final where Cand_Passed_Auto_Id='" + autoId + "'"; 
										System.out.println("query <><><><>< ++++++ "+query);
										rsPersDetails=stmt.executeQuery(query);
										if(rsPersDetails.next())
										{
											fatherName=rsPersDetails.getString("Cand_Father_Name");
										}
										else
										{
											fatherName="";
										}
						    			 
						    			 String workExp="";
						    			 
						    			 String joinStatus="";
						    			 String EmployeeID="";
						    			 String ERPNumber="";
						    			 String SecondMonthGross="";
						    			 if(rs.getString("EmployeeID")!=null)
						    			 {
						    			 	joinStatus=(String)rs.getString("EmployeeID");
						    			 }
						    			 if(rs.getString("EmployeeID")!=null)
						    			 {
						    			 	EmployeeID=(String) rs.getString("EmployeeID");
						    			 }
						    			 if(rs.getString("ERPNumber")!=null)
						    			 {
						    			 	ERPNumber=(String) rs.getString("ERPNumber");
						    			 }
						    			 if(rs.getString("SecondMonthGross")!=null)
						    			 {
						    			 	SecondMonthGross=(String) rs.getString("SecondMonthGross");
						    			 }
						    			 
						    			 
						    			 
						    	 %>
						    	<tr>
						    		<td>
						    			<%=iCounter%>
						    		</td>
						    		<td>
						    			<%=DOR%>
						    		</td>
						    		<td>
						    			<%=recNames %>
						    		</td>
						    		<td>
						    			Voice
						    		</td>
						    		<td>
						    			<%=progName%>
						    		</td>
						    		<td>
						    			<%=canName%>
						    		</td>
						    		<td>
						    			<%=rs.getString("Gender")%>
						    		</td>
						    		<td>
						    			<%=DOB %>
						    		</td>
						    		<td>
						    			<%=days2 %>
						    		</td>
						    		<td>
						    			<%=fatherName%>
						    		</td>
						    		<td>
						    			<%=rs.getString("Phone")%>
						    		</td>
						    		<td>
						    			<%=rs.getString("privious_ORG")%>
						    		</td>
						    		<td>
						    			<%
						    				if(rs.getString("RelevantExprience")==null || rs.getString("RelevantExprience").equalsIgnoreCase(""))
						    				{
						    					if(rs.getString("NONRelevantExprience")==null || rs.getString("NONRelevantExprience").equalsIgnoreCase(""))
							    				{
							    					workExp="";
							    				}
							    				else
							    				{
							    					workExp=rs.getString("NONRelevantExprience");
							    				}
						    				}
						    				else
						    				{
						    					if(rs.getString("NONRelevantExprience")==null || rs.getString("NONRelevantExprience").equalsIgnoreCase(""))
							    				{
							    					workExp=rs.getString("RelevantExprience");
							    				}
							    				else
							    				{
							    					workExp=rs.getString("RelevantExprience")+"+" +rs.getString("NONRelevantExprience");
							    				}
						    				}
						    			
						    				
						    			%>
						    			<%=workExp%>
						    		</td>
						    		<td>
						    			<%=rs.getString("RelevantExprience")%>
						    		</td>
						    		<td>
						    			<%=rs.getString("NONRelevantExprience")%>
						    		</td>
						    		<td>
						    			
						    		</td>
						    		<td>
						    			
						    		</td>
						    		<td>
						    			<%=primary_Source_Info%>
						    		</td>
						    		
						    		<td>
						    			<%=EmployeeID%>
						    		</td>
						    		<td>
						    			<%=ERPNumber%>
						    		</td>
						    		<td>
						    			<%=rs.getString("Qualification")%>
						    		</td>
						    		<td>
						    			<%
						    				if(rs.getString("CandidateStatus")==null)
						    				{
						    				}
						    				else
						    				{%>
						    					<%=rs.getString("CandidateStatus")%>
						    					
						    				<%}
						    			 %>
						    			
						    		</td>
						    		<td>
						    		
						    			<%
						    			String vaName;
						    			String van =  rs.getString("Recruiter_ID");
						    			String Dquery="SELECT Emp_Name FROM user_master WHERE emp_id= '" +van+ "'"; 
										System.out.println("VVVVVV   =====  "+Dquery);
						    			ResultSet rsOpsName=stmt.executeQuery(Dquery);
										if(rsOpsName.next())
										{
											vaName = rsOpsName.getString("Emp_Name");
										}
										else
										{
											vaName = "";
										}
						    			
						    			%>
						    			<%=vaName%>
						    		</td>
						    		<td>
						    			<%
						    			String to_Score = rs.getString("Total_score");
						    			if(to_Score!=null)
						    			{
						    			%>
						    				<%=to_Score%>
						    			<%
						    			}
						    			%>
						    		</td>
						    		<td>
						    			<%
						    				if(rs.getString("Statusi")==null)
						    				{
						    				}
						    				else
						    				{%>
						    					<%
						    				if(rs.getString("Statusi").equalsIgnoreCase("1"))
						    				{
						    					%>
						    						Select
						    					<%
						    				}
						    				else if(rs.getString("Statusi").equalsIgnoreCase("2"))
						    				{
						    					%>
						    						Hold
						    					<%
						    				}
						    				else if(rs.getString("Statusi").equalsIgnoreCase("3"))
						    				{
						    					%>
						    						Reject
						    					<%
						    				}
						    				else
						    				{
						    					
						    				}
						    			
						    			 %>
						    					
						    				<%}
						    			 %>
						    			
						    			
						    		</td>
						    		<td>
						    			
						    			<%
						    			try
						    			{
						    			String opsName;
						    			String ops =  rs.getString("User_Id");
						    			System.out.println("  >>>> tttttttttt ops >>>>    "+ops);
						    			ops  = "0"+ops;
						    			System.out.println("  >>>> -----  ops >>>>    "+ops);
										String Qquery="SELECT Emp_Name FROM user_master WHERE emp_id= '" +ops+ "'"; 
										System.out.println("  >>>> -----  >>>>    "+Qquery);
										ResultSet rsvopsName=stmt.executeQuery(Qquery);
										if(rsvopsName.next())
										{
											opsName = rsvopsName.getString("Emp_Name");
										}
										else
										{
											opsName = "";
										}
						    			%>
						    			<%=opsName%>
						    			<%
						    			}
						    			catch(Exception e)
						    			{
						    				e.printStackTrace();
						    			}
						    			%>
						    			
						    		</td>
						    		<td>
						    			<%
						    				if(rs.getString("Result_Status")==null)
						    				{
						    				}
						    				else
						    				{%>
						    					<%
						    				if(rs.getString("Result_Status").equalsIgnoreCase("1"))
						    				{
						    					%>
						    						Select
						    					<%
						    				}
						    				else if(rs.getString("Result_Status").equalsIgnoreCase("2"))
						    				{
						    					%>
						    						Hold
						    					<%
						    				}
						    				else if(rs.getString("Result_Status").equalsIgnoreCase("3"))
						    				{
						    					%>
						    						Reject
						    					<%
						    				}
						    				else
						    				{
						    					
						    				}
						    			
						    			 %>
						    					
						    				<%}
						    			 %>
						    			 
						    			
						    		</td>
						    		<td>
						    			
						    		</td>
						    		<td>
						    			<%
						    				if(rs.getString("CandidateStatus")==null)
						    				{
						    				}
						    				else
						    				{%>
						    					<%=rs.getString("CandidateStatus")%>
						    					
						    				<%}
						    			 %>
						    		</td>
						    		<td>
						    			<%=SecondMonthGross%>
						    		</td>
						    		<td>
						    			<%
						    				if(rs.getString("Overall_comment")==null)
						    				{
						    				}
						    				else
						    				{%>
						    					<%=rs.getString("Overall_comment")%>
						    					
						    				<%}
						    			 %>
						    			
						    		</td>
						    		<td>
						    			<%
						    			String score = rs.getString("Score");
						    			if(score!=null)
						    			{	
						    			%>
						    				<%=score%>
						    			<%
						    			}
						    			%>
						    		</td>
						    		<%
						    			
						    			
						    			if(joinStatus.equalsIgnoreCase(""))
						    			{
						    		 %>
						    		<td>
						    			
						    		</td>
						    		<%
						    			}
						    			else
						    			{
						    		 %>
						    		 <td>
						    			Joined
						    		</td>
						    		<%} %>
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
 <script type="text/javascript">
 function callDailyReg()
 {
	 var hidVal = document.getElementById("voice_report").value;
	 if(hidVal == '3')
	 {
		 voiceFrm.location.selectedIndex = 0;	 
	 }
	 else
	 {
		 voiceFrm.location.selectedIndex = hidVal;	 
	 }
 }
 </script> 	  	
  </body>
</html>
