<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp"%>


<%
	String message = (String)session.getAttribute("CONS_MSG");
%>

<html>
	<head>
	<%if(message.equalsIgnoreCase("1")) {%>
	<script language="Javascript">
	function call()
	{
		alert("Consultant name added successfully.");
		top.window.location.href = '<%=request.getContextPath()%>/247Recruit/jsp/Admin_Consult_Page.jsp';
	}
	</script>
	<%
	}if(message.equalsIgnoreCase("2")) {%>
	<script language="Javascript">
	function call()
	{
		alert("Consultant status updated successfully.");
		top.window.location.href = '<%=request.getContextPath()%>/247Recruit/jsp/Admin_Consult_Page.jsp';
	}
	</script>
	
	<%} if(message.equalsIgnoreCase("3")) {%>
	<script language="Javascript">
	function call()
	{
		alert("Consultant name deleted successfully.");
		top.window.location.href = '<%=request.getContextPath()%>/247Recruit/jsp/Admin_Consult_Page.jsp';
	}
	</script>
	<%} %>			
	</head>
	<body onload="call();">
	</body>
</html>

