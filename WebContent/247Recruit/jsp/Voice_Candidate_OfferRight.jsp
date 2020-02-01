<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.sql.PreparedStatement,java.util.Date,java.text.SimpleDateFormat,java.text.ParseException,java.sql.ResultSet" pageEncoding="utf-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@ include file="GlobalDeclare.jsp" %>
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
    <title>[24]7 Candidate Selection</title>
    
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
	document.getElementById('submit').style.display="none";
	document.getElementById("processing").style.display="";
}
 </script>
 <script type="text/javascript">
 
 
 </script> 
  
<script language="javascript">
function showWindow()
{

var url = "<%=request.getContextPath()%>/247Recruit/jsp/VoiceScorePopUp.jsp?canId=<%=canId%>"
someWindow = window.open(url,'ReasonWindow','height=635,width=670,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');

}
function showWindowmok()
{

var url = "<%=request.getContextPath()%>/247Recruit/jsp/StabilityChkPopUp.jsp?canId=<%=canId%>"
someWindow = window.open(url,'ReasonWindow','height=635,width=670,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no,location=no');

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
  <form name="BioForm" action="<%=recruitPath%>jsp/Voice_OfferUpdateSubmit.jsp" method="post" onsubmit="return CheckValidation(this);">
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
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;">Stability Check </td>
						<td align="right" class="allBackColor" style="background-color: #d8d8d8;">
							<b><a style="text-align: right;color: maroon;" onclick="showWindowmok()">View</a></b>
						</td>
					</tr>
				</table>
            </td>
            <% 
                int stabilitytotalscore=0;
                int stabilitystatus=0; 
                String secqrystability = "select Result_Status,Score from stability_chk_master where  Candidate_ID="+ CandautoId + "";
				System.out.println("Mok chatquery " + secqrystability);
				Statement stmtstability = connection.createStatement();
				ResultSet rssstability= stmtstability.executeQuery(secqrystability);
				while (rssstability.next()) 
				{
					stabilitystatus =rssstability.getInt("Result_Status");
					System.out.println("Statusi " + stabilitystatus);
					stabilitytotalscore =rssstability.getInt("Score");
					System.out.println("Total_score " + stabilitytotalscore);
				}
				%>
            <td align="left" class="allBackColor">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor"><b>Total Score :</b>&nbsp;<%=stabilitytotalscore%></td>
						<td align="right" class="allBackColor"><b>Status :</b>&nbsp;
							<%if(stabilitystatus==1){%>Selected<%}else if(stabilitystatus==2){%>On Hold<%}else if (stabilitystatus==3){%>Rejected<%}%>
						</td>
					</tr>
				</table>
			  </td>
        </tr> 
      
       
        <tr>
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;">V&A Test</td>
						<td align="right" class="allBackColor" style="background-color: #d8d8d8;">
							<b><a style="text-align: right;color: maroon;" onclick="showWindow()">View</a></b>
						</td>
					</tr>
				</table>
            </td>
         <% 
                int totalscorevoice=0;
                int voicestatus=0; 
                String secqryvoice = "select Statusi,Total_score from candidate_voice_score where  Cand_Id="+ CandautoId + "";
				System.out.println("Mok chatquery " + secqryvoice);
				Statement stmtvoice = connection.createStatement();
				ResultSet rssvoice= stmtvoice.executeQuery(secqryvoice);
				while (rssvoice.next()) 
				{
					voicestatus =rssvoice.getInt("Statusi");
					System.out.println("Statusi " + voicestatus);
					totalscorevoice =rssvoice.getInt("Total_score");
					System.out.println("Total_score " + totalscorevoice);
				}
				%>
            <td align="left" class="allBackColor">
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor"><b>Total Score :</b>&nbsp;<%=totalscorevoice%></td>						
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
				System.out.println("operations interview::: " + secqryoperations);
				Statement stmtoperations = connection.createStatement();
				ResultSet rssoperations= stmtoperations.executeQuery(secqryoperations);
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
				Statement stmtprogram = connection.createStatement();
				ResultSet rsprogram = stmtprogram.executeQuery(secQsnQryprogram);
				String matchSelectFieldprogram=null;
				Statement stmtMaster=null;
				ResultSet rsMaster=null;
				if(rsprogram.next())
				{
					matchSelectFieldprogram=rsprogram.getString("Program_Id");
					String secQsnMasterprogram = "select * from program_names_master where program_typeid=1 and is_alive=1";
				    System.out.println("query ============ "+secQsnMasterprogram);
				 	stmtMaster = connection.createStatement();
				 	rsMaster = stmtMaster.executeQuery(secQsnMasterprogram);
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
        <tr>
            <td colspan="3" align="center">   
            	<input type="hidden" name="selFor" value="" />
                <input type="submit" name="submit" id="submit" value="Offer" class="buttonMedium" onClick="return CheckValidation(this.form);"/>&nbsp;&nbsp;
               <span id="processing" style="display:none;"><b><font color="#000033" style="font-size: 12px;font-family: Arial,Helvetica,sans-serif;" class="taL" >Processing, please wait...</font></b></span>
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
				rssvoice.close(); 
				stmtvoice.close(); 
				rssstability.close(); 
				stmtstability.close(); 
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
  </body>
</html>
