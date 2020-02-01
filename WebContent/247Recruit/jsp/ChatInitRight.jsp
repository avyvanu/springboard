<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="util.IsLanguageValidator"%>
<%
String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
	     if(USER_Name==null)
		  	{
		  	 response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Login.jsp");
		  	}
System.out.println("USER_Name in Ops  page::::"+USER_Name);	
String canId = (String) request.getParameter("candId");
System.out.println("canId ====="+canId);
session.setAttribute( "bioCanID", canId );
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
session.setAttribute( "page", "ChatInitRight.jsp" );	
String progVal=(String) request.getParameter("progVal");
if(progVal==null)
{
	progVal=(String) session.getAttribute("progVal");	
}
else
{
	session.setAttribute("progVal",progVal);
}

  	
%>

<html>
  <head>
    <title>[24]7 Select for Operations Interview</title>
    
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
	  function RedirectPage()
    	{
	 		parent.location.href= "<%=recruitPath%>jsp/ChatInitRight.jsp";
	 	}
	 function showWindow()
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
  <form name="BioForm" onsubmit="return RedirectPage();">
  
    <%
    String higeduc = null;
    int SkillSet=0;
	int Reveexp = 0;
	int ReveexpMts=0;
	int ReveexpYrs = 0;
	int nonReveexp = 0;
	int nonReveexpMts=0;
	int nonReveexpYrs = 0;
	int ApplyingFor=0;
  	if(rs.next())
  	{
  		int RAG=rs.getInt("RAG");
  		int CandautoId=rs.getInt("AutoID");
  		System.out.println("CandautoId"+CandautoId);
  		System.out.println("RAG::::ChatInitPage:::"+RAG);
  		String canName=rs.getString("First_Name")+ " " +rs.getString("Middle_Name")+ " " +rs.getString("Last_Sir_Name");
  		Date dateStr = rs.getDate("System_Date_Time");
  		SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy");
    	String DOR = formatter.format(dateStr);
    	higeduc = rs.getString("Qualification");
    	ApplyingFor=rs.getInt("Applying_For");
    	SkillSet=rs.getInt("Current_Skill_Set");
		Reveexp = rs.getInt("RelevantExprience");
		System.out.println("RelevantExprience"+Reveexp);
		ReveexpMts=Reveexp%12;
		System.out.println("RelevantExprience:::ReveexpMts"+ReveexpMts);
		ReveexpYrs=Reveexp/12;
		System.out.println("RelevantExprience::ReveexpYrs"+ReveexpYrs);
		nonReveexp = rs.getInt("NONRelevantExprience");
		System.out.println("Non RelevantExprience"+nonReveexp);
		nonReveexpMts=nonReveexp%12;
		System.out.println("Non RelevantExprience:::nonReveexpMts"+nonReveexpMts);
		nonReveexpYrs=nonReveexp/12;
		System.out.println("Non RelevantExprience:::nonReveexpYrs"+nonReveexpYrs);
    	//*******Qualification Group Code*********//
		    Statement stQualification=null;
			ResultSet rsQualification=null;
		    String QualificationGroupName="";
		    String queryForqualification="SELECT  QualificationGroupName FROM mstqualgroup where QualificationGroupId='"+higeduc+"'";
			stQualification=connection.createStatement();
			rsQualification=stQualification.executeQuery(queryForqualification);
			if(rsQualification.next())
	    	{	
	    	QualificationGroupName=rsQualification.getString("QualificationGroupName");
	    	System.out.println("QualificationGroupName"+QualificationGroupName);
	    	}
		    rsQualification.close();
		    stQualification.close();
		    //*****End ofQualification Group Code*****//
    	
    	//**************Applying For*****************//
    	    Statement stApplyingFor=null;
			ResultSet rsApplyingFor=null;
		    String ApplyingForName="";
		    String queryApplyingFor="SELECT Program_type_Name FROM  program_type_master Where Program_Type_Id='"+ApplyingFor+"'";
			stApplyingFor=connection.createStatement();
			rsApplyingFor=stApplyingFor.executeQuery(queryApplyingFor);
			if(rsApplyingFor.next())
	    	{	
	    	ApplyingForName=rsApplyingFor.getString("Program_type_Name");
	    	System.out.println("ApplyingForName"+ApplyingForName);
	    	}
		    rsApplyingFor.close();
		    stApplyingFor.close();
    	
    	//**************End of Applying For*****************//
    	
    	//**************Current Skill Set For Experience*****************//
    	    Statement stSkillSet=null;
			ResultSet rsSkillSet=null;
		    String SkillSetName="";
		    String querySkillSet="SELECT Current_Skill_name FROM current_skill_master where Current_Skill_id='"+SkillSet+"'";
			stSkillSet=connection.createStatement();
			rsSkillSet=stSkillSet.executeQuery(querySkillSet);
			if(rsSkillSet.next())
	    	{	
	    	SkillSetName=rsSkillSet.getString("Current_Skill_name");
	    	System.out.println("SkillSetName"+SkillSetName);
	    	}
		    rsSkillSet.close();
		    stSkillSet.close();
    	
    	//**************End of Current Skill Set For Experience*****************//
    	
    	
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
            	<a style="text-align: right;color: maroon;" onclick="showWindowYellow()"><img src="<%=recruitPath%>images/yellow.jpg" width="65px" height="80px" alt="image" /></a>
            	 	<%}
            		else if(RAG==3)
            		{
            	 %>
            	 <img src="<%=recruitPath%>images/green.jpg" width="65px" height="80px" alt="image" />
            	 <%}
            		else
            		{
            	 %>
            	<a style="text-align: right;color: maroon;" onclick="showWindow()"> <img src="<%=recruitPath%>images/red.jpg" width="65px" height="80px" alt="image" /></a>
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
            <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
                Highest Education
            </td>
            
            <td align="left"  class="allBackColor">
                <%=QualificationGroupName%>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
                Current Skill Set
            </td>
            
            <td align="left"  class="allBackColor">
            <%if(SkillSet==0){ %>
            Fresher
            <%}else{ %>
                <%=SkillSetName%>
            <%} %>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
                Applying For
            </td>
            
            <td align="left"  class="allBackColor">
                <%=ApplyingForName%>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
                Relevant Experience
            </td>
            
            <td align="left"  class="allBackColor">
              <%if(Reveexp==0)
					{ %>
					Fresher
					<%}
					else
					{ %>
					<%=ReveexpYrs%> Years <%=ReveexpMts %> Months
					<%} %>
            </td>
        </tr>
         <tr>
            <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
                Non Relevant Experience
            </td>
            
            <td align="left" class="allBackColor">
              <%if(nonReveexp==0){
					 %>
					 Fresher
					 <%}else{ %>
					<%=nonReveexpYrs%> Years <%=nonReveexpMts %> Months
					<%} %>
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
            
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
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
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
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
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
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
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
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
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
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
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
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
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
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
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
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
            <td colspan="3" align="center"> 
                <input type="button" name="back" value="Start Interview" class="buttonMedium" onclick="javascript:parent.location.href='<%=recruitPath%>jsp/OperationsInterview.jsp?progVal=<%=progVal%>'" />&nbsp;&nbsp;
            </td>
        </tr>
    </table>
	<%
	}
	}
	  	catch(Exception e)
	  	{
	  		e.printStackTrace();
	  	}
	rs.close();
	stmts.close();
	connection.close();
	%>
   </form>
  </body>
</html>
