<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>

<%

String canId= (String) session.getAttribute("Bpo_Cand_Id");
String query="update bpo_candidatesreg_details set MarkChatReScore=1 where Bpo_Cand_Id='" + canId + "'"; 
Connection connection=ConnectDatabase.getConnection();		
Statement stmt=connection.createStatement();
stmt.executeUpdate(query);
String redURL=recruitPath+ "jsp/MarkChat_ReScore.jsp";
%>


<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MarkVoiceSubmit.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" language="javascript">
   		alert("Updated Successfully.");
   		parent.location.href= "<%=redURL%>";
  
  </script>
  </head>
  
  <body>
    
  </body>
  <%
					
					stmt.close();
					connection.close();
				 %>
</html>
