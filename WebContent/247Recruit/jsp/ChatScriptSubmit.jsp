<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String recruitPath = path + "/247Recruit/";

String USER_ID = (String)session.getAttribute("USER_ID");
if(USER_ID == null)
 	{
 		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
 	}
System.out.println("USER_ID in home page::::"+USER_ID);
String canId= (String) session.getAttribute("Bpo_Cand_Id");
String ChatText= request.getParameter("txtScript");
String query="select ChatText,ChatTestUploadLastCount from bpo_candidatesreg_details where Bpo_Cand_Id='" + canId + "'"; 

Connection connection=ConnectDatabase.getConnection();		
Statement stmt=connection.createStatement();
ResultSet rs=stmt.executeQuery(query);

    	
    	if(rs.next())
	  	{
	  		
	  		int ChatTestUploadLastCount=rs.getInt("ChatTestUploadLastCount");
	  		ChatTestUploadLastCount=ChatTestUploadLastCount+1;
    			String query1="update bpo_candidatesreg_details set IsChatTestUpload=1,ChatTestUploadLastCount=" + ChatTestUploadLastCount + ",ChatText='" + ChatText + "',ChatTestUploadOn=NOW() where Bpo_Cand_Id='" + canId + "'"; 
			   	String query2="INSERT INTO candidate_chattestupdate_history(CandidateID,MaxCopyNo,ChatText,RecID,UpdatedDate) VALUES('" + canId + "'," + ChatTestUploadLastCount + ",'" + ChatText + "','" + USER_ID + "',NOW())";
				stmt.executeUpdate(query1);
				stmt.executeUpdate(query2);
			}				 
	%>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'BioRegSubmit.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<script type="text/javascript" language="javascript">
   alert("Uploaded SuccessFully.");
 parent.location.href= "<%=recruitPath%>jsp/Chat_Update_Script.jsp";
  
  </script>
  </head>
  
  <body>
    
  </body>
</html>
