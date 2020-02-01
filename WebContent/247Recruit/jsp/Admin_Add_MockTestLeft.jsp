<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="util.ConnectionDAO"%>
<%@ include file="GlobalDeclare.jsp"%>

<%
Connection con = null;
Statement stmt = null;
ResultSet rs = null;

 %>
<html>
<head>    
    <title>[24]7 SPRINGBOARD</title>
    
	<script type="text/javascript" language="javascript">
    function ChangeColor(tableRow,mockChatRowId)
    {
    	var iVal = document.getElementById("iValHid").value;    	
    	var trRow;
    	var i=1;
    	for (i=1; i<iVal;i++)
    	{
    		trRow = document.getElementById(i);
    		trRow.style.backgroundColor = '#F2F2F2'; // #F8F8F8     #F2F2F2
    	}
	    tableRow.style.backgroundColor = '#C7C3DD';
	    parent.right.location.href= "<%=recruitPath%>jsp/Admin_Add_MockTestRight.jsp?MockChatQuesID="+mockChatRowId;
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
<table rules="all" style="width: 450px; border:1px solid black; background-color:#F2F2F2; margin:0px;">
	<tr style="font-size: 13px;">
		<td style="border-bottom:1px solid black;margin:0;" align="center"><b>Sl.No.</b></td>
		<td style="border-bottom:1px solid black;margin:0;" align="center"><b>Mock Test Name</b></td>
		<td style="border-bottom:1px solid black;margin:0;" align="center"><b>Status</b></td>
	</tr>
<%
	int i=1;
	try
	{
		con=ConnectDatabase.getConnection();		
		stmt=con.createStatement();

		int quesCount = 0;
		String queryQsCount="SELECT *  FROM mock_chat_script_master  WHERE Is_Deleted = 0";
		rs=stmt.executeQuery(queryQsCount);
		int mockTestActiveCt = 0;
		while(rs.next())
		{
%>
	<tr class="txtFont" id="<%=i%>" onclick="javascript:ChangeColor(this,'<%=rs.getString("Chat_Script_Id")%>');" style="font-size:13px; cursor: pointer;">
		<td align="center">
			<%=i %>
		</td>
		<td>
			<%=rs.getString("Chat_Description")%>
		</td>
		<td>
			<%
				String languageTestIsActive = rs.getString("Is_Active");
  				if(languageTestIsActive.equalsIgnoreCase("1"))
  				{
			%>
 					Active
			<%	
					mockTestActiveCt = mockTestActiveCt + 1;
  				}
  				else
  				{
			%>
 					Inactive
			<%
  				}
			%>
		</td>
		
	</tr>
<%
			i = i+1;			
			session.setAttribute("ActiveTestCount",mockTestActiveCt);		
		}
%>
		</table>
		<input type="hidden" id="iValHid" value="<%=i%>" />
<%
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		ConnectionDAO.closeConnection(con,stmt,rs);
	}
%>
  </body>
</html>
