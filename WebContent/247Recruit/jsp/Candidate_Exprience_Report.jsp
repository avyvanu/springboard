<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" isELIgnored="false" import="java.sql.*,java.util.*,util.ConnectDatabase,java.util.Date,java.text.SimpleDateFormat" pageEncoding="utf-8"%>
<%@page import="java.text.DateFormat"%>
<%@ include file="GlobalDeclare.jsp" %>

<html>
<head>

<title>Insert title here</title>
</head>

<%
  	String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
    if(USER_Name==null)
  	{
  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
  	}
	System.out.println("USER_Name in Reports home page::::"+USER_Name);		  	

	String location = request.getParameter("location");
	if(location == null)
	{
		location = "0";	
	}
	System.out.println(">>>location " + location);
	
	String skillSet = request.getParameter("skillSet");
	if(skillSet == null)
	{
		skillSet = "0";
	}
	String vendor = request.getParameter("vendor");
	if(vendor == null)
	{
		vendor = "0";
	}
	
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
	            <font class="nonLink">Experience Report</font>
	        </td>
	        <td align="right"  style="padding-right:10px;">
				<b><span class="recName"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>
	    </tr>
	    <tr>
	        <td colspan="2" style="padding-left:10px;padding-right: 10px;" align="left">
	        <br/>
			            	
			            	<form action="" method="post" name="dailyFrmName" id="dailyFrmName">
			            	<table>
			            		<tr>
			            			<td>From:<input type="text" name="ReoprtVOICEfrom" id="ReoprtVOICEfrom" value="${F}" style="width: 100px;"/></td>
			            			<td> To:<input type="text" name="ReoprtVOICEto" id="ReoprtVOICEto" value="${T}" style="width: 100px;"/> </td>
						            <td>
						            	 <span style="font-size: 12px;">Location:</span>						
											<select name="location" id="location">
									    	<option value="0">All</option>
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
			            				<span style="font-size: 12px;">Skill Set:</span>
										<select name="skillSet" id="skillSet">
											<option value="0">All</option>
												<%
													qry = "SELECT program_type_Id, program_type_Name FROM program_type_master WHERE is_Active=1";
													System.out.println("query "+qry);
													rst = smt.executeQuery(qry);
													while(rst.next())
													{
													%>
														<option value="<%=rst.getString("program_type_Id")%>"><%=rst.getString("program_type_Name")%></option>	
												    <%
													}
													rst.close();
									            %>
																			
										</select>
			            				
			            			</td>
			            			<td>
			            				<span style="font-size: 12px;">Vendor:</span>
										<select name="vendor" id="vendor">
											<option value="0">All</option>										
											<option value="Yes">Vendor</option>
											<option value="No">Non Vendor</option>																				
										</select>
			            				
			            			</td>

			            			<td>
			            				<input type="hidden" name="daily_Reg" id="daily_Reg" value="<%=location%>"/>
			            				<input type="hidden" name="skill_setVal" id="skill_setVal" value="<%=skillSet%>"/>
			            				<input type="hidden" name="vendor_setVal" id="vendor_setVal" value="<%=vendor%>"/>
			            				<input type="submit" name="searchCand" class="buttonSmall" value="Go"/>
			            			</td>
			            			<td nowrap="nowrap"></td>
			            		</tr>
			            	</table>
			            	</form>
			            	
			            	<%
							ResultSet rs=null;
							Statement stmt=null;
							String query=null;
							CallableStatement cs=null;
							
							String good1 = ""; 
							String veryGood1 = ""; 
							String excellent1 = ""; 
							String needImprove1 = ""; 
							String poor1 = ""; 
							String na1 = ""; 

							String good2 = ""; 
							String veryGood2 = ""; 
							String excellent2 = ""; 
							String needImprove2 = ""; 
							String poor2 = ""; 
							String na2 = ""; 

							String good3 = ""; 
							String veryGood3 = ""; 
							String excellent3 = ""; 
							String needImprove3 = ""; 
							String poor3 = ""; 
							String na3 = ""; 

							String good4 = ""; 
							String veryGood4 = ""; 
							String excellent4 = ""; 
							String needImprove4 = ""; 
							String poor4 = ""; 
							String na4 = ""; 
							
							String good5 = ""; 
							String veryGood5 = ""; 
							String excellent5 = ""; 
							String needImprove5 = ""; 
							String poor5 = ""; 
							String na5 = ""; 

							String good6 = ""; 
							String veryGood6 = ""; 
							String excellent6 = ""; 
							String needImprove6 = ""; 
							String poor6 = ""; 
							String na6 = "";
							
							String minutes_120 = ""; 
							String mins_60_120 = ""; 
							String mins_30_60 = ""; 
							String mins_10_30 = ""; 
							String na_mins = ""; 
							
							String Hours_8 = ""; 
							String Hours_6_8 = ""; 
							String Hours_4_6 = ""; 
							String Hours_2_4 = ""; 
							String Hours_2 = ""; 
							String na_hours = ""; 
							

							try
							{
								stmt=con.createStatement();
								String strProcedure_q4="{call get_Cand_Exprience_Report_q4(?,?,?,?,?)}"; //your procedure name
								cs=con.prepareCall(strProcedure_q4);
								cs.setString(1,strFrom);
								cs.setString(2,strTo);
								cs.setString(3,location);
								cs.setString(4,skillSet);
								cs.setString(5,vendor);
								rs=cs.executeQuery();
								System.out.println("call get_Cand_Exprience_Report_q4('"+strFrom+"','"+strTo+"',"+location+","+skillSet+",'"+vendor+"')");
							
					    		if(rs.next())
								{
									poor1 = rs.getString("Poor");
									System.out.println("Hello poor 1 "+poor1);
									
									needImprove1 = rs.getString("need_to_improve");
									System.out.println("Hello needImprove 1 "+needImprove1);
									
									excellent1 = rs.getString("Excelent");
									System.out.println("Hello excellent 1 "+excellent1);
									
									veryGood1 = rs.getString("verygood");
									System.out.println("Hello veryGood 1 "+veryGood1);
									
									good1 = rs.getString("good");
									System.out.println("Hello good 1 "+good1);
									
									na1 = rs.getString("Na");
									System.out.println("Hello na1 1 "+na1);
									
								}
					    		rs.close();
					    		
								stmt=con.createStatement();
								String strProcedure_q5="{call get_Cand_Exprience_Report_q5(?,?,?,?,?)}"; //your procedure name
								cs=con.prepareCall(strProcedure_q5);
								cs.setString(1,strFrom);
								cs.setString(2,strTo);
								cs.setString(3,location);
								cs.setString(4,skillSet);
								cs.setString(5,vendor);
								rs=cs.executeQuery();
								System.out.println("call get_Cand_Exprience_Report_q5('"+strFrom+"','"+strTo+"',"+location+","+skillSet+",'"+vendor+"')");
					    		if(rs.next())
								{
									poor2 = rs.getString("Poor");
									System.out.println("Hello poor 2 "+poor2);
									
									needImprove2 = rs.getString("need_to_improve");
									System.out.println("Hello needImprove 2 "+needImprove2);
									
									excellent2 = rs.getString("Excelent");
									System.out.println("Hello excellent 2 "+excellent2);
									
									veryGood2 = rs.getString("verygood");
									System.out.println("Hello veryGood 2 "+veryGood2);
									
									good2 = rs.getString("good");
									System.out.println("Hello good 2 "+good2);
									
									na2 = rs.getString("Na");
									System.out.println("Hello na2 2 "+na2);
								}
					    		rs.close();
					    		
								stmt=con.createStatement();
								String strProcedure_q6="{call get_Cand_Exprience_Report_q6(?,?,?,?,?)}"; //your procedure name
								cs=con.prepareCall(strProcedure_q6);
								cs.setString(1,strFrom);
								cs.setString(2,strTo);
								cs.setString(3,location);
								cs.setString(4,skillSet);
								cs.setString(5,vendor);
								rs=cs.executeQuery();
								System.out.println("call get_Cand_Exprience_Report_q6('"+strFrom+"','"+strTo+"',"+location+","+skillSet+",'"+vendor+"')");
					    		if(rs.next())
								{
									poor3 = rs.getString("Poor");
									System.out.println("Hello poor 3 "+poor3);
									
									needImprove3 = rs.getString("need_to_improve");
									System.out.println("Hello needImprove 3 "+needImprove3);
									
									excellent3 = rs.getString("Excelent");
									System.out.println("Hello excellent 3 "+excellent3);
									
									veryGood3 = rs.getString("verygood");
									System.out.println("Hello veryGood 3 "+veryGood3);
									
									good3 = rs.getString("good");
									System.out.println("Hello good 3 "+good3);
									
									na3 = rs.getString("Na");
									System.out.println("Hello na1 3 "+na3);
									
								}
								rs.close();
								
								stmt=con.createStatement();
								String strProcedure_q9="{call get_Cand_Exprience_Report_q9(?,?,?,?,?)}"; //your procedure name
								cs=con.prepareCall(strProcedure_q9);
								cs.setString(1,strFrom);
								cs.setString(2,strTo);
								cs.setString(3,location);
								cs.setString(4,skillSet);
								cs.setString(5,vendor);
								rs=cs.executeQuery();
								System.out.println("call get_Cand_Exprience_Report_q9('"+strFrom+"','"+strTo+"',"+location+","+skillSet+",'"+vendor+"')");
					    		
					    		if(rs.next())
								{
									poor4 = rs.getString("Poor");
									System.out.println("Hello poor 4 "+poor4);
									
									needImprove4 = rs.getString("need_to_improve");
									System.out.println("Hello needImprove 4 "+needImprove4);
									
									excellent4 = rs.getString("Excelent");
									System.out.println("Hello excellent 4 "+excellent4);
									
									veryGood4 = rs.getString("verygood");
									System.out.println("Hello veryGood 4 "+veryGood4);
									
									good4 = rs.getString("good");
									System.out.println("Hello good 4 "+good4);
									
									na4 = rs.getString("Na");
									System.out.println("Hello na1 4 "+na4);
								}
								rs.close();
								stmt=con.createStatement();
								String strProcedure_q10="{call get_Cand_Exprience_Report_q10(?,?,?,?,?)}"; //your procedure name
								cs=con.prepareCall(strProcedure_q10);
								cs.setString(1,strFrom);
								cs.setString(2,strTo);
								cs.setString(3,location);
								cs.setString(4,skillSet);
								cs.setString(5,vendor);
								rs=cs.executeQuery();
								System.out.println("call get_Cand_Exprience_Report_q10('"+strFrom+"','"+strTo+"',"+location+","+skillSet+",'"+vendor+"')");
					    		if(rs.next())
								{
									poor5 = rs.getString("Poor");
									System.out.println("Hello poor 5 "+poor5);
									
									needImprove5 = rs.getString("need_to_improve");
									System.out.println("Hello needImprove 5 "+needImprove5);
									
									excellent5 = rs.getString("Excelent");
									System.out.println("Hello excellent 5 "+excellent5);
									
									veryGood5 = rs.getString("verygood");
									System.out.println("Hello veryGood 5 "+veryGood5);
									
									good5 = rs.getString("good");
									System.out.println("Hello good 5 "+good5);
									
									na5 = rs.getString("Na");
									System.out.println("Hello na1 5 "+na5);
									
								}

								rs.close();
								stmt=con.createStatement();
								String strProcedure_q11="{call get_Cand_Exprience_Report_q11(?,?,?,?,?)}"; //your procedure name
								cs=con.prepareCall(strProcedure_q11);
								cs.setString(1,strFrom);
								cs.setString(2,strTo);
								cs.setString(3,location);
								cs.setString(4,skillSet);
								cs.setString(5,vendor);
								rs=cs.executeQuery();
								System.out.println("call get_Cand_Exprience_Report_q11('"+strFrom+"','"+strTo+"',"+location+","+skillSet+",'"+vendor+"')");
					    		if(rs.next())
								{
									poor6 = rs.getString("Poor");
									System.out.println("Hello poor 6 "+poor6);
									
									needImprove6 = rs.getString("need_to_improve");
									System.out.println("Hello needImprove 6 "+needImprove6);
									
									excellent6 = rs.getString("Excelent");
									System.out.println("Hello excellent 6 "+excellent6);
									
									veryGood6 = rs.getString("verygood");
									System.out.println("Hello veryGood 6 "+veryGood6);
									
									good6 = rs.getString("good");
									System.out.println("Hello good 6 "+good6);
									
									na6 = rs.getString("Na");
									System.out.println("Hello na1 6 "+na6);
									
								}
					    		rs.close();

					    		
								stmt=con.createStatement();
								String strProcedure_mins="{call get_Cand_Exprience_Report_mins(?,?,?,?,?)}"; //your procedure name
								cs=con.prepareCall(strProcedure_mins);
								cs.setString(1,strFrom);
								cs.setString(2,strTo);
								cs.setString(3,location);
								cs.setString(4,skillSet);
								cs.setString(5,vendor);
								rs=cs.executeQuery();
								System.out.println("call get_Cand_Exprience_Report_mins('"+strFrom+"','"+strTo+"',"+location+","+skillSet+",'"+vendor+"')");
					    		if(rs.next())
					    		{
					    			 minutes_120 = rs.getString("minutes_120"); 
									 mins_60_120 = rs.getString("mins_60_120");  
									 mins_30_60 = rs.getString("mins_30_60");  
									 mins_10_30 = rs.getString("mins_10_30"); 
									 na_mins = rs.getString("NA");
					    		}
					    		rs.close();
					    		
					    		stmt=con.createStatement();
								String strProcedure_hours="{call get_Cand_Exprience_Report_Hours(?,?,?,?,?)}"; //your procedure name
								cs=con.prepareCall(strProcedure_hours);
								cs.setString(1,strFrom);
								cs.setString(2,strTo);
								cs.setString(3,location);
								cs.setString(4,skillSet);
								cs.setString(5,vendor);
								rs=cs.executeQuery();
								System.out.println("call get_Cand_Exprience_Report_Hours('"+strFrom+"','"+strTo+"',"+location+","+skillSet+",'"+vendor+"')");
					    		if(rs.next())
					    		{
					    			 Hours_8 = rs.getString("Hours_8"); 
									 Hours_6_8 = rs.getString("Hours_6_8"); 
									 Hours_4_6 = rs.getString("Hours_4_6");  
									 Hours_2_4 = rs.getString("Hours_2_4");  
									 Hours_2 = rs.getString("Hours_2");  
									 na_hours = rs.getString("NA");
								}
					    		rs.close();
							}
					    	catch(Exception e)
					    	{
					    		System.out.println("HEllooo");
					    		e.printStackTrace();
					    	}	
			            	%>
			            	<table cellpadding="6" cellspacing="6" rules="all" class="tblGRID" width="100%">
							<tr>
						    		<th>
						    			CANDIDATE EXPERIENCE : QUESTIONS <!-- 1 -->
						    		</th>						    		
						    		<th>
						    			Good   <!-- 2 -->
						    		</th>						    		
						    		<th>
						    			Very Good <!-- 3 -->
						    		</th>						    								    		
						    		<th>
						    			Excellent <!-- 4 -->
						    		</th>						    								    		
						    		<th>
						    		    Needs Improvement   <!-- 5 -->
						    		</th>						    		
						    		<th>
						    		    Poor  <!-- 6 -->
						    		</th>
						    		<th>
						    		    NA  <!-- 7 -->
						    		</th>
					    	</tr>
					    	<tr>
						    		<td style="background-color:#D8D8D8; width: 300px;">
						    		 	How would you rate the Look and Feel of the Office Campus? <!-- 1 -->
						    		</td>
						    		
						    		<td align="center"><!-- Good 2 -->
						    			<%=good1%> 
						    		</td>
						    		
						    		<td align="center"><!-- Very Good 3 -->
						    			<%=veryGood1 %>
						    		</td>
						    								    		
						    		<td align="center"><!-- Excellent 4 -->
						    			<%=excellent1 %>
						    		</td>
						    								    		
						    		<td align="center"><!-- Needs Improvement 5 -->
						    		    <%=needImprove1 %> 
						    		</td>
						    		
						    		<td align="center"><!-- Poor 6 -->
						    			<%=poor1 %>  
						    		</td>
						    		
						    		<td align="center"><!-- NA 7 -->
						    			<%=na1 %>  
						    		</td>
						    		
					    	</tr>
					    	<tr>
						    		<td style="background-color:#D8D8D8; width: 300px;">
						    			How was the approach of the consultant towards you in general?   <!-- 1 -->
						    		</td>
						    		
						    		<td align="center"><!-- Good 2 -->
						    			<%=good2%> 
						    		</td>
						    		
						    		<td align="center"><!-- Very Good 3 -->
						    			<%=veryGood2 %>
						    		</td>
						    								    		
						    		<td align="center"><!-- Excellent 4 -->
						    			<%=excellent2 %>
						    		</td>
						    								    		
						    		<td align="center"><!-- Needs Improvement 5 -->
						    		    <%=needImprove2 %> 
						    		</td>
						    		
						    		<td align="center"><!-- Poor 6 -->
						    			<%=poor2 %>  
						    		</td>
						    		
						    		<td align="center"><!-- NA 7 -->
						    			<%=na2%>
						    		</td>
					    	</tr>					            	
					    	<tr>
						    		<td style="background-color:#D8D8D8; width: 300px;">
						    			Was the Recruiter Polite and Friendly at all times?  <!-- 1 -->
						    		</td>
						    		<td align="center"><!-- Good 2 -->
						    			<%=good3%> 
						    		</td>
						    		
						    		<td align="center"><!-- Very Good 3 -->
						    			<%=veryGood3 %>
						    		</td>
						    								    		
						    		<td align="center"><!-- Excellent 4 -->
						    			<%=excellent3%>
						    		</td>
						    								    		
						    		<td align="center"><!-- Needs Improvement 5 -->
						    		    <%=needImprove3%> 
						    		</td>
						    		
						    		<td align="center"><!-- Poor 6 -->
						    			<%=poor3%>  
						    		</td>
						    		
						    		<td align="center"><!-- NA 7 -->
						    			<%=na3 %> 
						    		</td>
					    	</tr>
							<tr>
						    		<td style="background-color:#D8D8D8; width: 300px;">
						    			How  would  you rate your interview process with Voice & Accent Expert? <!-- 1 -->
						    		</td>
						    		<td align="center"><!-- Good 2 -->
						    			<%=good4%> 
						    		</td>
						    		
						    		<td align="center"><!-- Very Good 3 -->
						    			<%=veryGood4%>
						    		</td>
						    								    		
						    		<td align="center"><!-- Excellent 4 -->
						    			<%=excellent4%>
						    		</td>
						    								    		
						    		<td align="center"><!-- Needs Improvement 5 -->
						    		    <%=needImprove4%> 
						    		</td>
						    		
						    		<td align="center"><!-- Poor 6 -->
						    			<%=poor4%>  
						    		</td>
						    		
						    		<td align="center"><!-- NA 7 -->
						    			<%=na4 %> 
						    		</td>
					    	</tr>	
							<tr>
						    		<td style="background-color:#D8D8D8; width: 300px;">
						    			 How  would  you rate your interview process with Recruitment?<!-- 1 -->
						    		</td>
						    		<td align="center"><!-- Good 2 -->
						    			<%=good5%> 
						    		</td>
						    		
						    		<td align="center"><!-- Very Good 3 -->
						    			<%=veryGood5 %>
						    		</td>
						    								    		
						    		<td align="center"><!-- Excellent 4 -->
						    			<%=excellent5 %>
						    		</td>
						    								    		
						    		<td align="center"><!-- Needs Improvement 5 -->
						    		    <%=needImprove5 %> 
						    		</td>
						    		
						    		<td align="center"><!-- Poor 6 -->
						    			<%=poor5 %>  
						    		</td>
						    		
						    		<td align="center"><!-- NA 7 -->
						    			<%=na5 %> 
						    		</td>
					    	</tr>					    				            	
					    	<tr>
						    		<td style="background-color:#D8D8D8; width: 300px;">
						    			How  would  you rate your interview process with Operations <!-- 1 -->
						    		</td>
						    		
						    		<td align="center"><!-- Good 2 -->
						    			<%=good6%> 
						    		</td>
						    		
						    		<td align="center"><!-- Very Good 3 -->
						    			<%=veryGood6%>
						    		</td>
						    								    		
						    		<td align="center"><!-- Excellent 4 -->
						    			<%=excellent6%>
						    		</td>
						    								    		
						    		<td align="center"><!-- Needs Improvement 5 -->
						    		    <%=needImprove6%> 
						    		</td>
						    		
						    		<td align="center"><!-- Poor 6 -->
						    			<%=poor6%>  
						    		</td>
						    		
						    		<td align="center"><!-- NA 7 -->
						    			<%=na6 %> 
						    		</td>
					    	</tr>					            	
					    </table>
<!-- *********************************************************************************** -->
			            	<table cellpadding="5" cellspacing="0" rules="all" class="tblGRID" width="100%">
							<tr>
						    		<td style="background-color:#D8D8D8; width: 300px;" rowspan="2">
						    			How long did you wait for your 1st round with 247 recruiter <!-- 1 -->
						    		</td>
						    		
						    		<th>
						    			10-30 mins  <!-- 2 -->
						    		</th>
						    		
						    		<th>
						    			30-60 Mins  <!-- 3 -->
						    		</th>
						    								    		
						    		<th>
						    			60-120 mins  <!-- 4 -->
						    		</th>
						    								    		
						    		<th>
						    		    120 Minutes & above <!-- 5 -->
						    		</th>
						    		
						    		<th>
						    			NA  <!-- 6 -->
						    		</th>
					    	</tr>
					    	<tr>						    		
						    		<td align="center"><!-- 1 -->
						    			  <%=mins_10_30 %>
						    		</td>
						    		
						    		<td align="center"><!-- 2 -->
						    			<%=mins_30_60 %>
						    		</td>
						    								    		
						    		<td align="center"><!-- 3 -->
						    			 <%=mins_60_120 %>
						    		</td>
						    								    		
						    		<td align="center"><!-- 4 -->
						    		     <%=minutes_120 %>
						    		</td>
						    		<td align="center">
						    			<%=na_mins%> <!-- 5 -->
						    		</td>
					    	</tr>					            	
					    </table>
<!-- *********************************************************************************** -->
			            	<table cellpadding="5" cellspacing="0" rules="all" class="tblGRID" width="100%">
							<tr>
						    		<td style="background-color:#D8D8D8; width: 300px;" rowspan="2">
						    			What was the total time taken for the entire interview process <!-- 1 -->
						    		</td>
						    		
						    		<th>
						    			2 Hours <!-- 1 -->
						    		</th>
						    		
						    		<th>
						    			2-4 Hours  <!-- 2 -->
						    		</th>
						    								    		
						    		<th>
						    			4-6 Hours <!-- 3 -->
						    		</th>
						    								    		
						    		<th>
						    		   6-8 Hours <!-- 4 -->
						    		</th>
						    		
						    		<th>
						    			8+ Hours <!-- 5 -->
						    		</th>
						    		
						    		<th>
						    			NA <!-- 6 -->
						    		</th>
					    	</tr>
					    	<tr>						    		
						    		<td align="center">
						    			<%=Hours_2 %> <!-- 1 -->
						    		</td>
						    		
						    		<td align="center">
						    			<%=Hours_2_4 %>  <!-- 2 -->
						    		</td>
						    								    		
						    		<td align="center">
						    			<%=Hours_4_6 %> <!-- 3 -->
						    		</td>
						    								    		
						    		<td align="center">
						    		   <%=Hours_6_8%> <!-- 4 -->
						    		</td>
						    		
						    		<td align="center">
						    			<%=Hours_8 %> <!-- 5 -->
						    		</td>
						    		
						    		<td align="center">
						    			<%=na_hours%> <!-- 6 -->
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
	 var skill = document.getElementById("skill_setVal").value;
	 var vendorz = document.getElementById("vendor_setVal").value;
	 if(hidVal == '0')
	 {
		 dailyFrmName.location.selectedIndex = 0;
	 }
	 else
	 {
		 dailyFrmName.location.selectedIndex = hidVal;	
	 }
	 if(skill == '0')
	 {
		 dailyFrmName.skillSet.selectedIndex = 0;
	 }
	 else
	 {
		 dailyFrmName.skillSet.selectedIndex = skill;
	 }
	 if(vendorz == '0')
	 {
		 dailyFrmName.vendor.selectedIndex = 0;
	 }
	 else if(vendorz == 'Yes')
	 {
		 dailyFrmName.vendor.selectedIndex = 1;
	 }
	 else
	 {
		 dailyFrmName.vendor.selectedIndex = 2; 
	 }	
 }
 </script> 	
  </body>
</html>