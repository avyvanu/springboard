<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.sql.PreparedStatement,java.util.Date,java.text.SimpleDateFormat,java.text.ParseException,java.sql.ResultSet" pageEncoding="utf-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@ include file="GlobalDeclare.jsp" %>
<%@page import="util.IsLanguageValidator"%>
<%
  
String canId = (String) request.getParameter("CandID");
System.out.println("canId"+canId);
int ApplyingFor = Integer.parseInt(request.getParameter("ApplyingFor"));	
System.out.println("ApplyingFor"+ApplyingFor);

	Statement stmts=null;
	ResultSet rs = null;
	CallableStatement cs=null;
	Connection connection=ConnectDatabase.getConnection();	
	try
	{
		connection=ConnectDatabase.getConnection();									
		stmts = connection.createStatement();
		String strProcedure="{call BpoCandDtls_Encrypt_Proc(?,?,?)}"; //your procedure name
		System.out.println("strProcedure"+strProcedure);
		cs=connection.prepareCall(strProcedure);
		cs.setString(1,canId);
        cs.setString(2,EDKey);
        cs.setString(3,EDKPass);
		rs=cs.executeQuery();
%>



<html>
  <head>
    <title>[24]7 SPRINGBOARD</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Recruiter.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css">
 
<script language="javascript">

	function showWindowstability()
	{
		var url = "<%=request.getContextPath()%>/247Recruit/jsp/StabilityChkPopUp.jsp?canId=<%=canId%>"
		someWindow = window.open(url,'ReasonWindowStability','height=635,width=670,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no,location=no');
	}
	function showWindowVoice()
	{
		var url = "<%=request.getContextPath()%>/247Recruit/jsp/VoiceScorePopUp.jsp?canId=<%=canId%>"
		someWindow = window.open(url,'ReasonWindowVoice','height=635,width=670,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
	function showWindowOps()
	{
		var url = "<%=request.getContextPath()%>/247Recruit/jsp/OperationsInterviewPopUp.jsp?canId=<%=canId%>"
		someWindow = window.open(url,'ReasonWindowOPS','height=560,width=620,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no,location=no');
	}
	function showWindowLang()
	{
		var url = "<%=request.getContextPath()%>/247Recruit/jsp/LanguageScorePopUp.jsp?canId=<%=canId%>"
		someWindow = window.open(url,'ReasonWindowLang','height=635,width=675,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
	function showWindowmok()
	{
		var url = "<%=request.getContextPath()%>/247Recruit/jsp/ChatScorePopUp.jsp?canId=<%=canId%>"
		someWindow = window.open(url,'ReasonWindowmok','height=635,width=625,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no,location=no');
	}
	function showWindowPrecis()
	{
		var url = "<%=request.getContextPath()%>/247Recruit/jsp/PrecisScorePopUp.jsp?canId=<%=canId%>"
		someWindow = window.open(url,'ReasonWindowPrecis','height=635,width=605,scrollbars=no,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
</script>

  </head>
  
  <body>
  <form name="BioForm" action="<%=recruitPath%>jsp/Voice_OfferUpdateSubmit.jsp" method="post" onsubmit="return CheckValidation(this);">
    <%
  	if(rs.next())
  	{
  		
  		int CandautoId=rs.getInt("AutoID");
  		System.out.println("CandautoId"+CandautoId);
  		String canName=rs.getString("First_Name")+ " " +rs.getString("Middle_Name")+ " " +rs.getString("Last_Sir_Name");
  		%>
	<table border="0" cellpadding="6" cellspacing="6" width="450px">
       <tr>
           	<td align="left" class="allBackColor" style="background-color: #d8d8d8;">
                     Candidate Id:
            </td>
           	<td align="left" class="allBackColor">
                     <%=rs.getString("Bpo_Cand_Id")%>
            </td>
        <tr>
             <td align="left" class="allBackColor" style="background-color: #d8d8d8;">
                     Name:
            </td>
             <td align="left" class="allBackColor">
                 <%=canName %>
             </td>
        </tr>
      <%if(ApplyingFor == 1)
      {
      %>  
       <tr>
            <% 
                int stabilitytotalscore=0;
                int stabilitystatus=0; 
                int iStability = 0;
                String secqrystability = "select Result_Status,Score from stability_chk_master where  Candidate_ID="+ CandautoId + "";
				System.out.println("stability chatquery " + secqrystability);
				Statement stmtstability = connection.createStatement();
				ResultSet rssstability= stmtstability.executeQuery(secqrystability);
				if (rssstability.next()) 
				{
					stabilitystatus =rssstability.getInt("Result_Status");
					System.out.println("Statusi " + stabilitystatus);
					stabilitytotalscore =rssstability.getInt("Score");
					System.out.println("Total_score " + stabilitytotalscore);
					iStability++;
				}
				rssstability.close();
				stmtstability.close();
				%>
            
            <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;">Stability Check </td>
						<td align="right" class="allBackColor" style="background-color: #d8d8d8;">
							<%if(iStability > 0) 
							{
							%>
							<b><a style="text-align: right;color: maroon;" onclick="showWindowstability()">View</a></b>
							<%
							}
							 %>
						</td>
					</tr>
				</table>
            </td>
            <td align="left" class="allBackColor">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<%if(iStability > 0) 
							{
						%>
						<td align="left" class="allBackColor"><b>Total Score :</b>&nbsp;
							<%=stabilitytotalscore%>
						</td>
						<td align="right" class="allBackColor"><b>Status :</b>&nbsp;
							<%if(stabilitystatus==1){%>Selected<%}else if(stabilitystatus==2){%>On Hold<%}else if (stabilitystatus==3){%>Rejected<%}%>
						</td>
						 <%
							}
							else
							{
						%>
						<td align="right" class="allBackColor">
						 NA
						</td>
						<%
							} 
						%>
					</tr>
				</table>
			  </td>
        </tr> 
      	<tr>
            <% 
                int totalscorevoice=0;
                
                int iVoiceScore = 0;
                String secqryvoice = "select Total_score from candidate_voice_score where  Cand_Id="+ CandautoId + "";
				System.out.println("Voice chatquery " + secqryvoice);
				Statement stmtvoice = connection.createStatement();
				ResultSet rssvoice= stmtvoice.executeQuery(secqryvoice);
				if (rssvoice.next()) 
				{
					totalscorevoice =rssvoice.getInt("Total_score");
					System.out.println("Total_score " + totalscorevoice);
					iVoiceScore++;
				}
				rssvoice.close();
				stmtvoice.close();
				%>
            <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;">V&A Test</td>
						<td align="right" class="allBackColor" style="background-color: #d8d8d8;">
							<%if(iVoiceScore > 0)
							{
							 %>
							<b><a style="text-align: right;color: maroon;" onclick="showWindowVoice()">View</a></b>
							<%
							}
							 %>
						</td>
					</tr>
				</table>
            </td>
         	
            <td align="left" class="allBackColor">
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor">
							<%if(iVoiceScore > 0)
							{
							 %>
							 <b>Total Score :</b>&nbsp;
							<%=totalscorevoice%>
							<%
							}
							else
							{
							 %>
							 NA
							 <%
							 }
							  %>
						</td>						
					</tr>
				</table>
            </td>
        </tr>
        <%
        }
         %>
        <%if(ApplyingFor == 2)
      	{
      	%> 
      		<tr>
            <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
                Typing Test
            </td>
            
            <td align="left" class="allBackColor">
               <%  
                double accuracy=0.0;
                double speed=0.0;  
                int iTyping = 0;
                String decspeed=null;
                Statement stCommon = null;
                ResultSet rssSIM = null;
                String secqrytyping = "select ACCURACY,SPEED  from bpo_user_typing_test_attempt where user_id="+ CandautoId + "";
				System.out.println("query " + secqrytyping);
				stCommon = connection.createStatement();
				rssSIM = stCommon.executeQuery(secqrytyping);
				if(rssSIM.next())
				{
					accuracy=rssSIM.getDouble("ACCURACY");
					System.out.println("accuracy " + accuracy);
					speed=rssSIM.getFloat("SPEED");
					DecimalFormat df=new DecimalFormat("0.00");
	                decspeed = df.format(speed);
					System.out.println("decspeed " + decspeed);
					iTyping++;
				}
				rssSIM.close();
				%>
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor">
							<%if(iTyping > 0)
							{
							 %>
							<b>Accuracy :</b>&nbsp;<%=accuracy%>
							<%
							}
							else
							{
							 %>
							 NA
							 <%
							 }
							  %>
						</td>
						<td align="right" class="allBackColor">
							<%if(iTyping > 0)
							{
							 %>
								<b>Speed :</b>&nbsp; <%=decspeed%>
							<%
							}
							else
							{
							 %>
							 NA
							 <%
							 }
							  %>
						</td>
					</tr>
				</table>
            </td> 
        </tr>
        <tr>
            <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
                Reading Comprehension Test
            </td>
            <% 
                double readingdec=0;
                int iReadingComp = 0;
                String secqryreading = "select count(status) as countvalue from bpo_user_reading_comp_test where status='Y' and user_id="+ CandautoId + "";
				System.out.println("query " + secqryreading);
				stCommon = connection.createStatement();
				rssSIM= stCommon.executeQuery(secqryreading);
				
				if(rssSIM.next()) 
				{
					double readingper =rssSIM.getInt("countvalue");
					System.out.println("readingper " + readingper);
					readingdec=((readingper)/5)*100;
					System.out.println("readingper " + readingdec);
					iReadingComp++;
				}
				rssSIM.close();
				%>
            <td align="left" class="allBackColor">
              	<%if(iReadingComp > 0)
              	{
              	 %>
              	<%= readingdec%>
              	<%
              	}
              	else
              	{
              	 %>
              	 NA
              	 <%
              	 }
              	  %>
            </td>
        </tr>
        <tr>
            <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
                English Grammar Test
            </td>
            <% 
                double enggramdec=0;
                String enggramdecspeed=null;
                int iEnglishGram = 0;
                String secqryenggram = "select count(status) as countvalue from bpo_user_eng_comp_test where status='Y' and user_id="+ CandautoId + "";
				System.out.println("query " + secqryenggram);
				stCommon = connection.createStatement();
				rssSIM= stCommon.executeQuery(secqryenggram);
				if(rssSIM.next()) 
				{
					double enggramper =rssSIM.getDouble("countvalue");
					System.out.println("enggramper " + enggramper);
					enggramdec=((enggramper)/15)*100;
					System.out.println("enggramdec " + enggramdec);
					DecimalFormat df=new DecimalFormat("0.00");
                    enggramdecspeed = df.format(enggramdec);
				    System.out.println("enggramdecspeed " + enggramdecspeed);
				    iEnglishGram++;
				}
				rssSIM.close();
				%>
            <td align="left" class="allBackColor">
                <%if(iEnglishGram > 0)
                {
                 %>
                <%=enggramdecspeed %>
                <%
                }
                else
                {
                 %>
                 NA
                 <%
                 }
                  %>
            </td>
        </tr>
        <!--Start of  Precis Writing Test --> 
        <% boolean languageAvailable = false;
           languageAvailable=IsLanguageValidator.LanguageValidator(CandautoId);
        if(!languageAvailable)
        {
        %>
        <tr>
           	<% 
                float totalscoreprecis=0;
                int precisstatus=0; 
                int iPrecis = 0;
                String secqryprecis = "select statusi,total_score from candidate_precis_writing_score where  Cand_Id="+ CandautoId + "";
				System.out.println("Mok chatquery " + secqryprecis);
				stCommon = connection.createStatement();
				rssSIM= stCommon.executeQuery(secqryprecis);
				if(rssSIM.next()) 
				{
					precisstatus =rssSIM.getInt("Statusi");
					System.out.println("Statusi " + precisstatus);
					totalscoreprecis =rssSIM.getFloat("Total_score");
					System.out.println("Total_score " + totalscoreprecis);
					iPrecis++;
				}
				rssSIM.close();
				%>
            <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;">Precis Writing Test</td>
						<td align="right" class="allBackColor" style="background-color: #d8d8d8;">
							<%if(iPrecis > 0)
							{
							 %>
							<b><a style="text-align: right;color: maroon;" onclick="showWindowPrecis()">View</a></b>
							<%
							}
							 %>
						</td>
					</tr>
				</table>
            </td>
        	<td align="left" class="allBackColor">
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor">
							<%if(iPrecis > 0)
							{
							 %>
							<b>Total Score :</b>&nbsp; <%=totalscoreprecis%>
							<%
							}
							else
							{
							 %>
							 NA
							 <%
							 }
							  %>
						</td>
					</tr>
				</table>
            </td>
        </tr>
        <%} %>
         <!--Start of  Language Test --> 
       <% if(languageAvailable) {%>
        <tr>
            <% 
                float totalscorelang=0;
                int iLanguage = 0; 
                String secqrylang = "select total_score from candidate_language_testscore where  Cand_Id="+ CandautoId + "";
				System.out.println("Language test Query::::: " + secqrylang);
				stCommon = connection.createStatement();
				rssSIM= stCommon.executeQuery(secqrylang);
				if (rssSIM.next()) 
				{
					totalscorelang =rssSIM.getFloat("Total_score");
					System.out.println("Total_score:::::totalscorelang" + totalscorelang);
					iLanguage++;
				}
				rssSIM.close();
				%>
            <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;">Language Test</td>
						<td align="right" class="allBackColor" style="background-color: #d8d8d8;">
							<%if(iLanguage > 0)
							{
							 %>
							<b><a style="text-align: right;color: maroon;" onclick="showWindowLang()">View</a></b>
							<%
							}
							 %>
						</td>
					</tr>
				</table>
            </td>
         	<td align="left" class="allBackColor">
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor">
							<%if(iLanguage > 0)
							{
							 %>
							<b>Total Score :</b>&nbsp; <%=totalscorelang%>
							<%
							}
							else
							{
							 %>
							 NA
							 <%
							 }
							  %>
						</td>
					</tr>
				</table>
              </td>
        </tr>
        <%} %>
       <!--End of Language Test -->
         <tr>
            <% 
                float moktotalscore=0;
                int iMock = 0;
                String secqrymokchat = "select total_score from candidate_chat_score where  Cand_Id="+ CandautoId + "";
				System.out.println("Mok chatquery " + secqrymokchat);
				stCommon = connection.createStatement();
				rssSIM = stCommon.executeQuery(secqrymokchat);
				if(rssSIM.next()) 
				{
					moktotalscore =rssSIM.getFloat("Total_score");
					System.out.println("Total_score " + moktotalscore);
					iMock++;
				}
				rssSIM.close();
				%>
            <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;">Mock Chat Test</td>
						<td align="right" class="allBackColor" style="background-color: #d8d8d8;">
							<%if(iMock > 0) 
							{
							%>
							<b><a style="text-align: right;color: maroon;" onclick="showWindowmok()">View</a></b>
							<%
							} %>
						</td>
					</tr>
				</table>
            </td>
            
            <td align="left" class="allBackColor">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor">
							<%if(iMock > 0) 
							{
							%>
							<b>Total Score :</b>&nbsp; <%=moktotalscore%>
							<%
							}
							else
							{
							 %>
							 Na
							 <%
							 }
							  %>
						</td>
					</tr>
				</table>
			  </td>
        </tr>
      	<%
      	}
      	 %>
        <tr>
            <% 
                int operationstotalscore=0;
                int operationsstatus=0; 
                int iOps = 0;
                String secqryoperations = "select Result_Status,Score from operations_interview_master where  Candidate_ID="+ CandautoId + "";
				System.out.println("operations interview::: " + secqryoperations);
				Statement stmtoperations = connection.createStatement();
				ResultSet rssoperations= stmtoperations.executeQuery(secqryoperations);
				if(rssoperations.next()) 
				{
					operationsstatus =rssoperations.getInt("Result_Status");
					System.out.println("Statusi " + operationsstatus);
					operationstotalscore =rssoperations.getInt("Score");
					System.out.println("Total_score " + operationstotalscore);
					iOps++;
				}
				%>
            <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;">Operations Interview</td>
						<td align="right" class="allBackColor" style="background-color: #d8d8d8;">
							<%if(iOps > 0)
							{
							 %>
							<b><a style="text-align: right;color: maroon;" onclick="showWindowOps()">View</a></b>
							<%
							}
							 %>
						</td>
					</tr>
				</table>
            </td>
            
            <td align="left" class="allBackColor">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<%if(iOps > 0)
						 {
						%>
						<td align="left" class="allBackColor"><b>Total Score :</b>&nbsp;
							<%=operationstotalscore%>
						</td>
						<td align="right" class="allBackColor"><b>Status :</b>&nbsp;
							
							<%if(operationsstatus==1){%>Selected<%}else if(operationsstatus==2){%>On Hold<%}else if (operationsstatus==3){%>Rejected<%}%>
						</td>
						<%
						}
						else
						{
						 %>
						 <td align="left" class="allBackColor">
						 NA
						 </td>
						 <%
						 }
						  %>
					</tr>
				</table>
			  </td>
      </tr>
      <tr>
            <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
                Selected For Program
            </td>
            
            <td align="left" class="allBackColor">
              <%  
              	String secQsnQryprogram = "";
              	int programID = 0;
              	String programName = null;
				Statement stmtMaster = null;
				ResultSet rsMaster = null;
				Statement stmtprogram = null;
				ResultSet rsprogram = null;
				int iPrgms = 0;
              	secQsnQryprogram = "SELECT Program_Id FROM operations_interview_master WHERE Candidate_ID="+CandautoId+"";
				System.out.println("query "+secQsnQryprogram);
				stmtprogram = connection.createStatement();
				rsprogram = stmtprogram.executeQuery(secQsnQryprogram);
				  if(rsprogram.next())
					{
						programID = rsprogram.getInt("Program_Id");
						System.out.println("programID of OPS::::::"+programID);
						iPrgms ++;
					}
					System.out.println("iPrgms::::::"+iPrgms);
					rsprogram.close();
					stmtprogram.close();
					if(iPrgms == 0)
					{
						secQsnQryprogram = "SELECT Init_Selected_Program FROM bpo_candidatesreg_details WHERE AutoID ="+CandautoId+"";
						System.out.println("query "+secQsnQryprogram);
						stmtprogram = connection.createStatement();
						rsprogram = stmtprogram.executeQuery(secQsnQryprogram);
						  if(rsprogram.next())
							{
								programID = rsprogram.getInt("Init_Selected_Program");
								System.out.println("programID of bpo_reg::::::"+programID);
								iPrgms ++;
							}
							System.out.println("iPrgms::::::"+iPrgms);
							rsprogram.close();
							stmtprogram.close();
					}
					String secQsnprogramName = "select Program_name from program_names_master where Program_id = "+programID+"";
				    System.out.println("secQsnMasterprogram ============ "+secQsnprogramName);
				 	stmtMaster = connection.createStatement();
				 	rsMaster = stmtMaster.executeQuery(secQsnprogramName);
				 	if(rsMaster.next())
				 	{
						programName = rsMaster.getString("Program_name");
						System.out.println("programName ============ "+programName);
					} 
					else
					{
						programName = "NA";
					}
					%>
              	<%=programName %>
            </td>
        </tr>
          <tr>
            <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;">Final Registration</td>
					</tr>
				</table>
            </td>
            <% 
                String secqryfinalReg = "select Cand_Passed_Auto_Id from cand_personal_details_final where Cand_Passed_Auto_Id="+ CandautoId + "";
				System.out.println("Final Candidate Registration Query:: " + secqryfinalReg);
				Statement stmtfinalReg = connection.createStatement();
				ResultSet rssfinalReg= stmtfinalReg.executeQuery(secqryfinalReg);
				boolean state=false;
				state=rssfinalReg.next();
				System.out.println("state"+state);
				%>
            <td align="left" class="allBackColor">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
					 <td align="left" class="allBackColor">
					    <b>
						<%if(state==true) {%>
						<label style="color: green;" id="finalstate" > Done</label>
						<%}else { %>
						<label style="color: red;"> Not Done</label>
						<%} %>
						</b>
						<input type="hidden" id="finalreg" name="finalreg" value="<%= state%>"/>
					  </td>
					</tr>
				</table>
			  </td>
        </tr>
        
    </table>
  		<%      rssfinalReg.close();
  		        stmtfinalReg.close();
				rsMaster.close();
				stmtMaster.close();
				rsprogram.close();
				stmtprogram.close();
				rssoperations.close();
				stmtoperations.close(); 
				rs.close();
				stmts.close();
				connection.close();
				} 
						}
   	catch(Exception e)
   	{
   		e.printStackTrace();
   	}
		 %>
   </form>
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
