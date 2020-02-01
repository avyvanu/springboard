<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.sql.Connection"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.CallableStatement"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
	String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
	if(USER_Name == null)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	}
	System.out.println("USER_Name in Voice Score page::::"+USER_Name);
	String candID = (String) request.getParameter("candidateid");
	System.out.println("candID==="+candID);
	String pagevalue=(String)session.getAttribute("ChatPageVal");
	System.out.println("Chat Score pagevalue==="+pagevalue);
	String USER_ID = (String)session.getAttribute("USER_ID");
	
	if(USER_ID == null)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	}
 	System.out.println("USER_ID in Chat score score page::::"+USER_ID);
 %>

<html>
  <head>
    <title>[24]7 SPRINGBOARD</title>
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

</style>

<script type="text/javascript" language="javascript">

 function logout()
 {
 	location.href = "<%=logoutPage%>";
 }
 
 function showWindowScript()
	{
		var url = "<%=request.getContextPath()%>/247Recruit/jsp/ChatScriptPrint.jsp?CandidateId=<%=candID%>"
		someWindow = window.open(url,'ReasonWindow','height=550,width=610,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}

</script>	 
	
	<!-- Opening PDF Help Document  -->
	<script type="text/javascript">
	function ShowDoc(Filepath)
	{
		someWindow = window.open(Filepath,'ReasonWindow','height=635,width=605,scrollbars=no,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
	</script>
   <!-- End of Opening PDF Help Document  -->
   
<!-- Char allowing scripts --> 
<script type="text/javascript">
	function AllowChars(evt)
	{
	var charCode = (evt.which) ? evt.which : event.keyCode;

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
<!-- End of script -->

<!-- Calculating Scores Based on Selection -->

<script type="text/javascript">
	function AllowNumbers(evt)
	{
		var theEvent = evt || window.event;
		var charCode = (evt.which) ? evt.which : event.keyCode;
		if ((charCode > 47 && charCode < 58) || charCode == 13 || charCode == 8) 
		{
			return true;
		}
		else
		{
			alert("Only numbers allowed here !!");
			return false;
		}
	}      
</script>
	 
<!-- Script to calculate the Total Score --> 
<script type="text/javascript">
		 
	function calcscore()	 
	{
		var appropraiteOpening=document.getElementById("appropraiteOpening").value; 
		var appropriateClosing=document.getElementById("appropriateClosing").value;
		var Candidateownership=document.getElementById("Candidateownership").value;
		var candidateAssistance=document.getElementById("candidateAssistance").value;
		var candidatepolite=document.getElementById("candidatepolite").value; 
		var candidateEmpathize=document.getElementById("candidateEmpathize").value;
		var candidateComprehend=document.getElementById("candidateComprehend").value;
		var candidateconcise=document.getElementById("candidateconcise").value;
		  
		var total=parseFloat(appropraiteOpening)+parseFloat(appropriateClosing)+parseFloat(Candidateownership)+parseFloat(candidateAssistance)+parseFloat(candidatepolite)+parseFloat(candidateEmpathize)+parseFloat(candidateComprehend)+parseFloat(candidateconcise);	   
		document.getElementById("dis").value=total;
		document.getElementById("display").value=total;
		ValCalc();
	}	
</script>

<!-- Final Total Score Script -->
 <script type="text/javascript">
		function ValCalc()
		{
		   
			var x=document.getElementById('dis').value;
			var y=document.getElementById('dis1').value;
			var z=document.getElementById('dis2').value;
			var colorScore = document.getElementById("Chat_Score").value;
			var sum = parseFloat(x)+parseFloat(y)+parseFloat(z) + parseFloat(colorScore);
			document.getElementById("display").value=sum;
		}
</script>
	 
<!-- Script for Validating the Selection -->	 
 <script type="text/javascript">
       
		    function CheckValidation()
			{
				document.getElementById('Chat_texaHTML').innerHTML = Composition.document.body.innerHTML;
				
				var chat_partC = document.getElementById("chat_partC_Comments").value;
				if(chat_partC == '' || chat_partC.trim() == '') 
    	        { 
                	var appStr = 'Please enter part C comments !';		
					alert(appStr);
					document.getElementById('chat_partC_Comments').focus(); 
					return false; 
              	}
				if(chatscoresubmitform.appropraiteOpening.selectedIndex == 0) 
    	        { 
                	alert ( 'Please Select "Did the Candidate use the appropriate Opening" Field !');
                 	document.getElementById('appropraiteOpening').focus(); 
                 	return false; 
              	}
				else if(chatscoresubmitform.appropriateClosing.selectedIndex == 0) 
              	{ 
                	alert ( 'Please Select "Did the Candidate use the appropriate Closing" Field !'); 
                 	document.getElementById('appropriateClosing').focus(); 
                 	return false; 
              	}
				else if(chatscoresubmitform.Candidateownership.selectedIndex == 0) 
              	{ 
                	alert ( 'Please Select "Did the Candidate take ownership of the situation" Field !'); 
                 	document.getElementById('Candidateownership').focus(); 
                 	return false; 
              	}
				else if(chatscoresubmitform.candidateAssistance.selectedIndex == 0) 
              	{ 
                	alert ( 'Please Select "Did the Candidate ask for additional assistance before closing" Field !');
                 	document.getElementById('candidateAssistance').focus();  
                 	return false; 
              	}
				else if(chatscoresubmitform.candidatepolite.selectedIndex == 0) 
              	{ 
                	alert ( 'Please Select "Please Select "Was the Candidate Courteous/Polite" Field !'); 
                 	document.getElementById('candidatepolite').focus();  
                 	return false; 
              	}
				else if(chatscoresubmitform.candidateEmpathize.selectedIndex == 0) 
              	{ 
                	alert ( 'Please Select "Please Select "Did the Candidate Empathize/Showed concern" Field !'); 
                	document.getElementById('candidateEmpathize').focus();  
                 	return false; 
              	}
				else if(chatscoresubmitform.candidateComprehend.selectedIndex == 0) 
              	{	 
                	alert ( 'Please Select "Please Select "Did the Candidate Comprehend the customer questions and statements" Field !');
                	document.getElementById('candidateComprehend').focus(); 
                 	return false; 
              	}
				else if(chatscoresubmitform.candidateconcise.selectedIndex == 0) 
              	{ 
                	alert ( 'Please Select "Please Select "Was the Candidate clear and concise with his explanations" Field !');
                 	document.getElementById('candidateconcise').focus();  
                 	return false; 
              	}	
				else if(document.getElementById("comments").value=='')
				{
					var appStr = 'Please Enter Comments !';		
					alert(appStr);
					document.getElementById('comments').focus();
					return false;
				}
			     document.getElementById('Submit').style.display="none";
	             document.getElementById("processing").style.display="";
			}

</script>
<script type="text/javascript">

function purpleScoreTotal()
{
	var sconmax = 9;
	var sconmin = 0;
	var total_error = document.getElementById("totalerror1").value;
	if(total_error == 0)
	{
		document.getElementById('display1').value = sconmax;		
	}
	if(total_error > 0 && total_error <= 36)
	{		
		var purple = sconmax - (parseInt(total_error) * 0.25);
		document.getElementById('display1').value = purple;	
	}
	else if(total_error > 36)
	{
		document.getElementById('display1').value = sconmin;
	}
	
	funTotalScore();
}

var counterPurple = 0; 
var suvcounterPurple = 0; 
function countcodeNoPurple()
{
	var pval = document.getElementById("totalerror1").value;
	counterPurple  = parseInt(pval)+1;
	document.getElementById("totalerror1").value = counterPurple;
	purpleScoreTotal();
}

function subcountcodeNoPurple()
{
	var pval = document.getElementById("totalerror1").value;
	if(pval > 0)
	{
		suvcounterPurple  = parseInt(pval)-1;
		document.getElementById("totalerror1").value = suvcounterPurple;
	}
	purpleScoreTotal();
}
</script>

<script type="text/javascript">
function orangeScoreTotal()
{
	var pun_max = 3;
	var pun_min = 0;
	
	var total_error = document.getElementById("totalerror2").value;
	if(total_error == 0)
	{
		document.getElementById('display2').value = pun_max;		
	}
	if(total_error > 0 && total_error <= 12)
	{		
		var orange = pun_max - (parseInt(total_error) * 0.25);
		document.getElementById('display2').value = orange;	
	}
	else if(total_error > 12)
	{
		document.getElementById('display2').value = pun_min;
	}
	funTotalScore();
}

var counterOrange = 0; 
var subcounterOrange = 0; 

function countcodeNoOrange()
{
	var oval = document.getElementById("totalerror2").value;
	counterOrange  = parseInt(oval)+1;
	document.getElementById("totalerror2").value = counterOrange;
	orangeScoreTotal();

}
function subocountcodeNoOrange()
{
	var oval = document.getElementById("totalerror2").value;
	if(oval > 0)
	{
		subcounterOrange  = parseInt(oval) - 1;
		document.getElementById("totalerror2").value = subcounterOrange;
	}
	orangeScoreTotal();

}
</script>

<script type="text/javascript">
function funTotalScore()
{
	var pScor = document.getElementById("display1").value;
	var oScor = document.getElementById("display2").value;
	var tscore = parseFloat(pScor) + parseFloat(oScor);
	document.getElementById("langChatScore").innerHTML = tscore;
	document.getElementById("Chat_Score").value = tscore;
	ValCalc();
}
</script>

<script type="text/javascript">


var bLoad=false
var pureText=true
var bodyTag="";
var bTextMode=false

function clearAllcolorcode_chatC()
{
	if(confirm('Are you sure you want to clear this correction ?'))
	{
		document.getElementById("totalerror1").value = 0;
		document.getElementById("totalerror2").value = 0;
	
		document.getElementById("display1").value = 9;
		document.getElementById("display2").value = 3;
		document.getElementById("Chat_Score").value = 12;
		document.getElementById("langChatScore").innerHTML = 12;
		
		
	
	
		bodyTag = ( document.getElementById("Composition").innerHTML = document.getElementById("transData").innerHTML);
		Composition.document.open();
		Composition.document.write(bodyTag);
		Composition.document.body.style.fontSize = "10pt";
		Composition.document.body.style.fontFamily = "Arial";
		Composition.document.body.style.bgColor = "#F7F7F7";
		Composition.document.body.text = '#000000';
		Composition.document.close();
		Composition.document.designMode="On";
		ValCalc();
	}
	else 
	{
		return false;
	}

}
</script>

	 </head>
  <body onload="getScript();">
  <table cellpadding="0" cellspacing="0" width="100%">
	    <tr>
	    <% 
	    	   Connection con=null;
	           Statement stmts7 =null;
			   ResultSet rss7 = null;          
               try
               {
                con = ConnectDatabase.getConnection(); 
  			    String recruiterName=null;
	    	    String recruiterid=null;
  			    String secqryrecruiter = "SELECT Emp_Name,Emp_ID FROM user_master where Emp_ID='"+USER_ID+"'";
				System.out.println("query "+secqryrecruiter);
				Statement stmtsrec = con.createStatement();
				ResultSet rssrec = stmtsrec.executeQuery(secqryrecruiter);
				while(rssrec.next())
				{
					recruiterName=rssrec.getString("Emp_Name");
					recruiterid=rssrec.getString("Emp_ID");
				}
        %>
	       <td align="left">
	            <img src="<%=recruitPath%>images/247_Logo_left.jpg" alt="Logo" />
	        </td>
	        <td align="right">
	            <img src="<%=recruitPath%>images/Springboard_LOG.jpg" alt="Logo" />
	        </td>
	    </tr>

	    <tr class="tBackColor">
	        <td align="left" colspan="2" style="height:12px;">
				
			</td>
			
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr>
	        <td align="left" style="padding-left:10px;">
	           <%if(pagevalue=="1")
	        { %>
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > <a href="<%=recruitPath%>jsp/SIM_Home.jsp">SIM</a> > <a href="<%=recruitPath%>jsp/LD_ChatScore.jsp">Select Candidate</a> ></font>
	            <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Score Chat</font>
	        <%} 
	        else if(pagevalue=="2")
	        {%>
	        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > <a href="<%=recruitPath%>jsp/SIM_Home.jsp">SIM</a> > <a href="<%=recruitPath%>jsp/LD_ChatScore.jsp">Select Candidate</a> ></font>
	        <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Rescore Chat</font>
	            <%} %>
	        </td>
	        <td align="right" style="padding-right:10px;">
				<b><span class="recName"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
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
  <!-- ********************************************** -->
  
   <form action="<%=request.getContextPath()%>/ChatScore" method="post" id="chatscoresubmitform" name="chatscoresubmitform" method="post">
<div class="wrapper">
  <div class="contentSize">
<table width="920px" cellspacing="6" cellpadding="6" border="0">
  <tr>
   <% 
                 String firstname=null;
                 String middlename=null;  
                 String id=null;
                 String higeduc=null;
	             int Reveexp = 0;
			     int ReveexpMts=0;
			     int ReveexpYrs = 0;
				 int nonReveexp = 0;
				 int nonReveexpMts=0;
				 int nonReveexpYrs = 0;
				 int ApplyingFor=0;
                 String doe=null;
                 String imagepath=null;
                 String dobfinal=null;
                 String transcript=null; 
                 CallableStatement cs =null;
                 ResultSet rss = null;
 				
				cs = con.prepareCall("call BpoCandDtls_Encrypt_Proc(?,?,?)");
				cs.setString(1,candID);
				cs.setString(2,EDKey);
				cs.setString(3,EDKPass);
				rss = cs.executeQuery();
				
				if(rss.next())
				{
				id=rss.getString("AutoID");
				candID=rss.getString("Bpo_Cand_Id");
				firstname=rss.getString("First_Name");
				middlename=rss.getString("Middle_Name");
				higeduc=rss.getString("Qualification");
				ApplyingFor=rss.getInt("Applying_For");
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
				doe= rss.getString("system_date_time");
			    SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat dateFormat2=new SimpleDateFormat("dd-MMM-yyyy");
				Date date=dateFormat.parse(doe);
				imagepath=rss.getString("ImagePath");
			    dobfinal=dateFormat2.format(date);
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
		            	<img src="<%=recruitPath%>images/default_person.jpg" width="120px" height="90px" alt="image" />
		            </td>
            	<%}
            		else
            		{
            	%>
		   		    <td width="120px" rowspan="3" style="padding: 0px;">  
				    	<img src="<%=recruitPath%>jsp/displayImageView.jsp?CID=<%=candID%>" width="120px" height="90px" alt="image" /></td>
			   <%} %>
    <td width="250px" class="allBackColor" id="candidateid" align="left"><%=candID%>
        <input type="hidden" name="candidateid" value="<%=id %>"/>
        <input type="hidden" name="recruitername" value="<%= recruiterid%>">
        <input type="hidden" name="pagevalue" value="<%= pagevalue%>">
        <input type="hidden" name="CandidateGeneratedID" value="<%=candID%>" /></td>

    <td width="250px" class="allBackmain" align="left"><b>Highest Education</b></td>
    <td width="300px" class="allBackColor" align="left">
       <%if(higeduc.equalsIgnoreCase("0")) {%>NA
			    <%}else{ %>
		 <%=QualificationGroupName%>
			 <%} %>
    </td>
  </tr>
  <tr align="left">
	    <td class="allBackColor"><%=firstname%>&nbsp;<%=middlename %></td>
	    <td class="allBackmain"><b>Customer Interaction Experience</b></td>
	    <td class="allBackColor">
	        <%if(Reveexp==0) {%>
	      Fresher
	        <%}else { %>
	        <%=ReveexpYrs%> Years <%=ReveexpMts %> Months
	      <%} %>
	    </td>
  </tr>
  <tr align="left">
	    <td class="allBackColor"><%=ApplyingForName %></td>
	    <td class="allBackmain"><b>Other Experience</b></td>
	    <td class="allBackColor">
		    <%if(nonReveexp==0){ %>
		    Fresher
		    <%}else{ %>
		    <%=nonReveexpYrs%> Years <%=nonReveexpMts %> Months
		    <%} %>
   		</td>
  </tr>
  <tr class="allBackColor" style="display: none;">
	   <td  class="allBackmain" colspan="1"> 
		   <table width="100%" height="100%" border="0">
			   <tr>
				   <td align="center" valign="bottom" class="allBackmain" height="70px">
				   <b>Transcript</b>
				   </td>
			   </tr>
			   <tr>
				   <td class="allBackmain" align="right" valign="bottom" height="70px">
				   <b><a style="color: maroon;" onclick="showWindowScript()">Print</a></b>
				   </td>
			   </tr>
		   </table>
	    </td>
        <% 
            String sectranscript = "select transcript from mock_chat_test_attempt_master where user_id='"+id+"'";
			System.out.println("sectranscript "+sectranscript);
			Statement stmttranscript = con.createStatement();
			ResultSet rstranscript = stmttranscript.executeQuery(sectranscript);
			System.out.println("rstranscript"+rstranscript);
			
         %>
    <td colspan="3" align="left">
    <!-- <textarea style="width:100%;height:150px;font-size:13px;border:white;resize:none;background-color: #F7F7F7;font-weight: normal" readonly="readonly" id="w" class="allTdBackColor"> --> 
	<div style="width:100%;height:150px;font-size:12px;background-color: #F7F7F7; overflow-y: scroll;" class="allTdBackColor"id="transData">
	<%
			if(rstranscript.next())
			{
				transcript= rstranscript.getString("transcript");
				System.out.println("Transcript "+transcript);	
				if((transcript==null)||(transcript=="") || (transcript.length() == 0))
				{
					out.print("No Transcript available for this candidate");
				}
				else
				{
					String stringsplit[]=transcript.split("::");
                	for(int i=1;i<stringsplit.length-1;i+=2)
              		{
		              	System.out.println(i);
						if(i>1)
						{
						%>
							<br/>
						<%
						}
						if(((i+1) % 4) != 0)
						{
						%>
							<b>:: <%= stringsplit[i] %> :: </b><%=stringsplit[i+1] %>
						<%
						}
						else
						{
						%>
							<b style="color: red;">:: <%= stringsplit[i] %> :: </b><%=stringsplit[i+1] %>
						<%
						}
					}
				}
			}
		 	if (!rstranscript.next() ) 
		 	{
			    String ChatText=null;
			    String secUploadedtranscript = "SELECT ChatText FROM candidate_chattestupdate_history WHERE CandidateID='"+candID+"' ORDER BY AutoID DESC LIMIT 1";
				System.out.println("sectranscript "+sectranscript);
				Statement stmtUploadedtranscript = con.createStatement();
				ResultSet rsUploadedtranscript = stmtUploadedtranscript.executeQuery(secUploadedtranscript);
				System.out.println("rstranscript"+rstranscript);
			    if(rsUploadedtranscript.next())
			    {
				    ChatText=rsUploadedtranscript.getString("ChatText");
				    System.out.println("Chat Uploaded Text::::"+ChatText);
				    %>
				    <%= ChatText%>
				    <% 
			    }
			   // else // if (!rsUploadedtranscript.next() )
			   // {
				//	out.print("No Transcript available for this candidate vishnu");
				//}
			}
	     %>
	</div>
	    </td>
	   </tr>
<!-- ******************  Start 1 for the color codeing ********************* -->
<tr>	
	<td class="allBackmain" align="center" rowspan="2">
	   	<b>Transcript</b>&nbsp;<font color="red" size="1">*</font>
	   <br/>
	   <br/>
	   <br/>
	    <b><a style="color: maroon; font-size: 10;" onclick="showWindowScript()">View / Print</a></b>
    </td>
	<td colspan="3" class="allBackColor" style="font-size: 12px;">		
		<iframe class="allTdBackColor" style="width:100%;resize:none;height:150px;font-size:13px;border: 0px;" name="Composition" id="Composition" LANGUAGE="javascript" readonly="readonly">
		</iframe>
	</td>
</tr>
<tr>
	<td colspan="3" align="left" nowrap="nowrap" class="allBackColor">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td align="left">
					<table>
						<tr>							
							<td style="background-color: #C6B0F0;">
								<table cellpadding="3" cellspacing="3" border="0">
									<tr>
								       <td>
											<input type="button" value="Sentence Construction" id="Scon" name="Scon" style="font-size: 11;" LANGUAGE="javascript" onclick="return backColor('#C6B0F0'), countcodeNoPurple();">
								       </td>
								       <td>
					       					<input type="text" name="totalerror1" id="totalerror1" autocomplete="off" maxlength="4" value="0" style="font-size: 11; width: 30px; text-align: center;" onkeypress="return AllowNumbers(event);" onkeyup="return purpleScoreTotal();"/>
								       </td>
								       <td>
											<input type="button" value=" - " title="subtraction" id="SubPun" name="SubPun" style="font-size: 11;" LANGUAGE="javascript" onclick="return backColor('#F2F2F2'), subcountcodeNoPurple();">
								       </td>
									</tr>
								</table>
							</td>
							<td style="width: 5px;">&nbsp;</td>
							<td style="background-color: #FFBF00;">
								<table cellpadding="3" cellspacing="3" border="0">
									<tr>
								       <td>
											<input type="button" value="Punctuation" id="Punc" name="Punc" style="font-size: 11;" LANGUAGE="javascript" onclick="backColor('#FFBF00'), countcodeNoOrange();">
								       </td>
								       <td>
								       		<input type="text" name="totalerror2" id="totalerror2" autocomplete="off" maxlength="2" style="font-size: 11; width: 30px; text-align: center;" onkeypress="return AllowNumbers(event);" onkeyup="return orangeScoreTotal();"/>
								       </td>
								       <td>
											<input type="button" value="-" title="Subtraction" id="SubPun" name="SubPun" style="font-size: 11;" LANGUAGE="javascript" onclick="return backColor('#F2F2F2'), subocountcodeNoOrange();">
								       </td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
				<td align="right">
					<input type="button" id="clearAllB" name="clearAllB" value="Clear Correction" class="buttonMedium" onclick="return clearAllcolorcode_chatC();"/>
				</td>
			</tr>
		</table>
	</td>
</tr>

<tr>
       <td class="allBackmain" align="center">
          <b> Language Score </b>
          <br/>
          <b> ( Part C ) </b>
       </td>
       <td align="center"class="allBackColor" style="width: 150px;">
	       <table border="0" cellpadding="3" cellspacing="3">
		       <tr>
		       		
		       		<td style="font-size: 9px; background-color: #C6B0F0;" align="center">       			
		       			<input type="text" name="display1" id="display1" value="9" readonly="readonly" style="font-size: 10; width: 45px; text-align: center; border: none;"/>
		       		</td>
		       		<td>+</td>
		       		<td style="font-size: 9px; background-color: #FFBF00;" align="center">       			
		       			<input type="text" name="display2" id="display2" value="3" readonly="readonly" style="font-size: 10; width: 45px; text-align: center; border: none;"/>
		       		</td>
		       		<td>
		       			=
		       		</td>
		       		<td style="font-size: 12;">         
		        		<span id="langChatScore"></span>
		        		<input type="hidden" name="Chat_Score" id="Chat_Score" style="font-size: 10; width: 30px;" value="12"/>
		       		</td>
		       </tr>
	       </table>
       </td>
       <td class="allBackmain" align="center" width="200">
        	<b> Comments </b>
       </td>
       <td align="center" width="400" class="allBackColor">
       		<textarea name="chat_partC_Comments" id="chat_partC_Comments" rows="2" style="resize:none;width: 100%;" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"></textarea>
       </td>
    </tr>
<tr>
	<td colspan="4" align="left">
		<font color="red" size="1">* Please select incorrect text in the Summary and click on one of the correction options to color code the respective error/s made.</font>
	</td>
</tr>	<!-- ******************  End 1 for the color codeing ********************* -->	
	   
	     <tr>
	       <td align="left" class="allBackheading" colspan="4">Part A - Chat Etiquette</td>
	     </tr> 

	
   <tr class="allBackmain" align="left">
    <td  style="padding-left: 10px;" colspan="2"><b>Parameter</b></td>
    <td  colspan="2"><b>Score</b></td>
  </tr> 
  
   <tr align="left">
    <td class="allBackColor" colspan="2">Did the Candidate use the appropriate Opening</td>
    <td class="allTdBackColor" colspan="2">
	  <select name="appropraiteOpening" id="appropraiteOpening" style="width: 100%; height: 20px;" class="reSizeforOther" onchange="calcscore()">
	     <option value="0">Select</option>
              <%
              	String secQsnQrys = "select score,concat(score,' ',description) as scoredesc from  chat_score_pp_master where chat_pp_id='1' order by score";
				System.out.println("query "+secQsnQrys);
				Statement stmts1 = con.createStatement();
				ResultSet rss1 = stmts1.executeQuery(secQsnQrys);
				while(rss1.next())
				{%>
					<option value="<%=rss1.getString("score")%>"><%=rss1.getString("scoredesc")%></option>	
			<%	}
               %>
              
            </select>
	</td>
	</tr> 
  
   <tr align="left">
    <td class="allBackColor" colspan="2">Did the Candidate use the appropriate Closing</td>
    <td class="allTdBackColor" colspan="2">
	
	<select name="appropriateClosing" id="appropriateClosing" style="width: 100%; height: 20px;" class="reSizeforOther" onchange="calcscore()">
	   <option value="0">Select</option>
              <%
              	String secQsnQrys1 = "select score,concat(score,' ',description) as ritesh from  chat_score_pp_master where chat_pp_id='2' order by score";
				System.out.println("query "+secQsnQrys1);
				Statement stmtss1 = con.createStatement();
				ResultSet rsss1 = stmtss1.executeQuery(secQsnQrys1);
				while(rsss1.next())
				{%>
					<option value="<%=rsss1.getString("score")%>"><%=rsss1.getString("ritesh")%></option>	
			<%	}
               %>
              
            </select>
	  </td>
  </tr>
  <tr align="left">
    <td class="allBackColor" colspan="2">Did the Candidate take ownership of the situation</td>
    <td class="allTdBackColor" colspan="2">
	<select name="Candidateownership" id="Candidateownership" style="width: 100%; height: 20px;" class="reSizeforOther" onchange="calcscore()">
	   <option value="0">Select</option>
              <%
              	String secQsnQrys2 = "select score,concat(score,' ',description) as ritesh from  chat_score_pp_master where chat_pp_id='3' order by score";
				System.out.println("query "+secQsnQrys2);
				Statement stmts2 = con.createStatement();
				ResultSet rss2 = stmts2.executeQuery(secQsnQrys2);
				while(rss2.next())
				{%>
					<option value="<%=rss2.getString("score")%>"><%=rss2.getString("ritesh")%></option>	
			<%	}
               %>
               </select>
	  </td>
  </tr>
  
  <tr align="left">
    <td class="allBackColor" colspan="2">Did the Candidate ask for additional assistance before closing</td>
    <td class="allTdBackColor" colspan="2">
	<select name="candidateAssistance" id="candidateAssistance" style="width: 100%; height: 20px;" class="reSizeforOther" onchange="calcscore()">
	   <option value="0">Select</option>
              <%
              	String secQsnQrys3 = "select score,concat(score,' ',description) as ritesh from  chat_score_pp_master where chat_pp_id='4' order by score";
				System.out.println("query "+secQsnQrys3);
				Statement stmts3 = con.createStatement();
				ResultSet rss3 = stmts3.executeQuery(secQsnQrys3);
				while(rss3.next())
				{%>
					<option value="<%=rss3.getString("score")%>"><%=rss3.getString("ritesh")%></option>	
			<%	}
               %>
               </select>
	</td>
  </tr>

 <tr>
   <td align="left" class="allBackheading" colspan="4">Part B - Customer Service</td>
    </tr>

  <tr class="allBackmain" align="left">
   <td  style="padding-left: 10px;" colspan="2"><b>Parameter</b></td>
    <td colspan="2"><b>Score</b></td>
 </tr>
  <tr align="left">
   <td class="allBackColor" colspan="2">Was the Candidate Courteous/Polite</td>
    <td class="allTdBackColor" colspan="2">
	<select name="candidatepolite" id="candidatepolite" style="width: 100%; height: 20px;" class="reSizeforOther" onchange="calcscore()">
	  <option value="0">Select</option>
              <%
              	String secQsnQrys4 = "select score,concat(score,' ',description) as ritesh from  chat_score_pp_master where chat_pp_id='5' order by score";
				System.out.println("query "+secQsnQrys4);
				Statement stmts4 = con.createStatement();
				ResultSet rss4 = stmts4.executeQuery(secQsnQrys4);
				while(rss4.next())
				{%>
					<option value="<%=rss4.getString("score")%>"><%=rss4.getString("ritesh")%></option>	
			<%	}
               %>
        </select>
	</td>
</tr>
  <tr align="left">
   <td class="allBackColor" colspan="2">Did the Candidate Empathize/Showed concern</td>
    <td class="allTdBackColor" colspan="2">
    <select name="candidateEmpathize" id="candidateEmpathize" style="width: 100%; height: 20px;" class="reSizeforOther" onchange="calcscore()">
	   <option value="0">Select</option>
              <%
              	String secQsnQrys5 = "select score,concat(score,' ',description) as ritesh from  chat_score_pp_master where chat_pp_id='6' order by score";
				System.out.println("query "+secQsnQrys5);
				Statement stmts5 = con.createStatement();
				ResultSet rss5 = stmts5.executeQuery(secQsnQrys5);
				while(rss5.next())
				{%>
					<option value="<%=rss5.getString("score")%>"><%=rss5.getString("ritesh")%></option>	
			<%	}
               %>
        </select>
	</td>
   </tr>
  <tr align="left">
   <td class="allBackColor" colspan="2">Did the Candidate Comprehend the customer questions and statements </td>
    <td class="allTdBackColor" colspan="2">
	<select name="candidateComprehend" id="candidateComprehend" style="width: 100%; height: 20px;" class="reSizeforOther" onchange="calcscore()">
	<option value="0">Select</option>
              <%
              	String secQsnQrys6 = "select score,concat(score,' ',description) as ritesh from  chat_score_pp_master where chat_pp_id='7' order by score";
				System.out.println("query "+secQsnQrys6);
				Statement stmts6 = con.createStatement();
				ResultSet rss6 = stmts6.executeQuery(secQsnQrys6);
				while(rss6.next())
				{%>
					<option value="<%=rss6.getString("score")%>"><%=rss6.getString("ritesh")%></option>	
			<%	}
               %>
        </select>
	</td>
  </tr>
  <tr align="left">
   <td class="allBackColor" colspan="2">Was the Candidate clear and concise with his explanations</td>
    <td class="allTdBackColor" colspan="2">
		<select name="candidateconcise" id="candidateconcise" style="width: 100%; height: 20px;" class="reSizeforOther" onchange="calcscore()">
	  <option value="0">Select</option>
              <%
              	String secQsnQrys7 = "select score,concat(score,' ',description) as ritesh from  chat_score_pp_master where chat_pp_id='8' order by score";
				System.out.println("query "+secQsnQrys7);
				stmts7 = con.createStatement();
				rss7 = stmts7.executeQuery(secQsnQrys7);
				while(rss7.next())
				{%>
					<option value="<%=rss7.getString("score")%>"><%=rss7.getString("ritesh")%></option>	
			<%	}
               %>
        </select>
	</td>
  </tr>
          <tr>
			 <td  class="allBackmain" align="center"  colspan="1"><b>Comments</b></td>
			 <td  class="allTdBackColor"  colspan="3" align="left">
               <textarea name="comments" id="comments" style="width:100%;" rows="4" class="resizetextarea" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"></textarea>
            </td>
         </tr>
	     <tr>
	        <td  class="allBackmain" nowrap="nowrap" colspan="1" align="center">
	        	<b>TOTAL SCORE</b>
	        </td>
		    <td  class="allBackColor" align="center" colspan="2">
				<b>
					<input type="text" id="display" name="display" value="12" readonly="readonly" style="background: #F2F2F2;border-left: #F2F2F2;border-top: #F2F2F2;border-bottom: #F2F2F2;border-right: #F2F2F2;text-align: center"/>
					<input type="hidden" name="dis" id="dis" value="0">
					<input type="hidden" name="dis1" id="dis1" value="0">
					<input type="hidden" name="dis2" id="dis2" value="0">
				</b>
		   	</td>
		<td colspan="1">
		<table border="0" width="100%">
		<tr>
		  <td align="center">
	       <input name="Clear" type="reset" value="Clear" id="Clear" class="buttonSmall"/>
         </td>
      <td align="center">
	  <input name="Submit" type="submit" value="Submit" id="Submit" class="buttonSmall" onClick="return CheckValidation(this.form);" />
		 <span id="processing" style="display:none;"><b><font color="#000033" style="font-size: 12px;font-family: Arial,Helvetica,sans-serif;" class="taL" >Processing, please wait...</font></b></span>
		 </td>
		    </tr>
		    </table>
		    </td>
		    </tr>
		   <%   
		        
					rss7.close();
					stmts7.close();
					rss6.close();
					stmts6.close();
					rss5.close();
					stmts5.close();
					rss4.close();
					stmts4.close();
					rss3.close();
					stmts3.close();
					rss2.close();
					stmts2.close();
					rsss1.close();
					stmtss1.close();
					rss1.close();
					stmts1.close();
					rstranscript.close();
					stmttranscript.close();
					rss.close();
					// stmts.close();
				    con.close();
				}
				catch(Exception ex)
				{
					System.out.println("========="+ex.getMessage());
					ex.printStackTrace();
				}
				
				%>
  </table>
  </div>
  </div>
  
  	<textarea style="width:0;height:0; display: none;" id="Chat_texaHTML" name="Chat_texaHTML"></textarea>
 
	<script LANGUAGE="Javascript" SRC="<%=request.getContextPath()%>/247Recruit/js/compose.js?169"></script>

 
  </form>
  
  <!-- ************************* -->
  	        </td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;">.</td>
	    </tr>
	    <tr class="footerBackColor">
	        <td align="left" valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="1">
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
<script  LANGUAGE="javascript">


function getScript()
{
	document.getElementById("totalerror1").value = 0;
	document.getElementById("totalerror2").value = 0;

	document.getElementById("display1").value = 9;
	document.getElementById("display2").value = 3;
	document.getElementById("langChatScore").innerHTML = 12;


	bodyTag = ( document.getElementById("Composition").innerHTML = document.getElementById("transData").innerHTML);
	Composition.document.open();
	Composition.document.write(bodyTag);
	Composition.document.body.style.fontSize = "10pt";
	Composition.document.body.style.fontFamily = "Arial";
	Composition.document.body.style.bgColor = "#F7F7F7";
	Composition.document.body.text = '#000000';
	Composition.document.close();
	Composition.document.designMode="On";
}
</script> 

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
