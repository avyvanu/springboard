<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String recruitPath = path + "/247Recruit/";

String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
 if(USER_Name == null)
{
	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
}
 System.out.println("USER_Name in LD script righthome page::::"+USER_Name);
String canId = (String) session.getAttribute("Bpo_Cand_Id");
String USER_ID =(String)session.getAttribute("USER_ID");
System.out.println("USER_ID::::SCRIPLD PAGE::"+USER_ID);
String ChatText= request.getParameter("txtScript");
String UpdateState = (String)session.getAttribute("ScriptUpdateState");
System.out.println("SingleUpload Page:::UpdateState::::::"+UpdateState);  
String query="select ChatText,ChatTestUploadLastCount from bpo_candidatesreg_details where Bpo_Cand_Id='" + canId + "'"; 
String redPage="LD_ChatScriptUploadUI.jsp";
String redURL=recruitPath+ "jsp/" + redPage + "?candId=" + canId;
Connection connection=ConnectDatabase.getConnection();		
Statement stmt=connection.createStatement();
ResultSet rs=stmt.executeQuery(query);

    	if(UpdateState.equalsIgnoreCase("0"))
    	{
    	if(rs.next())
	  	{
	  		
		  		int ChatTestUploadLastCount=rs.getInt("ChatTestUploadLastCount");
		  		ChatTestUploadLastCount=ChatTestUploadLastCount+1;
    	        String query1="update bpo_candidatesreg_details set IsChatTestUpload=1,ChatTestUploadLastCount=" + ChatTestUploadLastCount + ",ChatText='" + ChatText + "',ChatTestUploadOn=NOW() where Bpo_Cand_Id='" + canId + "'"; 
			   	System.out.println("LDUPDATESRCIPT:::Update QUERY:::"+query1);
			   	String query2="INSERT INTO candidate_chattestupdate_history(CandidateID,MaxCopyNo,ChatText,RecID,UpdatedDate) VALUES('" + canId + "'," + ChatTestUploadLastCount + ",'" + ChatText + "','" + USER_ID + "',NOW())";
			    System.out.println("LDUPDATESRCIPT:::Insert QUERY:::"+query2);
			    stmt.executeUpdate(query1);
			    System.out.println("Updated Successfully Query 1");
				stmt.executeUpdate(query2);
				System.out.println("LDUPDATESRCIPT:::Insert QUERY:::"+query2);
				System.out.println("Inserted Successfully Query 1");
				session.setAttribute("ScriptUpdateState", "1");
	   }	
	  }
	  else
		{
			session.setAttribute("ScriptUpdateState", "0");
		}			 
	%>

<html>
  <head>
    <title>[24]7 Chat Transcript Upload</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<script type="text/javascript" language="javascript">
 <% if(UpdateState.equalsIgnoreCase("0"))
    	{%>
   alert("Updated Successfully");
   <%}%>
  location.href= "<%=redURL%>";
  
  </script>
  </head>
  
  <body>
    
  </body>
</html>
