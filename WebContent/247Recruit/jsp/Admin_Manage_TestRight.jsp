<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page isELIgnored="false" language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
String username = (String)session.getAttribute("USER_Name");
System.out.println("USER Name:::"+username);
String testid = request.getParameter("TestId");
System.out.println("Test Id:::"+testid);
session.setAttribute("TestID",testid);

%>
<html>
  <head>
    <title>[24]7 SPRINGBOARD</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Recruiter.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css">
	<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/NoBack.js"></script>	

	<style type="text/css">
	html,body,form
	{
		margin: 0px;
	}
	.wmta
	{       		 
		color:gray;       		
	}
	.wmtr
	{       		 
		color:black;       		
	}
	.nta
	{
		color: black;
	}
	</style>
	<script type="text/javascript">
	function Focus(obn, wmt)
	{ 
		obj = document.getElementById(obn); 
		if (obj.value.trim() == wmt)
		{ 
			obj.value = ""; 
			obj.className = "nta"; 
		} 
	} 
	function Blur(obn, wmt)
	{ 
		obj = document.getElementById(obn); 
		if (obj.value.trim() == "") 
		{ 
			obj.value = wmt; 
			obj.className = "wmta"; 
		} 
		else 
		{ 
			obj.className = "nta"; 
		} 
	}
	</script>
	<script type="text/javascript">
	function AllowCharsName(evt)
	{
		var charCode = (evt.which) ? evt.which : event.keyCode;
		if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 8 || 
			charCode == 32 || charCode == 46 || charCode == 47 || charCode == 95) 
		{
			return true;
		}
		else
		{
			alert("Please enter only alphabets !");
			return false;
		}
	}
	function AllowNumbers(evt)
	{
		var charCode = (evt.which) ? evt.which : event.keyCode;
		if (charCode > 47 && charCode < 58 || charCode == 8) 
		{
			return true;
		}
		else
		{
			alert("Please enter only numbers !");
			return false;
		}
	}
	</script>
	<script type="text/javascript">
	function openaddtest()
	{
		document.getElementById('type_Test_Edit').style.display = "none";
		document.getElementById('dispButtons').style.display = "none";
		document.getElementById('test_Edit_Button').style.display = "none";
		document.getElementById('dispMins').style.display = "none";
		document.getElementById('dispSec').style.display = "none";
		document.getElementById('dispEditMins').style.display = "none";
		document.getElementById('dispEditSec').style.display = "none";
		document.getElementById('dispName').style.display = "none";
		document.getElementById('dispAddName').style.display = "";
		document.getElementById('dispURL').style.display = "none";
		document.getElementById('dispAddURL').style.display = "";
		document.getElementById('dispMins').style.display = "none";
		document.getElementById('dispAddMins').style.display = "";
		document.getElementById('dispSec').style.display = "none";
		document.getElementById('dispAddSec').style.display = "";
		document.getElementById('dispStatus').style.display = "none";
		document.getElementById('dispAddStatus').style.display = "";
		document.getElementById('test_Add_Button').style.display = ""; 

	}
	function openedittest()
	{
		document.getElementById('type_Test_Edit').style.display = "";
		document.getElementById('dispButtons').style.display = "none";
		document.getElementById('test_Edit_Button').style.display = "";
		document.getElementById('dispMins').style.display = "none";
		document.getElementById('dispSec').style.display = "none";
		document.getElementById('dispEditMins').style.display = "";
		document.getElementById('dispEditSec').style.display = "";
		document.getElementById('dispName').style.display = "";
		document.getElementById('dispAddName').style.display = "none";
		document.getElementById('dispURL').style.display = "";
		document.getElementById('dispAddURL').style.display = "none";
		document.getElementById('dispMins').style.display = "none";
		document.getElementById('dispAddMins').style.display = "none";
		document.getElementById('dispSec').style.display = "none";
		document.getElementById('dispAddSec').style.display = "none";
		document.getElementById('dispStatus').style.display = "none";
		document.getElementById('dispAddStatus').style.display = "none";
		document.getElementById('test_Add_Button').style.display = "none"; 
	}
	function addTestfun()
	{
		var addDesc = document.getElementById('addName').value;
		addDesc = addDesc.trim();
		if(addDesc == null || addDesc == "" || addDesc == "Test Description")
		{
			alert("Please Enter Test Description.");
			document.getElementById('addName').focus();
			return false;
		}
		var addURL = document.getElementById('addURL').value;
		addURL = addURL.trim();
		if(addURL == null || addURL == "" || addURL == "Test URL")
		{
			alert("Please Enter Test URL.");
			document.getElementById('addURL').focus();
			return false;
		}
		var addMins = document.getElementById('addtimeMins').value;
		addMins = addMins.trim();
		if(addMins == "" || addMins == null || addMins == "Time in Minutes")
		{
			alert("Please Enter Minutes.");
			document.getElementById('addtimeMins').focus();
			return false;
		}
		if(addMins == 0)
		{
			alert("Please enter more than 1 minute.");
			document.getElementById('addtimeMins').focus();
			return false;
		}
		if(addMins > 60)
		{
			alert("Please enter upto 60 minutes.");
			document.getElementById('addtimeMins').focus();
			return false;
		}
		var addSec =document.getElementById('addtimeSec').value;
		addSec = addSec.trim();
		if(addSec == "" || addSec == null || addSec == "Time in Seconds")
		{
			alert("Please Enter Seconds.");
			document.getElementById('addtimeSec').focus();
			return false;
		}
		if(addSec > 59)
		{
			alert("Please enter less than 60 seconds.");
			document.getElementById('addtimeSec').focus();
			return false;
		}
		if(confirm('Are you sure you want to add this Test? '))
		{
			return true;			
		}
		else
		{
			return false;
		}
	}
	function editTestfun()
	{
		var new_Mins = document.getElementById('timeMins').value;
		new_Mins = new_Mins.trim();
		if(new_Mins == "" || new_Mins == null)
		{
			alert("Please Enter Minutes.");
			document.getElementById('timeMins').focus();
			return false;
		}
		if(new_Mins == 0)
		{
			alert("Please enter more than 1 minute.");
			document.getElementById('timeMins').focus();
			return false;
		}
		if(new_Mins > 60)
		{
			alert("Please enter upto 60 minutes.");
			document.getElementById('timeMins').focus();
			return false;
		}
		var new_Sec = document.getElementById('timeSec').value ;
		new_Sec = new_Sec.trim();
		if(new_Sec == "" || new_Sec == null)
		{
			alert("Please Enter Seconds.");
			document.getElementById('timeSec').focus();
			return false;
		}
		if(new_Sec > 59)
		{
			alert("Please enter less than 60 seconds.");
			document.getElementById('timeSec').focus();
			return false;
		}
		if(confirm('Are you sure you want to update this Test? '))
		{
			return true;			
		}
		else
		{
			return false;
		}
	}
	
	function cancelButton()
	{
		if(confirm('Are you sure you want to cancel? Changes made will not be saved.' ))
		{ 
			//document.getElementById('type_Test_Status').style.display = "";
			document.getElementById('type_Test_Edit').style.display = "none";
			document.getElementById('dispMins').style.display = "";
			document.getElementById('dispSec').style.display = "";
			document.getElementById('dispEditMins').style.display = "none";
			document.getElementById('dispEditSec').style.display = "none";
			document.getElementById('dispButtons').style.display = "";
			document.getElementById('test_Edit_Button').style.display = "none";
			document.getElementById('dispName').style.display = "";
			document.getElementById('dispAddName').style.display = "none";
			document.getElementById('dispURL').style.display = "";
			document.getElementById('dispAddURL').style.display = "none";
			document.getElementById('dispMins').style.display = "";
			document.getElementById('dispAddMins').style.display = "none";
			document.getElementById('dispSec').style.display = "";
			document.getElementById('dispAddSec').style.display = "none";
			document.getElementById('dispStatus').style.display = "";
			document.getElementById('dispAddStatus').style.display = "none";
			document.getElementById('test_Add_Button').style.display = "none"; 
		}
		else
		{
			return false;	
		} 
	}
	</script>
	</head>
	<body > 
		<form action="<%=request.getContextPath()%>/EditTest" method="post">
		<%
		String query = "SELECT * FROM test_master WHERE Test_id = '"+ testid + "'";
		Connection connection = ConnectDatabase.getConnection();		
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(query); 
		if(rs.next())
		{
			String testDesc = rs.getString("Test_Description");
			System.out.println("Test Description :::::"+testDesc);
			String testURL = rs.getString("Test_URL");
			System.out.println("Test URL :::::"+testURL);
			String status = rs.getString("is_active");
			System.out.println("Status :::::"+status);
			String timeMin = rs.getString("Time_limit_min");
			System.out.println("Time_limit_min:::::"+timeMin);
			String timeSec = rs.getString("Time_limit_sec");
			System.out.println("Time_limit_sec :::::"+timeSec);
		%>
			<div id="displayTest">
				<table width = "450" cellspacing = "6" cellpadding = "6" border = "0">
					<tr height = "30">
						<td class="allBackColor" width = "120"  style="background-color: #d8d8d8;">Test Description</td>
						<td class="allBackColor" id = "dispName"><b><%=testDesc %></b></td>
						<td class="allBackColor" id = "dispAddName" style="display:none;">
							<input type = "text" id = "addName" name = "addName" size = "25" maxlength= "100"  class = "wmta" style="border-color: #41383C;" onkeypress="return AllowCharsName(event);" title = " Enter the Test Description" onblur="Blur(this.id, 'Test Description');" onfocus="Focus(this.id, 'Test Description');" value="Test Description" oncopy="return false" onpaste="return false" oncut="return false"/>
						</td>
					</tr>
					<tr height = "30">
						<td class="allBackColor" width = "120"  style="background-color: #d8d8d8;">Test URL</td>
						<td class="allBackColor" id = "dispURL"><b><%=testURL %></b></td>
						<td class="allBackColor" id = "dispAddURL" style="display:none;">
							<input type = "text" id = "addURL" name = "addURL" size = "25" maxlength = "100" class = "wmta" style="border-color: #41383C;" onkeypress="return AllowCharsName(event);" title = " Enter the Test URL" onblur="Blur(this.id, 'Test URL')" onfocus="Focus(this.id, 'Test URL')" value="Test URL" oncopy="return false" onpaste="return false" oncut="return false"/>
						</td>
					</tr>
					<tr height = "30">
						<td class="allBackColor"  style="background-color: #d8d8d8;">Time in Minutes</td>
						<td class="allBackColor" id = "dispMins" ><b><%=timeMin %></b></td>
						<td class="allBackColor" id = "dispAddMins" style="display:none;">
							<input type = "text" id = "addtimeMins" name = "addtimeMins"  size = "25" maxlength = "2" class = "wmta" style="border-color: #41383C;" onkeypress = "return AllowNumbers(event);" title = " Enter the Time in Minutes" onblur="Blur(this.id,'Time in Minutes')" onfocus="Focus(this.id,'Time in Minutes')" value="Time in Minutes" oncopy="return false" onpaste="return false" oncut="return false"/>
						</td>
						<td class="allBackColor" id = "dispEditMins" style="display:none;">
							<input type = "text" id = "timeMins" name = "timeMins" value = "<%= timeMin%>"  size = "25" maxlength = "2" onkeypress = "return AllowNumbers(event);" />
						</td>
					</tr>
					<tr height = "30">
						<td class="allBackColor"  style="background-color: #d8d8d8;">Time in Seconds</td>
						<td class="allBackColor" id = "dispSec" ><b><%=timeSec %></b></td>
						<td class="allBackColor" id = "dispAddSec" style="display:none;">
							<input type = "text" id = "addtimeSec" name = "addtimeSec"  size = "25" maxlength="2" onkeypress="return AllowNumbers(event);" class = "wmta" style="border-color: #41383C;" title = " Enter the Time in Seconds" onblur="Blur(this.id,'Time in Seconds')" onfocus="Focus(this.id,'Time in Seconds')" value="Time in Seconds" oncopy="return false" onpaste="return false" oncut="return false"/>
						</td>
						<td class="allBackColor" id = "dispEditSec" style="display:none;">
							<input type = "text" id = "timeSec" name = "timeSec" value = "<%= timeSec%>" size = "25" maxlength="2" onkeypress = "return AllowNumbers(event);" />
						</td>
					</tr>
					<tr height = "30">
						<td class="allBackColor" height = "30" style="background-color: #d8d8d8;">Test Status</td>
						<td class="allBackColor" id = "dispStatus">
							<%
							if(status.equalsIgnoreCase("1"))
							{
								status="Active";
							}
							else
							{
								status="InActive";
							}	
							%>
							<b><%=status %></b>
							
						</td>
						<td class="allBackColor" id = "dispAddStatus" style="display: none;">
							<input type="radio" name="addtest_status" id="addtest_status" value="1"  />
								<b>Active</b>	
							<input type="radio" name="addtest_status"  id="addtest_status" value="0" checked="checked"/>
								<b>InActive</b>
						</td>
				<%
					if(status.equalsIgnoreCase("Active"))
					{
				%>
						<td class="allBackColor" id="type_Test_Edit" style="display:none;">
							<input type="radio" name="test_status" id="test_status" value="1" checked="checked" />
								Active	
							<input type="radio" name="test_status" id="test_status" value="0" />
								InActive	
						</td>
				<%
					}
					else
					{
				%>
						<td class="allBackColor" id="type_Test_Edit" style="display:none;">
							<input type="radio" name="test_status" id="test_status" value="1"  />
								Active	
							<input type="radio" name="test_status"  id="test_status" value="0" checked="checked"/>
								InActive
						</td>
					</tr>
					<%
					}
			
					%>
				</table>
				<table width="450" id="dispButtons">
					<tr>
						<td align="right">
							<input type="button" class="buttonSmall" value="Add" id="addTest" name="addTest" onclick="return openaddtest();">
						</td>
						<td align="left">
							<input type="button" class="buttonSmall" value="Edit" id="editTest" name="editTest" onclick="return openedittest();">
						</td>
					</tr>
				</table>
				<table width="450" id="test_Add_Button" style="display:none;">
					<tr>
						<td align="right">
							<input type="reset" id=test_Cancel value="Cancel" class="buttonSmall" name="test_Cancel" onclick="return cancelButton();">
						</td>
						<td align="left">
							<input type="submit" id="buttons" name="buttons" value="Submit" class="buttonSmall" onclick="return addTestfun();">
						</td>
					</tr>
				</table>
				<table width="450" id="test_Edit_Button" style="display:none;">
					<tr>
						<td align="right">
							<input type="reset" id=test_Cancel value="Cancel" class="buttonSmall" name="test_Cancel" onclick="return cancelButton();">
						</td>
						<td align="left">
							<input type="submit" id="buttons" name="buttons" value="Update" class="buttonSmall" onclick="return editTestfun();">
						</td>
					</tr>
				</table>
			</div>
			<%
		}
			%>
		</form>
	</body>
</html>				