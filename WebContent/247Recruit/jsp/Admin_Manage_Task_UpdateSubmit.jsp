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
String USER_ID = ((String)session.getAttribute("USER_ID")).trim(); 
  if(USER_ID == null)
	 {
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	 }
System.out.println("USER_ID:::::::"+USER_ID);
String TaskId = (String) session.getAttribute("TaskId");
if(TaskId == null)
 {
	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
 }
System.out.println("TaskId in Admin Update page::"+TaskId);
	try
	{
      
      //*********************Add part*********************//
      if(ActionType.equals("1"))
			{
				String TaskName = request.getParameter("TaskNameValADD").trim();
				System.out.println("User Entered TaskName::::"+TaskName);
				String TaskMasterQry = "SELECT * FROM task_master where Task_description ='"+TaskName+"'";
				System.out.println("TaskMasterQry:::::"+TaskMasterQry);
				Statement stTaskname = connection.createStatement();
				ResultSet rsTaskname = stTaskname.executeQuery(TaskMasterQry);
				boolean state=rsTaskname.next();
			if(state==true)
				{
				%>
				<script type="text/javascript" language="javascript">
				    alert("Task Already Exists. Please Edit the same !"); 
				   parent.location.href= "<%=recruitPath%>jsp/Admin_Manage_Tasks.jsp";
				</script>
				<%
			   }
			else
			{
				//*** Adding New Task Name into task_master***//
				String selParentTaskAdd = null;
				String ParentTaskId = "0";
				String TaskURLValADD = request.getParameter("TaskURLValADD").trim();
				System.out.println("TaskURLValADD::::"+TaskURLValADD);
				String TaskStatusSelected = request.getParameter("TaskStatusSelelctionAdd").trim();
				System.out.println("TaskStatusSelected::::"+TaskStatusSelected);
				String selectTaskTypeadd = request.getParameter("selectTaskTypeadd").trim();
				System.out.println("selectTaskTypeadd::::"+selectTaskTypeadd);
				if(selectTaskTypeadd.equalsIgnoreCase("1"))
				{
					selParentTaskAdd = request.getParameter("selParentTaskAdd").trim();
					System.out.println("selParentTaskAdd::::"+selParentTaskAdd);
					ParentTaskId = selParentTaskAdd;
				}
				else
				{
					ParentTaskId = "0";
				}
				PreparedStatement addTaskInsert = null;
				addTaskInsert =connection.prepareStatement("insert into task_master(Task_Description,Pareent_Task_Id,Is_Active,Updated_By,Updated_On,Task_URL) values(?,?,?,?,now(),?)");
				addTaskInsert.setString(1,TaskName);
				addTaskInsert.setString(2,ParentTaskId);
				addTaskInsert.setString(3,TaskStatusSelected);
				addTaskInsert.setString(4,USER_ID);
				addTaskInsert.setString(5,TaskURLValADD);
				addTaskInsert.executeUpdate();
				addTaskInsert.close();
			   	System.out.println("Inserted successfully into task_master:::::");
			    //*** End of Adding New Task Name into task_master***//
			 
			}
       }
    //*********Edit Part*********//
	if(ActionType.equalsIgnoreCase("2"))
	{
		
		String taskTypeSelelction = request.getParameter("TaskStatusSelelction").trim();
		System.out.println("taskTypeSelelction::::"+taskTypeSelelction);
		String selParentTask = null;
		String ParentTaskIdEdit = "0";
		String selectTaskTypeedit = request.getParameter("selectTaskTypeedit").trim();
				System.out.println("selectTaskTypeedit::::"+selectTaskTypeedit);
				if(selectTaskTypeedit.equalsIgnoreCase("1"))
				{
					selParentTask = request.getParameter("selParentTask").trim();
					System.out.println("selParentTask::::"+selParentTask);
					ParentTaskIdEdit = selParentTask;
				}
				else
				{
					ParentTaskIdEdit = "0";
				}
		//******Insert into task_master_history******//
		String InsertQryTMH = "insert into task_master_history(Task_ID,Task_Description,Pareent_Task_Id,Is_Active,Updated_By,Updated_On,Task_URL) select Task_ID,Task_Description,Pareent_Task_Id,Is_Active,Updated_By,Updated_On,Task_URL from task_master where Task_Id ='"+TaskId+"'";
		System.out.println("Inserted Query into task_master_history::"+InsertQryTMH);
		Statement stmtedit=connection.createStatement();
		stmtedit.execute(InsertQryTMH);
		System.out.println("Inserted Successfully::::task_master_history");
	   
			   	
		//*****Update of task_master*******//
		PreparedStatement programInfoUpdate = null;
		programInfoUpdate =connection.prepareStatement("update task_master set Pareent_Task_Id = ?, Is_Active = ?,Updated_By = ? ,Updated_On = now() where Task_Id = ?");
		programInfoUpdate.setString(1,ParentTaskIdEdit);
		programInfoUpdate.setString(2,taskTypeSelelction);
		programInfoUpdate.setString(3,USER_ID);
		programInfoUpdate.setString(4,TaskId);
		programInfoUpdate.executeUpdate();
		programInfoUpdate.close();
		System.out.println("Update Successfully task_master::::");
	}
  //*********Edit Part*********//
 session.setAttribute("TaskId",TaskId);
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
    parent.location.href= "<%=recruitPath%>jsp/Admin_Manage_Tasks.jsp";
  </script>
  </head>
  
  <body>
    
  </body>
</html>
