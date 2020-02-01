<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.util.Date,java.text.*,java.text.SimpleDateFormat" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    
    <title>[24]7 SPRINGBOARD</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
 <% 
 	Object ID=session.getAttribute("ID");
 		System.out.println("ID:::::"+ID);
 	//String Id=request.getParameter("testTypeId");
 	Object stat=session.getAttribute("type_status");
 		System.out.println("==stat===="+stat);
 		
 	String status=request.getParameter("status");
 	 	System.out.println(":::::Edit status::::"+status);
	//String stat="InActive";
		
	int updateQuery=0;
	Connection connection=null;
	
	try
	{
		//if(stat.equals("Active"))
		//{
			//int st=1;
			connection=ConnectDatabase.getConnection();
			PreparedStatement pstmt=connection.prepareStatement("UPDATE bpo_typing_master SET Is_Active=? WHERE TYPING_MASTER_ID=?");
			pstmt.setObject(1,stat);
			//pstmt.setTimestamp(2,timestamp);
			pstmt.setObject(2,ID);
			updateQuery=pstmt.executeUpdate();
		//}
		/*
		else 
		{
			int st=0;
			connection=ConnectDatabase.getConnection();
			PreparedStatement pstmt=connection.prepareStatement("UPDATE bpo_typing_master SET Is_Active=? WHERE TYPING_MASTER_ID=?");
			pstmt.setInt(1,st);
			//pstmt.setTimestamp(2,timestamp);
			pstmt.setObject(2,ID);
			updateQuery=pstmt.executeUpdate();
		}
		*/
		
		if (updateQuery > 0)
		 { 
			%>
			<script type="text/javascript">
				alert("Edited Successfully");
				top.location.href = "<%=request.getContextPath()%>/247Recruit/jsp/Admin_Type_Test_main.jsp";
		
			</script>	
			<% 	   
	     }
	     else
	     {
	  	%>
			<script type="text/javascript">
				alert("not Edited");
				top.location.href = "<%=request.getContextPath()%>/247Recruit/jsp/Admin_Type_Test_main.jsp";
		
			</script>	
		<% 	  
	 	}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	 }
	%>
  
</html>
