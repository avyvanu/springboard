<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="util.ConnectionDAO"%>
<%@ include file="GlobalDeclare.jsp" %>

<%
Connection con = null;
Statement stmt = null;
ResultSet rs = null;
 %>
<html>
<head>    
    <title>[24]7 SPRINGBOARD</title>
    
	<script type="text/javascript" language="javascript">
    function ChangeColor(tableRow,engGrammarRowId)
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
	    parent.right.location.href= "<%=recruitPath%>jsp/Admin_Manage_EngGrammarRight.jsp?engGrammarRowId="+engGrammarRowId;
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
		<td style="border-bottom:1px solid black;margin:0;" align="center"><b>English Grammar Test Name</b></td>
		<td style="border-bottom:1px solid black;margin:0;" align="center"><b>Status</b></td>
	</tr>
<%
	int i=1;
	try
	{
		String query="SELECT READING_COMP_MASTER_ID, Test_Name, Is_Alive FROM bpo_eng_comp_master WHERE Is_Deleted = 0"; 
		con=ConnectDatabase.getConnection();		
		stmt=con.createStatement();
		rs=stmt.executeQuery(query);
		int engGrammarTestActiveCt = 0;
		while(rs.next())
		{
%>
	<tr class="txtFont" id="<%=i%>" onclick="javascript:ChangeColor(this,'<%=rs.getString("READING_COMP_MASTER_ID")%>');" style="font-size:13px; cursor: pointer;">
		<td align="center">
			<%=i %>
		</td>
		<td>
			<%=rs.getString("Test_Name")%>
		</td>
		<td>
			<%
				String engGrammarTestIsActive = rs.getString("Is_Alive");
  				if(engGrammarTestIsActive.equalsIgnoreCase("1"))
  				{
			%>
 					Active
			<%	
					engGrammarTestActiveCt = engGrammarTestActiveCt + 1;
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
		}
		session.setAttribute("ActiveTestCount",engGrammarTestActiveCt);
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
