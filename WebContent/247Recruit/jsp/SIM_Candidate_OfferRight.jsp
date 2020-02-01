<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.sql.PreparedStatement,java.util.Date,java.text.SimpleDateFormat,java.text.ParseException,java.sql.ResultSet" pageEncoding="utf-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@ include file="GlobalDeclare.jsp" %>
<%@page import="util.IsLanguageValidator"%>
<%
  	String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
		  if(USER_Name == null)
			{
				response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
			}
	System.out.println("USER_Name in home page::::"+USER_Name);
	String canId= (String) request.getParameter("candId");
	System.out.println("canId"+canId);
	session.setAttribute( "Bpo_Cand_Id", canId );
	Statement stmts=null,stmtprecis=null,stmtlang =null;
	ResultSet rs = null,rssprecis=null,rsslang=null;
	ResultSet rssfinalReg = null;
	CallableStatement cs=null;
	Connection connection=null;	
	Statement stCommon = null;
	
	ResultSet rssoperations = null;
	ResultSet rssmokchat = null;
	ResultSet rssenggram = null;
	Statement stmtMaster=null;
	ResultSet rsMaster=null; 
	ResultSet rsstyping = null;
	ResultSet rssreading = null;
	ResultSet rsprogram = null;
	
	try
	{
		connection=ConnectDatabase.getConnection();									
		stCommon = connection.createStatement();
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
   <title>[24]7 Candidate Status Update</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Recruiter.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css">
    <script type="text/javascript" language="javascript">
    <%
		if(USER_Name==null)
 			{
	%>
		parent.location.href="<%=logoutPage%>";
	<%
		}
	%>
     function CheckValidation()
    {
	var finalregvalue=false;
	try
	{
		finalregvalue=document.getElementById("finalreg").value;
	}
	catch(e)
	{
		alert("Final Registration is not completed !");
		return false;	
	}
	if(document.getElementById("selForProgram").value =='')
	{
		var appStr = 'Please Select The Program!!!';
		alert(appStr);
		document.getElementById('selForProgram').focus();
		return false;	
	}
	if(finalregvalue=="false")
	{
		alert("Final Registration is not completed !");
		return false;
	}
	
	if(confirm('Are you sure you want to make this offer? Details will be submited to HRMS.'))
	{
		document.getElementById('submit').style.display="none";
		document.getElementById("processing").style.display="";
		return true;
	}
	else 
	{
		return false;
	}
	
}
  </script>
  
<script language="javascript">
function showWindow()
{

var url = "<%=request.getContextPath()%>/247Recruit/jsp/PrecisScorePopUp.jsp?canId=<%=canId%>"
someWindow = window.open(url,'ReasonWindow','height=635,width=605,scrollbars=no,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');

}
function showWindowLang()
{

var url = "<%=request.getContextPath()%>/247Recruit/jsp/LanguageScorePopUp.jsp?canId=<%=canId%>"
someWindow = window.open(url,'ReasonWindow','height=635,width=675,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');

}
function showWindowmok()
{

var url = "<%=request.getContextPath()%>/247Recruit/jsp/ChatScorePopUp.jsp?canId=<%=canId%>"
someWindow = window.open(url,'ReasonWindow','height=635,width=625,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no,location=no');

}

function showWindowOps()
{

var url = "<%=request.getContextPath()%>/247Recruit/jsp/OperationsInterviewPopUp.jsp?canId=<%=canId%>"
someWindow = window.open(url,'ReasonWindow','height=560,width=620,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no,location=no');

}
function showWindowRed()
{
var url = "<%=request.getContextPath()%>/247Recruit/jsp/CandidateListPopUp.jsp?canId=<%=canId%>&ColorType=1"
someWindow = window.open(url,'ReasonWindow','height=600,width=400,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
}
function showWindowYellow()
{
var url = "<%=request.getContextPath()%>/247Recruit/jsp/CandidateListPopUp.jsp?canId=<%=canId%>&ColorType=2"
someWindow = window.open(url,'ReasonWindow','height=600,width=400,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
}
</script>

  </head>
  
  <body>
  <form name="BioForm" action="<%=recruitPath%>jsp/SIM_OfferUpdateSubmit.jsp" method="post">
    <%
  	if(rs.next())
  	{
  		int RAG=rs.getInt("RAG");
  		int CandautoId=rs.getInt("AutoID");
  		int initresult=rs.getInt("Init_Result");
  		System.out.println("CandautoId"+CandautoId);
  		String canName=rs.getString("First_Name")+ " " +rs.getString("Middle_Name")+ " " +rs.getString("Last_Sir_Name");
  		Date dateStr = rs.getDate("System_Date_Time");
  		SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy");
    	String DOR = formatter.format(dateStr);
        int IsResumeUpload = rs.getInt("IsResumeUpload");

  		%>
	<table border="0" cellpadding="6" cellspacing="6" width="450px">
        <tr>
           	 <td rowspan="3" style="width:80px;" align="left" valign="middle">
	           <%
            		if(rs.getString("ImagePath")==null)
            		{
            	 %>
		            	<img src="<%=recruitPath%>images/default_person.jpg" width="80px" height="80px" alt="image" />
            	<%}
            		else
            		{
            	%>
		            	<img src="<%=recruitPath%>jsp/displayImageView.jsp?CID=<%=canId%>" width="80px" height="80px" alt="image" />
            	<%}%>    
            </td>
                <td rowspan="3" style="width:85px;" align="center" valign="middle">
                <%
            		if(RAG==2)
            		{
            	 %>
            	<a style="text-align: right;color: maroon;" onclick="showWindowYellow()"><img src="<%=recruitPath%>images/yellow.jpg" width="65" height="80" alt="image" /></a>
            	 	<%}
            		else if(RAG==3)
            		{
            	 %>
            	 <img src="<%=recruitPath%>images/green.jpg" width="65" height="80" alt="image" />
            	 <%}
            		else
            		{
            	 %>
            	<a style="text-align: right;color: maroon;" onclick="showWindowRed()"> <img src="<%=recruitPath%>images/red.jpg" width="65" height="80" alt="image" /></a>
            	 </td>
            	<%} %>
                 <td align="left" class="allBackColor">
                     <%=rs.getString("Bpo_Cand_Id")%>
                 </td>
             <tr>
                 <td align="left" class="allBackColor">
                     <%=canName %>
                 </td>
             </tr>
             <tr>
                 <td align="left" class="allBackColor">
                     DOR: <%=DOR%>
                 </td>
             </tr>
        <tr>
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
                Typing Test
            </td>
            
            <td align="left" class="allBackColor">
               <%  
                double accuracy=0.0;
                double speed=0.0;  
                String decspeed=null;
                String secqrytyping = "select ACCURACY,SPEED  from bpo_user_typing_test_attempt where user_id="+ CandautoId + "";
				System.out.println("query " + secqrytyping);
				stCommon = connection.createStatement();
				rsstyping = stCommon.executeQuery(secqrytyping);
				while (rsstyping.next())
				{
					accuracy=rsstyping.getDouble("ACCURACY");
					speed=rsstyping.getFloat("SPEED");
					DecimalFormat df=new DecimalFormat("0.00");
	                decspeed = df.format(speed);
					System.out.println("decspeed " + decspeed);
				}
				%>
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor"><b>Accuracy :</b>&nbsp;<%=accuracy%></td>
						<td align="right" class="allBackColor"><b>Speed :</b>&nbsp;<%=decspeed%></td>
					</tr>
				</table>
            </td> 
        </tr>
        <tr>
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
                Reading Comprehension Test
            </td>
            <% 
                double readingdec=0;
                String secqryreading = "select count(status) as countvalue from bpo_user_reading_comp_test where status='Y' and user_id="+ CandautoId + "";
				System.out.println("query " + secqryreading);
				stCommon = connection.createStatement();
				rssreading= stCommon.executeQuery(secqryreading);
				
				while (rssreading.next()) 
				{
					double readingper =rssreading.getInt("countvalue");
					System.out.println("readingper " + readingper);
					readingdec=((readingper)/5)*100;
					System.out.println("readingper " + readingdec);
				}
				%>
            <td align="left" class="allBackColor">
              	<%= readingdec%>%
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
                English Grammar Test
            </td>
            <% 
                double enggramdec=0;
                String enggramdecspeed=null;
                String secqryenggram = "select count(status) as countvalue from bpo_user_eng_comp_test where status='Y' and user_id="+ CandautoId + "";
				System.out.println("query " + secqryenggram);
				stCommon = connection.createStatement();
				rssenggram= stCommon.executeQuery(secqryenggram);
				while (rssenggram.next()) 
				{
					double enggramper =rssenggram.getInt("countvalue");
					System.out.println("enggramper " + enggramper);
					enggramdec=((enggramper)/15)*100;
					System.out.println("enggramdec " + enggramdec);
					DecimalFormat df=new DecimalFormat("0.00");
                    enggramdecspeed = df.format(enggramdec);
				    System.out.println("enggramdecspeed " + enggramdecspeed);
				}
				%>
            <td align="left" class="allBackColor">
                <%=enggramdecspeed %>%
            </td>
        </tr>
        <!--Start of  Precis Writing Test --> 
        <% boolean languageAvailable = false;
           languageAvailable=IsLanguageValidator.LanguageValidator(CandautoId);
        if(!languageAvailable)
        {
        %>
        <tr>
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;">Precis Writing Test</td>
						<td align="right" class="allBackColor" style="background-color: #d8d8d8;">
							<b><a style="text-align: right;color: maroon;" onclick="showWindow()">View</a></b>
						</td>
					</tr>
				</table>
            </td>
         <% 
                float totalscoreprecis=0;
                int precisstatus=0; 
                String secqryprecis = "select statusi,total_score from candidate_precis_writing_score where  Cand_Id="+ CandautoId + "";
				System.out.println("Mok chatquery " + secqryprecis);
				stCommon = connection.createStatement();
				rssprecis= stCommon.executeQuery(secqryprecis);
				while (rssprecis.next()) 
				{
					precisstatus =rssprecis.getInt("Statusi");
					System.out.println("Statusi " + precisstatus);
					totalscoreprecis =rssprecis.getFloat("Total_score");
					System.out.println("Total_score " + totalscoreprecis);
				}
				%>
            <td align="left" class="allBackColor">
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor"><b>Total Score :</b>&nbsp;<%=totalscoreprecis%></td>
					</tr>
				</table>
              
            </td>
        </tr>
        <%} %>
         <!--Start of  Language Test --> 
       <% if(languageAvailable) {%>
        <tr>
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;">Language Test</td>
						<td align="right" class="allBackColor" style="background-color: #d8d8d8;">
							<b><a style="text-align: right;color: maroon;" onclick="showWindowLang()">View</a></b>
						</td>
					</tr>
				</table>
            </td>
         <% 
                float totalscorelang=0;
                int langstatus=0; 
                String secqrylang = "select statusi,total_score from candidate_language_testscore where  Cand_Id="+ CandautoId + "";
				System.out.println("Language test Query::::: " + secqrylang);
				stCommon = connection.createStatement();
				rsslang= stCommon.executeQuery(secqrylang);
				if (rsslang.next()) 
				{
					langstatus =rsslang.getInt("Statusi");
					System.out.println("Statusi langstatus::::" + langstatus);
					totalscorelang =rsslang.getFloat("Total_score");
					System.out.println("Total_score:::::totalscorelang" + totalscorelang);
				}
				%>
            <td align="left" class="allBackColor">
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor"><b>Total Score :</b>&nbsp;<%=totalscorelang%></td>
					</tr>
				</table>
              </td>
        </tr>
        <%} %>
       <!--End of Language Test -->
         <tr>
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;">Mock Chat Test</td>
						<td align="right" class="allBackColor" style="background-color: #d8d8d8;">
							<b><a style="text-align: right;color: maroon;" onclick="showWindowmok()">View</a></b>
						</td>
					</tr>
				</table>
            </td>
            <% 
                float moktotalscore=0;
                int mokstatus=0; 
                String secqrymokchat = "select statusi,total_score from candidate_chat_score where  Cand_Id="+ CandautoId + "";
				System.out.println("Mok chatquery " + secqrymokchat);
				stCommon = connection.createStatement();
				rssmokchat = stCommon.executeQuery(secqrymokchat);
				while (rssmokchat.next()) 
				{
					mokstatus =rssmokchat.getInt("Statusi");
					System.out.println("Statusi " + moktotalscore);
					moktotalscore =rssmokchat.getFloat("Total_score");
					System.out.println("Total_score " + moktotalscore);
				}
				%>
            <td align="left" class="allBackColor">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor"><b>Total Score :</b>&nbsp;<%=moktotalscore%></td>
					</tr>
				</table>
			  </td>
        </tr>
          <tr>
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;">Operations Interview</td>
						<td align="right" class="allBackColor" style="background-color: #d8d8d8;">
							<b><a style="text-align: right;color: maroon;" onclick="showWindowOps()">View</a></b>
						</td>
					</tr>
				</table>
            </td>
            <% 
                int operationstotalscore=0;
                int operationsstatus=0; 
                String secqryoperations = "select Result_Status,Score from operations_interview_master where  Candidate_ID="+ CandautoId + "";
				System.out.println("Mok chatquery " + secqryoperations);
				stCommon = connection.createStatement();
				rssoperations = stCommon.executeQuery(secqryoperations);
				while (rssoperations.next()) 
				{
					operationsstatus =rssoperations.getInt("Result_Status");
					System.out.println("Statusi " + operationsstatus);
					operationstotalscore =rssoperations.getInt("Score");
					System.out.println("Total_score " + operationstotalscore);
				}
				%>
            <td align="left" class="allBackColor">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor"><b>Total Score :</b>&nbsp;<%=operationstotalscore%></td>
						<td align="right" class="allBackColor"><b>Status :</b>&nbsp;
							<%if(operationsstatus==1){%>Selected<%}else if(operationsstatus==2){%>On Hold<%}else if (operationsstatus==3){%>Rejected<%}%>
						</td>
					</tr>
				</table>
			  </td>
        </tr>
      <tr>
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
                Selecting For Program
            </td>
            
            <td align="left" class="allBackColor">
                 <select id="selForProgram" name="selForProgram" class="reSizeforOther">
            	  <option value="">Select</option>
            
             <%  
              	String secQsnQryprogram = "SELECT Program_Id FROM operations_interview_master WHERE Candidate_ID="+CandautoId+"";
				System.out.println("query "+secQsnQryprogram);
				stCommon = connection.createStatement();
				rsprogram= stCommon.executeQuery(secQsnQryprogram);
				String matchSelectFieldprogram=null;

				if(rsprogram.next())
				{
					matchSelectFieldprogram=rsprogram.getString("Program_Id");
					String secQsnMasterprogram = "select * from program_names_master where program_typeid=2 and is_alive=1 ";
				    System.out.println("query ============ "+secQsnMasterprogram);
				 	stCommon = connection.createStatement();
				 	rsMaster = stCommon.executeQuery(secQsnMasterprogram);
				 	while(rsMaster.next())
				 	{
						if (matchSelectFieldprogram.equals(rsMaster.getString("program_id"))) 
						{
				 %>
					<option value="<%=rsMaster.getString("program_id")%>" selected="selected" style="font-weight: bold;"><%=rsMaster.getString("program_name")%></option>	
					<%
						}
						else
						{
					 %>
						<option value="<%=rsMaster.getString("program_id")%>"><%=rsMaster.getString("program_name")%></option>	
					<%
						
						}	
					} 
					}           
	                %>
              
            </select>
            </td>
        </tr>
    <tr>
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;">Final Registration</td>
					</tr>
				</table>
            </td>
            <% 
                String secqryfinalReg = "select Cand_Passed_Auto_Id from cand_personal_details_final where Cand_Passed_Auto_Id="+ CandautoId + "";
				System.out.println("Final Candidate Registration Query:: " + secqryfinalReg);
				stCommon = connection.createStatement();
				rssfinalReg = stCommon.executeQuery(secqryfinalReg);
				boolean state=rssfinalReg.next();
				System.out.println("state"+state);
				%>
            <td align="left" class="allBackColor">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
					 <td align="left" class="allBackColor"><b>
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
         <tr>
            <td colspan="3" align="center">   
            	<input type="hidden" name="selFor" value="" />

                <input type="submit" name="submit" id="submit" value="Offer" class="buttonMedium" onClick="return CheckValidation(this.form);"/>&nbsp;&nbsp;
              <span id="processing" style="display:none;"><b><font color="#000033" style="font-size: 12px;font-family: Arial,Helvetica,sans-serif;" class="taL" >Processing, please wait...</font></b></span>
             </td>
        </tr>
    </table>
  		<%         // rssfinalReg.close();
                   // stmtfinalReg.close();
					//rsMaster.close();
					//stmtMaster.close();
					////rsprogram.close();
					//stmtprogram.close();
					//rssoperations.close();
					//stmtoperations.close(); 
					//rssmokchat.close(); 
					//stmtmokchat.close();
					//rssprecis.close(); 
					//stmtprecis.close();
					//rssenggram.close();
					//stmtenggram.close();
					//rssreading.close(); 
					//stmtreading.close();
					//rsstyping.close(); 
					//stmttyping.close();
					//rs.close();
					//stmts.close();
					//connection.close();
			} 
			}
   	catch(Exception e)
   	{
   		e.printStackTrace();
   	}
   	finally
   	{
			System.out.println("============================== RIGHT OFFER END ==============================");		
			ConnectionDAO.closeConnection(connection,stCommon,rssfinalReg);			  
			ConnectionDAO.closeConnection(connection,stCommon,rsMaster);
			ConnectionDAO.closeConnection(connection,stCommon,rsprogram);
			ConnectionDAO.closeConnection(connection,stCommon,rssoperations);
			ConnectionDAO.closeConnection(connection,stCommon,rssmokchat);
			ConnectionDAO.closeConnection(connection,stCommon,rsslang);
			ConnectionDAO.closeConnection(connection,stCommon,rssprecis);
			ConnectionDAO.closeConnection(connection,stCommon,rssenggram);
			ConnectionDAO.closeConnection(connection,stCommon,rssreading);
			ConnectionDAO.closeConnection(connection,stCommon,rsstyping);
   	}
		 %>
   </form>
  </body>
</html>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         