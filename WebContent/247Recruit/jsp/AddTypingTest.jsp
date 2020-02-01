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
	String username = ((String) session.getAttribute("RecUserName")).trim();
	System.out.println("username===" + username);
	String candID = (String) request.getParameter("candidateid");
	System.out.println("candID===" + candID);
	String pagevalue = (String) session.getAttribute("VoicePageVal");
	System.out.println("Voice Score pagevalue===" + pagevalue);
	if (username == null) {
		response.sendRedirect("../../jsp/Login.jsp");
	}
	String RecEmployeeId=((String)session.getAttribute("RecEmployeeId")).trim();
	if(RecEmployeeId==null)
    {
    response.sendRedirect("../247Recruit/jsp/Login.jsp");
    }
    System.out.println("RecEmployeeId==="+RecEmployeeId);
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
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
	  	{
			 var data = xmlhttp.responseText;
			 idata=data.split(",");
			 for(var i=0;i<idata.length-1;i++)
			 {
			    document.getElementById('desiredscore1').value= idata[0].trim();	
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
			if(document.getElementById("programname").value =='')
			{
				var appStr = 'Please Select The Program!!!';
				alert(appStr);
				document.getElementById('programname').focus();
				return false;	
			}
			else	
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
			else
			if (( voicescoresubmitform.select[0].checked == false ) && ( voicescoresubmitform.select[1].checked == false )&&( voicescoresubmitform.select[2].checked == false ) ) 
			{ 
				 alert ( "Please choose the status(Select/Hold/Reject)" );
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
					String secqryrecruiter = "SELECT Emp_Name,Emp_ID FROM user_master where Emp_ID='"+ RecEmployeeId + "'";
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
	        <td align="left" style="padding-left:10px;">
	        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;">
	            <a href="<%=recruitPath%>jsp/Recruiter_Home_Page.jsp">Home > </a>
	             
	            </font>
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;">
	            <a href="<%=recruitPath%>jsp/Admin_Home_Page.jsp">Administration > </a>
	             
	            </font>
	            <font class="nonLink">Manage Typing Test</font>
	        </td>
	        <td align="right" style="padding-right:10px;">
				<b><span class="recName"><%=username%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>
	    </tr>
			<tr>
				<td colspan="2" align="center">
                    

<br/>
					<!--********************************* -->

 <div class="wrapper">
  <div class="contentSize">
     <form action="<%=request.getContextPath()%>/VoiceScore" method="post" id="voicescoresubmitform" name="voicescoresubmitform" method="post" onsubmit="return CheckValidation();" accept-charset="utf-8">
		<table width="920px" cellspacing="6" cellpadding="6" border="0">
			<tr class="allBackheading" align="left">
					<td align="left"  colspan="4">
						Typing Test Passage
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
					<td id="totalscore" class="allBackColor" align="center">
						<b> <input type="text" id="display" name="display" readonly="readonly" style="background: #F2F2F2; border-left: #F2F2F2; border-top: #F2F2F2; border-bottom: #F2F2F2; border-right: #F2F2F2; text-align: center" />
						</b>
					</td>
					<td  colspan="1" align="left" nowrap="nowrap" style="font-family: Arial;font-size: 12px;color: #41383C;">
						<INPUT TYPE="RADIO" NAME="select" VALUE="1" id="select">
						Select
					   <INPUT TYPE="RADIO" NAME="select" VALUE="2" id="select">
						Hold
					   <INPUT TYPE="RADIO" NAME="select" VALUE="3" id="select">
						Reject
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
		</form>
			<%
					
					
					rssrec.close();
                    stmtsrec.close();
					con.close();
				} catch (Exception ex) {
					System.out.println("=========" + ex.getMessage());
					ex.printStackTrace();
				}
			%>
     
   </div>
</div>
		<!--********************************* -->
               </td>
			</tr>
			<tr>
				<td colspan="2" style="height: 10px;"></td>
			</tr>
			<tr class="footerBackColor">
				<td align="left" style="background-color: #666666; color: #FFFFFF; font-weight: bold; height: 21px; font-size: 9px; font-family: Arial; padding-left: 5px;" colspan="1">
					&copy; 2012. [24]7. ALL RIGHTS RESERVED.
				</td>
              <td align="right" valign="middle" style="background-color:#666666;height:21px; padding-right:5px;">
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
</body>
</html>
