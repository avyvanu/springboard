<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.sql.Connection"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.CallableStatement"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp"%>

<%
	String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
     if(USER_Name == null)
	  	{
	  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	  	}
    System.out.println("USER_Name in Voice Score page::::"+USER_Name);
	String candID = (String) request.getParameter("candidateid");
	System.out.println("candID===" + candID);
	String pagevalue = (String) session.getAttribute("VoicePageVal");
	System.out.println("Voice Score pagevalue===" + pagevalue);
	String USER_ID = (String)session.getAttribute("USER_ID");
	 if(USER_ID == null)
	  	{
	  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	  	}
	 System.out.println("USER_ID in voice score page::::"+USER_ID);
%>

<html>
	<head>
		<title>[24]7 Voice Score</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/Common_ritesh.css">
		<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
<style type="text/css">
	html,body 
	{
		margin: 0px;
	}

	.contentSize
		{
			border: 0px solid #FFFFFF;
		    clear: both;
		    display: block;
		    overflow: hidden;
		    padding-left: 0px;
		    width: 920px;
		    vertical-align: middle;
		}

	.wrapper
		{
			margin: 0 auto;
	    	width: 920px;
		}

	.tPersonal {
		width: 550px;
		height: 300px;
	}
</style>

<!-- Opening PDF Help Document  -->
	<script type="text/javascript">
	function ShowDoc(Filepath)
	{
	someWindow = window.open(Filepath,'ReasonWindow','height=635,width=605,scrollbars=no,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
	</script>
   <!-- End of Opening PDF Help Document  -->
   
   
<script type="text/javascript" language="javascript">
	 function logout()
	 {
	 location.href = "<%=logoutPage%>";
	 }
</script>

<!-- Audio playing script Java scripts-->
<script type="text/javascript" src="<%=recruitPath%>js/jquery.min.js"></script>
<script type="text/javascript"src="<%=recruitPath%>js/jquery.media.js"></script>

<script type=text/javascript>
    $(function() {
        $('a.media').media( { width: 240, height: 18 } );
    });
</script>
<!--End of  Audio playing script Java scripts-->

<script type="text/javascript">
	function AllowChars(evt)
	{
		var charCode = (evt.which) ? evt.which : event.keyCode;
		      // alert(charCode);
		if ((charCode > 47 && charCode < 58) || (charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 8 || charCode == 32 || charCode == 44 || charCode == 45 || charCode == 46 || charCode == 95) {
			return true;
		}
		else
		{
			alert("Invalid character entered !!");
			return false;
		}
	}      
</script>

<script type="text/javascript">
function calcscore()	 
		 {
		    var sentencestructure=document.getElementById("sentencestructure").value; 
		    var clarityThought=document.getElementById("clarityThought").value;
		    var pronunciation=document.getElementById("pronunciation").value;
		    var claritySpeech=document.getElementById("claritySpeech").value;
		    var RateOfSpeech=document.getElementById("RateOfSpeech").value;
		    var creativity=document.getElementById("creativity").value;   
		    var total=(parseInt(sentencestructure)+parseInt(clarityThought)+parseInt(pronunciation)+parseInt(claritySpeech)+parseInt(RateOfSpeech)+parseInt(creativity));	   
		    document.getElementById("display").value=total;
		 }	
</script>

<!-- Script for for Onchange of program -->
<script type="text/javascript">

	function programval()
	{
		getprogramvalue();
	}
	function getprogramvalue()
	{
		var programvalue=document.getElementById("programname").value;
		xmlhttp=GetXmlHttpObject();
		if (xmlhttp==null)
		{
		alert("Your browser does not support AJAX!");
	 	return;
		}
		var url="<%=request.getContextPath()%>/247Recruit/jsp/VoiceScoreList.jsp";
		url=url+"?sid="+Math.random();
		url=url+"&programvalue="+programvalue;
		xmlhttp.onreadystatechange=stateChanged;
		xmlhttp.open("GET",url,true);
		xmlhttp.send(null);
	}
	function stateChanged()
	{
		if (xmlhttp.readyState==4)
	  	{
			 var data = xmlhttp.responseText;
			 idata=data.split(",");
			 for(var i=0;i<idata.length-1;i++)
			 {
			    document.getElementById('desiredscore1').value= idata[0];	
				document.getElementById('desiredscore2').value= idata[1];
				document.getElementById('desiredscore3').value= idata[2];
				document.getElementById('desiredscore4').value= idata[3];
				document.getElementById('desiredscore5').value= idata[4];
		        document.getElementById('desiredscore6').value= idata[5];
			 }
		}
	}
function GetXmlHttpObject()
	{
		if (window.XMLHttpRequest)
	    {
			// code for IE7+, Firefox, Chrome, Opera, Safari
	  		return new XMLHttpRequest();
	  	}
		if (window.ActiveXObject)
		{
			// code for IE6, IE5
			return new ActiveXObject("Microsoft.XMLHTTP");
		}
		return null;
	}
</script>

<!-- Script for Checking the Validation on submit -->
<script type="text/javascript">      
        function CheckValidation()
		{
			if(voicescoresubmitform.sentencestructure.selectedIndex == 0) 
              { 
                alert ( 'Please Select Sentence Struture !'); 
                document.getElementById('sentencestructure').focus();
                 return false; 
              }
			
			else
			if(voicescoresubmitform.clarityThought.selectedIndex == 0) 
              { 
                alert ( 'Please Select Clarity of Thought Field !'); 
                document.getElementById('clarityThought').focus();
                 return false; 
              }	
			
			else
			if(voicescoresubmitform.pronunciation.selectedIndex == 0) 
              { 
                alert (  'Please Select Pronunciation Field !'); 
                document.getElementById('pronunciation').focus();
                 return false; 
              }		
			
			else	
			if(voicescoresubmitform.claritySpeech.selectedIndex == 0) 
              { 
                alert ( 'Please Select Clarity Of Speech !'); 
                document.getElementById('claritySpeech').focus();
                
                 return false; 
              }	
			
			else	
			if(voicescoresubmitform.RateOfSpeech.selectedIndex == 0) 
              { 
                alert (  'Please Select Rate of Speech !'); 
                document.getElementById('RateOfSpeech').focus();
                 return false; 
              }	
			
			else
			if(voicescoresubmitform.creativity.selectedIndex == 0) 
              { 
                alert (  'Please Select Creativity Filed !'); 
                 document.getElementById('creativity').focus();
                 return false; 
              }		
			
			else
				
			if(document.getElementById("comments").value=='')
			{
				var appStr = 'Please Enter Comments !!!';		
				alert(appStr);
				document.getElementById('comments').focus();
				return false;
			}
			document.getElementById('Submit').style.display="none";
            document.getElementById("processing").style.display="";
		  }
</script>
</head>
     <body>
		<table cellpadding="0" cellspacing="0" width="100%">
			<%
				try {
					String recruiterName = null;
					String recruiterid = null;
					Connection con = ConnectDatabase.getConnection();
					String secqryrecruiter = "SELECT Emp_Name,Emp_ID FROM user_master where Emp_ID='"+ USER_ID + "'";
					System.out.println("query " + secqryrecruiter);
					Statement stmtsrec = con.createStatement();
					ResultSet rssrec = stmtsrec.executeQuery(secqryrecruiter);
					if (rssrec.next()) {
						recruiterName = rssrec.getString("Emp_Name");
						System.out.println("recruiterName: " + recruiterName);
						recruiterid = rssrec.getString("Emp_ID");
                      }
			%>
			<tr>
				<td align="left">
		            <img src="<%=recruitPath%>images/247_Logo_left.jpg" alt="Logo" />
		        </td>
		        <td align="right">
		            <img src="<%=recruitPath%>images/Springboard_LOG.jpg" alt="Logo" />
		        </td>
			</tr>
			<tr class="tBackColor">
				<td align="left" colspan="2" style="height: 12px;">

				</td>
           </tr>
			<tr>
				<td colspan="2" style="height: 10px;"></td>
			</tr>
			<tr>
				<td align="left" style="padding-left: 10px;">
					<%
						if (pagevalue == "1") {
					%>
					<font style="color: #7E7E7E; font-weight: bold; font-size: 12px; font-family: Arial;">
					<a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > 
					<a href="<%=recruitPath%>jsp/Voice_Home.jsp">Voice</a> > 
					<a href="<%=recruitPath%>jsp/LD_VoiceScore.jsp">Select Candidate</a>>
					</font>
					<font style="color: #000000; font-weight: bold; font-size: 12px; font-family: Arial;">Score Voice</font>
					<%
						} else if (pagevalue == "2") {
					%>
					<font style="color: #7E7E7E; font-weight: bold; font-size: 12px; font-family: Arial;">
					<a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > 
					<a href="<%=recruitPath%>jsp/Voice_Home.jsp">Voice</a> > 
					<a href="<%=recruitPath%>jsp/LD_VoiceScore.jsp">Select Candidate</a> ></font>
					<font style="color: #000000; font-weight: bold; font-size: 12px; font-family: Arial;">Rescore Voice</font>
					<%
						}
					%>
				 </td>
				 <td align="right" class="recName" style="padding-right:10px;">
				  <b><span class="username"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
			    </td>
			</tr>
			<tr>
				<td colspan="2" align="center">
                     <%
						if (request.getAttribute("DuplicateCheck") != null)
						 {
						String DuplicateCheck = (String) request.getAttribute("DuplicateCheck");
						 if (DuplicateCheck.equalsIgnoreCase("Already_Inserted")) 
						 {
					%>
					<div align="center">
						<span class="register" style="color: red; font-weight: bold;">
							Data already Exists!! </span>
					</div>
					<%
						}
							}
					%>

<br/>
					<!--********************************* -->

 <div class="wrapper">
  <div class="contentSize">
     <form action="<%=request.getContextPath()%>/VoiceScore" method="post" id="voicescoresubmitform" name="voicescoresubmitform" method="post" onsubmit="return CheckValidation();" accept-charset="utf-8">
		<table width="920px" cellspacing="6" cellpadding="6" border="0">
			<tr>
		      <%
			    String firstname = null;
				String middlename = null;
				String id = null;
				String higeduc = null;
				int Reveexp = 0;
				int ReveexpMts=0;
				int ReveexpYrs = 0;
				int nonReveexp = 0;
				int nonReveexpMts=0;
				int nonReveexpYrs = 0;
				int ApplyingFor=0;
				String doe = null;
				String imagepath = null;
				String dobfinal = null;
				String StartTime = null;
				Statement statement=null;
				ResultSet resultset=null;
				//String secQsnxQry7 = "SELECT * FROM bpo_candidatesreg_details where Bpo_Cand_Id='"+ candID + "'";
				//System.out.println("query " + secQsnxQry7);
				//Statement stmts = con.createStatement();
				//ResultSet rss = stmts.executeQuery(secQsnxQry7);
				//String EDKey="[24]7";
			//	String EDKPass="247Cust0m3r"; 
				Statement stmts=null;
				ResultSet rss = null;
				CallableStatement cs=null;
				con=ConnectDatabase.getConnection();									
				stmts = con.createStatement();
				String strProcedure="{call BpoCandDtls_Encrypt_Proc(?,?,?)}"; //your procedure name
				System.out.println("strProcedure"+strProcedure);
				cs=con.prepareCall(strProcedure);
				cs.setString(1,candID);
		        cs.setString(2,EDKey);
		        cs.setString(3,EDKPass);
				rss=cs.executeQuery();
			if (rss.next())
			 {
				id = rss.getString("AutoID");
				candID = rss.getString("Bpo_Cand_Id");
				firstname = rss.getString("First_Name");
				middlename = rss.getString("Middle_Name");
				ApplyingFor=rss.getInt("Applying_For");
				higeduc = rss.getString("Qualification");
				Reveexp = rss.getInt("RelevantExprience");
				System.out.println("RelevantExprience"+Reveexp);
				ReveexpMts=Reveexp%12;
				System.out.println("RelevantExprience:::ReveexpMts"+ReveexpMts);
				ReveexpYrs=Reveexp/12;
				System.out.println("RelevantExprience::ReveexpYrs"+ReveexpYrs);
				nonReveexp = rss.getInt("NONRelevantExprience");
				System.out.println("Non RelevantExprience"+nonReveexp);
				nonReveexpMts=nonReveexp%12;
				System.out.println("Non RelevantExprience:::nonReveexpMts"+nonReveexpMts);
				nonReveexpYrs=nonReveexp/12;
				System.out.println("Non RelevantExprience:::nonReveexpYrs"+nonReveexpYrs);
				doe = rss.getString("system_date_time");
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat dateFormat2 = new SimpleDateFormat("dd-MMM-yyyy");
				Date date = dateFormat.parse(doe);
				imagepath = rss.getString("ImagePath");
				dobfinal = dateFormat2.format(date);
				// onlyDate=doe.substring(0,10);
				String insertQuery = "SELECT CURTIME()";
				System.out.println("query " + insertQuery);
				statement = con.createStatement();
				resultset = statement.executeQuery(insertQuery);
			if (resultset.next()) 
			  {
				StartTime = resultset.getString(1);
				System.out.println("StartTime" + StartTime);
			  }
		    }
		    
		    //*******Qualification Group Code*********//
		    Statement stQualification=null;
			ResultSet rsQualification=null;
		    String QualificationGroupName="";
		    String queryForqualification="SELECT  QualificationGroupName FROM mstqualgroup where QualificationGroupId='"+higeduc+"'";
			stQualification=con.createStatement();
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
			stApplyingFor=con.createStatement();
			rsApplyingFor=stApplyingFor.executeQuery(queryApplyingFor);
			if(rsApplyingFor.next())
	    	{	
	    	ApplyingForName=rsApplyingFor.getString("Program_type_Name");
	    	System.out.println("ApplyingForName"+ApplyingForName);
	    	}
		    rsApplyingFor.close();
		    stApplyingFor.close();
    	
    	//**************End of Applying For*****************//
			%>
			
			<%
           if(imagepath==null)
           		{
            	 %>
	            	<td width="120px" rowspan="3" style="padding: 0px;"> 
		            	<img src="<%=recruitPath%>images/default_person.jpg" width="120" height="90" alt="image" />
		            </td>
            	<%}
            		else
            		{
            	%>
					<td width="120px" rowspan="3" style="padding: 0px;"> 
						<img src="<%=recruitPath%>jsp/displayImageView.jsp?CID=<%=candID%>" width="120" height="90" alt="image" />
					</td>
					<%} %>
					<td width="250px" class="allBackColor" id="candidateid" align="left"><%=candID%>
						<input type="hidden" name="candidateid" value="<%=id%>" />
						<input type="hidden" name="recruitername" value="<%=recruiterid%>">
						<input type="hidden" name="pagevalue" value="<%=pagevalue%>">
						<input type="hidden" name="starttime" value="<%=StartTime%>">
						<input type="hidden" name="CandidateGeneratedID" value="<%=candID%>" />
					</td>
					<td width="250px" id="Highesteducation" class="allBackmain" align="left">
						<b>Highest Education</b>
					</td>
						<td width="300px" id="Education" class="allBackColor" align="left">
							<%if(higeduc.equalsIgnoreCase("0")) {%>
			                      NA
			                <%}else{ %>
			                <%=QualificationGroupName%>
			                <%} %>
	                </td>
				</tr>
				<tr>
					<td id="candidatename" class="allBackColor" align="left"><%=firstname%>&nbsp;<%=middlename%></td>
					<td class="allBackmain" align="left">
						<b>Customer Interaction Experience</b>
					</td>
					<td id="relevant_exp" class="allBackColor" align="left">
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
					<td class="allBackColor" align="left">
						<%=ApplyingForName %>
					</td>
					<td class="allBackmain" align="left">
						<b>Other Experience</b>
					</td>
					<td id="nonrelevant" class="allBackColor" align="left">
					<%if(nonReveexp==0){
					 %>
					 Fresher
					 <%}else{ %>
					<%=nonReveexpYrs%> Years <%=nonReveexpMts %> Months
					<%} %>
					</td>
				</tr>
				<tr>
					<td class="allBackmain" align="left">
						<b>Audio File</b>
					</td>
					<%
						    String media = null;
							String secmedia = "SELECT VAUploadPath FROM bpo_candidatesreg_details where bpo_cand_id='"+ candID + "'";
							System.out.println("File name:: " + secmedia);
							Statement stmtmedia = con.createStatement();
							ResultSet rsmedia = stmtmedia.executeQuery(secmedia);
							if (rsmedia.next()) {
								media = rsmedia.getString("VAUploadPath");
								System.out.println("media file name:: " + media);
							}
					%>
					<td class="allBackColor" colspan="3" align="left">
						<%
							if (media == null) {
									out.print("No Audio file found for this candidate");
								} else {
						%>
						<A class=media href="<%=voicePath%><%=media%>"></A>
						<%
							}
						%>
					</td>
			 </tr>
             <tr class="allBackheading" align="left">
				<td align="left" colspan="4">
					Part A - Language
				</td>
			 </tr>
	         <tr class="allBackmain">
					<td  style="padding-left: 10px;" colspan="2" align="left">
						<b>Parameter</b>
					</td>					
					<td align="left" colspan="2">
						<b>Score</b>
					</td>
				</tr>
				<tr>
					<td class="allBackColor" style="padding-left: 10px;" colspan="2" align="left">
						Sentence Structure
					</td>				
					<td class="allTdBackColor" align="left" colspan="2">

						<select name="sentencestructure" id="sentencestructure" size="1" class="reSizeforOther" onChange="calcscore()" style="width: 100%; height: 20px;">
							<option value="0">
								Select
							</option>
							<%
								String secQsnQry1 = "select score, concat(score,' ',description) as ritesh from voice_score_pp_master where pp_id='1' order by score";
									System.out.println("query " + secQsnQry1);
									Statement stmt1 = con.createStatement();
									ResultSet rs1 = stmt1.executeQuery(secQsnQry1);
									while (rs1.next()) {
							%>
							<option value="<%=rs1.getString("score")%>"><%=rs1.getString("ritesh")%></option>
							<%
								}
							%>

						</select>

					</td>
				</tr>
				<tr>
					<td class="allBackColor" style="padding-left: 10px;" colspan="2" align="left">
						Clarity of Thought
					</td>					
					<td class="allTdBackColor" align="left" colspan="2">
						<select name="clarityThought" id="clarityThought" size="1" class="reSizeforOther" onChange="calcscore()" style="width: 100%; height: 20px;">
							<option value="0">
								Select
							</option>
							<%
								String secQsnQry2 = "select score,concat(score,' ',description) as ritesh from voice_score_pp_master where pp_id='2' order by score";
									System.out.println("query " + secQsnQry2);
									Statement stmt2 = con.createStatement();
									ResultSet rs2 = stmt2.executeQuery(secQsnQry2);
									while (rs2.next()) {
							%>
							<option value="<%=rs2.getString("score")%>"><%=rs2.getString("ritesh")%></option>
							<%
								}
							%>

						</select>

					</td>
				</tr>
	        <tr class="allBackheading">
					<td colspan="4" align="left">
						Part B - Accent
					</td>
				</tr>
           <tr class="allBackmain">
					<td  style="padding-left: 10px;" colspan="2" align="left">
						<b>Parameter</b>
					</td>					
					<td align="left" colspan="2">
						<b>Score</b>
					</td>
				</tr>
				<tr>
					<td class="allBackColor" style="padding-left: 10px;" colspan="2" align="left">
						Pronunciation
					</td>
					
					<td class="allTdBackColor" align="left" colspan="2">
						<select name="pronunciation" id="pronunciation" size="1"
							class="reSizeforOther" onChange="calcscore()"  style="width: 100%; height: 20px;">

							<option value="0">
								Select
							</option>
							<%
								String secQsnQry3 = "select score,concat(score,' ',description) as ritesh from voice_score_pp_master where pp_id='3' order by score";
								System.out.println("query " + secQsnQry3);
								Statement stmt3 = con.createStatement();
								ResultSet rs3 = stmt3.executeQuery(secQsnQry3);
								while (rs3.next()) {
							%>
							<option value="<%=rs3.getString("score")%>"><%=rs3.getString("ritesh")%></option>
							<%
								}
							%>

						</select>
					</td>
				</tr>
				<tr>
					<td class="allBackColor" style="padding-left: 10px;" colspan="2" align="left">
						Clarity of Speech
					</td>					
					<td class="allTdBackColor" align="left" colspan="2">
						<select name="claritySpeech" id="claritySpeech" size="1" class="reSizeforOther" onChange="calcscore()" style="width: 100%; height: 20px;">
							<option value="0">
								Select
							</option>
							<%
								String secQsnQry4 = "select score,concat(score,' ',description) as ritesh from voice_score_pp_master where pp_id='4' order by score";
									System.out.println("query " + secQsnQry4);
									Statement stmt4 = con.createStatement();
									ResultSet rs4 = stmt4.executeQuery(secQsnQry4);
									while (rs4.next()) {
							%>
							<option value="<%=rs4.getString("score")%>"><%=rs4.getString("ritesh")%></option>
							<%
								}
							%>
						</select>

					</td>
				</tr>
		      <tr class="allBackheading">
					<td colspan="4" align="left">
						Part C - Overall Performance
					</td>
				</tr>
	         <tr class="allBackmain">
					<td  style="padding-left: 10px;" colspan="2" align="left">
						<b>Parameter</b>
					</td>
					<td align="left" colspan="2">
						<b>Score</b>
					</td>
				</tr>
				<tr>
					<td class="allBackColor" style="padding-left: 10px;" colspan="2" align="left">
						Rate of speech
					</td>
					<td class="allTdBackColor" align="left" colspan="2">
			             <select name="RateOfSpeech" id="RateOfSpeech" size="1" class="reSizeforOther" onChange="calcscore()" style="width: 100%; height: 20px;">
							<option value="0">
								Select
							</option>
							<%
								String secQsnQry5 = "select score,concat(score,' ',description) as ritesh from voice_score_pp_master where pp_id='5' order by score";
									System.out.println("query " + secQsnQry5);
									Statement stmt5 = con.createStatement();
									ResultSet rs5 = stmt5.executeQuery(secQsnQry5);
									while (rs5.next()) {
							%>
							<option value="<%=rs5.getString("score")%>"><%=rs5.getString("ritesh")%></option>
							<%
								}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td class="allBackColor" style="padding-left: 10px;" colspan="2" align="left">
						Creativity
					</td>
					
					<td class="allTdBackColor" align="left" colspan="2">
						<select name="creativity" id="creativity" size="1"
							class="reSizeforOther" onChange="calcscore()"  style="width: 100%; height: 20px;">
							<option value="0">
								Select
							</option>
							<%
								String secQsnQry6 = "select score,concat(score,' ',description) as ritesh from voice_score_pp_master where pp_id='6' order by score";
									System.out.println("query " + secQsnQry6);
									Statement stmt6 = con.createStatement();
									ResultSet rs6 = stmt6.executeQuery(secQsnQry6);
									while (rs6.next()) {
							%>

							<option value="<%=rs6.getString("score")%>"><%=rs6.getString("ritesh")%></option>
							<%
								}
							%>

						</select>
					</td>
				</tr>
			    <tr>
					<td  class="allBackmain" align="center" colspan="1">
						<b>Comments</b>
					</td>
					<td  class="allTdBackColor" colspan="3" width="800px" align="left">
						<textarea name="comments" style="width:100%" rows="4" id="comments" class="resizetextarea" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"></textarea>
					</td>
				</tr>
                <tr>
					<td  class="allBackmain" colspan="1" nowrap="nowrap" align="center">
						<b >TOTAL SCORE</b>
					</td>
					<td id="totalscore" class="allBackColor" align="center" colspan="2">
						<b> <input type="text" id="display" name="display" readonly="readonly" value="0" style="background: #F2F2F2; border-left: #F2F2F2; border-top: #F2F2F2; border-bottom: #F2F2F2; border-right: #F2F2F2; text-align: center" />
						</b>
					</td>
					<td colspan="1" >
					<table border="0" width="100%">
						<tr>
							<td align="center">
								<input name="Clear" type="reset" value="Clear" id="Clear" class="buttonSmall" />
                    		</td>
							<td align="center">
								<input name="Submit" id="Submit" type="submit" value="Submit" class="buttonSmall" onClick="return CheckValidation(this.form);" />
								<span id="processing" style="display:none;"><b><font color="#000033" style="font-size: 12px;font-family: Arial,Helvetica,sans-serif;" class="taL" >Processing, please wait...</font></b></span>
							</td>
						</tr>
					</table>
					</td>
				</tr>
			</table>
			<%
					rs6.close();
					stmt6.close();
					rs5.close();
					stmt5.close();
					rs4.close();
					stmt4.close();
					rs3.close();
					stmt3.close();
					rs2.close();
					stmt2.close();
					rs1.close();
					stmt1.close();
					rsmedia.close();
					stmtmedia.close();
					resultset.close();
					statement.close();
					rss.close();
					stmts.close();
					rssrec.close();
                    stmtsrec.close();
					con.close();
				} catch (Exception ex) {
					System.out.println("=========" + ex.getMessage());
					ex.printStackTrace();
				}
			%>
     </form>
   </div>
</div>
		<!--********************************* -->
               </td>
			</tr>
			<tr>
				<td colspan="2" style="height: 10px;"></td>
			</tr>
			<tr class="footerBackColor">
				<td align="left" valign="middle" style="background-color: #808080; color: #FFFFFF; font-weight: bold; height: 21px; font-size: 9px; font-family: Arial; padding-left: 5px;" colspan="1">
					&copy; 2012. [24]7. ALL RIGHTS RESERVED.
				</td>
              <td align="right" valign="middle" style="background-color:#808080;height:21px; padding-right:5px;">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<a onclick="return ShowDoc('<%=HelpDocVPathLND%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
						</td>
						<td style="width: 5px;"></td>
						<td>
							<a onclick="return ShowDoc('<%=HelpDocVPathLND%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
						</td>
					</tr>
				</table>
			</td>
			</tr>
		</table>

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
