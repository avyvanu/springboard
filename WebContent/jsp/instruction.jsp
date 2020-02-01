<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.EmailDemo"%>
<%@page import="util.SMSFunction"%>
<%@page import="util.ConnectionDAO"%>
<%@ include file="GlobalDeclareNEW.jsp"%>

<%
	try
	{
	String f5_refreash =(String)session.getAttribute("F5_REFERSH");
	System.out.println("f5_refreash AAAAA \t"+f5_refreash);
	if(f5_refreash!=null)
	{
		System.out.println("f5_refreash BBBBB \t"+f5_refreash);
		if(f5_refreash.equals("0"))
		{
			System.out.println("f5_refreash CCCCC \t"+f5_refreash);
			%>
 			<script language="Javascript">
 			var error = 'error';
 			function call()
 			{
 				
 			}
			</script> 
		   <%
			
		}
	}
	String USER_Name =(String)session.getAttribute("USER_Name");

	int USER_AUTOID =(Integer)session.getAttribute("USER_AUTOID");
	if(USER_AUTOID==0)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	}
	session.setAttribute("F5_REFERSH", "0");
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>[24]7 SPRINGBOARD</title>
	<link rel="stylesheet" type="text/css" href="../css/careers.css"/>
	<link rel="stylesheet" type="text/css" href="../247Recruit/css/MasterTheme.css"/>
	<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/NoBack.js"></script>
	<!-- Back button jquery -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/jquery-1.2.6.js"></script>
	
	<!-- top.window.location.href = '<%=request.getContextPath()%>/jsp/Login.jsp?secruity_violation='+error+'&id='+randomString()+''+Math.random(); -->
	
	<script type="text/javascript">
		function logout()
		{
			top.window.location.href = "<%=request.getContextPath()%>/LogoutServletV";
		}
	</script>
	<style type="text/css">
	  	html,body,form
		{
			margin: 0px;
		}
		.instrLink a
		{
			color:#F28900;
		}
	</style>
<script type="text/javascript">
function randomString() {
        var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
        var string_length = 30;
        var randomstring = '';
        for (var i=0; i<string_length; i++) {
                var rnum = Math.floor(Math.random() * chars.length);
                randomstring += chars.substring(rnum,rnum+1);
        }
        return randomstring;
}
$(function(){			
	var error = 'error';
	var lastjavascripthash='';
	if (location.hash) 
	{
		top.window.location.href = '<%=request.getContextPath()%>/jsp/Login.jsp?secruity_violation='+error+'&id='+randomString()+''+Math.random();
		lastjavascripthash=location.hash;
	}
	//just add a dummy hash:
	lastjavascripthash=location.hash='#loaded';	
	//when clicking the links append the hash to the url:
	$('#tostep1').click(function() 
	{
		lastjavascripthash=location.hash='#step1';					
	});
	$('#tostep2').click(function() 
	{
		lastjavascripthash=location.hash='#step2';					
	});
	//do regular check if the hash in the location still fits the last hash that was set via a valid javascript call
	// if not it means someone else modified the hash - typically the browser back
	setInterval(function() 
	{
		if (location.hash != lastjavascripthash) 
		{
			top.window.location.href = '<%=request.getContextPath()%>/jsp/Login.jsp?secruity_violation='+error+'&id='+randomString()+''+Math.random();
			lastjavascripthash=location.hash;
		}
	}, 300);
});
</script>
	
</head>
<body onload="call()">
<table border="0" width="100%" style="padding-top: 5px;">
     <tr>
	    <td align="left" style="padding-left:10px;">
	        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Post Registration > </font>
	        <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Instruction</font>		
		</td>
		<td align="right" style="padding-right:10px;">
			<b><span class="recName" style="font-size:12px;"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>			
		</td>
	</tr>
</table>
<br/>
 
<%
	System.out.println("inside Instruction :::::::"+USER_Name);
	
	boolean button=false;
	boolean typeButton=false;
	boolean mockButton=false;
	boolean engbutton=false;
	boolean preceButton=false;
	boolean Language=false;

	
	String endDate=null;
	String endDate2=null;
	String endDate3=null;
	String endDateeng=null;	
	String strPrece=null;	
	String strMok=null;
	String LangTest = null;
	
	Connection con = null;
	Statement dStmt = null;
	ResultSet rsquery=null;

	
		try
			{
	    		int userID = (Integer)session.getAttribute("USER_AUTOID");
				con = ConnectDatabase.getConnection();
				
				// Reading query Test
				String delQry = "select END_DATE_ACTIVE from bpo_user_reading_comp_test_attempt where USER_ID="+userID;
				System.out.println("bpo_user_reading_comp_test_attempt : "+delQry);
				dStmt = con.createStatement();
				rsquery = dStmt.executeQuery(delQry);
				if(rsquery.next())
				{
					endDate = rsquery.getString("END_DATE_ACTIVE");
					if(endDate==null)
					{
						System.out.println("date is null");
						try
						{
							Statement delSt = con.createStatement();
							String InsertQryReading="insert into bpo_user_reading_comp_test_attempt_history(READING_TEST_ATTEMPT_ID,USER_ID,START_DATE_ACTIVE,END_DATE_ACTIVE,Final_Score,Final_Status,Log_Date) select READING_TEST_ATTEMPT_ID,USER_ID,START_DATE_ACTIVE,END_DATE_ACTIVE,Final_Score,Final_Status,now() from bpo_user_reading_comp_test_attempt where User_Id="+userID+"";
							System.out.println("Inserted Query::"+InsertQryReading);
							delSt.execute(InsertQryReading);
							System.out.println("Inserted Successfully::::bpo_user_reading_comp_test_attempt_history");
							
							String UpdateQryReadingComp = "delete from bpo_user_reading_comp_test_attempt where USER_ID="+userID+"";
							System.out.println("bpo_user_reading_comp_test_attempt : "+UpdateQryReadingComp);
							delSt.execute(UpdateQryReadingComp);
							System.out.println("Update successfull in bpo_user_reading_comp_test_attempt");
							
							String InsertQryReading1="insert into bpo_user_reading_comp_test_history(READING_TEST_ID,USER_ID,READING_COMP_MASTER_ID,READING_COMP_QUESTION_MASTER_ID,READING_COMP_QUESTION_ANSWER_MASTER_ID,status,Log_Date) select READING_TEST_ID,USER_ID,READING_COMP_MASTER_ID,READING_COMP_QUESTION_MASTER_ID,READING_COMP_QUESTION_ANSWER_MASTER_ID,status,now() from bpo_user_reading_comp_test where User_Id="+userID+"";
							System.out.println("Inserted Query1::"+InsertQryReading1);
							delSt.execute(InsertQryReading1);
							System.out.println("Inserted Successfully::::bpo_user_reading_comp_test_history");
							
							String UpdateQryReadingComp1 = "delete from bpo_user_reading_comp_test where USER_ID="+userID+"";
							System.out.println("bpo_user_reading_comp_test : "+UpdateQryReadingComp1);
							delSt.execute(UpdateQryReadingComp1);
							System.out.println("Update successfull in bpo_user_reading_comp_test");
							delSt.close();
							//String deleteQry = "delete from bpo_user_reading_comp_test where USER_ID="+userID;
							//Statement delSt = con.createStatement();
							//delSt.execute(deleteQry);
						}
						catch(Exception ex)
						{
							ex.printStackTrace();
						}
					}
					else
					{
						button=true;
					}
				}
				rsquery.close();
// -------------------------------------------------------------------------------------------------------------------   //
				// Typing Test Query
				String delTypeQry = "select END_DATE_ACTIVE from bpo_user_typing_test_attempt where USER_ID="+userID;
				System.out.println("bpo_user_typing_test_attempt       : "+delTypeQry);						
				dStmt = con.createStatement();
				rsquery = dStmt.executeQuery(delTypeQry);			
				if(rsquery.next())
				{
				 	endDate2 = rsquery.getString("END_DATE_ACTIVE");
					if(endDate2==null)
					{
						System.out.println("TYPE date is null");
						try
						{
							Statement delSt = con.createStatement();
							String InsertQryTyping="insert into bpo_user_typing_test_attempt_history(TYPING_TEST_ATTEMPT_ID,USER_ID,START_DATE_ACTIVE,END_DATE_ACTIVE,Num_Of_Matches,Num_Of_Mismatches,ACCURACY,SPEED,Final_Score,Final_Status,Log_Date) select TYPING_TEST_ATTEMPT_ID,USER_ID,START_DATE_ACTIVE,END_DATE_ACTIVE,Num_Of_Matches,Num_Of_Mismatches,ACCURACY,SPEED,Final_Score,Final_Status,now() from bpo_user_typing_test_attempt where User_Id="+userID+"";
							System.out.println("Inserted Query::"+InsertQryTyping);
							delSt.execute(InsertQryTyping);
							System.out.println("Inserted Successfully bpo_user_typing_test_attempt_history::");
							
							String UpdateQryTyping = "delete from  bpo_user_typing_test_attempt where USER_ID="+userID+"";
							System.out.println("bpo_user_typing_test_attempt       : "+UpdateQryTyping);		
							delSt.execute(UpdateQryTyping);
							System.out.println("Update successfull in bpo_user_typing_test_attempt");
							
							String InsertQryTyping1="insert into bpo_user_typing_test_history(TYPING_TEST_ID,USER_ID,TYPING_MASTER_ID,TYPING_ANSWER,Log_Date) select TYPING_TEST_ID,USER_ID,TYPING_MASTER_ID,TYPING_ANSWER,now() from bpo_user_typing_test where User_Id="+userID+"";
							System.out.println("Inserted Query::"+InsertQryTyping1);
							delSt.execute(InsertQryTyping1);
							System.out.println("Inserted Successfully bpo_user_typing_test_history::");
							
							String UpdateQryTyping1 = "delete from  bpo_user_typing_test where USER_ID="+userID+"";
							System.out.println("bpo_user_typing_test:::::: "+UpdateQryTyping1);		
							delSt.execute(UpdateQryTyping1);
							System.out.println("Update successfull in bpo_user_typing_test");
							delSt.close();
							//String deleteQry = "delete from bpo_user_typing_test_attempt where USER_ID="+userID;
							//Statement delSt = con.createStatement();
							//delSt.execute(deleteQry);
						}
						catch(Exception ex)
						{
							ex.printStackTrace();
						}
					}
					else
					{
						typeButton=true;
					}
				}
				rsquery.close();
// ------------------------------------------------------------------------------------------------------------- //				
			// English Query Test
				String delQryeng = "select END_DATE_ACTIVE from bpo_user_eng_comp_test_attempt where USER_ID="+userID;
				System.out.println("bpo_user_eng_comp_test_attempt     : "+delQryeng);
				dStmt = con.createStatement();
				rsquery = dStmt.executeQuery(delQryeng);
				if(rsquery.next())
				{
					endDateeng = rsquery.getString("END_DATE_ACTIVE");
					if(endDateeng==null)
					{
						System.out.println("date is null");
						try
						{
							Statement delSt = con.createStatement();
							String InsertQryEnglish="insert into bpo_user_eng_comp_test_attempt_history(READING_TEST_ATTEMPT_ID,USER_ID,START_DATE_ACTIVE,END_DATE_ACTIVE,Final_Score,Final_Status,Log_Date) select READING_TEST_ATTEMPT_ID,USER_ID,START_DATE_ACTIVE,END_DATE_ACTIVE,Final_Score,Final_Status,now() from bpo_user_eng_comp_test_attempt where User_Id="+userID+"";
							System.out.println("Inserted Query::"+InsertQryEnglish);
							delSt.execute(InsertQryEnglish);
							System.out.println("Inserted Successfully bpo_user_eng_comp_test_attempt_history::");
							
							String UpdateQrYEnglish = "delete from  bpo_user_eng_comp_test_attempt where USER_ID="+userID+"";
							System.out.println("bpo_user_eng_comp_test_attempt     : "+UpdateQrYEnglish);
							delSt.execute(UpdateQrYEnglish);
							System.out.println("Update successfull in bpo_user_eng_comp_test_attempt");
							
							String InsertQryEnglish1="insert into bpo_user_eng_comp_test_history(READING_TEST_ID,USER_ID,READING_COMP_MASTER_ID,READING_COMP_QUESTION_MASTER_ID,READING_COMP_QUESTION_ANSWER_MASTER_ID,status,Log_Date) select READING_TEST_ID,USER_ID,READING_COMP_MASTER_ID,READING_COMP_QUESTION_MASTER_ID,READING_COMP_QUESTION_ANSWER_MASTER_ID,status,now() from bpo_user_eng_comp_test where User_Id="+userID+"";
							System.out.println("Inserted Query::"+InsertQryEnglish1);
							delSt.execute(InsertQryEnglish1);
							System.out.println("Inserted Successfully bpo_user_eng_comp_test_attempt_history::");
							
							String UpdateQrYEnglish1 = "delete from  bpo_user_eng_comp_test where USER_ID="+userID+"";
							System.out.println("bpo_user_eng_comp_test_attempt     : "+UpdateQrYEnglish1);
							delSt.execute(UpdateQrYEnglish1);
							System.out.println("Update successfull in bpo_user_eng_comp_test_attempt");
							//String deleteQry = "delete from bpo_user_eng_comp_test where USER_ID="+userID;
							//Statement delSt = con.createStatement();
							//delSt.execute(deleteQry);
							delSt.close();
						}
						catch(Exception ex)
						{
							ex.printStackTrace();
						}
					}
					else
					{
					System.out.println("engbutton is null"+endDateeng);
						engbutton=true;
					}
				}
				rsquery.close();
// ---------------------------------------------------------------------------------------------------------------------- //
				
	/*											
				// Precis Test Query
				String preceWriting="SELECT End_Date FROM precis_test_attempt_master where USER_ID="+userID;
				System.out.println("preceWriting    \t : "+preceWriting);
				dStmt = con.createStatement();
				rsquery = dStmt.executeQuery(preceWriting);	
				
				if(rsquery.next())
				{
				 	strPrece = rsquery.getString("End_Date");
					if(strPrece==null)
					{
						System.out.println("TYPE date is null");
						try
						{
							Statement delSt = con.createStatement();
							String InsertQryPrecis="insert into precis_test_attempt_master_history(Precis_Attempt_Id,USER_ID,Cand_generated_Id,Precis_Passage_Id,Precis_Typed_Area_Text,Start_Date,End_Date,Is_Active,Log_Date) select Precis_Attempt_Id,USER_ID,Cand_generated_Id,Precis_Passage_Id,Precis_Typed_Area_Text,Start_Date,End_Date,Is_Active,now() from precis_test_attempt_master where User_Id="+userID+"";
							System.out.println("Inserted Query::"+InsertQryPrecis);
							delSt.execute(InsertQryPrecis);
							System.out.println("Inserted Successfully precis_test_attempt_master_history::");
							
							String UpdateQrYPrecis="delete from  precis_test_attempt_master where USER_ID="+userID+"";
							System.out.println("preceWriting   : "+UpdateQrYPrecis);
							delSt.execute(UpdateQrYPrecis);
							System.out.println("Update successfull in precis_test_attempt_master");
							delSt.close();
							//String deleteQry = "delete from precis_test_attempt_master where USER_ID="+userID;
							//Statement delSt = con.createStatement();
							//delSt.execute(deleteQry);
						}
						catch(Exception ex)
						{
							ex.printStackTrace();
						}
					}
					else
					{
						preceButton=true;
					}
				}
				rsquery.close();
		*/
// ---------------------------------------------------------------------------------------------------------------------------- //				
				// MokChat Test query
				String adelTypeQry = "SELECT End_Date_Test FROM mock_chat_test_attempt_master where USER_ID="+userID;
				System.out.println("bpo_user_chat_test_attempt         : "+adelTypeQry);
				dStmt = con.createStatement();
				rsquery = dStmt.executeQuery(adelTypeQry);				
		
				if(rsquery.next())
				{
				 	strMok = rsquery.getString("End_Date_Test");
					if(strMok==null)
					{
						System.out.println("TYPE date is null");
						try
						{
							Statement delSt = con.createStatement();
							String InsertQryMock="insert into mock_chat_test_attempt_master_history(Chat_Test_Attempt_Id,User_Id,Start_Date_Active,End_Date_Test,Chat_Script_Id,Transcript,Log_Date) select Chat_Test_Attempt_Id,User_Id,Start_Date_Active,End_Date_Test,Chat_Script_Id,Transcript,now() from mock_chat_test_attempt_master where User_Id="+userID+"";
							System.out.println("Inserted Query::"+InsertQryMock);
							delSt.execute(InsertQryMock);
							System.out.println("Inserted Successfully precis_test_attempt_master_history::");
							
							String UpdateQrYMok = "delete from  mock_chat_test_attempt_master where USER_ID="+userID+"";
							System.out.println("bpo_user_chat_test_attempt    : "+UpdateQrYMok);
							delSt.executeUpdate(UpdateQrYMok);
							System.out.println("Update successfull in mock_chat_test_attempt_master");
							
							String InsertQryMockDeatils="insert into mock_chat_test_details_history(User_Id,Chat_Test_Attempt_Id,Chat_Question_Id,Chat_Question,User_Reply,Log_Date) select User_Id,Chat_Test_Attempt_Id,Chat_Question_Id,Chat_Question,User_Reply,now() from mock_chat_test_details where User_Id="+userID+"";
							System.out.println("Inserted Query::"+InsertQryMock);
							delSt.execute(InsertQryMockDeatils);
							System.out.println("Inserted Successfully mock_chat_test_details_history::");
							
							String UpdateQrYMokDetails = "delete from  mock_chat_test_details where USER_ID="+userID+"";
							System.out.println("bpo_user_chat_test_attempt    : "+UpdateQrYMokDetails);
							delSt.execute(UpdateQrYMokDetails);
							System.out.println("Update successfull in mock_chat_test_details");
							delSt.close();
							//String deleteQry = "delete from mock_chat_test_attempt_master where USER_ID="+userID;
							//Statement delSt = con.createStatement();
							//delSt.execute(deleteQry);
							//deleteQry = "delete from mock_chat_test_details where USER_ID="+userID;
							//delSt.execute(deleteQry);
							//deleteQry = "delete from mokchat_scriptid_archive where USERID="+userID;
							//delSt.execute(deleteQry);
						}
						catch(Exception ex)
						{
							ex.printStackTrace();
						}
					}
					else
					{
						mockButton=true;
					}
				}
				rsquery.close();
// ----------------------------------------------------------------------------------------------------------------------- // 				
// ---------------------------------------------------------------------------------------------------------------------------- //				
							
				// Language Test query
				String getLangQuery = "SELECT End_Date FROM language_test_attempt_master where Cand_Id="+userID;
				System.out.println(" Language Chat Test Attempt   : "+getLangQuery);
				dStmt = con.createStatement();
				rsquery = dStmt.executeQuery(getLangQuery);				
		
				if(rsquery.next())
				{
				 	LangTest = rsquery.getString("End_Date");
					if(LangTest==null)
					{
						System.out.println("TYPE date is null");
						try
						{
							Statement delSt = con.createStatement();
							String InsertQryLang="insert into language_test_attempt_master_history(Lang_Attempt_Id,Cand_Id,Lang_Test_Id,PartA_A1,PartA_A2,PartA_A3,PartA_A4,PartA_A5,PartA_A6,PartA_A7,PartA_A8,PartA_A9,PartA_A10,PartB_A,PartC_A,Start_Date,End_Date,Log_Date) select Lang_Attempt_Id,Cand_Id,Lang_Test_Id,PartA_A1,PartA_A2,PartA_A3,PartA_A4,PartA_A5,PartA_A6,PartA_A7,PartA_A8,PartA_A9,PartA_A10,PartB_A,PartC_A,Start_Date,End_Date,now() from language_test_attempt_master where Cand_Id="+userID+"";
							System.out.println("Inserted Query::"+InsertQryLang);
							delSt.execute(InsertQryLang);
							System.out.println("Inserted Successfully language_test_attempt_master_history::");
							
							String UpdateQrYLang="delete from language_test_attempt_master where Cand_Id="+userID+"";
							System.out.println("preceWriting   : "+UpdateQrYLang);
							delSt.execute(UpdateQrYLang);
							delSt.close();
							System.out.println("Update successfull in language_test_attempt_master");
							//String deleteQry = "delete from language_test_attempt_master where Cand_Id="+userID;
							//Statement delSt = con.createStatement();
							//delSt.execute(deleteQry);
						}
						catch(Exception ex)
						{
							ex.printStackTrace();
						}
					}
					else
					{
						Language=true;
					}
				}
				rsquery.close();
// ----------------------------------------------------------------------------------------------------------------------- // 				


				if( endDate!=null && endDate2 !=null  && endDateeng !=null && LangTest!=null && strMok!=null)
				  {
				  	PreparedStatement p17=con.prepareStatement("update bpo_candidatesreg_details set cand_Status=4 where AutoID="+userID+"");
				    System.out.println(" updated to canvas 2 data =="+p17);
			    	p17.executeUpdate();
			    	p17.close();
					    	
					String Recruiterphone=null;
					String RecruiterEmailId="";
					ArrayList<String> Phonenumbers = new ArrayList<String>();
					
				    String username1="247RecruitmentIS@247customer.com";
					String password1="123456@abc";
					String Candidatename=null;
					String CandidateFirstname=null;
					String CandidateMiddlename=null;
					String CadidateId=null;
					String Phonenumber=null;
					String msgsms=null;
					int Location=0;
					Statement stmts = null;
					ResultSet rss = null;
					CallableStatement cs=null;
				try
					{
						con=ConnectDatabase.getConnection();									
						stmts = con.createStatement();
						String strProcedure = "{call CandPhone_Encrypt_Proc("+USER_AUTOID+",'"+EDKey+"','"+EDKPass+"')}"; //your procedure name
						System.out.println("strProcedure"+strProcedure);
						cs=con.prepareCall(strProcedure);
						rss=cs.executeQuery();
			    	}
			    	catch(Exception e)
			    	{
			    		e.printStackTrace();
			    	}
		
					if (rss.next())
					{
						 CandidateFirstname=rss.getString("First_Name");
						 CandidateMiddlename=rss.getString("Middle_Name");
						 if(CandidateMiddlename==null)
						 {
						 	CandidateMiddlename="";
						 }
						 Candidatename=CandidateFirstname+" "+CandidateMiddlename+" "+rss.getString("Last_Sir_Name");
						 CadidateId=rss.getString("Bpo_Cand_Id");
						 Phonenumber=rss.getString("Phone");
						 Location=rss.getInt("Location");
				} 
			    String secQsnrec = "SELECT  Emp_email,Emp_Mobile_No FROM  user_master where User_Type_Id=1 and SendAlerts=1 and Is_Active=1 and Centre_Id='"+Location+"'";
				System.out.println("secQsnrec >>>>>>>>>>>>>>>>>>>>>>>>   >>>>>>>>>>>>>>>" + secQsnrec);
				Statement stmtrec = con.createStatement();
				ResultSet rssrec = stmtrec.executeQuery(secQsnrec);
				int ctr = 0;
				while (rssrec.next())
				{
					 Recruiterphone=rssrec.getString("Emp_Mobile_No");
					 Phonenumbers.add(Recruiterphone);
					 RecruiterEmailId+=rssrec.getString("Emp_email")+",";
					 ctr = ctr + 1;
				}   
				System.out.println("Email Id's ::: " + RecruiterEmailId);
		      	rssrec.close();
			    stmtrec.close();
			    rss.close();
			    stmts.close();
			    if(ctr > 0)
			    {
				    String msg=new String();
				    msgsms=CandidateFirstname+" ("+CadidateId+")";
					msg="<HTML><BODY>"+Candidatename+", Candidate Id : "+CadidateId+", has completed Communicaton Ability (Non-Voice) round on [24]7 career. <b>Mobile Number</b> :"+Phonenumber+"<br/><br/>Regards,<br/>Team [24]7</BODY></HTML>";
				    String subject="[24]7 Career Non-Voice Confirmation";
				    for(int j=0;j<Phonenumbers.size();j++)
			        {
					    SMSFunction.sendSMSRec(Phonenumbers.get(j).toString(),msgsms,Phonenumber);
				    }
			        EmailDemo.sendMail(username1,password1,RecruiterEmailId,msg,subject);
				}				
				System.out.println("Now complite the all exam !");
						//RequestDispatcher rd=request.getRequestDispatcher("/247Recruit/jsp/ChatConfirmationPage_TestExam.jsp");
						//rd.forward(request,response);
					%>
					<script language="Javascript"> 
						top.window.location.href='<%=request.getContextPath()%>/247Recruit/jsp/ChatConfirmationPage_TestExam.jsp'; 
					</script> 
					<%		
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			finally
			{
				ConnectionDAO.closeConnection(con, dStmt, rsquery);	
			}			
			
 %>

<div class="wrapperSize">
<div class="content">
<div class="inner-content">
  <div class="cont-lft-twocol">
    <div style="width: 100%;" class="cont-lft"> <div class="redTxt"></div>      
        <div style="padding: 0pt 0pt 10px;" class="forms">
          <input type="hidden" value="" id="sessionmemid" name="sessionmemid"/>
          <table width="700px" cellspacing="1" cellpadding="6" border="0">
            <tbody>
            <tr>
              <th class="taL" colspan="2" style="height: 32px;">[24]7 Online Test</th>
            </tr>
            <tr>
            
              <td width="45%" colspan="2">
         			<p>The online test comprises of 5 modules. You may access these modules using the links provided below. Please note that the tests or modules once completed without interruption cannot be attempted again. If there is an interruption due to power outage or loss of internet connectivity, you can log in again and complete the tests that were interrupted or were incomplete.  </p>

<div style="height:10px;"></div>

<p><b>Typing Test :</b></p>
<p> A passage will be given which would need to be typed into the box below. You will be assessed on accuracy and speed.</p>
<div style="height:10px;"></div>
<p>
<b>Reading Comprehension Test:</b></p><p>You will be assessed on your ability to read and comprehend a given passage and to select an appropriate answer to the question which follows.</p>
<div style="height:10px;"></div>
<div style="height:10px;"></div>
<p><b>English Grammar Test :</b></p>
<p>You will be assessed on English Grammar. A set of instructions for different grammar questions will be provided. You will require to choose the correct answers based on them. Examples will be provided (where required) for your reference.</p>
<div style="height:10px;"></div>
<p>Your selection will be based on passing the minimum criteria for each test and a cumulative grade derived for the scores in each. Each test or module will have a set of instructions.</p> 
<p>Please do take your time and go through them in detail. Once you are ready, you may commence the test by clicking on the START button.</p>
<div style="height:10px;"></div>

	<ul class="link">
	<%if(!typeButton){%>
	  	<li style="border: medium none;" class="instrLink"><b><a href="tat_instruction.jsp" style="text-decoration: none;">&nbsp;Typing Test (To be Attempted)</a></b></li>
	<%}else{%>
	     <li style="border: medium none;">&nbsp;Typing Test (Attempted)</li>
	<%}if(!button){%> 
	  <li style="border: medium none;" class="instrLink"><b><a href="rct_instruction.jsp" style="text-decoration: none;">&nbsp;Reading Comprehension Test (To be Attempted)</a></b></li>
	<%}else{%>
		<li style="border: medium none;" class="instrLink">&nbsp;Reading Comprehension Test(Attempted)</li>
	<%}if(!engbutton){%>
	  <li style="border: medium none;" class="instrLink"><b><a href="eng_instruction.jsp" style="text-decoration: none;">&nbsp;English Grammar Test (To be Attempted)</a></b></li>
	<%}else{%>
	  <li style="border: medium none;" class="instrLink">&nbsp;English Grammar Test(Attempted)</li>
	<%//}if(!preceButton){%>
	<!--   <li style="border: medium none;" class="instrLink"><b><a href="<%=request.getContextPath()%>/247Recruit/jsp/Precis_Test_Instruction.jsp" style="text-decoration: none;">&nbsp;Precis Writing Test (To be Attempted)</a></b></li> -->
	<%//}else{%>
	 <!--  <li style="border: medium none;" class="instrLink">&nbsp;Precis Writing Test (Attempted)</li> -->
	
	<%}if(!Language){%>
	  <li style="border: medium none;" class="instrLink"><b><a href="<%=request.getContextPath()%>/247Recruit/jsp/Language_Test_Instruction.jsp" style="text-decoration: none;">&nbsp;Language Test (To be Attempted)</a></b></li>
	<%}else{%>
	  <li style="border: medium none;" class="instrLink">&nbsp;Language Test (Attempted)</li>
	
	
	<%}if(!mockButton){%>
	  <li style="border: medium none;" class="instrLink"><b><a href="<%=request.getContextPath()%>/247Recruit/jsp/chat_instruction.jsp" style="text-decoration: none;" >&nbsp;Mock Chat Test (To be Attempted)</a></b></li>
	<%}else {%>
	  <li style="border: medium none;">&nbsp;Mock Chat Test (Attempted)</li>
	<%}%>
	</ul>
	</td>
	</tr>
	</tbody>
	</table>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>	

<!-- Old Google Analytics Code -->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-15437724-1']);
  _gaq.push(['_setDomainName', 'none']);
  _gaq.push(['_setAllowLinker', true]);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<!-- Old Google Analytics Code -->

</body>
</html>

  	<%
		}
		catch(Exception ex)
		{
	%>
			<script language="Javascript"> 
				top.window.location.href='<%=request.getContextPath()%>/247Recruit/jsp/SessionTimeout.jsp'; 
			</script> 
	<%		
		}
	%>   
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         