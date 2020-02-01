<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>

<%
String USER_ID = (String)session.getAttribute("USER_ID");
if(USER_ID == null)
 	{
 		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
 	}
System.out.println("USER_ID in LD Audio home page::::"+USER_ID);
Connection connection=ConnectDatabase.getConnection();	
String User_Center_Id =(String)session.getAttribute("User_Center_Id");
if(User_Center_Id == null)
 	{
 		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
 	}
System.out.println("User_Center_Id::::::mark for language"+User_Center_Id);
String query="select Bpo_Cand_Id,First_Name,Middle_Name,Last_Sir_Name from bpo_candidatesreg_details a left join candidate_voice_score b on a.autoid=b.cand_id  where a.MarkVoiceReScore = 0 and (b.cand_id is not null and (a.cand_Status=4 or (a.cand_Status = 6 and a.Init_Result not in (1,3)))) and a.Applying_For=1 and a.Location='"+User_Center_Id+"'"; 
System.out.println("Mark voice Resscore query::::"+query);
Statement stmt=connection.createStatement();
String FromDAte=request.getParameter("VoiceScoreFrom");
	String ToDAte=request.getParameter("VoiceScoreTo");
	if((FromDAte==null || FromDAte.equalsIgnoreCase(""))&& (ToDAte==null || ToDAte.equalsIgnoreCase("")))
	{
		System.out.println("No data");
	}
	if((FromDAte!=null ) && (ToDAte!=null))
	{
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
	query = query+ " and System_Date_Time between '" + strFrom + " 00:00:00.000' and '" + strTo + " 23:59:59.999'";
	System.out.println("Date Query:::::"+query);
	}
ResultSet rs=stmt.executeQuery(query);
			
%>



<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>[24]7 SPRINGBOARD</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Recruiter.css">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
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
		$("#VoiceScoreFrom").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1970:2050',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true		
		    });
	    });
    </script>  
	<!--  from date and to date start -->
	<script type="text/javascript">
			$(function() {
			$("#VoiceScoreTo").datepicker({
				changeMonth: true,
				changeYear: true,
	            yearRange: '1970:2050',
	            showOn: 'both',
				buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
				buttonImageOnly: true
			
			    });
	          });
	</script>

	<script type="text/javascript">      
	function CheckValidation()
			{
				if(document.getElementById("VoiceScoreFrom").value =='')
				{
					var appStr = 'Please Select From Date !';
					alert(appStr);
					document.getElementById('VoiceScoreFrom').focus();
					return false;	
				}
				if(document.getElementById("VoiceScoreTo").value =='')
				{
					var appStr = 'Please Select To Date !';
					alert(appStr);
					document.getElementById('VoiceScoreTo').focus();
					return false;	
				}
		  }
	</script>
	<script type="text/javascript" language="javascript">
    function ChangeColor(tableRow, canId)
    {
    	var iVal = document.getElementById("iValHid").value;
    	
    	var trRow;
    	var i=1;
    	for (i=1; i<iVal;i++)
    	{
    		trRow = document.getElementById(i);
    		trRow.style.backgroundColor = '#F2F2F2';
    	}
	    tableRow.style.backgroundColor = '#C7C3DD';
	    
	    parent.right.location.href= "<%=recruitPath%>jsp/MarkVoiceRight.jsp?candId="+canId;
  	}

  
  </script>
  </head>
  
  <body>
  <table width="420">
       <tr>
	      <td colspan="2">
			          <form action="" method="post" onsubmit="return CheckValidation();" accept-charset="utf-8">
			             <table>
			            	 <tr>
		            			<td nowrap="nowrap">From:<input type="text" size="14" name="VoiceScoreFrom" id="VoiceScoreFrom" value=""/></td>
		            			<td nowrap="nowrap"> To:<input type="text" size="14" name="VoiceScoreTo" id="VoiceScoreTo" value=""/> </td>
		            			<td><input type="submit" name="searchCand" class="buttonSmall" value="Go" onClick="return CheckValidation(this.form);" /></td>
		            		    <td nowrap="nowrap"></td>
			            	</tr>
			            </table>
			       </form>
			  </td>
		 </tr>
    </table>
    <table width="420" rules="all" style="border:1px solid black;background-color:#F2F2F2;margin:0;font-family: Arial,Helvetica,sans-serif; font-size: 13px;">
					<tr>
						<td style="border-bottom:1px solid black;margin:0;" align="center"><b>Candidate ID</b></td>
						<td style="border-left:1px solid black;border-bottom:1px solid black;margin:0;" align="center"><b>Name</b></td>
					</tr>
					
					<%
						int i=1;
						
						while(rs.next())
						{%>
							<tr id="<%=i%>" onclick="javascript:ChangeColor(this,'<%=rs.getString("Bpo_Cand_Id")%>');">
								<td>
									<%=rs.getString("Bpo_Cand_Id")%>
								</td>
								<td style="border-left:1px solid black;margin:0;">
									<%String canName=rs.getString("First_Name")+ " " +rs.getString("Middle_Name")+ " " +rs.getString("Last_Sir_Name");%>
									<%=canName %>
								</td>
							</tr>
						<%
						i = i+1;
						
						}%>
					
					
				</table>
				<input type="hidden" id="iValHid" value="<%=i%>" />
				<%
					rs.close();
					stmt.close();
					connection.close();
				 %>
  </body>
</html>

