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
String FromDAte=request.getParameter("ReoprtNONVOICEfrom");
String ToDAte=request.getParameter("ReoprtNONEVOICEto");
if(FromDAte==null || FromDAte.equalsIgnoreCase(""))
{
	FromDAte=df.format(new Date());
	ToDAte=FromDAte;
}
String[] forFROMSplit=null;
String[] forToSplit=null;
String strFrom=null;
String strTo=null;
try
{
	forFROMSplit=FromDAte.split("-");
	strFrom=forFROMSplit[2]+"-"+forFROMSplit[1]+"-"+forFROMSplit[0];
	//    System.out.println("strFrom \t"+strFrom);	
	request.setAttribute("F",FromDAte);
}
catch(Exception e)
{
	//    System.out.println(e.getMessage());
	e.printStackTrace();
}
try
{
	forToSplit=ToDAte.split("-");
	strTo=forToSplit[2]+"-"+forToSplit[1]+"-"+forToSplit[0];
	//    System.out.println("strTo \t"+strTo);
	request.setAttribute("T",ToDAte);
}
catch(Exception e)
{
	//    System.out.println(e.getMessage());
	e.printStackTrace();
}

String location = request.getParameter("location");
if(location == null)
{
	location = "3";	
}
System.out.println(">>>location " + location);
Connection connection=ConnectDatabase.getConnection();
ResultSet rs, rsDOI, rsSource1,rsSource2, rsProg, rsPersDetails, rsTypeTotal, rsTypeScore, rsPrecScore, rsMockScore, rsLanguage, rsRecruiterNameDisp, rsRecruiterNameDispmOCK, rsSourceFrom;
Statement stmt=connection.createStatement();
String query;
// String EDKey="[24]7";
// String EDKPass="247Cust0m3r"; 
try
{
// String strProcedure="{call GetNONVoice_DWSReport('" + strFrom + "','" + strTo + "','"+EDKey+"','"+EDKPass+"')}"; //your procedure name
// //    System.out.println("strProcedure:::::::;GetNONVoice_DWSReport::::"+strProcedure);
// CallableStatement cs=connection.prepareCall(strProcedure);
CallableStatement cs=connection.prepareCall("call GetNONVoice_DWSReport(?,?,?,?,?)");
cs.setString(1,strFrom);
cs.setString(2,strTo);
cs.setString(3,location);
cs.setString(4,EDKey);
cs.setString(5,EDKPass);
rs=cs.executeQuery();
%>


<html>
  <head>
    <title>[24]7 NON Voice DWS Report</title>
    
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
		$("#ReoprtNONVOICEfrom").datepicker({
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
		$("#ReoprtNONEVOICEto").datepicker({
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
  
  <body onload="return nonVoice();">
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
	            <font class="nonLink">NON Voice DWS Report</font>
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
			            	<form action="" method="post" id="nonvoiceFrm">
			            	<table>
			            		<tr>
			            		<td> From:<input type="text" name="ReoprtNONVOICEfrom" id="ReoprtNONVOICEfrom" value="${F}"/></td>
			            		<td>To:<input type="text" name="ReoprtNONEVOICEto" id="ReoprtNONEVOICEto" value="${T}"/></td>
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
			            		<input type="submit" name="searchCand" class="buttonSmall" value="Go"/></td>
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
						    			Non Voice
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
						    			Online Typing Test Score
						    		</th>
						    		<th>
						    			Online Typing Status (Select / Reject)
						    		</th>
						    		<!--  ************************** Start  reading & English ****************************** -->
						    		<th>
						    			Reading Comprehension Test Scores <!-- 10 -->
						    		</th>
						    		
						    		<th>
						    			Reading Comprehension Test (Select/Reject) <!-- 11 -->
						    		</th>
						    		<th>
						    			 English Grammar Test Scores <!-- 12 -->
						    		</th>	
						    		<th>
						    			  English Grammar Test Scores (Select/Reject) <!-- 13 -->
						    		</th>							    		
						    		<!--  ************************** End  reading & English ****************************** -->
						    		<th>
						    			L & D Name (Precis  writing)
						    		</th>
						    		<th>
						    			Clarity
						    		</th>
						    		<th>
						    			Punctuation
						    		</th>
						    		<th>
						    			Sentence Construction
						    		</th>
						    		<th>
						    			Spelling
						    		</th>
						    		<th>
						    			L & D Round (Precis Writing Score)
						    		</th>
						    		<th>
						    			Precis Writing Select or Reject
						    		</th>
						    		<th>
						    			L & D Name (Mock Chat) 
						    		</th>
						    		<th>
						    			L & D Round (Mock Chat Writing Score)
						    		</th>
						    		<th>
						    			Chat Etiquette
						    		</th>
						    		<th>
						    			Customer Service
						    		</th>
						    		<th>
						    			Language
						    		</th>
						    		<th>
						    			Mock Chat Writing Select or Reject
						    		</th>
						    		
						    		<th>L & D Name (English Language)</th> <!-- Language Test Name -->
						    		<th>Part A</th> <!-- Language Test Part A -->
						    		<th>Part B</th> <!-- Language Test Part B-->
						    		<th>Part C</th> <!-- Language Test Part C-->
						    		<th>English Language Select or Reject</th> <!-- Language Test Status-->
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
<!-- 						    		<th> -->
<!-- 						    			Stability Questions Scores -->
<!-- 						    		</th> -->
						    		<th>
						    			Risk Status
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
						    			//    System.out.println("Auto Id \t"+autoId);
						    			String SourceId=rs.getString("Primary_Source");
						    			//    System.out.println("------------ Displaying the data for Primary_Source ------- \t"+SourceId);
						    			//    System.out.println("SourceId \t"+SourceId);
						    			String ProgID=rs.getString("Program_Id");
						    			//    System.out.println("Program_Id \t"+ProgID);
						    			String canName=rs.getString("First_Name")+ " " +rs.getString("Middle_Name")+ " " +rs.getString("Last_Sir_Name");
						    			//    System.out.println("canName \t"+canName);
										String  DOR, primary_source, second_source,primary_Source_Info, recNames, progName, DOB, sourceName, RAG,SourceDate, recruiter_id;
										
										Date dateStr2 = rs.getDate("Cand_DOB");
										//    System.out.println("dateStr2 \t"+dateStr2);
						  				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yy");
						    			DOB = formatter.format(dateStr2);
						    			
						    			Date today = new Date();
						    		    long diff = today.getTime() - dateStr2.getTime();
										long days=(diff/(1000*60*60*24));
						    			int days2=Math.round((days/365));
										
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

										query="select Program_name from  program_names_master where Program_id='" + ProgID + "'"; 
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
										//    System.out.println("query \t"+query);
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
						    			 
						    		
										
										
										String precLDName,precClarity,precPunct,precSentCons,precSpelling, precStatus, precidScore;
										query="select * from candidate_precis_writing_score where Cand_Id='" + autoId + "'"; 
										//    System.out.println("query \t"+query);
										rsPrecScore=stmt.executeQuery(query);
										if(rsPrecScore.next())
										{
											precLDName=rsPrecScore.getString("Recruiter_Id");
											precClarity=rsPrecScore.getString("Precis_PPA1");
											precPunct=rsPrecScore.getString("Precis_PPA2");
											precSentCons=rsPrecScore.getString("Precis_PPA4");
											precSpelling=rsPrecScore.getString("Precis_PPA3");
											precStatus=rsPrecScore.getString("Statusi");
											precidScore=rsPrecScore.getString("Total_score");
											//    System.out.println(">>>>>>>VEnu>>>>>>>>"+precidScore);
										}
										else
										{
											precLDName="";
											precClarity="";
											precPunct="";
											precSentCons="";
											precSpelling="";
											precStatus="";
											precidScore="";
										}
										
										String mockLDName,mockScore, mockStatus;
										double mockChatEtiq,mockCustServ,mockLang;
										query="select * from candidate_chat_score where Cand_Id='" + autoId + "'"; 
										//    System.out.println("query \t"+query);
										rsMockScore=stmt.executeQuery(query);
										if(rsMockScore.next())
										{
											mockLDName=rsMockScore.getString("Recruiter_ID");
											//    System.out.println("mockLDName \t"+mockLDName);
											mockScore=rsMockScore.getString("Total_score");
											mockChatEtiq=rsMockScore.getFloat("Chat_PPA1")+rsMockScore.getFloat("Chat_PPA2")+rsMockScore.getFloat("Chat_PPA3")+rsMockScore.getFloat("Chat_PPA4");
											//    System.out.println("mockChatEtiq \t"+mockChatEtiq);
											mockCustServ=rsMockScore.getFloat("Chat_PPB1")+rsMockScore.getFloat("Chat_PPB2")+rsMockScore.getFloat("Chat_PPB3")+rsMockScore.getFloat("Chat_PPB4");
											mockLang=rsMockScore.getFloat("Chat_PPC1_Score")+rsMockScore.getFloat("Chat_PPC2_Score");
											mockStatus=rsMockScore.getString("Statusi");
											//    System.out.println("mockStatus \t"+mockStatus);
										}
										else
										{
											mockLDName="";
											mockScore="";
											mockChatEtiq=0.0;
											mockCustServ=0.0;
											mockLang=0.0;
											mockStatus="";
										}
										// rsRecruiterNameDisp
										String MOCKLDRecruitName;
										query="SELECT Emp_Name FROM user_master WHERE emp_id= '" + mockLDName + "'"; 
										//    System.out.println("query Language ddddddddd \t"+query);
										rsRecruiterNameDisp=stmt.executeQuery(query);
										if(rsRecruiterNameDisp.next())
										{
											MOCKLDRecruitName = rsRecruiterNameDisp.getString("Emp_Name");
										}
										else
										{
											MOCKLDRecruitName = "";
										}
										
							// *********************** Start With language**********************//
										// Lang_Auto_Id, Cand_Id, Recruiter_Id, Program_Id, 
										//PartA_RS1, PartA_RS2, PartA_RS3, PartA_RS4, PartA_RS5,
										// PartA_RS6, PartA_RS7, PartA_RS8, PartA_RS9, PartA_RS10,
										// PartA_RS_Total, PartB_Score, PartB_Comments, PartC_Score, 
										//PartC_Comments, Comments, Statusi, Total_score, Last_scored_Date										
										String languageLDName,languageStatus;
										double languagePartA,languagePartB,languagePartC;
										query="select * from candidate_language_testscore where Cand_Id=" + autoId + ""; 
										//    System.out.println("query Language \t"+query);
										rsLanguage=stmt.executeQuery(query);
										if(rsLanguage.next())
										{
											languageLDName = rsLanguage.getString("Recruiter_Id");
											languagePartA = Double.parseDouble(rsLanguage.getString("PartA_RS_Total"));
											languagePartB = Double.parseDouble(rsLanguage.getString("PartB_Score"));
											languagePartC = Double.parseDouble(rsLanguage.getString("PartC_Score"));
											languageStatus = rsLanguage.getString("Statusi");											
										}
										else
										{
											languageLDName = "";
											languagePartA = 0.0;
											languagePartB = 0.0;
											languagePartC = 0.0;
											languageStatus = "";
										}
										
										// rsRecruiterNameDisp
										String languageLDRecruitName;
										query="SELECT Emp_Name FROM user_master WHERE emp_id= '" + languageLDName + "'"; 
										//    System.out.println("query Language ddddddddd \t"+query);
										rsRecruiterNameDisp=stmt.executeQuery(query);
										if(rsRecruiterNameDisp.next())
										{
											languageLDRecruitName = rsRecruiterNameDisp.getString("Emp_Name");
										}
										else
										{
											languageLDRecruitName = "";
										}
							// *********************** End With language**********************//
										
										
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
						    			 
						    			 RAG="";
						    			 if(rs.getString("RAG")!=null)
						    			 {
						    			 	RAG=(String)rs.getString("RAG");
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
						    			<%=recNames%>
						    		</td>
						    		<td>
						    			Non Voice
						    		</td>
						    		<td>
						    			<%=progName%>
						    		</td>
						    		<td>
						    			<%=canName%>
						    		</td>
						    		<td>
						    		<%//    System.out.println("Gender:::"+rs.getString("Gender")); %>
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
						    			<%//    System.out.println("Phone:::"+rs.getString("Phone")); %>
						    			<%=rs.getString("Phone")%>
						    		</td>
						    		<td>
						    			<%//    System.out.println("privious_ORG:::"+rs.getString("privious_ORG")); %>
						    			<%=rs.getString("privious_ORG")%>
						    		</td>
						    		<td>
						    			<%
						    				if(rs.getString("RelevantExprience")==null || rs.getString("RelevantExprience").equalsIgnoreCase(""))
						    				{
						    					if(rs.getString("NONRelevantExprience")==null || rs.getString("NONRelevantExprience").equalsIgnoreCase(""))
							    				{
							    					workExp="";
							    					//    System.out.println("workExp:>><<::"+workExp);
							    				}
							    				else
							    				{
							    					workExp=rs.getString("NONRelevantExprience");
							    					//    System.out.println("workExp:>><<::"+workExp);
							    				}
						    				}
						    				else
						    				{
						    					if(rs.getString("NONRelevantExprience")==null || rs.getString("NONRelevantExprience").equalsIgnoreCase(""))
							    				{
							    					workExp=rs.getString("RelevantExprience");
							    					//    System.out.println("workExp:::>>::"+workExp);
							    				}
							    				else
							    				{
							    					workExp=rs.getString("RelevantExprience")+"+" +rs.getString("NONRelevantExprience");
							    				//    System.out.println("workExp::??:::"+workExp);
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
						    			<%=primary_Source_Info%> <!-- primary_Source_Info --> 
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
						    		
						    	<%
						    							    		
					    			//    System.out.println("Typing Calculation of Scores starts:::::"); 
					    			double	typingTestScore = rs.getDouble("TypingScore");
					    			//    System.out.println("typingTestScore"+typingTestScore);
					    			String typingStatusfrmTable = rs.getString("TypingStatus");
					    			//    System.out.println("typingStatusfrmTable:::::"+typingStatusfrmTable); 
					    			if(typingStatusfrmTable.length()== 0 || typingStatusfrmTable.equals(""))
					    			{
						    			double ACCURACY=0.0;
			        					double SPEED=0.0; 
			    	    				double typingTestScoredATA=0.0;
			    	    				String typingStatus="";
										query="select * from bpo_user_typing_test_attempt where USER_ID='" + autoId + "'";
										//    System.out.println("query:::::bpo_user_typing_test_attempt"+query); 
										rsTypeTotal=stmt.executeQuery(query);
										if(rsTypeTotal.next())
										{
												ACCURACY=rsTypeTotal.getDouble("ACCURACY");
												SPEED=rsTypeTotal.getDouble("SPEED");												
			    	    						typingTestScoredATA= Math.round((SPEED * ACCURACY)/100);			    	    						
					    	    				if(typingTestScoredATA>20)
					    	    				{
					    	    					typingStatus="Pass";
					    	    				}
					    	    				else
					    	    				{
					    	    					typingStatus="Fail";
					    	    				}											
										}
										else
										{
										}										
										%>
										<td><%=typingTestScoredATA %></td>
										<td><%=typingStatus%></td>
										<%
										
									}
									else									
									{
									%>
										<td><%=typingTestScore %></td>
										<td><%=typingStatusfrmTable%></td>
									<%	
									}	
						    	
						    	 %>
						    	 <!-- ******** Start REading  Status And English Score -->
						    		<!-- 10  Reading Comprehension Test Scores -->
						    		
						    		<%
						    		//    System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
						    		//    System.out.println("------------------------ START READING SCORE AND STATUS  -------------------------------");
						    		//    System.out.println("------------------------ "+ DOR +" -------------------------------");
					    			
					    			String getFrmReadTestTableSc = rs.getString("ReadingScore");
					    			//    System.out.println("--READ-- "+ getFrmReadTestTableSc +" ----"+getFrmReadTestTableSc.length());
					    			String getFrmReadTestTableSt = rs.getString("ReadingStatus");
					    			//    System.out.println("--READ-- "+ getFrmReadTestTableSt +" ----"+getFrmReadTestTableSt.length());
					    		
					    			Connection conVA = null;
								    Statement stmt_Y=null;
								    String getID_of_RCMID=null;
								    double total_ans_get=0.0;
								    double no_Of_Question=0.0;
						    		double can_marks=0.0;
						    			
						    		
						    		String result_status="";
						    		if(getFrmReadTestTableSc.equals("") || getFrmReadTestTableSc.length()== 0)
						    		{	
						    		    String quryForGet_Y ="SELECT  DISTINCT(READING_COMP_MASTER_ID) as IDs_Master, COUNT(STATUS) as answer  FROM bpo_user_reading_comp_test WHERE  STATUS='Y'AND  User_ID="+rs.getString("autoID");
								        //    System.out.println("Display no of currect answer and distinct(READING_COMP_MASTER_ID)\t"+quryForGet_Y);
								        try
								        {	
								        	conVA = ConnectDatabase.getConnection();
								        	stmt_Y=conVA.createStatement();
								          	ResultSet rsGet_Y = stmt_Y.executeQuery(quryForGet_Y);													
											if (rsGet_Y.next()) 
											{
												getID_of_RCMID=rsGet_Y.getString("IDs_Master");
												//    System.out.println("getID_of_RCMID\t"+getID_of_RCMID);
												total_ans_get=Double.parseDouble(rsGet_Y.getString("answer"));
												//    System.out.println("total_ans_get\t"+total_ans_get);
												//    System.out.println("getID_of_RCMID\t"+getID_of_RCMID+"  total_ans_get\t"+total_ans_get);
												
												String quryforRCQM ="SELECT count(*) as QCount FROM bpo_reading_comp_question_master  where READING_COMP_MASTER_ID= ifnull("+getID_of_RCMID + ",1)";
												//    System.out.println("Display the reading com qs master ids \t"+quryforRCQM);
												stmt_Y=conVA.createStatement();
												ResultSet rs_IDS = stmt_Y.executeQuery(quryforRCQM);
												if (rs_IDS.next()) 
												{
													no_Of_Question=Double.parseDouble(rs_IDS.getString("QCount"));
													//    System.out.println("Dispaly Tatal no of question \t"+no_Of_Question);
												}
												rs_IDS.close();
											
												String quryFor_GET_total_Maxscore="SELECT Pass_percentage FROM maximum_read_assement_no WHERE Maximum_read_assement_ID=1";
												stmt_Y=conVA.createStatement();
												ResultSet rs_maxScore=stmt_Y.executeQuery(quryFor_GET_total_Maxscore);
												double get_PassPERCENT=0.0;
												if(rs_maxScore.next())
												{
													get_PassPERCENT=Double.parseDouble(rs_maxScore.getString("Pass_percentage"));
													//    System.out.println("Display The Percentage given by the ADMINISTRATOR\t"+get_PassPERCENT);
												}
												rs_maxScore.close();
												can_marks =(total_ans_get/no_Of_Question)*100;									
												//    System.out.println("Display the value of the Each Question of marks : \t"+can_marks);									
																	
												if(can_marks<get_PassPERCENT)
												{
													result_status="Fail";
												}
												else
												{
													result_status="Pass";
												}	
											}
											rsGet_Y.close();											
										}
										catch(Exception e)
										{
											e.getStackTrace();
											//    System.out.println(e.getCause());
											//    System.out.println(e.getMessage());				
										}
									    %>
									    <td><%=can_marks%></td>
									    <td><%=result_status%></td>
									    <%	
									   }
									   else
									   {
						    		   %>							    				
						    			<td><%=getFrmReadTestTableSc %></td>
						    			<td><%=getFrmReadTestTableSt %></td>
						    		   <%
						    		   }
						    		 	//    System.out.println("------------------------ END READING SCORE AND STATUS  -------------------------------");
						    		%>
						    				<!-- 12 English Grammar Test Scores-->	    	
						    	
						    		<%
						    		//    System.out.println("------------------------ START ENGLISH SCORE AND STATUS  -------------------------------");
						    		//    System.out.println("------------------------ "+ DOR +" -------------------------------");
					    			
					    			String getFrmReadTestTableEsc = rs.getString("EnglishScore");
					    			//    System.out.println("--ENG-- "+ getFrmReadTestTableEsc +" ----"+getFrmReadTestTableEsc.length());
					    			String getFrmReadTestTableEst = rs.getString("EnglishStatus");
					    			//    System.out.println("--ENG-- "+ getFrmReadTestTableEst +" ----"+getFrmReadTestTableEst.length());
					    			
					    			String result_statusENG="";
						    		if(getFrmReadTestTableEsc.equals("") || getFrmReadTestTableEsc.length() == 0)
						    		{							    			
						    			String getID_of_RCMIDeng=null;
						    			double total_ans_geteng=0.0;
						    			double get_passPERCENTeng=0.0;
						    			double can_marksENG=0.0;
						    			
						    			double no_Of_QuestionENG=0.0;
								        String quryForGet_YENG ="SELECT DISTINCT(READING_COMP_MASTER_ID) as IDs_Master, COUNT(STATUS) as answer FROM bpo_user_eng_comp_test WHERE STATUS='Y' AND User_ID="+rs.getString("autoID");
								        //    System.out.println("Display no of currect answer and quryForGet_Y ENG \t"+quryForGet_YENG);
								        
								        try
								        {	
								        	conVA = ConnectDatabase.getConnection();
								        	stmt_Y=conVA.createStatement();
								          	ResultSet rsGet_Yeng = stmt_Y.executeQuery(quryForGet_YENG);													
											if (rsGet_Yeng.next()) 
											{
												getID_of_RCMIDeng=rsGet_Yeng.getString("IDs_Master");
												total_ans_geteng=Double.parseDouble(rsGet_Yeng.getString("answer"));
												//    System.out.println("getID_of_RCMIDeng \t"+getID_of_RCMIDeng);
												//    System.out.println("total_ans_geteng \t"+total_ans_geteng);
												
												String quryforRCQM ="SELECT COUNT(*) as QCount FROM bpo_eng_comp_question_master  WHERE READING_COMP_MASTER_ID= ifnull("+getID_of_RCMIDeng + ",1)";
												//    System.out.println("Display the reading com qs master ids \t"+quryforRCQM);
												stmt_Y=conVA.createStatement();;
												ResultSet rs_IDS = stmt_Y.executeQuery(quryforRCQM);
												if (rs_IDS.next()) 
												{
													no_Of_QuestionENG=Double.parseDouble(rs_IDS.getString("QCount"));
													//    System.out.println("Dispaly Tatal no of question \t"+no_Of_QuestionENG);
												}
												rs_IDS.close();									
												String quryFor_GET_total_Maxscore="SELECT pass_percentage FROM maximum_english_grammar";
												stmt_Y=conVA.createStatement();
												ResultSet rs_maxScoreeng=stmt_Y.executeQuery(quryFor_GET_total_Maxscore);
												
												if(rs_maxScoreeng.next())
												{
													get_passPERCENTeng=Double.parseDouble(rs_maxScoreeng.getString("pass_percentage"));
													//    System.out.println("Dispaly pass percentage  ENG \t"+get_passPERCENTeng);
												}
												rs_maxScoreeng.close();
												can_marksENG =(total_ans_geteng/no_Of_QuestionENG)*100;									
												//    System.out.println("Display the value of the Each Question of marks : \t"+can_marksENG);
												if(can_marksENG<get_passPERCENTeng)
												{
													result_statusENG="Fail";
												}
												else
												{
													result_statusENG="Pass";
												}									
											}
											rsGet_Yeng.close();											
										}
										catch(Exception e)
										{
											e.getStackTrace();
											//    System.out.println(e.getCause());
											//    System.out.println(e.getMessage());				
										}	
									
							    	 	
							    		%>
							    		  <td><%=can_marksENG%></td>
									    <td><%=result_statusENG%></td>
									  
							    		<%
							    		
							    		}
							    		else
							    		{
							    		%>	
						    			<td> <%=getFrmReadTestTableEsc %></td>
						    			<td> <%=getFrmReadTestTableEst %></td>
						    			<%
					    				}
											//    System.out.println("------------------------ END ENGLISH SCORE AND STATUS  -------------------------------");
											//    System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");					    								    	
						    			%>						    								    	
						    			<!-- ******** End REading  Status And English Score -->
						    		<td>
						    			<%
						    			String prcopsName;
						    			
										query="SELECT Emp_Name FROM user_master WHERE emp_id= '" +precLDName+ "'"; 
										System.out.println("  >>>>>>>>    "+query);
										ResultSet rsprcName=stmt.executeQuery(query);
										if(rsprcName.next())
										{
											prcopsName = rsprcName.getString("Emp_Name");
										}
										else
										{
											prcopsName = "";
										}
						    			%>
						    			<%=prcopsName%>
						    			
						    		</td>
						    		<td>
						    			<%=precClarity%>
						    		</td>
						    		<td>
						    			<%=precPunct%>
						    		</td>
						    		<td>
						    			<%=precSentCons%>
						    		</td>
						    		<td>
						    			<%=precSpelling%>
						    		</td>
						    		<td>
						    			<%=precidScore %>
						    		</td>
						    		<td>
						    			<%
						    				if(precStatus=="")
						    				{
						    				}
						    				else
						    				{%>
						    					<%
						    				if(precStatus.equalsIgnoreCase("1"))
						    				{
						    					%>
						    						Select
						    					<%
						    				}
						    				else if(precStatus.equalsIgnoreCase("2"))
						    				{
						    					%>
						    						Hold
						    					<%
						    				}
						    				else if(precStatus.equalsIgnoreCase("3"))
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
						    			<%=MOCKLDRecruitName%>
						    		</td>
						    		<td>
						    			<%=mockScore%>
						    		</td>
						    		<td>
						    			<%=mockChatEtiq%>
						    		</td>
						    		<td>
						    			<%=mockCustServ%>
						    		</td>
						    		<td>
						    			<%=mockLang%>
						    		</td>
						    		
						    		<td>
						    			<%
						    				if(mockStatus=="")
						    				{
						    				}
						    				else
						    				{%>
						    					<%
						    				if(mockStatus.equalsIgnoreCase("1"))
						    				{
						    					%>
						    						Select
						    					<%
						    				}
						    				else if(mockStatus.equalsIgnoreCase("2"))
						    				{
						    					%>
						    						Hold
						    					<%
						    				}
						    				else if(mockStatus.equalsIgnoreCase("3"))
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
						    		
						    		
						    		
						    		<td><%=languageLDRecruitName %></td> <!--  L & D Name Language Test Name -->
						    		<td><%=languagePartA %></td> <!-- Language Test Part A -->
						    		<td><%=languagePartB %></td> <!-- Language Test Part B-->
						    		<td><%=languagePartC %></td> <!-- Language Test Part C-->
						    		<td>
						    		<%if(languageStatus.equalsIgnoreCase("0")) {%>
						    			
						    		<%}if(languageStatus.equalsIgnoreCase("1")) {%>
						    		Select
						    		<%}if(languageStatus.equalsIgnoreCase("2")) {%>
						    		Hold
						    		<%}if(languageStatus.equalsIgnoreCase("3")) {%>
						    		Reject
						    		<%} %>
						    		</td> <!-- Language Test Status-->
						    		
						    		
						    		
						    		<td>
						    			<%
						    			String opsName;
						    			String ops =  rs.getString("User_Id");
						    			ops  = "0"+ops;
						    			System.out.println("  >>>> ops >>>>    "+ops);
										query="SELECT Emp_Name FROM user_master WHERE emp_id= '" +ops+ "'"; 
										System.out.println("  >>>>>>>>    "+query);
										ResultSet rsOpsName=stmt.executeQuery(query);
										if(rsOpsName.next())
										{
											opsName = rsOpsName.getString("Emp_Name");
										}
										else
										{
											opsName = "";
										}
						    			%>
						    			<%=opsName%>
						    			
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
<!-- 						    		<td> -->
<%-- 						    			<%=rs.getInt("Total_score")%> --%>
<!-- 						    		</td> -->
						    		<%
						    			if(RAG.equalsIgnoreCase("1"))
						    			{
						    				RAG="high";
						    			}
						    			else if(RAG.equalsIgnoreCase("2"))
						    			{
						    				RAG="medium";
						    			}
						    			else if(RAG.equalsIgnoreCase("3"))
						    			{
						    				RAG="low";
						    			}
						    		 %>
						    		<td>	
						    			<%=RAG%>					    		
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
						    		}
						    		catch(Exception exs)
						    		{
						    		exs.printStackTrace();
						    		}
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
			<td align="right" valign="middle" style="background-color:#808080; height:21px; padding-right:5px;">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
						</td>
						<td style="width: 5px;"></td>
						<td>
							<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><img src="<%=request.getContextPath()%>/247Recruit/images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
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
 function nonVoice()
 {
	 var hidVal = document.getElementById("voice_report").value;
	 if(hidVal == '3')
	 {
		 nonvoiceFrm.location.selectedIndex = 0;	 
	 }
	 else
	 {
		 nonvoiceFrm.location.selectedIndex = hidVal;	 
	 }
 }
 </script> 	 	
  </body>
</html>
