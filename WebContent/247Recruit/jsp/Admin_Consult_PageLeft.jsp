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
    function ChangeColor(tableRow, consId, consName, active)
    {
    	var iVal = document.getElementById("iValHid").value;
    	
    	var trRow;
    	var i=1;
    	for (i=1; i<iVal;i++)
    	{
    		trRow = document.getElementById(i);
    		trRow.style.backgroundColor = '#F2F2F2';
    	}
    	var name = consName;
	    tableRow.style.backgroundColor = '#C7C3DD';
	    parent.right.location.href= "<%=recruitPath%>jsp/Admin_Consult_PageRight.jsp?consultId="+consId+"&consName="+name+"&active="+active;
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
<table style="width: 430px; border:1px solid black; background-color:#F2F2F2; margin:0px;" rules="all">
	<tr style="font-size: 13px;">
		<td style="border-bottom:1px solid black;margin:0;" align="center"><b>Sl.No.</b></td>
		<td style="border-bottom:1px solid black;margin:0;" align="center"><b>Consultant Name</b></td>
		<td style="border-bottom:1px solid black;margin:0;" align="center"><b>Status</b></td>
	</tr>
<%
	int i=1;
	try
	{
		con=ConnectDatabase.getConnection();		
		stmt=con.createStatement();

		int quesCount = 0;
		String queryQsCount="SELECT Consultant_Value , Consultant_Name, Is_Active  FROM consultant_master WHERE Is_deleted = 0 ORDER BY  consultant_name ASC "; 
		rs=stmt.executeQuery(queryQsCount);
		int mockTestActiveCt = 0;
		while(rs.next())
		{
%>
	<tr class="txtFont" id="<%=i%>" onclick="javascript:ChangeColor(this,'<%=rs.getString("Consultant_Value")%>','<%=rs.getString("Consultant_Name")%>','<%=rs.getString("Is_Active")%>');" style="font-size:13px; cursor: pointer;">
		<td align="center">
			<%=i %>
		</td>
		<td>
			<%=rs.getString("Consultant_Name")%>
		</td>
		
		<td style="width: 60px;">
			<%
				String isActive = rs.getString("Is_Active");
  				if(isActive.equalsIgnoreCase("1"))
  				{
			%>
 					Active
			<%	
					
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
%>	</table>
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
