<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String recruitPath = path + "/247Recruit/";

int USER_AUTOID = (Integer)session.getAttribute("USER_AUTOID");
if(USER_AUTOID == 0)
 	{
 		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
 	}
System.out.println("USER_AUTOID in home page::::"+USER_AUTOID);
String IsSAdmin = ((String)session.getAttribute("IsSAdmin")).trim();
if(IsSAdmin == null)
 {
 	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Login.jsp");
 }
String query = "SELECT Test_id, Test_Name, is_active FROM test_master WHERE is_deleted = 0 ORDER BY Test_id";
Connection connection=ConnectDatabase.getConnection();		
Statement stmt=connection.createStatement();
ResultSet rs=stmt.executeQuery(query); 

%>
<html>
	<head>
	    <title>[24]7 Admin Manage Tests</title>
	    <meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Recruiter.css">
	
		<script type="text/javascript" language="javascript">
		function ChangeColor(tableRow, TestId)
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
			parent.right.location.href= "<%=recruitPath%>jsp/Admin_Manage_TestRight.jsp?TestId="+TestId;
		}
		</script>
		
		<style type="text/css">
		html,body,form
		{
			margin: 0px;
		}
		tr:HOVER 
		{
			font-weight:bold;
		}
		</style>
	</head>
 	<body>
	    <table width="100%" rules="all" style="border:1px solid black;background-color:#F2F2F2;margin:0;font-family: Arial,Helvetica,sans-serif; font-size: 13px;">
		    <tr>
			    <td style="border-bottom:1px solid black;margin:0;" align="center"><b>Sl No.</b></td>
				<td style="border-bottom:1px solid black;margin:0;" align="center"><b>Test Description</b></td>
				<td style="border-left:1px solid black;border-bottom:1px solid black;margin:0;" align="center" nowrap="nowrap" ><b>Status</b></td>
			</tr>
		<%
			int i=1;
			
			while(rs.next())
			{
				String testName = rs.getString("Test_Name");
				System.out.println("testName :"+testName);
		%>
			<tr id="<%=i%>" onclick="javascript:ChangeColor(this, '<%=rs.getString("Test_id")%>');">
				<td align="center">
					<%=i %>
				</td>
				<td>
					<%= testName%>
				</td>
				<td align="center">
					<%
					String typestatus = rs.getString("is_active");
					if(typestatus.equals("1"))
					{
						typestatus="Active";
					}
					else
					{
						typestatus="InActive";
					}	
					System.out.println(":::::::::typestatus:::::::::"+typestatus);
			        %>
			        <%=typestatus %>
			        
				</td>
			</tr>
		<%
			i = i+1;
			}
		%>
		</table>
			<input type="hidden" id="iValHid" value="<%=i%>" />
		<%

			rs.close();
			stmt.close();
			connection.close();
		 %>
	</body>
</html>

