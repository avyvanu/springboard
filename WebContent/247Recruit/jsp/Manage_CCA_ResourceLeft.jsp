<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String recruitPath = path + "/247Recruit/";
String USER_ID = (String)session.getAttribute("USER_ID");
if(USER_ID == null)
  	{
  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Login.jsp");
  	}
System.out.println("USER_ID:::::"+USER_ID);
Connection connection=ConnectDatabase.getConnection();	
String CenterQuery="SELECT  Centre_Id FROM  user_master where Emp_ID='"+USER_ID+"'";
System.out.println("CenterQuery:::::::;"+CenterQuery);
Statement stmtCenterQuery=connection.createStatement();
ResultSet rsCenterQuery=stmtCenterQuery.executeQuery(CenterQuery);
int LDCentreId=0;
if(rsCenterQuery.next())
{
LDCentreId=rsCenterQuery.getInt("Centre_Id");
System.out.println("LDCentreId:::::"+LDCentreId);
}
rsCenterQuery.close();
stmtCenterQuery.close();

String query="SELECT  * FROM  user_master where Emp_ID like 'CCA%' and Is_Deleted = 0"; 
connection=ConnectDatabase.getConnection();		
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
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Recruiter.css">
	<script type="text/javascript" language="javascript">
    function ChangeColor(tableRow, EmpUserId)
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
	    parent.right.location.href= "<%=recruitPath%>jsp/Manage_CCA_ResourceRight.jsp?EmpUserId="+EmpUserId;
  	}

  
  </script>
  </head>
  
  <body>
    <table width="100%" rules="all" style="border:1px solid black;background-color:#F2F2F2;margin:0;">
					<tr>
					    <td style="border-bottom:1px solid black;margin:0;font-family: Arial,Helvetica,sans-serif;font-size: 14px;" align="center"><b>Sl No.</b></td>
						<td style="border-bottom:1px solid black;margin:0;font-family: Arial,Helvetica,sans-serif;font-size: 14px;" align="center"><b>Employee Name</b></td>
						<td style="border-left:1px solid black;border-bottom:1px solid black;margin:0;font-family: Arial,Helvetica,sans-serif;font-size: 14px;" align="center" nowrap="nowrap" ><b>User Type</b></td>
					</tr>
					
					<%
						int i=1;
						
						while(rs.next())
						{%>
							<tr id="<%=i%>" onclick="javascript:ChangeColor(this,'<%=rs.getString("Emp_ID")%>');">
							<td align="left" style="font-family: Arial,Helvetica,sans-serif;font-size: 14px;">
							<%=i %>
							</td>
								<td style="font-family: Arial,Helvetica,sans-serif;font-size: 14px;">
									<%=rs.getString("Emp_Name")%>
									
								</td>
								
								<td align="left" style="font-family: Arial,Helvetica,sans-serif;font-size: 14px;">
									<%
									String UserTypename=null;
									String UserTypeId=rs.getString("User_Type_Id");
									String Querytype="select User_Type_Description from user_type_master where User_Type_ID='" + UserTypeId + "'";
							        Statement stmttype=connection.createStatement();
							        ResultSet rstype=stmttype.executeQuery(Querytype);
							        if(rstype.next())
							        {
							        UserTypename=rstype.getString("User_Type_Description").trim();
							        }%>
							        <%=UserTypename %>
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

