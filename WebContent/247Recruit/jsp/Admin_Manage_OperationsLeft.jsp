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
System.out.println(":::::::::IsSAdmin:::::::::"+IsSAdmin);
boolean User_AllPrrmsAccess = ((Boolean)session.getAttribute("User_AllPrrmsAccess"));
System.out.println(":::::::::User_AllPrrmsAccess in left page:::::::::"+User_AllPrrmsAccess);
String query = "";
String countquery = "";

if(IsSAdmin.equalsIgnoreCase("Yes"))
{
	query="select * from program_names_master where Is_Alive = 1"; 
}
else
{
	if(User_AllPrrmsAccess == true)
	{
		query="select * from program_names_master where Is_Alive = 1";
	}
	else
	{
		query="SELECT * FROM program_names_master WHERE Is_Alive = 1 AND Program_id IN (SELECT Program_id FROM user_program_mapping WHERE User_Id = '"+USER_AUTOID+"')";
	}
	
}

System.out.println(":::::::::query:::::::::"+query);
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
	    
	    parent.right.location.href= "<%=recruitPath%>jsp/Admin_Manage_OperationsRight.jsp?ProgramId="+ProgramId;
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
				System.out.println(":::::::::ProgramTypeId:::::::::"+ProgramTypeId);
				String Querytype="select Program_type_Name from program_type_master where Program_Type_ID='" + ProgramTypeId + "'";
		        Statement stmttype=connection.createStatement();
		        ResultSet rstype=stmttype.executeQuery(Querytype);
		        if(rstype.next())
		        {
		        ProgramTypename=rstype.getString("Program_type_Name").trim();
		        }
				System.out.println(":::::::::ProgramTypename:::::::::"+ProgramTypename);
		        %>
		        <%=ProgramTypename %>
		        
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

