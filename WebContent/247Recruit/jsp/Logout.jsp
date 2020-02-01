<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.Connection"%>
<%
	 String path = request.getContextPath();
	 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	 String loginPage = basePath + "jsp/Login.jsp";

	 int logsDataId=(Integer)session.getAttribute("Logs_Data_Info");
	 System.out.println("=========== Logs Out Page ------------"+logsDataId);
	 
	 Connection con=ConnectDatabase.getConnection();
 	 PreparedStatement p17=con.prepareStatement("update cand_logs_information set LogOut_TimeStamp=now() where Logs_Id='"+logsDataId+"'");
     System.out.println(" updated to LogOut_TimeStamp  data =="+p17);
   	 p17.executeUpdate();
   	 p17.close();
 	
 	 session.removeAttribute("USER_Name");	
 	 session.removeAttribute("USER_AUTOID");
 	 session.removeAttribute("USER_ID");
	 session.removeAttribute("x_val");
	 session.removeAttribute("x_val2");
	 session.removeAttribute("ScriptType");
	 session.removeAttribute("password_random");
	 session.removeAttribute("Logs_Data_Info");	
	 session.invalidate();		
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Logout.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" language="javascript">
   	location.href= "<%=loginPage%>";
  </script>
</head>
  <body>
  </body>
</html>
