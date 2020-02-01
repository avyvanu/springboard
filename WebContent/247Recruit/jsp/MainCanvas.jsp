<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
     
    <title>[24]7 Online test</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
   <%
   try
   {
     	System.out.println("/247Recruit/jsp/Confirmation.jsp");
    	response.sendRedirect("247Recruit/jsp/camcanvas.jsp");
    }
   catch(Exception e)
   {
  	 	System.out.println("-- ERROR IN THE MAIN CANVAS PAGE");
   		e.printStackTrace();
   }
    %>
  </body>
</html>
