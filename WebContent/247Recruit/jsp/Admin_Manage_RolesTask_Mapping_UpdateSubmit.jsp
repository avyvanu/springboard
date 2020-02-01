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
     //*********Edit Part*********//
	if(ActionType.equalsIgnoreCase("2"))
	{
		String DeleteQuery = "";
		PreparedStatement roleTaskInfoUpdate = null;
		PreparedStatement roleTaskInfoChdUpdate = null;
		int counterEdit = Integer.parseInt(request.getParameter("counterForChkEdit"));
		System.out.println("counterEdit:::"+counterEdit);
		for(int i=1;i<counterEdit;i++) 
		 {
			System.out.println("Value of I for Edit Rec Part:::::"+i);
			String UUTMID = request.getParameter("UUTM"+i);
			System.out.println("UUTMID ID"+i+":::::"+UUTMID);
			String UUTMHddID = request.getParameter("UUTMHdd"+i);
			System.out.println("UUTMHddID ID"+i+":::::"+UUTMHddID);
			if(UUTMID == null)
			{
				if(!UUTMHddID.equalsIgnoreCase(""))
				{
					System.out.println("to be deleted entry :::::");
					
					//****Insert into user_type_task_mapping_history****//
					String InsertQryUMH="insert into user_type_task_mapping_history(UTT_Mapping_Id,User_Type_Id,Task_Id,Is_Active,Updated_By,Updated_On) select UTT_Mapping_Id,User_Type_Id,Task_Id,Is_Active,Updated_By,Updated_On from user_type_task_mapping where User_Type_Id='"+RoleID+"' and Task_Id = '"+UUTMHddID+"' ";
					System.out.println("Inserted Query into user_master_history::"+InsertQryUMH);
					Statement stmtedit=connection.createStatement();
					stmtedit.execute(InsertQryUMH);
					System.out.println("Inserted Successfully::::user_master_history");
					
					//****Delete from user_type_task_mapping****//
					DeleteQuery="delete from user_type_task_mapping where User_Type_Id ='"+RoleID+"' and Task_Id = '"+UUTMHddID+"'";
					System.out.println("DeleteQuery for Edit part type masking::"+DeleteQuery);
					Statement DeleteQry = connection.createStatement();
					DeleteQry.executeUpdate(DeleteQuery);
					System.out.println("Deleted Successfully for Edit part from user_type_task_mapping:::");
					
					//****Insert into user_utt_mapping_history****//
					String InsertQryUUMH="insert into user_utt_mapping_history (UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,Updated_On) select uut.UUTT_Id,uut.User_Id,uut.UTT_Mapping_Id,uut.Is_Active,now() from user_utt_mapping uut,user_type_task_mapping uttm where uut.utt_mapping_id = uttm.utt_mapping_id and uttm.task_id = '"+UUTMHddID+"' and User_Type_Id = '"+RoleID+"'";
					System.out.println("Inserted Query into user_utt_mapping_history::"+InsertQryUUMH);
					Statement stmt = connection.createStatement();
					stmt.execute(InsertQryUUMH);
					System.out.println("Inserted Successfully::::user_utt_mapping_history");
					stmt.close();
					
					//****Delete from user_utt_mapping****//
					DeleteQuery="delete from user_utt_mapping using user_utt_mapping, user_type_task_mapping where  user_utt_mapping.utt_mapping_id = user_type_task_mapping.utt_mapping_id and user_type_task_mapping.Task_Id = '"+UUTMHddID+"'  and user_type_task_mapping.user_type_id = '"+RoleID+"'";
					System.out.println("DeleteQuery for Edit part user_utt_mapping::"+DeleteQuery);
					DeleteQry = connection.createStatement();
					DeleteQry.executeUpdate(DeleteQuery);
					System.out.println("Deleted Successfully for Edit part from user_utt_mapping:::");
					
					
				}
			}
			else
			{
				if(UUTMHddID.equalsIgnoreCase(""))
				{
					System.out.println("entry to be addded:::::");
					roleTaskInfoUpdate =connection.prepareStatement("insert into user_type_task_mapping(User_Type_Id,Task_Id,Updated_By,Updated_On) values(?,?,?,now())");
					roleTaskInfoUpdate.setString(1,RoleID);
					roleTaskInfoUpdate.setString(2,UUTMID);
					roleTaskInfoUpdate.setString(3,USER_ID);
					roleTaskInfoUpdate.executeUpdate();
					roleTaskInfoUpdate.close();
					System.out.println("Inserted Successfully user_type_task_mapping::::");
				}
			}
			int counterForChkCHd = Integer.parseInt(request.getParameter("counterForChdEdit"+i));
			System.out.println("counterForChkCHd"+counterForChkCHd);
			for(int k=1; k < counterForChkCHd;k++)
				 {
					 String UTTMIDChd = request.getParameter("UTTM"+i+"Chd"+k);
					 System.out.println("UTTM"+i+"Chd"+k+"::::::"+UTTMIDChd);
					 String UUTMHddChdID = request.getParameter("UTTMHdd"+i+"Chd"+k);
					 System.out.println("UUTMHddChdID ID"+i+":::::"+UUTMHddChdID);
					 if(UTTMIDChd == null)
						{
							if(!UUTMHddChdID.equalsIgnoreCase(""))
							 {
								System.out.println("to be deleted entry for child:::::");
								
								//****Insert into user_type_task_mapping_history****//
								String InsertQryUMH="insert into user_type_task_mapping_history(UTT_Mapping_Id,User_Type_Id,Task_Id,Is_Active,Updated_By,Updated_On) select UTT_Mapping_Id,User_Type_Id,Task_Id,Is_Active,Updated_By,Updated_On from user_type_task_mapping where User_Type_Id='"+RoleID+"' and Task_Id = '"+UUTMHddChdID+"' ";
								System.out.println("Inserted Query into user_master_history::"+InsertQryUMH);
								Statement stmtedit=connection.createStatement();
								stmtedit.execute(InsertQryUMH);
								System.out.println("Inserted Successfully::::user_master_history");
								
								//****Delete from user_type_task_mapping****//
								DeleteQuery="delete from user_type_task_mapping where User_Type_Id ='"+RoleID+"' and Task_Id = '"+UUTMHddChdID+"'";
								System.out.println("DeleteQuery for Edit part type masking::"+DeleteQuery);
								Statement DeleteQryChd = connection.createStatement();
								DeleteQryChd.executeUpdate(DeleteQuery);
								System.out.println("Deleted Successfully for Edit part from user_type_task_mapping:::");
								
									//****Insert into user_utt_mapping_history****//
								String InsertQryUUMH="insert into user_utt_mapping_history (UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,Updated_On) select uut.UUTT_Id,uut.User_Id,uut.UTT_Mapping_Id,uut.Is_Active,now() from user_utt_mapping uut,user_type_task_mapping uttm where uut.utt_mapping_id = uttm.utt_mapping_id and uttm.task_id = '"+UUTMHddChdID+"' and User_Type_Id = '"+RoleID+"'";
								System.out.println("Inserted Query into user_utt_mapping_history::"+InsertQryUUMH);
								Statement stmt = connection.createStatement();
								stmt.execute(InsertQryUUMH);
								System.out.println("Inserted Successfully::::user_utt_mapping_history");
								stmt.close();
								
								//****Delete from user_utt_mapping****//
								DeleteQuery="delete from user_utt_mapping using user_utt_mapping, user_type_task_mapping where  user_utt_mapping.utt_mapping_id = user_type_task_mapping.utt_mapping_id and user_type_task_mapping.Task_Id = '"+UUTMHddChdID+"'  and user_type_task_mapping.user_type_id = '"+RoleID+"'";
								System.out.println("DeleteQuery for Edit part user_utt_mapping::"+DeleteQuery);
								DeleteQryChd = connection.createStatement();
								DeleteQryChd.executeUpdate(DeleteQuery);
								System.out.println("Deleted Successfully for Edit part from user_utt_mapping:::");
								
								
							 }	
						}
					else
					{
						if(UUTMHddChdID.equalsIgnoreCase(""))
						{
							System.out.println("entry to be addded for child:::::");
							roleTaskInfoChdUpdate =connection.prepareStatement("insert into user_type_task_mapping(User_Type_Id,Task_Id,Updated_By,Updated_On) values(?,?,?,now())");
							roleTaskInfoChdUpdate.setString(1,RoleID);
							roleTaskInfoChdUpdate.setString(2,UTTMIDChd);
							roleTaskInfoChdUpdate.setString(3,USER_ID);
							roleTaskInfoChdUpdate.executeUpdate();
							roleTaskInfoChdUpdate.close();
							System.out.println("Inserted Successfully user_type_task_mapping::::");
						}
					}
				}
		     }
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
    parent.location.href= "<%=recruitPath%>jsp/Admin_Manage_RolesTask_Mapping.jsp";
  </script>
  </head>
  
  <body>
    
  </body>
</html>
