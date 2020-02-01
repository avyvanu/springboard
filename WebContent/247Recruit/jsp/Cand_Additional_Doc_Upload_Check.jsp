<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.ConnectDatabase"%>

<%
	//response.sendRedirect("/247Recruit/jsp/Admin_Disp_LanguageList.jsp");
	String docCheck = (String)session.getAttribute("docCheck");
%>

<html>
	<head>
	
	<script language="Javascript">
	   <%if(docCheck.equalsIgnoreCase("maxDocsExceeds"))
		{
		%>
		alert("Maximum Documents already Uploaded. !");
		parent.location.href = '<%=request.getContextPath()%>/247Recruit/jsp/Cand_Additional_Doc_Upload.jsp';
	    <%
	     }
	     else if(docCheck.equalsIgnoreCase("maxDocSize"))
	     {
	     %>
	     alert("Please Upload file less than 10Mb in size. !");
		 parent.location.href = '<%=request.getContextPath()%>/247Recruit/jsp/Cand_Additional_Doc_Upload.jsp';
	     <%
	     }
	     else
	    {
	    %>
	    alert("Uploaded Successfully. !");
		parent.location.href = '<%=request.getContextPath()%>/247Recruit/jsp/Cand_Additional_Doc_Upload.jsp';
		<%
		}
		%>
	</script>
	</head>
	<body>
	</body>
</html>

