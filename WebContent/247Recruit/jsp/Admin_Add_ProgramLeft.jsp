<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String recruitPath = path + "/247Recruit/";
String query="select * from program_names_master"; 
Connection connection=ConnectDatabase.getConnection();		
Statement stmt=connection.createStatement();
ResultSet rs=stmt.executeQuery(query);
%>
<html>
  <head>
    <title>[24]7 Admin Manage Programs</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Recruiter.css">
	<script type="text/javascript" language="javascript">
    function ChangeColor(tableRow, ProgramId)
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
	    
	    parent.right.location.href= "<%=recruitPath%>jsp/Admin_Add_ProgramRight.jsp?ProgramId="+ProgramId;
  	}
 </script>
  </head>
 <body>
    <table width="100%" rules="all" style="border:1px solid black;background-color:#F2F2F2;margin:0;">
		<tr>
		    <td style="border-bottom:1px solid black;margin:0;" align="center"><b>Sl No.</b></td>
			<td style="border-bottom:1px solid black;margin:0;" align="center"><b>Program Name</b></td>
			<td style="border-left:1px solid black;border-bottom:1px solid black;margin:0;" align="center" nowrap="nowrap" ><b>Program Type</b></td>
		</tr>
				<%
					int i=1;
					
					while(rs.next())
					{%>
		<tr id="<%=i%>" onclick="javascript:ChangeColor(this,'<%=rs.getString("Program_id")%>');">
			<td align="center">
				<%=i %>
			</td>
			<td>
				<%=rs.getString("Program_name")%>
			</td>
			<td align="left">
				<%
				String ProgramTypename=null;
				String ProgramTypeId=rs.getString("Program_TypeId");
				String Querytype="select Program_type_Name from program_type_master where Program_Type_ID='" + ProgramTypeId + "'";
		        System.out.println("Admin Type Id Query for Admin Program::"+Querytype);
		        Statement stmttype=connection.createStatement();
		        ResultSet rstype=stmttype.executeQuery(Querytype);
		        if(rstype.next())
		        {
		        ProgramTypename=rstype.getString("Program_type_Name").trim();
		        }%>
		        <%=ProgramTypename %>
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

