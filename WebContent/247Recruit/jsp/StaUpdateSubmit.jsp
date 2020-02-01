<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,java.util.Date,java.text.SimpleDateFormat,util.ConnectDatabase" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<%@page import="util.IsLanguageValidator"%>

<%
try
{
String canId= (String) session.getAttribute("Bpo_Cand_Id");
System.out.println("canId ::"+canId);
String USER_ID = (String)session.getAttribute("USER_ID");
if(USER_ID == null)
 	{
 		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
 	}
System.out.println("USER_ID in status update page::::"+USER_ID);
int CandidateState = Integer.parseInt(request.getParameter("selFor"));
System.out.println("Selected Status::"+CandidateState);
String changeReason=request.getParameter("changeReason");
System.out.println("changeReason::"+changeReason);
int candidateInitialState = Integer.parseInt(request.getParameter("candidatestatus"));
System.out.println("candidateInitialState Status::"+candidateInitialState);
int CandApplyingFor = Integer.parseInt(request.getParameter("ApplyingFor"));
System.out.println("Candidate Appying for::"+CandApplyingFor);
int userID = Integer.parseInt(request.getParameter("CandAutoId"));
System.out.println("CandAutoId::"+userID);
boolean languageAvailable = false;
boolean voiceScoreStatus = false; 
boolean typingTestStatus = false;
boolean readingCompStatus = false;
boolean engGrammerStatus = false;
boolean precisWritingStatus = false;
boolean mockChatStatus = false;
languageAvailable=IsLanguageValidator.LanguageValidator(userID);
Connection connection=ConnectDatabase.getConnection();		
Statement stmt=connection.createStatement();
//*******Candidate Details code*********//
		    Statement stCandDtsl=null;
			ResultSet rsCandDtsl=null;
		    int Init_Result=0;
		    int Init_Selected_Program=0;
		    String Recruiter_Cand_Select_ID="";
		    String Recruiter_Cand_Select_Date=null;
		    String qryStatusChng="";
		    String queryForqualification="SELECT  Init_Result,Init_Selected_Program,Recruiter_Cand_Select_ID,Recruiter_Cand_Select_Date FROM bpo_candidatesreg_details where Bpo_Cand_Id='"+canId+"'";
			stCandDtsl=connection.createStatement();
			rsCandDtsl=stCandDtsl.executeQuery(queryForqualification);
			if(rsCandDtsl.next())
	    	{	
	    	Init_Result=rsCandDtsl.getInt("Init_Result");
	    	System.out.println("Init_Result:::::"+Init_Result);
	    	Init_Selected_Program=rsCandDtsl.getInt("Init_Selected_Program");
	    	System.out.println("Init_Selected_Program:::::"+Init_Selected_Program);
	    	Recruiter_Cand_Select_ID=rsCandDtsl.getString("Recruiter_Cand_Select_ID");
	    	if(Recruiter_Cand_Select_ID==null)
	    	{
	    	Recruiter_Cand_Select_ID="";
	    	}
	    	System.out.println("Recruiter_Cand_Select_ID:::::"+Recruiter_Cand_Select_ID);
	    	Recruiter_Cand_Select_Date=rsCandDtsl.getString("Recruiter_Cand_Select_Date");
	    	System.out.println("Recruiter_Cand_Select_Date:::::"+Recruiter_Cand_Select_Date);
	    	}
		    rsCandDtsl.close();
		    stCandDtsl.close();
//*****Candidate Details code*****//

//*********candidate_status_change*********//
            
            if(Recruiter_Cand_Select_Date==null)
            {
       	 	 	qryStatusChng = "insert into candidate_status_change(Candidate_ID,cand_Status_old,cand_Status_Selected,Init_Result,Init_Selected_Program,Recruiter_Cand_Select_ID,Changed_By,Change_Reason) values ('"+canId+"',"+candidateInitialState+","+CandidateState+","+Init_Result+","+Init_Selected_Program+",'"+Recruiter_Cand_Select_ID+"','"+USER_ID+"','"+changeReason+"')";
			}	
			else
			{
				qryStatusChng = "insert into candidate_status_change(Candidate_ID,cand_Status_old,cand_Status_Selected,Init_Result,Init_Selected_Program,Recruiter_Cand_Select_ID,Recruiter_Cand_Select_Date,Changed_By,Change_Reason) values ('"+canId+"',"+candidateInitialState+","+CandidateState+","+Init_Result+","+Init_Selected_Program+",'"+Recruiter_Cand_Select_ID+"','"+Recruiter_Cand_Select_Date+"','"+USER_ID+"','"+changeReason+"')";
			}
			System.out.println("query::::::: "+qryStatusChng);
			Statement stmtsrec = connection.createStatement();
			stmtsrec.execute(qryStatusChng);
			System.out.println("Insert successfull into table::::::: ");
//*********End of candidate_status_change*********//

for(int i=CandidateState+1;i<=candidateInitialState;i++)
{
System.out.println("Value of i is"+i);
	
	if(i==7)
	{
		 //********************Operations Interview  query Test**********//
		String InsertQryOperations="insert into operations_interview_master_history(operations_interview_ID,User_Id,Candidate_ID,Program_Id,Start_Date,End_Date,Overall_comment,Score,Result_Status,Log_Date) select *,now() from operations_interview_master where Candidate_ID="+userID+"";
		System.out.println("Inserted Query into operations_interview_master_history::"+InsertQryOperations);
		stmt.execute(InsertQryOperations);
		System.out.println("Inserted Successfully::::operations_interview_master_history");
		
		String UpdateQryOps = "delete from operations_interview_master where Candidate_ID="+userID+"";
		System.out.println("operations_interview_master : "+UpdateQryOps);
		stmt.execute(UpdateQryOps);
		System.out.println("delete successfull in operations_interview_master");
	      
	    //***********************Init Result and Init_Selected_Program*********//
	    String queryInitRslt="update bpo_candidatesreg_details set Init_Result=0,Init_Selected_Program=0 where Bpo_Cand_Id='" + canId + "'";
		stmt.executeUpdate(queryInitRslt);
		System.out.println("Init_Selected_Program:::Update successfull in bpo_candidatesreg_details finally:::::");
	}
 	if(i==6)
	{
		if (CandApplyingFor==1)
		{
			String queryForVoice = "select Cand_Id from candidate_voice_score where Cand_Id='"+userID+"'";
			stmt = connection.createStatement();
			ResultSet rsvoice = stmt.executeQuery(queryForVoice);
			if(rsvoice.next())
			{
				voiceScoreStatus = true;
			}
			rsvoice.close();
			System.out.println("voiceScoreStatus::::"+voiceScoreStatus);
			if(voiceScoreStatus == true)
			{
				//********************Voice Score query **********//
					String InsertQryVoice="insert into candidate_voice_rescore(Voice_Auto_Id,Cand_id,Recruiter_ID,Program_Id,PPA1,PPA2,PPB1,PPB2,PPC1,PPC2,Comments,Statusi,Total_score,Start_Time,End_Time,Time_in_mins,Last_Scored_Date,Log_Date) select Voice_Auto_Id,Cand_id,Recruiter_ID,Program_Id,PPA1,PPA2,PPB1,PPB2,PPC1,PPC2,Comments,Statusi,Total_score,Start_Time,End_Time,Time_in_mins,Last_Scored_Date,now() from candidate_voice_score where Cand_ID="+userID+"";
					System.out.println("Inserted Query into candidate_voice_rescore::"+InsertQryVoice);
					stmt.execute(InsertQryVoice);
					System.out.println("Inserted Successfully::::candidate_voice_rescore");
					
					String UpdateQryVoice = "delete from candidate_voice_score where Cand_ID="+userID+"";
					System.out.println("candidate_voice_score : "+UpdateQryVoice);
					stmt.execute(UpdateQryVoice);
					System.out.println("delete successfull in candidate_voice_score");
				 //********************End of Voice Score query **********//
			}	 
		}
		else if(CandApplyingFor==2)
		{
			precisLanguageDelete(userID);
		}
		
	}
	if((i==5) && (CandApplyingFor==1))
	{
		//********************Stability Score query **********//
			String InsertQryStability="insert into stability_chk_master_history(Stability_Chk_ID,User_Id,Candidate_ID,Start_Date,End_Date,Overall_comment,Score,Result_Status,Log_Date) select Stability_Chk_ID,User_Id,Candidate_ID,Start_Date,End_Date,Overall_comment,Score,Result_Status,now() from stability_chk_master where Candidate_ID="+userID+"";
			System.out.println("Inserted Query into stability_chk_master_history::"+InsertQryStability);
			stmt.execute(InsertQryStability);
			System.out.println("Inserted Successfully::::stability_chk_master_history");
			
			String UpdateQryStability = "delete from stability_chk_master where Candidate_ID="+userID+"";
			System.out.println("stability_chk_master : "+UpdateQryStability);
			stmt.execute(UpdateQryStability);
			System.out.println("delete successfull in stability_chk_master");
		//********************End of Stability Score query **********//
	}
	if((i ==4)&& (CandApplyingFor==2))
    {
			precisLanguageDelete(userID);
			testsInsertDelete(userID);
	}
   if(i<4)
	{
			if(candidateInitialState == 3 && CandApplyingFor == 2) 
			{
				testsInsertDelete(userID);
			}
			String UpdateApplngFor = "update bpo_candidatesreg_details set Applying_For = 0 where Bpo_Cand_Id='"+canId+"'";
			System.out.println("bpo_candidatesreg_details::::::"+UpdateApplngFor);		
			stmt.executeUpdate(UpdateApplngFor);
			System.out.println("Update successfull in bpo_candidatesreg_details");
    }
  }


String query="update bpo_candidatesreg_details set cand_Status=" + CandidateState + " where Bpo_Cand_Id='" + canId + "'";
stmt.executeUpdate(query);
System.out.println("Update successfull in bpo_candidatesreg_details finally:::::");

%>
<%!
	public void testsInsertDelete(int userID)
		 {
		 	try
				{
					boolean typingTestStatus = false;
					boolean readingCompStatus = false;
					boolean engGrammerStatus = false;
					boolean precisWritingStatus = false;
					boolean languageTestStatus = false;
					boolean mockChatStatus = false;
					Connection connection=ConnectDatabase.getConnection();
					Statement stmt=connection.createStatement();
					typingTestStatus = IsLanguageValidator.typingTestValidator(userID);
					readingCompStatus = IsLanguageValidator.readingCompValidator(userID);
					engGrammerStatus = IsLanguageValidator.engGrammarValidator(userID);
					precisWritingStatus = IsLanguageValidator.precisTestValidator(userID);
					languageTestStatus = IsLanguageValidator.LanguageValidator(userID);
					mockChatStatus = IsLanguageValidator.mockChatValidator(userID);
					
					//**********************Typing Test Query***********//
					if(typingTestStatus == true)
					{
						String InsertQryTyping="insert into bpo_user_typing_test_attempt_history(TYPING_TEST_ATTEMPT_ID,USER_ID,START_DATE_ACTIVE,END_DATE_ACTIVE,Num_Of_Matches,Num_Of_Mismatches,ACCURACY,SPEED,Final_Score,Final_Status,Log_Date) select TYPING_TEST_ATTEMPT_ID,USER_ID,START_DATE_ACTIVE,END_DATE_ACTIVE,Num_Of_Matches,Num_Of_Mismatches,ACCURACY,SPEED,Final_Score,Final_Status,now() from bpo_user_typing_test_attempt where User_Id="+userID+"";
						System.out.println("Inserted Query::"+InsertQryTyping);
						stmt.execute(InsertQryTyping);
						System.out.println("Inserted Successfully bpo_user_typing_test_attempt_history::");
						
						String UpdateQryTyping = "delete from  bpo_user_typing_test_attempt where USER_ID="+userID+"";
						System.out.println("bpo_user_typing_test_attempt       : "+UpdateQryTyping);		
						stmt.execute(UpdateQryTyping);
						System.out.println("Update successfull in bpo_user_typing_test_attempt");
						
						String InsertQryTyping1="insert into bpo_user_typing_test_history(TYPING_TEST_ID,USER_ID,TYPING_MASTER_ID,TYPING_ANSWER,Log_Date) select TYPING_TEST_ID,USER_ID,TYPING_MASTER_ID,TYPING_ANSWER,now() from bpo_user_typing_test where User_Id="+userID+"";
						System.out.println("Inserted Query::"+InsertQryTyping1);
						stmt.execute(InsertQryTyping1);
						System.out.println("Inserted Successfully bpo_user_typing_test_history::");
						
						String UpdateQryTyping1 = "delete from  bpo_user_typing_test where USER_ID="+userID+"";
						System.out.println("bpo_user_typing_test:::::: "+UpdateQryTyping1);		
						stmt.execute(UpdateQryTyping1);
						System.out.println("Update successfull in bpo_user_typing_test");
					}
					
					//********************Reading query Test**********//
					if(readingCompStatus == true)
					{
						String InsertQryReading="insert into bpo_user_reading_comp_test_attempt_history(READING_TEST_ATTEMPT_ID,USER_ID,START_DATE_ACTIVE,END_DATE_ACTIVE,Final_Score,Final_Status,Log_Date) select READING_TEST_ATTEMPT_ID,USER_ID,START_DATE_ACTIVE,END_DATE_ACTIVE,Final_Score,Final_Status,now() from bpo_user_reading_comp_test_attempt where User_Id="+userID+"";
						System.out.println("Inserted Query::"+InsertQryReading);
						stmt.execute(InsertQryReading);
						System.out.println("Inserted Successfully::::bpo_user_reading_comp_test_attempt_history");
						
						String UpdateQryReadingComp = "delete from bpo_user_reading_comp_test_attempt where USER_ID="+userID+"";
						System.out.println("bpo_user_reading_comp_test_attempt : "+UpdateQryReadingComp);
						stmt.execute(UpdateQryReadingComp);
						System.out.println("Update successfull in bpo_user_reading_comp_test_attempt");
						
						String InsertQryReading1="insert into bpo_user_reading_comp_test_history(READING_TEST_ID,USER_ID,READING_COMP_MASTER_ID,READING_COMP_QUESTION_MASTER_ID,READING_COMP_QUESTION_ANSWER_MASTER_ID,status,Log_Date) select READING_TEST_ID,USER_ID,READING_COMP_MASTER_ID,READING_COMP_QUESTION_MASTER_ID,READING_COMP_QUESTION_ANSWER_MASTER_ID,status,now() from bpo_user_reading_comp_test where User_Id="+userID+"";
						System.out.println("Inserted Query1::"+InsertQryReading1);
						stmt.execute(InsertQryReading1);
						System.out.println("Inserted Successfully::::bpo_user_reading_comp_test_history");
						
						String UpdateQryReadingComp1 = "delete from bpo_user_reading_comp_test where USER_ID="+userID+"";
						System.out.println("bpo_user_reading_comp_test : "+UpdateQryReadingComp1);
						stmt.execute(UpdateQryReadingComp1);
						System.out.println("Update successfull in bpo_user_reading_comp_test");
					}
					
					//*********************English Query Test***************//
					if(engGrammerStatus == true)
					{
						String InsertQryEnglish="insert into bpo_user_eng_comp_test_attempt_history(READING_TEST_ATTEMPT_ID,USER_ID,START_DATE_ACTIVE,END_DATE_ACTIVE,Final_Score,Final_Status,Log_Date) select READING_TEST_ATTEMPT_ID,USER_ID,START_DATE_ACTIVE,END_DATE_ACTIVE,Final_Score,Final_Status,now() from bpo_user_eng_comp_test_attempt where User_Id="+userID+"";
						System.out.println("Inserted Query::"+InsertQryEnglish);
						stmt.execute(InsertQryEnglish);
						System.out.println("Inserted Successfully bpo_user_eng_comp_test_attempt_history::");
						
						String UpdateQrYEnglish = "delete from  bpo_user_eng_comp_test_attempt where USER_ID="+userID+"";
						System.out.println("bpo_user_eng_comp_test_attempt     : "+UpdateQrYEnglish);
						stmt.execute(UpdateQrYEnglish);
						System.out.println("Update successfull in bpo_user_eng_comp_test_attempt");
						
						String InsertQryEnglish1="insert into bpo_user_eng_comp_test_history(READING_TEST_ID,USER_ID,READING_COMP_MASTER_ID,READING_COMP_QUESTION_MASTER_ID,READING_COMP_QUESTION_ANSWER_MASTER_ID,status,Log_Date) select READING_TEST_ID,USER_ID,READING_COMP_MASTER_ID,READING_COMP_QUESTION_MASTER_ID,READING_COMP_QUESTION_ANSWER_MASTER_ID,status,now() from bpo_user_eng_comp_test where User_Id="+userID+"";
						System.out.println("Inserted Query::"+InsertQryEnglish1);
						stmt.execute(InsertQryEnglish1);
						System.out.println("Inserted Successfully bpo_user_eng_comp_test_attempt_history::");
						
						String UpdateQrYEnglish1 = "delete from  bpo_user_eng_comp_test where USER_ID="+userID+"";
						System.out.println("bpo_user_eng_comp_test_attempt     : "+UpdateQrYEnglish1);
						stmt.execute(UpdateQrYEnglish1);
						System.out.println("Update successfull in bpo_user_eng_comp_test_attempt");
					}
					
					//***************** Precis Test Query*****************//
					if(precisWritingStatus == true)
					{
						String InsertQryPrecis="insert into precis_test_attempt_master_history(Precis_Attempt_Id,USER_ID,Cand_generated_Id,Precis_Passage_Id,Precis_Typed_Area_Text,Start_Date,End_Date,Is_Active,Log_Date) select Precis_Attempt_Id,USER_ID,Cand_generated_Id,Precis_Passage_Id,Precis_Typed_Area_Text,Start_Date,End_Date,Is_Active,now() from precis_test_attempt_master where User_Id="+userID+"";
						System.out.println("Inserted Query::"+InsertQryPrecis);
						stmt.execute(InsertQryPrecis);
						System.out.println("Inserted Successfully precis_test_attempt_master_history::");
						
						
						String UpdateQrYPrecis="delete from  precis_test_attempt_master where USER_ID="+userID+"";
						System.out.println("preceWriting   : "+UpdateQrYPrecis);
						stmt.execute(UpdateQrYPrecis);
						System.out.println("Update successfull in precis_test_attempt_master");
					}
					
					//***************** Language Test Query*****************//
					if(languageTestStatus == true)
					{
						String InsertQryLang="insert into language_test_attempt_master_history(Lang_Attempt_Id,Cand_Id,Lang_Test_Id,PartA_A1,PartA_A2,PartA_A3,PartA_A4,PartA_A5,PartA_A6,PartA_A7,PartA_A8,PartA_A9,PartA_A10,PartB_A,PartC_A,Start_Date,End_Date,Log_Date) select Lang_Attempt_Id,Cand_Id,Lang_Test_Id,PartA_A1,PartA_A2,PartA_A3,PartA_A4,PartA_A5,PartA_A6,PartA_A7,PartA_A8,PartA_A9,PartA_A10,PartB_A,PartC_A,Start_Date,End_Date,now() from language_test_attempt_master where Cand_Id="+userID+"";
						System.out.println("Inserted Query::"+InsertQryLang);
						stmt.execute(InsertQryLang);
						System.out.println("Inserted Successfully language_test_attempt_master_history::");
						
						String UpdateQrYLang="delete from language_test_attempt_master where Cand_Id="+userID+"";
						System.out.println("preceWriting   : "+UpdateQrYLang);
						stmt.execute(UpdateQrYLang);
						System.out.println("Update successfull in language_test_attempt_master");
					}
				
					//*****************MokChat Test query******************//
					if(mockChatStatus == true)
					{
						String InsertQryMock="insert into mock_chat_test_attempt_master_history(Chat_Test_Attempt_Id,User_Id,Start_Date_Active,End_Date_Test,Chat_Script_Id,Transcript,Log_Date) select Chat_Test_Attempt_Id,User_Id,Start_Date_Active,End_Date_Test,Chat_Script_Id,Transcript,now() from mock_chat_test_attempt_master where User_Id="+userID+"";
						System.out.println("Inserted Query::"+InsertQryMock);
						stmt.execute(InsertQryMock);
						System.out.println("Inserted Successfully precis_test_attempt_master_history::");
						
						String UpdateQrYMok = "delete from  mock_chat_test_attempt_master where USER_ID="+userID+"";
						System.out.println("bpo_user_chat_test_attempt    : "+UpdateQrYMok);
						stmt.executeUpdate(UpdateQrYMok);
						System.out.println("Update successfull in mock_chat_test_attempt_master");
						
						String InsertQryMockDeatils="insert into mock_chat_test_details_history(User_Id,Chat_Test_Attempt_Id,Chat_Question_Id,Chat_Question,User_Reply,Log_Date) select User_Id,Chat_Test_Attempt_Id,Chat_Question_Id,Chat_Question,User_Reply,now() from mock_chat_test_details where User_Id="+userID+"";
						System.out.println("Inserted Query::"+InsertQryMock);
						stmt.execute(InsertQryMockDeatils);
						System.out.println("Inserted Successfully mock_chat_test_details_history::");
						
						String UpdateQrYMokDetails = "delete from  mock_chat_test_details where USER_ID="+userID+"";
						System.out.println("bpo_user_chat_test_attempt    : "+UpdateQrYMokDetails);
						stmt.execute(UpdateQrYMokDetails);
						System.out.println("Update successfull in mock_chat_test_details");
					}
			  }
			 catch(Exception ex)
			 {
			 	ex.printStackTrace();
			 }
		 }
	
	public void precisLanguageDelete(int userID)
		 {
		 	try
				{
					boolean languageAvailable = false;
					boolean chatScoreStatus = false;
					boolean precisScoreStatus = false;
					boolean languageScoreStatus = false;
					languageAvailable=IsLanguageValidator.LanguageValidator(userID);
					System.out.println("Inside the function languageAvailable::::"+languageAvailable);
					Connection connection=ConnectDatabase.getConnection();		
					Statement stmts=connection.createStatement();
					System.out.println("Inside the function precisLanguageDelete::::");
					 
					String queryForChat = "select Cand_Id from candidate_chat_score where Cand_Id='"+userID+"'";
					stmts = connection.createStatement();
					ResultSet rs = stmts.executeQuery(queryForChat);
					if(rs.next())
					{
						chatScoreStatus = true;
					}
					rs.close();
					System.out.println("Inside the function chatScoreStatus::::"+chatScoreStatus);
					
					String queryForPrecis = "select Cand_Id from candidate_precis_writing_score where Cand_Id='"+userID+"'";
					stmts = connection.createStatement();
					rs = stmts.executeQuery(queryForPrecis);
					if(rs.next())
					{
						precisScoreStatus = true;
					}
					rs.close();
					System.out.println("Inside the function precisScoreStatus::::"+precisScoreStatus);
					
					String queryForLanguage = "select Cand_Id from candidate_language_testscore where Cand_Id='"+userID+"'";
					stmts = connection.createStatement();
					rs = stmts.executeQuery(queryForLanguage);
					if(rs.next())
					{
						languageScoreStatus = true;
					}
					rs.close();
					System.out.println("Inside the function languageScoreStatus::::"+languageScoreStatus);
						if(chatScoreStatus == true)
						{
							 //********************Chat Score query **********//
								String InsertQryChat="insert into candidate_chat_rescore(Chat_auto_Id,Cand_Id,Recruiter_ID,Program_Id,Chat_PPA1,Chat_PPA2,Chat_PPA3,Chat_PPA4,Chat_PPB1,Chat_PPB2,Chat_PPB3,Chat_PPB4,Chat_PPC1_Score,Chat_PPC2_Score,Chat_Totalerror1,Chat_Totalerror2,Comments,Statusi,Total_score,Last_Scored_Date,Log_Date) select Chat_auto_Id,Cand_Id,Recruiter_ID,Program_Id,Chat_PPA1,Chat_PPA2,Chat_PPA3,Chat_PPA4,Chat_PPB1,Chat_PPB2,Chat_PPB3,Chat_PPB4,Chat_PPC1_Score,Chat_PPC2_Score,Chat_Totalerror1,Chat_Totalerror2,Comments,Statusi,Total_score,Last_Scored_Date,now() from candidate_chat_score where Cand_ID="+userID+"";
								System.out.println("Inserted Query into candidate_chat_rescore::"+InsertQryChat);
								stmts.execute(InsertQryChat);
								System.out.println("Inserted Successfully::::candidate_chat_rescore");
								
								String UpdateQryChat = "delete from candidate_chat_score where Cand_ID="+userID+"";
								System.out.println("candidate_chat_score : "+UpdateQryChat);
								stmts.execute(UpdateQryChat);
								System.out.println("delete successfull in candidate_chat_score");
							 //********************End of Chat Score query **********//
						 }
					 	//********************Precis Score query **********//
					 if(!languageAvailable)
						{
							if(precisScoreStatus == true)
							{
								String InsertQryPrecis="insert into candidate_precis_writing_rescore(Precis_Auto_Id,Cand_Id,Recruiter_Id,Program_Id,Precis_PPA1,Precis_PPA2,Precis_PPA3,Precis_PPA4,Comments,Statusi,Total_score,Last_scored_Date,Log_Date) select Precis_Auto_Id,Cand_Id,Recruiter_Id,Program_Id,Precis_PPA1,Precis_PPA2,Precis_PPA3,Precis_PPA4,Comments,Statusi,Total_score,Last_scored_Date,now() from candidate_precis_writing_score where Cand_ID="+userID+"";
								System.out.println("Inserted Query into candidate_precis_writing_rescore::"+InsertQryPrecis);
								stmts.execute(InsertQryPrecis);
								System.out.println("Inserted Successfully::::candidate_precis_writing_rescore");
								
								String UpdateQryPrecis = "delete from candidate_precis_writing_score where Cand_ID="+userID+"";
								System.out.println("candidate_chat_score : "+UpdateQryPrecis);
								stmts.execute(UpdateQryPrecis);
								System.out.println("delete successfull in candidate_precis_writing_score");
						 	}
						 }
					 //********************End of Precis Score query **********//
					  
					 //********************Language Score query **********//
					  else
					    {
							if(languageScoreStatus == true)
							{
								String InsertQryLang="insert into candidate_language_testrescore(Lang_Auto_Id,Cand_Id,Recruiter_Id,Program_Id,PartA_RS1,PartA_RS2,PartA_RS3,PartA_RS4,PartA_RS5,PartA_RS6,PartA_RS7,PartA_RS8,PartA_RS9,PartA_RS10,PartA_RS_Total,PartB_Score,PartB_Comments,PartC_Score,PartC_Comments,Comments,Statusi,Total_score,Last_scored_Date,Log_Date) select Lang_Auto_Id,Cand_Id,Recruiter_Id,Program_Id,PartA_RS1,PartA_RS2,PartA_RS3,PartA_RS4,PartA_RS5,PartA_RS6,PartA_RS7,PartA_RS8,PartA_RS9,PartA_RS10,PartA_RS_Total,PartB_Score,PartB_Comments,PartC_Score,PartC_Comments,Comments,Statusi,Total_score,Last_scored_Date,now() from candidate_language_testscore where Cand_ID="+userID+"";
								System.out.println("Inserted Query into candidate_language_testrescore::"+InsertQryLang);
								stmts.execute(InsertQryLang);
								System.out.println("Inserted Successfully::::candidate_language_testrescore");
								
								String UpdateQryLang = "delete from candidate_language_testscore where Cand_ID="+userID+"";
								System.out.println("candidate_language_testscore : "+UpdateQryLang);
								stmts.execute(UpdateQryLang);
								System.out.println("delete successfull in candidate_language_testscore");
							}
						}
					 //********************End of Language Score query **********//
			  }
			 catch(Exception ex)
			 {
			 	ex.printStackTrace();
			 }
		 }
		  %>
                 <%
					stmt.close();
					connection.close();
					}
					catch(Exception ex)
					{
					ex.getMessage();
					ex.getCause();
					ex.printStackTrace();
					System.out.println(ex.getCause()+"_______"+ex.getMessage());
					}
					
				 %>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>[24]7 SPRINGBOARD</title>
    
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<script type="text/javascript" language="javascript">
   alert("Updated Successfully");
   parent.location.href= "<%=recruitPath%>jsp/Cand_Status_Update.jsp";
  
  </script>
  </head>
  
  <body>
  </body>
</html>
