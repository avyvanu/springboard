<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String recruitPath = path + "/247Recruit/";
	try
	{
	
	Connection connection=ConnectDatabase.getConnection();
	String query="SELECT * FROM bpo_typing_master WHERE Is_Deleted=0 ORDER BY TYPING_MASTER_ID" ;
	System.out.println("query::::::"+query);
	Statement stmt=connection.createStatement();
	ResultSet rs=stmt.executeQuery(query);
%>

<html>
	<head>
	    
		<title>[24]7 SPRINGBOARD</title>
		   
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="/springboard/247Recruit/css/Recruiter.css">
		<link rel="stylesheet" type="text/css" href="/springboard/247Recruit/css/MasterTheme.css">
			
		<!--
		<link rel="stylesheet" type="text/css" href="styles.css">
		-->
	
		<style type="text/css">
			.html,body,form
			{
				margin: 0px;
			}
			.tr:HOVER
			{
				font-weight:bold;
			}
		</style>
		
		<script type="text/javascript">
			function ChangeColor(tableRow,Type_id,typeTestName,typestatus)
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
				parent.right.location.href= "<%=recruitPath%>jsp/Admin_Manage_TypingTestRight.jsp?TypeId="+Type_id+"&Typename="+typeTestName+"&Typestatus="+typestatus;
			} 
		</script>
	</head>
	  
	<body>
		<table style="width:420px;border:1px solid black;background-color:#F2F2F2;margin:0px;" rules="all">
			<tbody>
				<tr style="font-size:13px;">
					<td align="center" style="border-bottom:1px solid black;margin:0px;">
						<b>Sl.No.</b>
					</td>
					<td align="center" style="border-bottom:1px solid black;margin:0px;">
						<b>Typing Test Name</b>
					</td>
					<td align="center" style="border-bottom:1px solid black;margin:0px;">
						<b>Status</b>
					</td>
				</tr>
			<%
				int i=1;
				while(rs.next())
				{
					String typeTestName = rs.getString("Typing_Test_Name");
					String typestatus = rs.getString("Is_Active");
			%>
					<tr id="<%=i%>"  style="font-size:13px;cursor:pointer;background-color:rgb(242,242,242);" onclick="javascript:ChangeColor(this,'<%=rs.getInt("TYPING_MASTER_ID")%>','<%=typeTestName%>','<%=typestatus%>');" onmouseover="style.fontWeight='bold'" onmouseout="style.fontWeight='normal'" >
						<td align="center"><%=i%></td>
						<td><%=typeTestName%></td>
						<%
						if(typestatus.equals("1"))
						{
							typestatus="Active";
						}
						else
						{
							typestatus="InActive";
						}	
						%>
						<td><%=typestatus%></td>
					</tr>
			<%
					i=i+1;
				}  			 
			%>
			</tbody>
		</table>
		<input type="hidden" id="iValHid" value="<%=i%>" />
		<%
			rs.close();
			stmt.close();
			connection.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("not Connected");
		}		
		%>
	</body>
</html>
