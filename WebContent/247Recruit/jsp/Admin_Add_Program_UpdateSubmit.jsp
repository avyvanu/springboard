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
String USER_ID=(String)session.getAttribute("USER_ID");
if(USER_ID == null)
 {
	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
 }
System.out.println("USER_ID"+USER_ID);
String ProgramId = (String) session.getAttribute("ProgramId");
if(ProgramId == null)
 {
	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
 }
System.out.println("ProgramId in Admin Update page::"+ProgramId);
	try
	{
      
      //*********************Add part*********************//
      if(ActionType.equals("1"))
			{
				String ProgramName = request.getParameter("ProgramNameValADD").trim();
				System.out.println("User Entered ProgramName::::"+ProgramName);
				String HRMSProgramId = request.getParameter("programname").trim();
				System.out.println("ProgramId::::"+ProgramId);
				String HRMSSubProgramId = request.getParameter("subprogramname").trim();
				System.out.println("HRMSSubProgramId::::"+HRMSSubProgramId);
				
				//String ProgramMasterQry="SELECT * FROM program_names_master where mst_programid='"+HRMSProgramId+"' and mst_subprogramid='"+HRMSSubProgramId+"'";
				String ProgramMasterQry="SELECT * FROM program_names_master where Program_name ='"+ProgramName+"'";
				System.out.println("ProgramMasterQry"+ProgramMasterQry);
				Statement stProgramname = connection.createStatement();
				ResultSet rsProgramname = stProgramname.executeQuery(ProgramMasterQry);
				boolean state=rsProgramname.next();
			if(state==true)
				{
				%>
				<script type="text/javascript" language="javascript">
				   alert('Program name "<%=ProgramName%>" already exists ! Please check and try again.'); 
				   parent.location.href= "<%=recruitPath%>jsp/Admin_Add_Program.jsp";
				</script>
				<%
			}
			else
			{
				//*** Adding New program Name into Program master***//
				String ProgramTypeSelected = request.getParameter("ProgramTypeSelelctionAdd").trim();
				System.out.println("ProgramTypeSelected::::"+ProgramTypeSelected);
				String ProgramStatusSelected = request.getParameter("ProgramStatusSelelctionAdd").trim();
				System.out.println("ProgramStatusSelected::::"+ProgramStatusSelected);
				
				PreparedStatement addProgramInsert = null;
				addProgramInsert =connection.prepareStatement("insert into program_names_master(Program_name,Program_TypeId,mst_programid,mst_subprogramid,Is_Alive,Updated_By,Updated_On) values(?,?,?,?,?,?,now())");
				addProgramInsert.setString(1,ProgramName);
				addProgramInsert.setString(2,ProgramTypeSelected);
				addProgramInsert.setString(3,HRMSProgramId);
				addProgramInsert.setString(4,HRMSSubProgramId);
				addProgramInsert.setString(5,ProgramStatusSelected);
				addProgramInsert.setString(6,USER_ID);
				addProgramInsert.executeUpdate();
				addProgramInsert.close();
			   	System.out.println("Inserted successfully into program_names_master:::::");
			    //*** End of Adding New program Name into Program master***//
			
				String Program_ID=null;
				String QueryProgramId="SELECT Program_ID FROM program_names_master where Program_Name='"+ProgramName+"'";
				System.out.println("QueryProgramId:::"+QueryProgramId);
				Statement stmtProgramId=connection.createStatement();
				ResultSet rsProgramId=stmtProgramId.executeQuery(QueryProgramId);
				if(rsProgramId.next())
				{
				Program_ID=rsProgramId.getString("Program_ID");
				System.out.println("Program_ID::::::"+Program_ID);
				}
				rsProgramId.close();
				stmtProgramId.close();
				
				//*** Adding New Entry into operations_interview_part_master***//
				String PartDescription="";
				PreparedStatement opsPartInsert = null;
				PreparedStatement opsQuestionInsert = null;
				opsPartInsert = connection.prepareStatement("insert into operations_interview_part_master(Program_Id,Part_Description,IsAlive,Order_No,Updated_By,Updated_On) values(?,?,?,?,?,now())");
				opsPartInsert.setString(1,Program_ID);
				opsPartInsert.setString(2,PartDescription);
				opsPartInsert.setInt(3,1);
				opsPartInsert.setInt(4,1);
				opsPartInsert.setString(5,USER_ID);
				opsPartInsert.executeUpdate();
				opsPartInsert.close();
				System.out.println("Inserted Successfully operations_interview_part_master::::");
				
				String Part_ID=null;
				String QueryPartId="SELECT Part_Id FROM operations_interview_part_master where Program_Id='"+Program_ID+"'";
				System.out.println("QueryPartId:::"+QueryPartId);
				Statement stmtPartId=connection.createStatement();
				ResultSet rsPartId=stmtPartId.executeQuery(QueryPartId);
				if(rsPartId.next())
				{
				Part_ID=rsPartId.getString("Part_Id");
				System.out.println("Part_Id::::::"+Part_ID);
				}
				rsPartId.close();
				stmtPartId.close();
				
				String Question="No Questions Available.";
				opsQuestionInsert = connection.prepareStatement("insert into operations_interview_question_master(Part_Id,Question,IsAlive,Order_No) values(?,?,?,?)");
				opsQuestionInsert.setString(1,Part_ID);
				opsQuestionInsert.setString(2,Question);
				opsQuestionInsert.setInt(3,1);
				opsQuestionInsert.setInt(4,1);
				opsQuestionInsert.executeUpdate();
				opsQuestionInsert.close();
				System.out.println("Inserted Successfully operations_interview_question_master::::");
				
				String InsertQueryDesiredScore="";
			  //******Voice Desired score deafult values insert*****//
			  if(ProgramTypeSelected.equalsIgnoreCase("1"))
			  {
			    int VoiceDesiredScore=0;
			    String QueryVoiceDesiredScore="select Desired_Score from voice_desired_score_default Where Program_Id=1";
				System.out.println("QueryVoiceDesiredScore:::"+QueryVoiceDesiredScore);
				Statement stmtDesiredScore=connection.createStatement();
				ResultSet rsDesiredScore=stmtDesiredScore.executeQuery(QueryVoiceDesiredScore);
				int i=1;
				while(rsDesiredScore.next())
				{
				VoiceDesiredScore=rsDesiredScore.getInt("Desired_Score");
				System.out.println("DesiredScore::::::"+VoiceDesiredScore);
				InsertQueryDesiredScore="insert into voice_desired_score(Program_Id,PP_Id,Desired_score) values('"+Program_ID+"',"+i+","+VoiceDesiredScore+")";
				System.out.println("InsertQueryDesiredScore::::Voice::"+InsertQueryDesiredScore);
				Statement stmtDesiredScoreInsert=connection.createStatement();
				stmtDesiredScoreInsert.execute(InsertQueryDesiredScore);
				System.out.println("Inserted Successfully into voice_desired_score");
				i++;
				System.out.println("Value of i::::::"+i);
				}
				rsDesiredScore.close();
				stmtDesiredScore.close();
			   }
			    //******End of Voice Desired score deafult values insert*****//     
			    
			    //******End of Chat Desired score deafult values insert*****//
			    if(ProgramTypeSelected.equalsIgnoreCase("2"))
			  {
			    int SIMDesiredScore=0;
			    String QuerySIMDesiredScore="select Desired_Score from precis_desired_score_default Where Program_Id=1";
				System.out.println("QuerySIMDesiredScore:::"+QuerySIMDesiredScore);
				Statement stmtDesiredSIMScore=connection.createStatement();
				ResultSet rsDesiredSIMScore=stmtDesiredSIMScore.executeQuery(QuerySIMDesiredScore);
				int j=1;
				while(rsDesiredSIMScore.next())
				{
				SIMDesiredScore=rsDesiredSIMScore.getInt("Desired_Score");
				System.out.println("DesiredScore::::::"+SIMDesiredScore);
				Statement stmtDesiredSIMInsert=connection.createStatement();
				InsertQueryDesiredScore="insert into precis_desired_score(Program_Id,PP_Id,Desired_score) values('"+Program_ID+"',"+j+","+SIMDesiredScore+")";
				stmtDesiredSIMInsert.execute(InsertQueryDesiredScore);
				System.out.println("InsertQueryDesiredScore::::Voice::"+InsertQueryDesiredScore);
				j++;
				System.out.println("Value of i::::::"+j);
				}
				rsDesiredSIMScore.close();
				stmtDesiredSIMScore.close();
			  } 
			    //******End of Chat Desired score deafult values insert*****//    
			 
			}
       }
    //*********Edit Part*********//
	if(ActionType.equalsIgnoreCase("2"))
	{
		String ProgramNameVal = request.getParameter("ProgramNameVal").trim();
		System.out.println("ProgramNameVal::::"+ProgramNameVal);
		String ProgramTypeSelelction = request.getParameter("ProgramTypeSelelction").trim();
		System.out.println("ProgramTypeSelelction::::"+ProgramTypeSelelction);
		String ProgramTypeInitialVal = (String) request.getParameter("ProgramTypeInitialVal");
		System.out.println("ProgramTypeInitialVal:::::"+ProgramTypeInitialVal);
		String ProgramStatusSelelction = (String) request.getParameter("ProgramStatusSelelction");
		System.out.println("ProgramStatusSelelction:::::"+ProgramStatusSelelction);
		
		//******Insert into program_names_masterHistory******//
		String InsertQryPNM="insert into program_names_master_history(Program_id,Program_name,Program_TypeId,mst_programid,mst_subprogramid,Is_Alive,Updated_By,Updated_On) select * from program_names_master where Program_id='"+ProgramId+"'";
		System.out.println("Inserted Query into program_names_master_history::"+InsertQryPNM);
		Statement stmtedit=connection.createStatement();
		stmtedit.execute(InsertQryPNM);
		System.out.println("Inserted Successfully::::program_names_master_history");
	   
			   	
		//*****Update of program_names_master*******//
		PreparedStatement programInfoUpdate = null;
		programInfoUpdate =connection.prepareStatement("update program_names_master set Program_name = ?,Program_TypeId = ?,Is_Alive = ?,Updated_By = ? ,Updated_On = now() where Program_Id = ?");
		programInfoUpdate.setString(1,ProgramNameVal);
		programInfoUpdate.setString(2,ProgramTypeSelelction);
		programInfoUpdate.setString(3,ProgramStatusSelelction);
		programInfoUpdate.setString(4,USER_ID);
		programInfoUpdate.setString(5,ProgramId);
		programInfoUpdate.executeUpdate();
		programInfoUpdate.close();
		System.out.println("Update Successfully program_names_master::::");
		
		
		if(!ProgramTypeInitialVal.equalsIgnoreCase(ProgramTypeSelelction))
		{
			System.out.println("Not Equal");
			if(ProgramTypeSelelction.equalsIgnoreCase("1"))
			{
				
				//******Insert into precis_desired_score_history******//
				String InsertQryPDSH="insert into precis_desired_score_history(Program_Id,PP_Id,Desired_score,Updated_On) select *,now() from precis_desired_score where Program_id='"+ProgramId+"'";
				System.out.println("Inserted Query into precis_desired_score_history::"+InsertQryPDSH);
				Statement stmteditPDSH=connection.createStatement();
				stmteditPDSH.execute(InsertQryPDSH);
				System.out.println("Inserted Successfully::::precis_desired_score_history");
		
				String deleteQry="delete from precis_desired_score where Program_Id='"+ProgramId+"'";
				Statement stmtdelete=connection.createStatement();
				stmtdelete.execute(deleteQry);
				System.out.println("Succesfully Deleted::::");
				stmtdelete.close();
				
				int VoiceDesiredScore=0;
			    String QueryVoiceDesiredScore="select Desired_Score from voice_desired_score_default Where Program_Id=1";
				System.out.println("QueryVoiceDesiredScore:::"+QueryVoiceDesiredScore);
				Statement stmtDesiredScore=connection.createStatement();
				ResultSet rsDesiredScore=stmtDesiredScore.executeQuery(QueryVoiceDesiredScore);
				int i=1;
				while(rsDesiredScore.next())
				{
				VoiceDesiredScore=rsDesiredScore.getInt("Desired_Score");
				System.out.println("DesiredScore::::::"+VoiceDesiredScore);
				String InsertQueryDesiredScore="insert into voice_desired_score(Program_Id,PP_Id,Desired_score) values('"+ProgramId+"',"+i+","+VoiceDesiredScore+")";
				System.out.println("InsertQueryDesiredScore::::Voice::"+InsertQueryDesiredScore);
				Statement stmtDesiredScoreInsert=connection.createStatement();
				stmtDesiredScoreInsert.execute(InsertQueryDesiredScore);
				System.out.println("Inserted Successfully into voice_desired_score");
				i++;
				System.out.println("Value of i::::::"+i);
				}
				rsDesiredScore.close();
				stmtDesiredScore.close();
			}
			if(ProgramTypeSelelction.equalsIgnoreCase("2"))
			{
				String InsertQryVDSH="insert into voice_desired_score_history(Program_Id,PP_Id,Desired_score,Updated_On) select *,now() from voice_desired_score where Program_id='"+ProgramId+"'";
				System.out.println("Inserted Query into precis_desired_score_history::"+InsertQryVDSH);
				Statement stmteditVDSH=connection.createStatement();
				stmteditVDSH.execute(InsertQryVDSH);
				System.out.println("Inserted Successfully::::voice_desired_score_history");
				
				String deleteQry="delete from voice_desired_score where Program_Id='"+ProgramId+"'";
				Statement stmtdelete=connection.createStatement();
				stmtdelete.execute(deleteQry);
				System.out.println("Succesfully Deleted::::");
				stmtdelete.close();
				
				int SIMDesiredScore=0;
			    String QuerySIMDesiredScore="select Desired_Score from precis_desired_score_default Where Program_Id=1";
				System.out.println("QuerySIMDesiredScore:::"+QuerySIMDesiredScore);
				Statement stmtDesiredSIMScore=connection.createStatement();
				ResultSet rsDesiredSIMScore=stmtDesiredSIMScore.executeQuery(QuerySIMDesiredScore);
				int j=1;
				while(rsDesiredSIMScore.next())
				{
				SIMDesiredScore=rsDesiredSIMScore.getInt("Desired_Score");
				System.out.println("DesiredScore::::::"+SIMDesiredScore);
				Statement stmtDesiredSIMInsert=connection.createStatement();
				String InsertQueryDesiredScore="insert into precis_desired_score(Program_Id,PP_Id,Desired_score) values('"+ProgramId+"',"+j+","+SIMDesiredScore+")";
				stmtDesiredSIMInsert.execute(InsertQueryDesiredScore);
				System.out.println("InsertQueryDesiredScore::::Voice::"+InsertQueryDesiredScore);
				j++;
				System.out.println("Value of i::::::"+j);
				}
				rsDesiredSIMScore.close();
				stmtDesiredSIMScore.close();
			}
		}
	}
  //*********Edit Part*********//
  
  
 //:::::::::::Delete part::::::::// 
  if(ActionType.equalsIgnoreCase("3"))
	 {
		String query="update program_names_master set Is_Alive=0 where Program_Id='" + ProgramId + "'";
		System.out.println("query for Action 3: Program Inactive:"+query);
		Statement stmt=connection.createStatement();
		stmt.executeUpdate(query);
		System.out.println("Program Disabled Successfully::::");
		stmt.close();
	 }
 //:::::::::::Delete part:::::::://  
session.setAttribute("ProgramId",ProgramId);
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
    <title>[24]7 Admin Manage Program</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<script type="text/javascript" language="javascript">
    alert("Updated Successfully."); 
    parent.location.href= "<%=recruitPath%>jsp/Admin_Add_Program.jsp";

  </script>
  </head>
  
  <body>
    
  </body>
</html>
