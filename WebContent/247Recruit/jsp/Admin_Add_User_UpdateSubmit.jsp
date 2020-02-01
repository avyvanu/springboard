<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%@page import="util.*" %>
<%@ include file="GlobalDeclare.jsp" %>
<%

Connection connection=ConnectDatabase.getConnection();		
String Emp_ID = (String) session.getAttribute("EmpUserId");
System.out.println("Emp_ID::"+Emp_ID);
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
System.out.println("USER_ID"+USER_ID);
int USER_AUTOID = (Integer) session.getAttribute("USER_AUTOID");
if(USER_AUTOID == 0)
  	{
  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
  	}
System.out.println("USER_AUTOID"+USER_AUTOID);
String IsSAdmin = ((String)session.getAttribute("IsSAdmin")).trim();
if(IsSAdmin == null)
{
	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
}
session.setAttribute("IsSAdmin",IsSAdmin);
System.out.println("IsSAdmin in home page::::"+IsSAdmin);  	

PreparedStatement userInfoUpdate = null;
PreparedStatement roleTaskInfoUpdate = null;
PreparedStatement roleTaskInfoChdUpdate = null;
PreparedStatement opsProgramUpdate = null;

try 
 {
   if(ActionType.equals("1"))
		{
			String Programid = request.getParameter("programname").trim();
			System.out.println("Programid::::"+Programid);
			String subprogramid = request.getParameter("subprogramname").trim();
			System.out.println("subprogramid::::"+subprogramid);
			String EmployeeId = request.getParameter("EmployeelistDDL").trim();
			System.out.println("EmployeeId::::"+EmployeeId);
			String EmpidQry="SELECT  Emp_Id,User_Id FROM user_master where Emp_ID='"+EmployeeId+"'";
			System.out.println("Emp Query"+EmpidQry);
			Statement stEmpid = connection.createStatement();
			ResultSet rsEmpid = stEmpid.executeQuery(EmpidQry);
			boolean state=rsEmpid.next();
		if(state==true)
			{
			%>
			<script type="text/javascript" language="javascript">
			    alert("User Already Exists !"); 
			   parent.location.href= "<%=recruitPath%>jsp/Admin_Add_User.jsp";
			</script>
			<%
		   }
		else
		{	
			String SendAlerts = request.getParameter("AlertsRequiredAdd").trim();
			System.out.println("SendAlerts::::"+SendAlerts);
			String UserStateAdd = request.getParameter("UserStateAdd").trim();
			System.out.println("UserStateAdd::::"+UserStateAdd);
			String EmployeeName=null;
			String CenterName=null;
			String EmailId=null;
			String qry = "select * from employee_information where CandidateId='"+EmployeeId+"'";
			System.out.println("Query"+qry);
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(qry);
			if(rs.next())
			{
			    EmployeeName=rs.getString("EmpFullName");
				EmailId=rs.getString("EmailId");
				CenterName=rs.getString("CenterName").trim();
			}
		int CentreId;
			if(CenterName.equalsIgnoreCase("Bangalore"))
			{
				CentreId=1;
			}
			else if(CenterName.equalsIgnoreCase("Hyderabad")||CenterName.equalsIgnoreCase("Hyderabad - Unit 1")||CenterName.equalsIgnoreCase("Hyderabad - Unit 2"))
			{
				CentreId=2;
			}
			else
			{
				CentreId=0;
			}
			String UserTypeIdAdd = request.getParameter("UserTypesIdAddUser").trim();
			System.out.println("UserTypeIdAdd:::::::"+UserTypeIdAdd);
			String Phone = request.getParameter("employeephone").trim();
			PreparedStatement addUserInsert = null;
			addUserInsert = connection.prepareStatement("insert into user_master(Centre_Id,Emp_ID,Emp_Name,User_Type_Id,Emp_email,Emp_Mobile_No,Program_Id,SubProgram_Id,SendAlerts,Is_Active,Updated_By,Updated_On) values(?,?,?,?,?,?,?,?,?,?,?,now())");
			addUserInsert.setInt(1,CentreId);
			addUserInsert.setString(2,EmployeeId);
			addUserInsert.setString(3,EmployeeName);
			addUserInsert.setString(4,UserTypeIdAdd);
			addUserInsert.setString(5,EmailId);
			addUserInsert.setString(6,Phone);
			addUserInsert.setString(7,Programid);
			addUserInsert.setString(8,subprogramid);
			addUserInsert.setString(9,SendAlerts);
			addUserInsert.setString(10,UserStateAdd);
			addUserInsert.setString(11,USER_ID);
			addUserInsert.executeUpdate();
			addUserInsert.close();
			System.out.println("Inserted Successfully into user_master::::");
		
			int UserIdGenerated = 0;
			String QueryUserId="select User_Id from user_master where Emp_ID='" + EmployeeId + "'";
			System.out.println("QueryUserId:::"+QueryUserId);
		        Statement stmtUserId=connection.createStatement();
		        ResultSet rsUserId=stmtUserId.executeQuery(QueryUserId);
		        if(rsUserId.next())
		        {
		        UserIdGenerated = rsUserId.getInt("User_Id");
		        System.out.println("UserId"+UserIdGenerated);
		        }
		   
		   if(UserTypeIdAdd.equalsIgnoreCase("1"))   
		    { 
		        int Reccounter = Integer.parseInt(request.getParameter("RecCountValueAdduser"));
		        for(int i=1;i<Reccounter;i++) 
			    {
			    System.out.println("Value of I:::::"+i);
				String UUTID = request.getParameter("UUTADDRec"+i);
				System.out.println("UUTADD ID"+UUTID);
				int ReccounterChd = Integer.parseInt(request.getParameter("RecCountValueAdduser"+i));
				System.out.println("ReccounterChd:::::"+ReccounterChd);
				
					if(UUTID!=null)
					{
						roleTaskInfoUpdate = connection.prepareStatement("insert into user_utt_mapping(User_Id,UTT_Mapping_Id) values(?,?)");
						roleTaskInfoUpdate.setInt(1,UserIdGenerated);
						roleTaskInfoUpdate.setString(2,UUTID);
						roleTaskInfoUpdate.executeUpdate();
						roleTaskInfoUpdate.close();
						System.out.println("Inserted Successfully user_utt_mapping::::");
						for(int k=1; k < ReccounterChd;k++)
						 {
							 String UUTIDChd = request.getParameter("UUTADDRec"+i+"Chd"+k);
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
					}
		        }
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
		   if(UserTypeIdAdd.equalsIgnoreCase("4"))   
		    {  
		      int HRopscounter = Integer.parseInt(request.getParameter("HROpsCountValueAdduser"));
		      System.out.println("Value of HRopscounter:::::"+HRopscounter);
		      for(int i=1;i<HRopscounter;i++) 
		      {
			    System.out.println("Value of I:::::"+i);
				String UUTID = request.getParameter("UUTADDHROps"+i);
				int HRopscounterChd = Integer.parseInt(request.getParameter("HROpsCountValueAdduser"+i));
				System.out.println("UUT ID"+UUTID);
				 if(UUTID!=null)
				   	{
						roleTaskInfoUpdate = connection.prepareStatement("insert into user_utt_mapping(User_Id,UTT_Mapping_Id) values(?,?)");
						roleTaskInfoUpdate.setInt(1,UserIdGenerated);
						roleTaskInfoUpdate.setString(2,UUTID);
						roleTaskInfoUpdate.executeUpdate();
						roleTaskInfoUpdate.close();
						System.out.println("Inserted Successfully user_utt_mapping::::");
						for(int k=1; k < HRopscounterChd;k++)
					 	{
						 String UUTIDChd = request.getParameter("UUTADDHROps"+i+"Chd"+k);
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
		   	if(UserTypeIdAdd.equalsIgnoreCase("5"))   
		    {  
		      int Viewercounter = Integer.parseInt(request.getParameter("ViewerCountValueAdduser"));
		      System.out.println("Value of Viewercounter:::::"+Viewercounter);
		      for(int i=1;i<Viewercounter;i++) 
		      {
			    System.out.println("Value of I:::::"+i);
				String UUTID = request.getParameter("UUTADDViewer"+i);
				int HRopscounterChd = Integer.parseInt(request.getParameter("ViewerCountValueAdduser"+i));
				System.out.println("UUT ID"+UUTID);
				 if(UUTID!=null)
				   	{
						roleTaskInfoUpdate = connection.prepareStatement("insert into user_utt_mapping(User_Id,UTT_Mapping_Id) values(?,?)");
						roleTaskInfoUpdate.setInt(1,UserIdGenerated);
						roleTaskInfoUpdate.setString(2,UUTID);
						roleTaskInfoUpdate.executeUpdate();
						roleTaskInfoUpdate.close();
						System.out.println("Inserted Successfully user_utt_mapping::::");
						for(int k=1; k < HRopscounterChd;k++)
					 	{
						 String UUTIDChd = request.getParameter("UUTADDViewer"+i+"Chd"+k);
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
			   if(UserTypeIdAdd.equalsIgnoreCase("3"))   
			    {
				   String allProgramChk = null;
				   if(IsSAdmin.equalsIgnoreCase("Yes"))
			        {
			        	allProgramChk = request.getParameter("accessToProgramAdd");
			        	System.out.println("allProgramChk:::::"+allProgramChk);
			        }
				   int OpscounterAdd = Integer.parseInt(request.getParameter("OpsCountValueAdduser"));
				  	System.out.println("Ops counter for Add part:::"+OpscounterAdd);
				  	 for(int i=1;i < OpscounterAdd;i++) 
					    {
						   System.out.println("Value of I for Add Ops Part:::::"+i);
						   String UUTID = request.getParameter("UUTADDOps"+i);
						   System.out.println("UUTADD ID"+UUTID);
						   int OpscounterAddChd = Integer.parseInt(request.getParameter("OpsCountValueAdduser"+i));
						   System.out.println("Ops counter Chd for add part:::"+OpscounterAddChd);
							if(UUTID!=null)
							{
							    roleTaskInfoUpdate =connection.prepareStatement("insert into user_utt_mapping(User_Id,UTT_Mapping_Id) values(?,?)");
								roleTaskInfoUpdate.setInt(1,UserIdGenerated);
								roleTaskInfoUpdate.setString(2,UUTID);
								roleTaskInfoUpdate.executeUpdate();
								roleTaskInfoUpdate.close();
								System.out.println("Inserted Successfully user_utt_mapping::::");
								
							   for(int k=1; k < OpscounterAddChd;k++)
								 {
									 String UUTIDChd = request.getParameter("UUTADDOps"+i+"Chd"+k);
									 System.out.println("UUTADDOps"+i+"Chd"+k+"::::::"+UUTIDChd);
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
						    }
			            }
			        if(allProgramChk != null)
			        {
			        	opsProgramUpdate =connection.prepareStatement("insert into user_program_mapping(User_Id,Program_Id,Is_Active) values(?,?,?)");
						opsProgramUpdate.setInt(1,UserIdGenerated);
						opsProgramUpdate.setString(2,allProgramChk);
						opsProgramUpdate.setInt(3,1);
						opsProgramUpdate.executeUpdate();
						opsProgramUpdate.close();
						System.out.println("Inserted Successfully for CHD user_program_mapping::::");
			        }
			       else
			       {
					String[] SelectedValuesEdit = request.getParameterValues("ToLB");
						if(SelectedValuesEdit != null)
						{
							System.out.println("SelectedValuesEdit.length"+SelectedValuesEdit.length);
							for(int iops = 0; iops < SelectedValuesEdit.length; iops++)
							{
								System.out.println("SelectedValuesEdit"+SelectedValuesEdit[iops]);
								opsProgramUpdate =connection.prepareStatement("insert into user_program_mapping(User_Id,Program_Id,Is_Active) values(?,?,?)");
								opsProgramUpdate.setInt(1,UserIdGenerated);
								opsProgramUpdate.setString(2,SelectedValuesEdit[iops]);
								opsProgramUpdate.setInt(3,1);
								opsProgramUpdate.executeUpdate();
								opsProgramUpdate.close();
								System.out.println("Inserted Successfully for CHD user_program_mapping::::");
					       }
				        } 
			       }   
		            System.out.println("Finally::::Inserted successfully for Add Operations part Chk Box:::::");
				} 
		rs.close();
		st.close();
		}
    }

	if(ActionType.equalsIgnoreCase("2"))
	{
		String SendAlertsEdit = request.getParameter("AlertsRequired").trim();
		System.out.println("SendAlertsEdit::::"+SendAlertsEdit);
		String UserStateEdit = request.getParameter("UserState").trim();
		System.out.println("UserStateEdit::::"+UserStateEdit);
		String UserTypesIdEdit = "";
		String UserTypeIdInitial = (String) request.getParameter("UserTypeIdInitial");
		System.out.println("UserTypeIdInitial::::"+UserTypeIdInitial);
		String IsAllprograms = (String) request.getParameter("IsAllprograms");
		System.out.println("IsAllprograms::::"+IsAllprograms);
		String User_AllPrgmsAccess = (String) request.getParameter("User_AllPrgmsAccess");
		System.out.println("User_AllPrgmsAccess::::"+User_AllPrgmsAccess);
		int UserPrgmAccessState = 0;
		if(User_AllPrgmsAccess.equalsIgnoreCase("true"))
		{
			UserPrgmAccessState = 1;
		}
		else
		{
			UserPrgmAccessState = 0;
		}
		System.out.println("UserPrgmAccessState::::"+UserPrgmAccessState);
		String allProgramChkEdit = null;
		if(IsSAdmin.equalsIgnoreCase("Yes"))
			{
				UserTypesIdEdit = (String) request.getParameter("UserTypesId");
				allProgramChkEdit = request.getParameter("accessToProgram");
			    System.out.println("allProgramChkEdit:::::"+allProgramChkEdit);
			}
		else
			{
				UserTypesIdEdit = UserTypeIdInitial;
			}
		System.out.println("UserTypesIdEdit::::"+UserTypesIdEdit);
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
		Statement stmt = connection.createStatement();
		String DeleteQuery="";
		
		if(!UserTypesIdEdit.equalsIgnoreCase(UserTypeIdInitial))
		 {
			System.out.println("Change in User Type::::");
			if(IsSAdmin.equalsIgnoreCase("Yes"))
				{
					
					//****Insert into user_utt_mapping_history****//
					String InsertQryUUMH="insert into user_utt_mapping_history(UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,Updated_On) select UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,now() from user_utt_mapping where User_ID ="+EmpUserAutoId+"";
					System.out.println("Inserted Query into user_utt_mapping_history::"+InsertQryUUMH);
					stmt=connection.createStatement();
					stmt.execute(InsertQryUUMH);
					System.out.println("Inserted Successfully::::user_utt_mapping_history");
					stmt.close();
					
					//DeleteQuery="delete from user_utt_mapping where User_Id='"+EmpUserAutoId+"'";
					DeleteQuery="delete from user_utt_mapping using user_utt_mapping, user_type_task_mapping where  user_utt_mapping.utt_mapping_id = user_type_task_mapping.utt_mapping_id and user_utt_mapping.User_Id = '"+EmpUserAutoId+"' and user_type_task_mapping.user_type_id = '"+UserTypesIdEdit+"'";
					System.out.println("DeleteQuery for Edit part::"+DeleteQuery);
					Statement DeleteQry = connection.createStatement();
					DeleteQry.executeUpdate(DeleteQuery);
					System.out.println("Deleted Successfully for Edit part from user_utt_mapping:::");
					DeleteQry.close();
					if(UserTypeIdInitial.equalsIgnoreCase("3"))  
			  		 {
			  		 	//****Insert into user_program_mapping_history****//
						String InsertQryUPMH="insert into user_program_mapping_history(UP_Mapping_Id,User_Id,Program_Id,Is_Active,Updated_On) select UP_Mapping_Id,User_Id,Program_Id,Is_Active,now() from user_program_mapping where User_ID ="+EmpUserAutoId+"";
						System.out.println("Inserted Query into user_program_mapping_history::"+InsertQryUPMH);
						stmt=connection.createStatement();
						stmt.execute(InsertQryUPMH);
						System.out.println("Inserted Successfully::::user_program_mapping_history");
					    stmt.close();
					    
						//****delete from user_program_mapping_history****//
						String DeleteQueryUPM="delete from user_program_mapping where User_Id='"+EmpUserAutoId+"'";
						System.out.println("DeleteQuery for Edit part DeleteQueryUPM::"+DeleteQueryUPM);
						Statement DeleteQryUPM = connection.createStatement();
						DeleteQryUPM.executeUpdate(DeleteQueryUPM);
						System.out.println("Deleted Successfully for Edit part from user_program_mapping:::");
						DeleteQryUPM.close();
			  		 }
				}
		 }
			 // Edit part:::For Recruiter adding Accessing Field: Checkbox::::://
			if(UserTypesIdEdit.equalsIgnoreCase("1"))   
			   { 
				   int ReccounterEdit = Integer.parseInt(request.getParameter("CountValue"));
				   System.out.println("Rec counter for Edit part:::"+ReccounterEdit);
			    	for(int i=1;i<ReccounterEdit;i++) 
				   	 {
					   System.out.println("Value of I for Edit Rec Part:::::"+i);
					   String UUTRecID = request.getParameter("UUTRecEdit"+i);
					   System.out.println("UUTRecID ID"+UUTRecID);
					   String UUTRecHdd = request.getParameter("UUTRecHdd"+i);
					   System.out.println("UUTRecHdd ID"+UUTRecHdd);
					   	if(UUTRecID == null)
						{
							if(!UUTRecHdd.equalsIgnoreCase(""))
							{
								System.out.println("to be deleted entry :::::");
								//****Insert into user_utt_mapping_history****//
								String InsertQryUUMH="insert into user_utt_mapping_history (UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,Updated_On) select UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,now() from user_utt_mapping where User_Id = '"+EmpUserAutoId+"' and UTT_Mapping_Id = '"+UUTRecHdd+"'";
								System.out.println("Inserted Query into user_utt_mapping_history::"+InsertQryUUMH);
								Statement stmtUUMH = connection.createStatement();
								stmtUUMH.execute(InsertQryUUMH);
								System.out.println("Inserted Successfully::::user_utt_mapping_history");
								stmtUUMH.close();
								
								//****Delete from user_utt_mapping****//
								DeleteQuery="delete from user_utt_mapping where User_Id = '"+EmpUserAutoId+"' and UTT_Mapping_Id = '"+UUTRecHdd+"'";
								System.out.println("DeleteQuery for Edit part user_utt_mapping::"+DeleteQuery);
								Statement DeleteQry = connection.createStatement();
								DeleteQry.executeUpdate(DeleteQuery);
								System.out.println("Deleted Successfully for Edit part from user_utt_mapping:::");
								DeleteQry.close();
							}
						}
						else
						{
							if(UUTRecHdd.equalsIgnoreCase(""))
							{
								System.out.println("entry to be addded:::::");
								roleTaskInfoUpdate =connection.prepareStatement("insert into user_utt_mapping(User_Id,UTT_Mapping_Id) values(?,?)");
								roleTaskInfoUpdate.setInt(1,EmpUserAutoId);
								roleTaskInfoUpdate.setString(2,UUTRecID);
								roleTaskInfoUpdate.executeUpdate();
								roleTaskInfoUpdate.close();
								System.out.println("Inserted Successfully user_utt_mapping::::");
							}
						}
						int ReccounterEditChd = Integer.parseInt(request.getParameter("CountValue"+i));
					   	System.out.println("Rec counter Chd for Edit part:::"+ReccounterEditChd);
					   	for(int k=1; k < ReccounterEditChd;k++)
							 {
								 String UUTRecIDChd = request.getParameter("UUTRecEdit"+i+"Chd"+k);
								 System.out.println("UUTRecIDChd"+i+"Chd"+k+"::::::"+UUTRecIDChd);
								 String UUTRecHddChd = request.getParameter("UUTRecHdd"+i+"Chd"+k);
								 System.out.println("UUTRecIDChd"+i+"Chd"+k+"::::::"+UUTRecIDChd);
								 	if(UUTRecIDChd == null)
									{
										if(!UUTRecHddChd.equalsIgnoreCase(""))
										{
											System.out.println("to be deleted entry for child:::::");
											//****Insert into user_utt_mapping_history****//
											String InsertQryUUMH="insert into user_utt_mapping_history (UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,Updated_On) select UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,now() from user_utt_mapping where User_Id = '"+EmpUserAutoId+"' and UTT_Mapping_Id = '"+UUTRecHddChd+"'";
											System.out.println("Inserted Query into user_utt_mapping_history::"+InsertQryUUMH);
											Statement stmtUUMH = connection.createStatement();
											stmtUUMH.execute(InsertQryUUMH);
											System.out.println("Inserted Successfully::::user_utt_mapping_history");
											stmtUUMH.close();
											
											//****Delete from user_utt_mapping****//
											DeleteQuery="delete from user_utt_mapping where User_Id = '"+EmpUserAutoId+"' and UTT_Mapping_Id = '"+UUTRecHddChd+"'";
											System.out.println("DeleteQuery for Edit part user_utt_mapping::"+DeleteQuery);
											Statement DeleteQry = connection.createStatement();
											DeleteQry.executeUpdate(DeleteQuery);
											System.out.println("Deleted Successfully for Edit part from user_utt_mapping:::");
											DeleteQry.close();
										}
									}
									else
									{
										if(UUTRecHddChd.equalsIgnoreCase(""))
										{
											System.out.println("entry to be addded for child:::::");
											roleTaskInfoUpdate =connection.prepareStatement("insert into user_utt_mapping(User_Id,UTT_Mapping_Id) values(?,?)");
											roleTaskInfoUpdate.setInt(1,EmpUserAutoId);
											roleTaskInfoUpdate.setString(2,UUTRecIDChd);
											roleTaskInfoUpdate.executeUpdate();
											roleTaskInfoUpdate.close();
											System.out.println("Inserted Successfully user_utt_mapping::::");
										}
									}	
							   }
					    }
		            System.out.println("Finally::::Inserted successfully for Edit Rec part Chk Box:::::");   
			     } 
        	// Edit part:::For LND adding Accessing Field: Checkbox::::://
			if(UserTypesIdEdit.equalsIgnoreCase("2"))   
			   { 
				   int LNDcounterEdit = Integer.parseInt(request.getParameter("LNDCountValue"));
				   System.out.println("L & D counter for Edit part:::"+LNDcounterEdit);
			    	for(int i=1;i<LNDcounterEdit;i++) 
				   	 {
					   System.out.println("Value of I for Edit L & D Part:::::"+i);
					   String UUTLNDID = request.getParameter("UUTLNDEdit"+i);
					   System.out.println("UUTLNDID ID"+UUTLNDID);
					   String UUTLNDHdd = request.getParameter("UUTLNDHdd"+i);
					   System.out.println("UUTLNDID ID"+UUTLNDHdd);
					   	if(UUTLNDID == null)
						{
							if(!UUTLNDHdd.equalsIgnoreCase(""))
							{
								System.out.println("to be deleted entry :::::");
								//****Insert into user_utt_mapping_history****//
								String InsertQryUUMH="insert into user_utt_mapping_history (UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,Updated_On) select UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,now() from user_utt_mapping where User_Id = '"+EmpUserAutoId+"' and UTT_Mapping_Id = '"+UUTLNDHdd+"'";
								System.out.println("Inserted Query into user_utt_mapping_history::"+InsertQryUUMH);
								Statement stmtUUMH = connection.createStatement();
								stmtUUMH.execute(InsertQryUUMH);
								System.out.println("Inserted Successfully::::user_utt_mapping_history");
								stmtUUMH.close();
								
								//****Delete from user_utt_mapping****//
								DeleteQuery="delete from user_utt_mapping where User_Id = '"+EmpUserAutoId+"' and UTT_Mapping_Id = '"+UUTLNDHdd+"'";
								System.out.println("DeleteQuery for Edit part user_utt_mapping::"+DeleteQuery);
								Statement DeleteQry = connection.createStatement();
								DeleteQry.executeUpdate(DeleteQuery);
								System.out.println("Deleted Successfully for Edit part from user_utt_mapping:::");
								DeleteQry.close();
							}
						}
						else
						{
							if(UUTLNDHdd.equalsIgnoreCase(""))
							{
								System.out.println("entry to be addded:::::");
								roleTaskInfoUpdate =connection.prepareStatement("insert into user_utt_mapping(User_Id,UTT_Mapping_Id) values(?,?)");
								roleTaskInfoUpdate.setInt(1,EmpUserAutoId);
								roleTaskInfoUpdate.setString(2,UUTLNDID);
								roleTaskInfoUpdate.executeUpdate();
								roleTaskInfoUpdate.close();
								System.out.println("Inserted Successfully user_utt_mapping::::");
							}
						}
						int LNDcounterEditChd  = Integer.parseInt(request.getParameter("LNDCountValue"+i));
					   	System.out.println("LND Chd for Edit part:::"+LNDcounterEditChd);
					   	for(int k=1; k < LNDcounterEditChd;k++)
							 {
								 String UUTLNDIDChd = request.getParameter("UUTLNDEdit"+i+"Chd"+k);
								 System.out.println("UUTLNDIDChd"+i+"Chd"+k+"::::::"+UUTLNDIDChd);
								 String UUTLNDHddChd = request.getParameter("UUTLNDHdd"+i+"Chd"+k);
								 System.out.println("UUTLNDHddChd"+i+"Chd"+k+"::::::"+UUTLNDHddChd);
								 	if(UUTLNDIDChd == null)
									{
										if(!UUTLNDHddChd.equalsIgnoreCase(""))
										{
											System.out.println("to be deleted entry for child:::::");
											//****Insert into user_utt_mapping_history****//
											String InsertQryUUMH="insert into user_utt_mapping_history (UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,Updated_On) select UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,now() from user_utt_mapping where User_Id = '"+EmpUserAutoId+"' and UTT_Mapping_Id = '"+UUTLNDHddChd+"'";
											System.out.println("Inserted Query into user_utt_mapping_history::"+InsertQryUUMH);
											Statement stmtUUMH = connection.createStatement();
											stmtUUMH.execute(InsertQryUUMH);
											System.out.println("Inserted Successfully::::user_utt_mapping_history");
											stmtUUMH.close();
											
											//****Delete from user_utt_mapping****//
											DeleteQuery="delete from user_utt_mapping where User_Id = '"+EmpUserAutoId+"' and UTT_Mapping_Id = '"+UUTLNDHddChd+"'";
											System.out.println("DeleteQuery for Edit part user_utt_mapping::"+DeleteQuery);
											Statement DeleteQry = connection.createStatement();
											DeleteQry.executeUpdate(DeleteQuery);
											System.out.println("Deleted Successfully for Edit part from user_utt_mapping:::");
											DeleteQry.close();
										}
									}
									else
									{
										if(UUTLNDHddChd.equalsIgnoreCase(""))
										{
											System.out.println("entry to be addded for child:::::");
											roleTaskInfoUpdate =connection.prepareStatement("insert into user_utt_mapping(User_Id,UTT_Mapping_Id) values(?,?)");
											roleTaskInfoUpdate.setInt(1,EmpUserAutoId);
											roleTaskInfoUpdate.setString(2,UUTLNDIDChd);
											roleTaskInfoUpdate.executeUpdate();
											roleTaskInfoUpdate.close();
											System.out.println("Inserted Successfully user_utt_mapping::::");
										}
									}	
							   }
					    }
		            System.out.println("Finally::::Inserted successfully for Edit LND part Chk Box:::::");   
			     } 
         
          // Edit part:::For HR Ops adding Accessing Field: Checkbox::::://
			if(UserTypesIdEdit.equalsIgnoreCase("4"))   
			   { 
				   int HROpscounterEdit = Integer.parseInt(request.getParameter("CountValue_HRops"));
				   System.out.println("L & D counter for Edit part:::"+HROpscounterEdit);
			    	for(int i=1;i<HROpscounterEdit;i++) 
				   	 {
					   System.out.println("Value of I for Edit L & D Part:::::"+i);
					   String UUTHROpsID = request.getParameter("UUTHROpsEdit"+i);
					   System.out.println("UUTHROpsID ID"+UUTHROpsID);
					   String UUTHROpsHdd = request.getParameter("UUTHROpsHdd"+i);
					   System.out.println("UUTHROpsID ID"+UUTHROpsHdd);
					   	if(UUTHROpsID == null)
						{
							if(!UUTHROpsHdd.equalsIgnoreCase(""))
							{
								System.out.println("to be deleted entry :::::");
								//****Insert into user_utt_mapping_history****//
								String InsertQryUUMH="insert into user_utt_mapping_history (UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,Updated_On) select UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,now() from user_utt_mapping where User_Id = '"+EmpUserAutoId+"' and UTT_Mapping_Id = '"+UUTHROpsHdd+"'";
								System.out.println("Inserted Query into user_utt_mapping_history::"+InsertQryUUMH);
								Statement stmtUUMH = connection.createStatement();
								stmtUUMH.execute(InsertQryUUMH);
								System.out.println("Inserted Successfully::::user_utt_mapping_history");
								stmtUUMH.close();
								
								//****Delete from user_utt_mapping****//
								DeleteQuery="delete from user_utt_mapping where User_Id = '"+EmpUserAutoId+"' and UTT_Mapping_Id = '"+UUTHROpsHdd+"'";
								System.out.println("DeleteQuery for Edit part user_utt_mapping::"+DeleteQuery);
								Statement DeleteQry = connection.createStatement();
								DeleteQry.executeUpdate(DeleteQuery);
								System.out.println("Deleted Successfully for Edit part from user_utt_mapping:::");
								DeleteQry.close();
							}
						}
						else
						{
							if(UUTHROpsHdd.equalsIgnoreCase(""))
							{
								System.out.println("entry to be addded:::::");
								roleTaskInfoUpdate =connection.prepareStatement("insert into user_utt_mapping(User_Id,UTT_Mapping_Id) values(?,?)");
								roleTaskInfoUpdate.setInt(1,EmpUserAutoId);
								roleTaskInfoUpdate.setString(2,UUTHROpsID);
								roleTaskInfoUpdate.executeUpdate();
								roleTaskInfoUpdate.close();
								System.out.println("Inserted Successfully user_utt_mapping::::");
							}
						}
						int HROpscounterEditChd  = Integer.parseInt(request.getParameter("CountValue_HRops"+i));
					   	System.out.println("HROps Chd for Edit part:::"+HROpscounterEditChd);
					   	for(int k=1; k < HROpscounterEditChd;k++)
							 {
								 String UUTHROpsIDChd = request.getParameter("UUTHROpsEdit"+i+"Chd"+k);
								 System.out.println("UUTHROpsIDChd"+i+"Chd"+k+"::::::"+UUTHROpsIDChd);
								 String UUTHROpsHddChd = request.getParameter("UUTHROpsHdd"+i+"Chd"+k);
								 System.out.println("UUTHROpsHddChd"+i+"Chd"+k+"::::::"+UUTHROpsHddChd);
								 	if(UUTHROpsIDChd == null)
									{
										if(!UUTHROpsHddChd.equalsIgnoreCase(""))
										{
											System.out.println("to be deleted entry for child:::::");
											//****Insert into user_utt_mapping_history****//
											String InsertQryUUMH="insert into user_utt_mapping_history (UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,Updated_On) select UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,now() from user_utt_mapping where User_Id = '"+EmpUserAutoId+"' and UTT_Mapping_Id = '"+UUTHROpsHddChd+"'";
											System.out.println("Inserted Query into user_utt_mapping_history::"+InsertQryUUMH);
											Statement stmtUUMH = connection.createStatement();
											stmtUUMH.execute(InsertQryUUMH);
											System.out.println("Inserted Successfully::::user_utt_mapping_history");
											stmtUUMH.close();
											
											//****Delete from user_utt_mapping****//
											DeleteQuery="delete from user_utt_mapping where User_Id = '"+EmpUserAutoId+"' and UTT_Mapping_Id = '"+UUTHROpsHddChd+"'";
											System.out.println("DeleteQuery for Edit part user_utt_mapping::"+DeleteQuery);
											Statement DeleteQry = connection.createStatement();
											DeleteQry.executeUpdate(DeleteQuery);
											System.out.println("Deleted Successfully for Edit part from user_utt_mapping:::");
											DeleteQry.close();
										}
									}
									else
									{
										if(UUTHROpsHddChd.equalsIgnoreCase(""))
										{
											System.out.println("entry to be addded for child:::::");
											roleTaskInfoUpdate =connection.prepareStatement("insert into user_utt_mapping(User_Id,UTT_Mapping_Id) values(?,?)");
											roleTaskInfoUpdate.setInt(1,EmpUserAutoId);
											roleTaskInfoUpdate.setString(2,UUTHROpsIDChd);
											roleTaskInfoUpdate.executeUpdate();
											roleTaskInfoUpdate.close();
											System.out.println("Inserted Successfully user_utt_mapping::::");
										}
									}	
							   }
					    }
		            System.out.println("Finally::::Inserted successfully for Edit HROps part Chk Box:::::");   
			     } 
		   
		   // Edit part:::For Viewer adding Accessing Field: Checkbox::::://
			if(UserTypesIdEdit.equalsIgnoreCase("5"))   
			   { 
				   int ViewercounterEdit = Integer.parseInt(request.getParameter("CountValue_Viewer"));
				   System.out.println("L & D counter for Edit part:::"+ViewercounterEdit);
			    	for(int i=1;i<ViewercounterEdit;i++) 
				   	 {
					   System.out.println("Value of I for Edit L & D Part:::::"+i);
					   String UUTViewerID = request.getParameter("UUTViewerEdit"+i);
					   System.out.println("UUTViewerID ID"+UUTViewerID);
					   String UUTViewerHdd = request.getParameter("UUTViewerHdd"+i);
					   System.out.println("UUTViewerID ID"+UUTViewerHdd);
					   	if(UUTViewerID == null)
						{
							if(!UUTViewerHdd.equalsIgnoreCase(""))
							{
								System.out.println("to be deleted entry :::::");
								//****Insert into user_utt_mapping_history****//
								String InsertQryUUMH="insert into user_utt_mapping_history (UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,Updated_On) select UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,now() from user_utt_mapping where User_Id = '"+EmpUserAutoId+"' and UTT_Mapping_Id = '"+UUTViewerHdd+"'";
								System.out.println("Inserted Query into user_utt_mapping_history::"+InsertQryUUMH);
								Statement stmtUUMH = connection.createStatement();
								stmtUUMH.execute(InsertQryUUMH);
								System.out.println("Inserted Successfully::::user_utt_mapping_history");
								stmtUUMH.close();
								
								//****Delete from user_utt_mapping****//
								DeleteQuery="delete from user_utt_mapping where User_Id = '"+EmpUserAutoId+"' and UTT_Mapping_Id = '"+UUTViewerHdd+"'";
								System.out.println("DeleteQuery for Edit part user_utt_mapping::"+DeleteQuery);
								Statement DeleteQry = connection.createStatement();
								DeleteQry.executeUpdate(DeleteQuery);
								System.out.println("Deleted Successfully for Edit part from user_utt_mapping:::");
								DeleteQry.close();
							}
						}
						else
						{
							if(UUTViewerHdd.equalsIgnoreCase(""))
							{
								System.out.println("entry to be addded:::::");
								roleTaskInfoUpdate =connection.prepareStatement("insert into user_utt_mapping(User_Id,UTT_Mapping_Id) values(?,?)");
								roleTaskInfoUpdate.setInt(1,EmpUserAutoId);
								roleTaskInfoUpdate.setString(2,UUTViewerID);
								roleTaskInfoUpdate.executeUpdate();
								roleTaskInfoUpdate.close();
								System.out.println("Inserted Successfully user_utt_mapping::::");
							}
						}
						int ViewercounterEditChd  = Integer.parseInt(request.getParameter("CountValue_Viewer"+i));
					   	System.out.println("Viewer Chd for Edit part:::"+ViewercounterEditChd);
					   	for(int k=1; k < ViewercounterEditChd;k++)
							 {
								 String UUTViewerIDChd = request.getParameter("UUTViewerEdit"+i+"Chd"+k);
								 System.out.println("UUTViewerIDChd"+i+"Chd"+k+"::::::"+UUTViewerIDChd);
								 String UUTViewerHddChd = request.getParameter("UUTViewerHdd"+i+"Chd"+k);
								 System.out.println("UUTViewerHddChd"+i+"Chd"+k+"::::::"+UUTViewerHddChd);
								 	if(UUTViewerIDChd == null)
									{
										if(!UUTViewerHddChd.equalsIgnoreCase(""))
										{
											System.out.println("to be deleted entry for child:::::");
											//****Insert into user_utt_mapping_history****//
											String InsertQryUUMH="insert into user_utt_mapping_history (UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,Updated_On) select UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,now() from user_utt_mapping where User_Id = '"+EmpUserAutoId+"' and UTT_Mapping_Id = '"+UUTViewerHddChd+"'";
											System.out.println("Inserted Query into user_utt_mapping_history::"+InsertQryUUMH);
											Statement stmtUUMH = connection.createStatement();
											stmtUUMH.execute(InsertQryUUMH);
											System.out.println("Inserted Successfully::::user_utt_mapping_history");
											stmtUUMH.close();
											
											//****Delete from user_utt_mapping****//
											DeleteQuery="delete from user_utt_mapping where User_Id = '"+EmpUserAutoId+"' and UTT_Mapping_Id = '"+UUTViewerHddChd+"'";
											System.out.println("DeleteQuery for Edit part user_utt_mapping::"+DeleteQuery);
											Statement DeleteQry = connection.createStatement();
											DeleteQry.executeUpdate(DeleteQuery);
											System.out.println("Deleted Successfully for Edit part from user_utt_mapping:::");
											DeleteQry.close();
										}
									}
									else
									{
										if(UUTViewerHddChd.equalsIgnoreCase(""))
										{
											System.out.println("entry to be addded for child:::::");
											roleTaskInfoUpdate =connection.prepareStatement("insert into user_utt_mapping(User_Id,UTT_Mapping_Id) values(?,?)");
											roleTaskInfoUpdate.setInt(1,EmpUserAutoId);
											roleTaskInfoUpdate.setString(2,UUTViewerIDChd);
											roleTaskInfoUpdate.executeUpdate();
											roleTaskInfoUpdate.close();
											System.out.println("Inserted Successfully user_utt_mapping::::");
										}
									}	
							   }
					    }
		            System.out.println("Finally::::Inserted successfully for Edit Viewer part Chk Box:::::");   
			     } 
			
			 // Edit part:::For Ops adding Accessing Field: Checkbox::::://
			if(UserTypesIdEdit.equalsIgnoreCase("3"))   
			   { 
				   int OpscounterEdit = Integer.parseInt(request.getParameter("CountValue_Ops"));
				   System.out.println("L & D counter for Edit part:::"+OpscounterEdit);
				   if(IsSAdmin.equalsIgnoreCase("Yes"))
					{
					   	//****Insert into user_program_mapping_history****//
						String InsertQryUPMH="insert into user_program_mapping_history(UP_Mapping_Id,User_Id,Program_Id,Is_Active,Updated_On) select UP_Mapping_Id,User_Id,Program_Id,Is_Active,now() from user_program_mapping where User_ID ="+EmpUserAutoId+"";
						System.out.println("Inserted Query into user_program_mapping_history::"+InsertQryUPMH);
						stmt=connection.createStatement();
						stmt.execute(InsertQryUPMH);
						stmt.close();
						System.out.println("Inserted Successfully::::user_program_mapping_history");
						
						//****delete from user_program_mapping_history****//
						DeleteQuery="delete from user_program_mapping where User_Id='"+EmpUserAutoId+"'";
						System.out.println("DeleteQuery for Edit part::"+DeleteQuery);
						Statement DeleteQryUPM = connection.createStatement();
						DeleteQryUPM.executeUpdate(DeleteQuery);
						DeleteQryUPM.close();
						System.out.println("Deleted Successfully for Edit part from user_program_mapping:::");
					}
					else
					{
						if(IsAllprograms.equalsIgnoreCase("false"))
						{
							//****Insert into user_program_mapping_history****//
							String InsertQryUPMH = "";
							if(UserPrgmAccessState == 1)
							{
								InsertQryUPMH = "insert into user_program_mapping_history(UP_Mapping_Id,User_Id,Program_Id,Is_Active,Updated_On) select UP_Mapping_Id,User_Id,Program_Id,Is_Active,now() from user_program_mapping where User_ID ="+EmpUserAutoId+"";
							}
							else
							{
								InsertQryUPMH = "insert into user_program_mapping_history(UP_Mapping_Id,User_Id,Program_Id,Is_Active,Updated_On) select UP_Mapping_Id,User_Id,Program_Id,Is_Active,now() from user_program_mapping where User_ID ="+EmpUserAutoId+" and Program_id in (SELECT program_id FROM user_program_mapping WHERE user_id = '"+USER_AUTOID+"')";
							}
							//String InsertQryUPMH = "insert into user_program_mapping_history(UP_Mapping_Id,User_Id,Program_Id,Is_Active,Updated_On) select UP_Mapping_Id,User_Id,Program_Id,Is_Active,now() from user_program_mapping where User_ID ="+EmpUserAutoId+" and Program_id in (SELECT program_id FROM user_program_mapping WHERE user_id = '"+USER_AUTOID+"')";
							System.out.println("Inserted Query into user_program_mapping_history::"+InsertQryUPMH);
							stmt=connection.createStatement();
							stmt.execute(InsertQryUPMH);
							stmt.close();
							System.out.println("Inserted Successfully::::user_program_mapping_history");
							
							//****delete from user_program_mapping_history****//
							CallableStatement deletePrgmProc=null;
							deletePrgmProc = connection.prepareCall("{ call UPM_Delete_Encrypt_Proc(?,?,?,?,?)}");
							deletePrgmProc.setInt(1,USER_AUTOID);
							deletePrgmProc.setInt(2,EmpUserAutoId);
							deletePrgmProc.setInt(3,UserPrgmAccessState);
							deletePrgmProc.setString(4,EDKey);
							deletePrgmProc.setString(5, EDKPass);
							deletePrgmProc.execute();
							deletePrgmProc.close();
							System.out.println("Update sucessfully");
						}
					}
			    	for(int i=1;i<OpscounterEdit;i++) 
				   	 {
					   System.out.println("Value of I for Edit L & D Part:::::"+i);
					   String UUTOpsID = request.getParameter("UUTOpsEdit"+i);
					   System.out.println("UUTOpsID ID"+UUTOpsID);
					   String UUTOpsHdd = request.getParameter("UUTOpsHdd"+i);
					   System.out.println("UUTOpsID ID"+UUTOpsHdd);
					   	if(UUTOpsID == null)
						{
							if(!UUTOpsHdd.equalsIgnoreCase(""))
							{
								System.out.println("to be deleted entry :::::");
								//****Insert into user_utt_mapping_history****//
								String InsertQryUUMH="insert into user_utt_mapping_history (UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,Updated_On) select UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,now() from user_utt_mapping where User_Id = '"+EmpUserAutoId+"' and UTT_Mapping_Id = '"+UUTOpsHdd+"'";
								System.out.println("Inserted Query into user_utt_mapping_history::"+InsertQryUUMH);
								Statement stmtUUMH = connection.createStatement();
								stmtUUMH.execute(InsertQryUUMH);
								System.out.println("Inserted Successfully::::user_utt_mapping_history");
								stmtUUMH.close();
								
								//****Delete from user_utt_mapping****//
								DeleteQuery="delete from user_utt_mapping where User_Id = '"+EmpUserAutoId+"' and UTT_Mapping_Id = '"+UUTOpsHdd+"'";
								System.out.println("DeleteQuery for Edit part user_utt_mapping::"+DeleteQuery);
								Statement DeleteQry = connection.createStatement();
								DeleteQry.executeUpdate(DeleteQuery);
								System.out.println("Deleted Successfully for Edit part from user_utt_mapping:::");
								DeleteQry.close();
							}
						}
						else
						{
							if(UUTOpsHdd.equalsIgnoreCase(""))
							{
								
								System.out.println("entry to be addded:::::");
								roleTaskInfoUpdate =connection.prepareStatement("insert into user_utt_mapping(User_Id,UTT_Mapping_Id) values(?,?)");
								roleTaskInfoUpdate.setInt(1,EmpUserAutoId);
								roleTaskInfoUpdate.setString(2,UUTOpsID);
								roleTaskInfoUpdate.executeUpdate();
								roleTaskInfoUpdate.close();
								System.out.println("Inserted Successfully user_utt_mapping::::");
							}
						}
						int OpscounterEditChd  = Integer.parseInt(request.getParameter("CountValue_Ops"+i));
					   	System.out.println("Ops Chd for Edit part:::"+OpscounterEditChd);
					   	for(int k=1; k < OpscounterEditChd;k++)
							 {
								 String UUTOpsIDChd = request.getParameter("UUTOpsEdit"+i+"Chd"+k);
								 System.out.println("UUTOpsIDChd"+i+"Chd"+k+"::::::"+UUTOpsIDChd);
								 String UUTOpsHddChd = request.getParameter("UUTOpsHdd"+i+"Chd"+k);
								 System.out.println("UUTOpsHddChd"+i+"Chd"+k+"::::::"+UUTOpsHddChd);
								 	if(UUTOpsIDChd == null)
									{
										if(!UUTOpsHddChd.equalsIgnoreCase(""))
										{
											System.out.println("to be deleted entry for child:::::");
											//****Insert into user_utt_mapping_history****//
											String InsertQryUUMH="insert into user_utt_mapping_history (UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,Updated_On) select UUTT_Id,User_Id,UTT_Mapping_Id,Is_Active,now() from user_utt_mapping where User_Id = '"+EmpUserAutoId+"' and UTT_Mapping_Id = '"+UUTOpsHddChd+"'";
											System.out.println("Inserted Query into user_utt_mapping_history::"+InsertQryUUMH);
											Statement stmtUUMH = connection.createStatement();
											stmtUUMH.execute(InsertQryUUMH);
											System.out.println("Inserted Successfully::::user_utt_mapping_history");
											stmtUUMH.close();
											
											//****Delete from user_utt_mapping****//
											DeleteQuery="delete from user_utt_mapping where User_Id = '"+EmpUserAutoId+"' and UTT_Mapping_Id = '"+UUTOpsHddChd+"'";
											System.out.println("DeleteQuery for Edit part user_utt_mapping::"+DeleteQuery);
											Statement DeleteQry = connection.createStatement();
											DeleteQry.executeUpdate(DeleteQuery);
											System.out.println("Deleted Successfully for Edit part from user_utt_mapping:::");
											DeleteQry.close();
										}
									}
									else
									{
										if(UUTOpsHddChd.equalsIgnoreCase(""))
										{
											System.out.println("entry to be addded for child:::::");
											roleTaskInfoUpdate =connection.prepareStatement("insert into user_utt_mapping(User_Id,UTT_Mapping_Id) values(?,?)");
											roleTaskInfoUpdate.setInt(1,EmpUserAutoId);
											roleTaskInfoUpdate.setString(2,UUTOpsIDChd);
											roleTaskInfoUpdate.executeUpdate();
											roleTaskInfoUpdate.close();
											System.out.println("Inserted Successfully user_utt_mapping::::");
										}
									}	
							   }
					    }
						if(allProgramChkEdit != null)
					        {
					        	opsProgramUpdate =connection.prepareStatement("insert into user_program_mapping(User_Id,Program_Id,Is_Active) values(?,?,?)");
								opsProgramUpdate.setInt(1,EmpUserAutoId);
								opsProgramUpdate.setString(2,allProgramChkEdit);
								opsProgramUpdate.setInt(3,1);
								opsProgramUpdate.executeUpdate();
								opsProgramUpdate.close();
								System.out.println("Inserted Successfully for CHD user_program_mapping::::");
					        }
						else
						  {
							String[] SelectedValuesEdit = request.getParameterValues("ToLB1");
					    	if(SelectedValuesEdit != null)
					    	{
								System.out.println("SelectedValuesEdit.length"+SelectedValuesEdit.length);
								for(int iops = 0;iops < SelectedValuesEdit.length;iops++)
								{
								System.out.println("SelectedValuesEdit"+SelectedValuesEdit[iops]);
								opsProgramUpdate =connection.prepareStatement("insert into user_program_mapping(User_Id,Program_Id,Is_Active) values(?,?,?)");
								opsProgramUpdate.setInt(1,EmpUserAutoId);
								opsProgramUpdate.setString(2,SelectedValuesEdit[iops]);
								opsProgramUpdate.setInt(3,1);
								opsProgramUpdate.executeUpdate();
								opsProgramUpdate.close();
								System.out.println("Inserted Successfully for CHD user_program_mapping::::");
						       }
					       }
					    }      
		            System.out.println("Finally::::Inserted successfully for Edit Ops part Chk Box:::::");   
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
		
		if((UserTypeIddelete.equalsIgnoreCase("1"))||(UserTypeIddelete.equalsIgnoreCase("2")) ||(UserTypeIddelete.equalsIgnoreCase("4")))  
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
		   else if(UserTypeIddelete.equalsIgnoreCase("3"))
		   {
		     	//****Insert into user_program_mapping_history****//
				String InsertQryUPMH="insert into user_program_mapping_history(UP_Mapping_Id,User_Id,Program_Id,Is_Active,Updated_On) select *,now() from user_program_mapping where User_ID ="+EmpUserAutoId+"";
				System.out.println("Inserted Query into user_program_mapping_history::"+InsertQryUPMH);
				stmt.execute(InsertQryUPMH);
				System.out.println("Inserted Successfully::::user_program_mapping_history");
				
				//****Delete from  user_utt_mapping****//
				DeleteQueryUPMH="delete from user_program_mapping where User_Id='"+EmpUserAutoId+"'";
				System.out.println("DeleteQuery for Delete part DeleteQueryUPMH::"+DeleteQueryUPMH);
				Statement DeleteQryUPM = connection.createStatement();
				DeleteQryUPM.executeUpdate(DeleteQueryUPMH);
				System.out.println("Deleted Successfully for Edit part from user_program_mapping:::");
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
    <title>[24]7 Admin Manage User</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<script type="text/javascript" language="javascript">
    alert("Updated Successfully."); 
    parent.location.href= "<%=recruitPath%>jsp/Admin_Add_User.jsp";

  </script>
  </head>
  
  <body>
    
  </body>
</html>
