<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%@page import="util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String recruitPath = path + "/247Recruit/";
Connection connection=ConnectDatabase.getConnection();		
String ActionType =(String)request.getParameter("ActionType");
System.out.println("Action Type Id::"+ActionType);
String USER_ID =(String)session.getAttribute("USER_ID");
if(USER_ID == null)
 {
	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
 }
System.out.println("USER_ID:::::::"+USER_ID);
String RoleID = (String) session.getAttribute("RoleID");
if(RoleID == null)
 {
	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
 }
System.out.println("RoleID in Admin Update page::"+RoleID);
	try
	{
      
      //*********************Add part*********************//
      if(ActionType.equals("1"))
			{
				String RoleName = request.getParameter("RoleNameValADD").trim();
				System.out.println("User Entered RoleName::::"+RoleName);
				String roleMasterQry = "SELECT * FROM user_type_master where User_Type_description ='"+RoleName+"'";
				System.out.println("roleMasterQry:::::"+roleMasterQry);
				Statement stRolename = connection.createStatement();
				ResultSet rsRolename = stRolename.executeQuery(roleMasterQry);
				boolean state=rsRolename.next();
			if(state==true)
				{
				%>
				<script type="text/javascript" language="javascript">
				    alert("Role Already Exists. Please Edit the same !"); 
				   parent.location.href= "<%=recruitPath%>jsp/Admin_Manage_Roles.jsp";
				</script>
				<%
			   }
			else
			{
				//*** Adding New Role into user_type_master***//
				String roleStatusSelected = request.getParameter("RoleStatusSelelctionAdd").trim();
				System.out.println("roleStatusSelected::::"+roleStatusSelected);
				PreparedStatement addRoleInsert = null;
				addRoleInsert =connection.prepareStatement("insert into user_type_master(User_Type_Description,Is_Active,Updated_By,Updated_On) values(?,?,?,now())");
				addRoleInsert.setString(1,RoleName);
				addRoleInsert.setString(2,roleStatusSelected);
				addRoleInsert.setString(3,USER_ID);
				addRoleInsert.executeUpdate();
				addRoleInsert.close();
			   	System.out.println("Inserted successfully into user_type_master:::::");
			    //*** End of New Role into user_type_master***//
			 
			}
       }
    //*********Edit Part*********//
	if(ActionType.equalsIgnoreCase("2"))
	{
		
		String roleTypeSelelction = request.getParameter("RoleStatusSelelction").trim();
		System.out.println("roleTypeSelelction::::"+roleTypeSelelction);
		//******Insert into user_type_master_history******//
		String InsertQryUTMH = "insert into user_type_master_history(User_Type_ID,User_Type_Description,Is_Active,Updated_By,Updated_On) select User_Type_ID,User_Type_Description,Is_Active,Updated_By,Updated_On from user_type_master where User_Type_ID ='"+RoleID+"'";
		System.out.println("Inserted Query into user_type_master_history::"+InsertQryUTMH);
		Statement stmtedit=connection.createStatement();
		stmtedit.execute(InsertQryUTMH);
		System.out.println("Inserted Successfully::::user_type_master_history");
	   
			   	
		//*****Update of user_type_master*******//
		PreparedStatement programInfoUpdate = null;
		programInfoUpdate =connection.prepareStatement("update user_type_master set Is_Active = ?,Updated_By = ? ,Updated_On = now() where User_Type_ID = ?");
		programInfoUpdate.setString(1,roleTypeSelelction);
		programInfoUpdate.setString(2,USER_ID);
		programInfoUpdate.setString(3,RoleID);
		programInfoUpdate.executeUpdate();
		programInfoUpdate.close();
		System.out.println("Update Successfully user_type_master::::");
	}
  //*********Edit Part*********//
 session.setAttribute("RoleID",RoleID);
%>
<%
}
catch(Exception exception)
{
exception.printStackTrace();
}
connection.close();
				 %>

<html>
  <head>
    <title>[24]7 SPRINGBOARD</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
   <script type="text/javascript" language="javascript">
    alert("Updated Successfully."); 
    parent.location.href= "<%=recruitPath%>jsp/Admin_Manage_Roles.jsp";
  </script>
  </head>
  
  <body>
    
  </body>
</html>
