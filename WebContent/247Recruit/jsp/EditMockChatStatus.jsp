<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.ConnectDatabase"%>

<%
	//response.sendRedirect("/247Recruit/jsp/Admin_Disp_LanguageList.jsp");
	String isActiveData = (String)session.getAttribute("MockChat");
	System.out.println("isActiveData  \t"+isActiveData);
%>

<html>
	<head>

	<%if(isActiveData.equalsIgnoreCase("0")) {%>
	<script language="Javascript">
	function call()
	{
		alert("Can't deactivate all mockchat tests!! At least one must be active.");
		top.window.location.href = '<%=request.getContextPath()%>/247Recruit/jsp/Admin_Disp_MockChatTest.jsp';
	}
	</script>

	<%}else if(isActiveData.equalsIgnoreCase("1")) {%>
	<script language="Javascript">
	function call()
	{
		alert("MockChat test status updated successfully.");
		top.window.location.href = '<%=request.getContextPath()%>/247Recruit/jsp/Admin_Disp_MockChatTest.jsp';

	}
	</script>
	<%}else if(isActiveData.equalsIgnoreCase("2")) {%>
	<script language="Javascript">
	function call()
	{
		alert("Can't delete the only activate mockchat test!! At least one test, other than the one being deleted, must be active.");
		top.window.location.href = '<%=request.getContextPath()%>/247Recruit/jsp/Admin_Disp_MockChatTest.jsp';

	}
	</script>
	<%} else if(isActiveData.equalsIgnoreCase("3")) {%>
	<script language="Javascript">
	function call()
	{
		alert("MockChat test deleted successfully.");
		top.window.location.href = '<%=request.getContextPath()%>/247Recruit/jsp/Admin_Disp_MockChatTest.jsp';

	}
	</script>
	
	<%}else if(isActiveData.equalsIgnoreCase("4")) { %>
	<script language="Javascript">
	function call()
	{
		alert("MockChat test added successfully.");
		top.window.location.href = '<%=request.getContextPath()%>/247Recruit/jsp/Admin_Disp_MockChatTest.jsp';

	}
	</script>
	
	<%} %>
	</head>
	<body onload="call();">
	</body>
</html>

