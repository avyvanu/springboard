<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%@page import="util.*" %>
<%@ include file="GlobalDeclare.jsp" %>
<%
Connection connection= null;		
String Emp_ID = (String) session.getAttribute("EmpUserId");
System.out.println("Emp_ID"+Emp_ID);
int EmpUserAutoId = (Integer)session.getAttribute("EmpUserAutoId");
if(EmpUserAutoId == 0)
  	{
  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
  	}
System.out.println("EmpUserAutoId::"+EmpUserAutoId);
String ActionType =request.getParameter("ActionType");
System.out.println("Action Type Id::"+ActionType);
String USER_ID = (String)session.getAttribute("USER_ID");
if(USER_ID == null)
  	{
  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
  	}
System.out.println("USER_ID:::::"+USER_ID);
PreparedStatement userInfoUpdate = null;
PreparedStatement roleTaskInfoUpdate = null;
PreparedStatement roleTaskInfoChdUpdate = null;
String username1="247RecruitmentIS@247customer.com";
String password1="123456@abc";
 CallableStatement pwResetproc=null;				
try
 {
 
   connection=ConnectDatabase.getConnection();		
   if(ActionType.equals("1"))
		{
		    String EmailId =  request.getParameter("employeeemailid").trim();
			System.out.println("EmailId::::"+EmailId);
			String Phone =  request.getParameter("employeephone").trim();
			System.out.println("Phone::::"+Phone);
			String EmpidQry="SELECT  * FROM user_master where Emp_email = '"+EmailId+"' or Emp_Mobile_No = '"+Phone+"'";
			System.out.println("Emp Query"+EmpidQry);
			Statement stEmpid = connection.createStatement();
			ResultSet rsEmpid = stEmpid.executeQuery(EmpidQry);
			boolean state=rsEmpid.next();
		if(state==true)
		 {
			%>
			<script type="text/javascript" language="javascript">
			    alert("User Already Exists with mentioned Phone and Email!"); 
			   parent.location.href= "<%=recruitPath%>jsp/Manage_CCA_Resource.jsp";
			</script>
			<%
	    }
		else
		{  
		    ResultSet rsemployeeid = null;
		    String EmployeeId = "";
		    String EmployeeName = request.getParameter("employeename").trim();
			System.out.println("EmployeeName::::"+EmployeeName);
		    String Programid = request.getParameter("programid").trim();
			System.out.println("Programid::::"+Programid);
			String subprogramid = request.getParameter("subprogramid").trim();
			System.out.println("subprogramid::::"+subprogramid);
			int CentreId = Integer.parseInt(request.getParameter("location"));
			System.out.println("CentreId::::"+CentreId);
			String SendAlerts = request.getParameter("AlertsRequiredAdd").trim();
			System.out.println("SendAlerts::::"+SendAlerts);
			String UserStateAdd = request.getParameter("UserStateAdd").trim();
			System.out.println("UserStateAdd::::"+UserStateAdd);
			
			String UserTypeIdAdd = request.getParameter("UserTypesId").trim();
			System.out.println("UserTypeIdAdd:::::::"+UserTypeIdAdd);
			String pwGen = GenerateCCAPassword.getCCAPassword();
			System.out.println("pwGen::::::"+pwGen);
			CallableStatement addUserInsert = null;
			addUserInsert = connection.prepareCall("{call CCAResourceInsert_Proc(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			addUserInsert.setInt(1,CentreId);
			addUserInsert.setString(2,pwGen);
			addUserInsert.setString(3,EmployeeName);
			addUserInsert.setString(4,UserTypeIdAdd);
			addUserInsert.setString(5,EmailId);
			addUserInsert.setString(6,Phone);
			addUserInsert.setString(7,Programid);
			addUserInsert.setString(8,subprogramid);
			addUserInsert.setString(9,SendAlerts);
			addUserInsert.setString(10,UserStateAdd);
			addUserInsert.setString(11,USER_ID);
			addUserInsert.setString(12,"[24]7");
			addUserInsert.setString(13,EDKPass);
			rsemployeeid = addUserInsert.executeQuery();
			if(rsemployeeid.next())
			{
			EmployeeId = rsemployeeid.getString("Emp_Id");
			System.out.println("EmployeeId:::::Created"+EmployeeId);
			}
			addUserInsert.close();
			System.out.println("Inserted Successfully into user_master::::");
		        
	        int UserIdGenerated=0;
			String QueryUserId="select User_Id from user_master where Emp_ID='" + EmployeeId + "'";
			System.out.println("QueryUserId:::"+QueryUserId);
	        Statement stmtUserId=connection.createStatement();
	        ResultSet rsUserId=stmtUserId.executeQuery(QueryUserId);
	        if(rsUserId.next())
	        {
	        UserIdGenerated=rsUserId.getInt("User_Id");
	        System.out.println("UserIdGenerated"+UserIdGenerated);
	        }
		   
			    if(UserTypeIdAdd.equalsIgnoreCase("2"))   
		    {  
		      int LNDcounter = Integer.parseInt(request.getParameter("LNDCountValueAdduser"));
		      for(int i=1;i<LNDcounter;i++) 
		      {
			    System.out.println("Value of I:::::"+i);
				String UUTID = request.getParameter("UUTADDLND"+i);
				System.out.println("UUT ID"+UUTID);
				int LNDcounterChd = Integer.parseInt(request.getParameter("LNDCountValueAdduser"+i));
				 if(UUTID!=null)
				   {
					roleTaskInfoUpdate = connection.prepareStatement("insert into user_utt_mapping(User_Id,UTT_Mapping_Id) values(?,?)");
					roleTaskInfoUpdate.setInt(1,UserIdGenerated);
					roleTaskInfoUpdate.setString(2,UUTID);
					roleTaskInfoUpdate.executeUpdate();
					roleTaskInfoUpdate.close();
					System.out.println("Inserted Successfully user_utt_mapping::::");
					for(int k=1; k < LNDcounterChd;k++)
					 {
						 String UUTIDChd = request.getParameter("UUTADDLND"+i+"Chd"+k);
						 System.out.println("UUTADD"+i+"Chd"+k+"::::::"+UUTIDChd);
						 if(UUTIDChd != null)
						 {
						 	roleTaskInfoChdUpdate =connection.prepareStatement("insert into user_utt_mapping(User_Id,UTT_Mapping_Id) values(?,?)");
							roleTaskInfoChdUpdate.setInt(1,UserIdGenerated);
							roleTaskInfoChdUpdate.setString(2,UUTIDChd);
							roleTaskInfoChdUpdate.executeUpdate();
							roleTaskInfoChdUpdate.close();
							System.out.println("Inserted Successfully for CHD user_utt_mapping::::");
						 }
					  }
					System.out.println("Inserted successfully:::::");   
			      }
		      }  
		   }
			    String msg=new String();
			    msg="<HTML><BODY>Hi "+EmployeeName+",<br/><br/>Your Id has been created successfully .<br/><br/><b>Id:</b>&nbsp;"+EmployeeId+"<br/><b>Password:</b>&nbsp;"+pwGen+"<br/><br/>Regards,<br/>Team [24]7</BODY></HTML>";
				String subject="[24]7 User-Id Created";
				if(EmailId.length() != 0)
				{
					EmailDemo.sendMailNew(username1,password1,EmailId,msg,subject);
				}
			   if(Phone.length() != 0)
	            {
		            SMSFunction.sendSMSCCA(Phone,pwGen,EmployeeId);
	            }
		}
    }
  if(ActionType.equalsIgnoreCase("2"))
	 {
		String SendAlertsEdit = request.getParameter("AlertsRequired").trim();
		System.out.println("SendAlertsEdit::::"+SendAlertsEdit);
		String UserStateEdit = request.getParameter("UserState").trim();
		System.out.println("UserStateEdit::::"+UserStateEdit);
		String UserTypesIdEdit = (String) request.getParameter("UserTypesId");
		System.out.println("UserTypesIdEdit"+UserTypesIdEdit);
		
		String InsertQryUMH="insert into user_master_history(User_Id,Centre_Id,Emp_ID,Emp_password,Emp_Name,User_Type_Id,Emp_email,Emp_Mobile_No,Program_Id,SubProgram_Id,SendAlerts,Is_Active,Is_Deleted,Updated_By,Updated_On) select * from user_master where Emp_ID='"+Emp_ID+"'";
		System.out.println("Inserted Query into user_master_history::"+InsertQryUMH);
		Statement stmtedit=connection.createStatement();
		stmtedit.execute(InsertQryUMH);
		System.out.println("Inserted Successfully::::user_master_history");
		
		userInfoUpdate =connection.prepareStatement("update user_master set User_Type_Id = ?,SendAlerts = ?,Is_Active = ?,Updated_By = ? ,Updated_On = now() where Emp_ID= ?");
		userInfoUpdate.setString(1,UserTypesIdEdit);
		userInfoUpdate.setString(2,SendAlertsEdit);
		userInfoUpdate.setString(3,UserStateEdit);
		userInfoUpdate.setString(4,USER_ID);
		userInfoUpdate.setString(5,Emp_ID);
		userInfoUpdate.executeUpdate();
		userInfoUpdate.close();
		System.out.println("Update Successfully::::");
		
		Statement stmt=connection.createStatement();
		String DeleteQuery="";
			if(UserTypesIdEdit.equalsIgnoreCase("2"))  
			   { 
					//****Insert into user_utt_mapping_history****//
					String InsertQryUUMH="insert into user_utt_mapping_history(UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,Updated_On) select *,now() from user_utt_mapping where User_ID ="+EmpUserAutoId+"";
					System.out.println("Inserted Query into user_utt_mapping_history::"+InsertQryUUMH);
					stmt=connection.createStatement();
					stmt.execute(InsertQryUUMH);
					System.out.println("Inserted Successfully::::user_utt_mapping_history");
					stmt.close();
					
					
					DeleteQuery="delete from user_utt_mapping using user_utt_mapping, user_type_task_mapping where  user_utt_mapping.utt_mapping_id = user_type_task_mapping.utt_mapping_id and user_utt_mapping.User_Id = '"+EmpUserAutoId+"' and user_type_task_mapping.user_type_id = '"+UserTypesIdEdit+"'";
					System.out.println("DeleteQuery for Edit part::"+DeleteQuery);
					Statement DeleteQry = connection.createStatement();
					DeleteQry.executeUpdate(DeleteQuery);
					System.out.println("Deleted Successfully for Edit part from user_utt_mapping:::");
					
					//****Insert into user_program_mapping_history****//
					String InsertQryUPMH="insert into user_program_mapping_history(UP_Mapping_Id,User_Id,Program_Id,Is_Active,Updated_On) select *,now() from user_program_mapping where User_ID ="+EmpUserAutoId+"";
					System.out.println("Inserted Query into user_program_mapping_history::"+InsertQryUPMH);
					stmt=connection.createStatement();
					stmt.execute(InsertQryUPMH);
					System.out.println("Inserted Successfully::::user_program_mapping_history");
				    stmt.close();
				    
					String DeleteQueryUPM="delete from user_program_mapping where User_Id='"+EmpUserAutoId+"'";
					System.out.println("DeleteQuery for Edit part DeleteQueryUPM::"+DeleteQueryUPM);
					Statement DeleteQryUPM = connection.createStatement();
					DeleteQryUPM.executeUpdate(DeleteQueryUPM);
					System.out.println("Deleted Successfully for Edit part from user_program_mapping:::");
			   }
			 
         
          // Edit part:::For L & D adding Accessing Field: Checkbox::::://
		  if(UserTypesIdEdit.equalsIgnoreCase("2"))   
		   { 
		   int LNDcounterEdit = Integer.parseInt(request.getParameter("LNDCountValue"));
		   System.out.println("L & D counter for Edit part:::"+LNDcounterEdit);
		    for(int i=1;i<LNDcounterEdit;i++) 
			    {
			    System.out.println("Value of I for Edit L & D Part:::::"+i);
				String UUTID = request.getParameter("UUTLNDEdit"+i);
				System.out.println("UUTID ID"+UUTID);
				int LNDcounterEditChd = Integer.parseInt(request.getParameter("LNDCountValue"+i));
				System.out.println("LNDcounterEditChd counter Chd for Edit part:::"+LNDcounterEditChd);
					if(UUTID!=null)
					{
					roleTaskInfoUpdate =connection.prepareStatement("insert into user_utt_mapping(User_Id,UTT_Mapping_Id) values(?,?)");
					roleTaskInfoUpdate.setInt(1,EmpUserAutoId);
					roleTaskInfoUpdate.setString(2,UUTID);
					roleTaskInfoUpdate.executeUpdate();
					roleTaskInfoUpdate.close();
					System.out.println("Inserted Successfully user_utt_mapping::::");
					for(int k=1; k < LNDcounterEditChd;k++)
						 {
							 String UUTIDChd = request.getParameter("UUTLNDEdit"+i+"Chd"+k);
							 System.out.println("UUT"+i+"Chd"+k+"::::::"+UUTIDChd);
							 if(UUTIDChd != null)
							 {
							 	roleTaskInfoChdUpdate =connection.prepareStatement("insert into user_utt_mapping(User_Id,UTT_Mapping_Id) values(?,?)");
								roleTaskInfoChdUpdate.setInt(1,EmpUserAutoId);
								roleTaskInfoChdUpdate.setString(2,UUTIDChd);
								roleTaskInfoChdUpdate.executeUpdate();
								roleTaskInfoChdUpdate.close();
								System.out.println("Inserted Successfully for CHD user_utt_mapping::::");
							 }
						}
				    }
		        }
		        System.out.println("Finally:::Inserted successfully for Edit L & D part Chk Box:::::"); 
		   } 
	 }  
  
  
    
    
//*****Delete part of User***//
	 Statement stmt=connection.createStatement();
	if(ActionType.equalsIgnoreCase("3"))
	 {
		
		String UserTypeIddelete = request.getParameter("UserTypeIdInitial");
		System.out.println("deleteUserTypeId::::"+UserTypeIddelete);
		String deleteCommentstxt = request.getParameter("deleteComments").trim();
		System.out.println("deleteCommentstxt::::"+deleteCommentstxt);
		String Emp_Id = request.getParameter("empid");
		System.out.println("Emp_Id::::"+Emp_Id);
		String DeleteQueryUUMH="";
		String DeleteQueryUPMH="";
		
		if(UserTypeIddelete.equalsIgnoreCase("2"))  
		   { 
				//****Insert into user_utt_mapping_history****//
				String InsertQryUUMH="insert into user_utt_mapping_history(UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,Updated_On) select *,now() from user_utt_mapping where User_ID ="+EmpUserAutoId+"";
				System.out.println("Inserted Query into user_utt_mapping_history::"+InsertQryUUMH);
				stmt.execute(InsertQryUUMH);
				System.out.println("Inserted Successfully::::user_utt_mapping_history");
				
				//****Delete from  user_utt_mapping****//
				DeleteQueryUUMH="delete from user_utt_mapping using user_utt_mapping, user_type_task_mapping where  user_utt_mapping.utt_mapping_id = user_type_task_mapping.utt_mapping_id and user_utt_mapping.User_Id = '"+EmpUserAutoId+"' and user_type_task_mapping.user_type_id = '"+UserTypeIddelete+"'";
				System.out.println("DeleteQuery for Delete part::"+DeleteQueryUUMH);
				Statement DeleteQry = connection.createStatement();
				DeleteQry.executeUpdate(DeleteQueryUUMH);
				System.out.println("Deleted Successfully for Delete part from user_utt_mapping:::");
			 }
		   
		String InsertQryUMH="insert into user_master_history(User_Id,Centre_Id,Emp_ID,Emp_password,Emp_Name,User_Type_Id,Emp_email,Emp_Mobile_No,Program_Id,SubProgram_Id,SendAlerts,Is_Active,Is_Deleted,Updated_By,Updated_On,Deleted_Reason,Deleted_By,Deleted_On) select *,'"+deleteCommentstxt+"','"+USER_ID+"',now() from user_master where Emp_ID='"+Emp_ID+"'";
		System.out.println("Inserted Query into user_master_history::"+InsertQryUMH);
		Statement stmtInsertUMH = connection.createStatement();
		stmtInsertUMH.execute(InsertQryUMH);
		System.out.println("Inserted Successfully::::user_master_history");
		
		userInfoUpdate =connection.prepareStatement("update user_master set Is_Deleted = ?,Updated_By = ?,Updated_On = now() where Emp_ID= ?");
		userInfoUpdate.setInt(1,1);
		userInfoUpdate.setString(2,USER_ID);
		userInfoUpdate.setString(3,Emp_ID);
		userInfoUpdate.executeUpdate();
		userInfoUpdate.close();
		System.out.println("Update Successfully user_master::::");
	
	}
	 if(ActionType.equals("4"))
		{
			System.out.println("Emp_ID::"+Emp_ID);
			String EmployeeName = (String)session.getAttribute("EmployeeName");
			if(EmployeeName == null)
			  	{
			  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
			  	}
			System.out.println("EmployeeName::"+EmployeeName);
			String EmpEmail = (String)session.getAttribute("EmpEmail");
			if(EmpEmail == null)
			  	{
			  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
			  	}
			System.out.println("EmpEmail::"+EmpEmail);
			String EmpPhone = (String)session.getAttribute("EmpPhone");
			if(EmpPhone == null)
			  	{
			  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
			  	}
			System.out.println("EmpPhone::"+EmpPhone);
			String pwGenReset = GenerateCCAPassword.getCCAPassword();
			System.out.println("pwGenReset::::::"+pwGenReset);
			try
			    {
				  String EDKeyCCA = "[24]7";
				  connection= ConnectDatabase.getConnection();
				  pwResetproc = connection.prepareCall("{ call CCA_PWReset_Proc(?,?,?,?)}");
				  pwResetproc.setString(1, Emp_ID);
				  pwResetproc.setString(2, pwGenReset);
				  pwResetproc.setString(3, EDKeyCCA);
				  pwResetproc.setString(4, EDKPass);
				  pwResetproc.execute();
				  pwResetproc.close();
				  System.out.println("Update  sucessfully");
				  
				  PreparedStatement pwResetInsert_Proc=connection.prepareStatement("insert into CCA_pwreset_change(CCA_ID, Updated_By) values(?,?)");
				  pwResetInsert_Proc.setString(1, Emp_ID);
				  pwResetInsert_Proc.setString(2, USER_ID);
				  pwResetInsert_Proc.executeUpdate();
				  pwResetInsert_Proc.close();
				  System.out.println("Inserted  sucessfully");
			   }
			catch(Exception ex)
			 {
			  ex.printStackTrace();
			 }
			String msg=new String();
		    msg="<HTML><BODY>Hi "+EmployeeName+",<br/><br/>Your password has been created reset .<br/><br/><b>Id:</b>&nbsp;"+Emp_ID+"<br/><b>Password:</b>&nbsp;"+pwGenReset+"<br/><br/>Regards,<br/>Team [24]7</BODY></HTML>";
			String subject="[24]7 Password Reset";
			if(EmpEmail.length() != 0)
			{
				EmailDemo.sendMailNew(username1,password1,EmpEmail,msg,subject);
			}
		   if(EmpPhone.length() != 0)
            {
	            SMSFunction.sendSMSPWReset(EmpPhone,pwGenReset,Emp_ID);
            }
		}
	session.setAttribute("EmpUserId",Emp_ID);
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
    parent.location.href= "<%=recruitPath%>jsp/Manage_CCA_Resource.jsp";

  </script>
  </head>
  
  <body>
    
  </body>
</html>
