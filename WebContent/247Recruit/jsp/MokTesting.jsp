<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ include file="GlobalDeclare.jsp" %>

<%
	try
	{
	String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
	PreparedStatement oPst, pst, stp=null;
	int USER_AUTOID = (Integer) session.getAttribute("USER_AUTOID");
	System.out.println("USER_AUTOID::========::"+USER_AUTOID);
	if(USER_AUTOID==0)
	{
		response.sendRedirect(request.getContextPath()+"/jsp/Login.jsp");
	}
	Connection con = ConnectDatabase.getConnection();
	String scritptypeId=(String)session.getAttribute("ScriptType");
	System.out.println("scritptypeId \t"+scritptypeId);
	if(scritptypeId==null)
	{
		response.sendRedirect(request.getContextPath()+"/jsp/Login.jsp");
	}
	String hidMins, hidSecs;
	hidMins="0";
	hidSecs="0";

	Connection con_TDuration = null;
	Statement st_TDuration = null;
	ResultSet rs_TDuration = null;
	String time_in_min = "";
	String time_in_sec = "";
	try
	{
		String time_duration = "SELECT Time_limit_min,Time_limit_sec FROM test_master WHERE Test_id = 6";
		con_TDuration = ConnectDatabase.getConnection();
		st_TDuration = con_TDuration.createStatement();
		rs_TDuration = st_TDuration.executeQuery(time_duration);
		if(rs_TDuration.next())
		{
			time_in_min = rs_TDuration.getString("Time_limit_min");
			time_in_sec = rs_TDuration.getString("Time_limit_sec");
			System.out.println("time_in_min "+time_in_min+"\t"+time_in_sec);
			
		}
		rs_TDuration.close();
		st_TDuration.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}

%>
<html>
	<head>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/careers.css" />
		<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/NoBack.js"></script>
		<script language="javascript" src="<%=recruitPath%>js/shortcut.js"></script>
		<!-- Back button jquery -->
		<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/jquery-1.2.6.js"></script>
		
		<!-- POP UP JQUERY -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/text.css" media="all" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/styles.css" media="all" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/colorbox.css" media="all" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/popjsfile.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/loginpopup.js"></script>
		<!-- END POP UP JQUERY -->
	

<style>
.theader
{
	background: url("<%=request.getContextPath() %>/247Recruit/images/header_BG.jpg") repeat-x scroll 0 0 transparent;color: #FFFFFF;
}
	
	.msgClass{
    color: #FFFFFF;
    direction: ltr;
    font-family: 'lucida grande',tahoma,verdana,arial,sans-serif;
    font-size: 12px;
    line-height: 1.50;
    padding-right:15px; 
    font-weight: bold;
   
}

	.msgClasstimeUp{
    color: #FFFFFF;
    direction: ltr;
    font-family: 'lucida grande',tahoma,verdana,arial,sans-serif;
    font-size: 12px;
    font-weight:500;
    line-height: 1.50;
    padding-right:20px;
	font-weight: bold;
}

#facemodal .face-box-white .close
{
	background:url("<%=request.getContextPath()%>/247Recruit/images/delO.png") no-repeat scroll 0 0 transparent;    
	cursor:pointer;
	float:right;
	position:absolute;
	right:1px;
	width: 20px;
	height: 20px;
} 
</style>

		
<!--  ********************************   AJAX FOR QUESTION ******************************** -->
<script type="text/javascript">
var QsAsked = 1;
var photoNotTaken = true;
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

function callAjaxForQues(QId)	
{	
	//alert('Inside');	
    var url="<%=request.getContextPath()%>/247Recruit/jsp/MockQuestion.jsp";
    
	url=url+"?sid="+Math.random();
	url=url+"&quesId="+QId; 
      
    var request = GetXmlHttpObject();
    if (request==null)
    {
 		 alert("Your browser does not support AJAX!");
		 return false;
	}
	request.onreadystatechange = function () 
	{		
		chargeCodeSelected(request);
	};
	request.open("POST", url, true);
	request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	request.send(null);
}

function chargeCodeSelected(request)
{
	var quesData = request.responseText;
	if(request.readyState==4 && request.status==200)
	{
		document.getElementById('hidQ'+QsAsked).value = quesData;
		document.getElementById('chatwindow').innerHTML = document.getElementById('chatwindow').innerHTML + '<p><b>:: Customer :: </b>' + document.getElementById('hidQ'+QsAsked).value + '</p>';
		document.getElementById('CHAT2').value = '';
		document.getElementById('CHAT2').focus();
	}
}
function counter()
{
	document.getElementById('hidA'+QsAsked).value = document.getElementById('CHAT2').value;
	document.getElementById('chatwindow').innerHTML = document.getElementById('chatwindow').innerHTML + '<p style="color: red;"><b>:: <%=USER_Name %> :: </b>' + document.getElementById('CHAT2').value + '</p>';
	QsAsked = QsAsked + 1;
	var TotQs = document.getElementById('hidQCt').value;
	if(QsAsked > TotQs)
	{
		document.getElementById('CHAT2').style.display = 'none';
		document.getElementById('submit').style.display = 'none';
		document.getElementById('finish').style.display = '';
		showDivText();
	}
	else
	{
		var QId = document.getElementById('hidQ'+QsAsked).value;
		callAjaxForQues(QId);
	}
}
</script>
		 
<!--  Timer script -->
<script type="text/javascript">
window.onload = init;
		function init() 
		{
		  mockTest();
		  noCpyPstTimer();
		}
</script>		 


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
			top.window.location.href = '<%=request.getContextPath()%>/jsp/Login.jsp';
			lastjavascripthash=location.hash;
		}
	}, 300);
});
</script>
<script>
function myFunction()
{
	var vcv = setInterval(function()
	{ 
		document.getElementById('closeblock').click();
		clearInterval(vcv);
	},5000);
	return false;
}
function myFunctionTimeUp()
{
	setInterval(function()
	{ 
		document.getElementById('closeblocktimeUp').click();
		submitform();
	},5000);
	return false;
}
</script>
<script language="javascript">
var msg = "Sorry, this functionality is disabled.";
shortcut.add("F5",function()
{
	document.getElementById('loginblock').click();
	document.getElementById('dispMSG').innerHTML = msg;
	document.getElementById('closeblock').focus();
	//myFunction();
	return false;
});
	
shortcut.add("Alt+Left",function()
{
	document.getElementById('loginblock').click();
	document.getElementById('dispMSG').innerHTML = msg;
	document.getElementById('closeblock').focus();
	myFunction();
	return false;
});

shortcut.add("f12",function()
{
	document.getElementById('loginblock').click();
	document.getElementById('dispMSG').innerHTML = msg;
	document.getElementById('closeblock').focus();
	myFunction();
	return false;
});

shortcut.add("backspace",function()
{
	document.getElementById('loginblock').click();
	document.getElementById('dispMSG').innerHTML = msg;
	document.getElementById('closeblock').focus();
	myFunction();
	return false;
});
</script>

<script type="text/javascript">
function nocopypaste(e)
{
	var code = (document.all) ? event.keyCode:e.which;
	var msg = "Sorry, this functionality is disabled.";
	if (parseInt(code)==17) //CTRL
	{
		document.getElementById('loginblock').click();
		document.getElementById('dispMSG').innerHTML = msg;
		document.getElementById('closeblock').focus();
		myFunction();
		return false;
	}
}
</script>

<script type="text/javascript"> 
<!-- 
//Disable right click script 
//visit http://www.rainbow.arch.scriptmania.com/scripts/ 
var msg = "Sorry, this functionality is disabled.";
function clickIE() 
{
	if (document.all) 
	{
		document.getElementById('loginblock').click();
		document.getElementById('dispMSG').innerHTML = msg;
		document.getElementById('closeblock').focus();
		myFunction();
		return false;
	}
} 
function clickNS(e) 
{
	if(document.layers||(document.getElementById&&!document.all)) 
	{ 
		if(e.which==2||e.which==3) 
		{
			document.getElementById('loginblock').click();
			document.getElementById('dispMSG').innerHTML = msg;
			document.getElementById('closeblock').focus();
			myFunction();
			return false;
		}
	}
} 
if(document.layers) 
{
	document.captureEvents(Event.MOUSEDOWN);
	document.onmousedown=clickNS;
} 
else
{
	document.onmouseup=clickNS;
	document.oncontextmenu=clickIE;
} 
document.oncontextmenu=new Function("return false"); 
// --> 
</script> 
	
		 
<script LANGUAGE="JavaScript">  
		var mins
		var secs;

		function mockTest() {
		 	mins = 1 * m("<%=time_in_min%>"); // change minutes here
		 	secs = 0 + s(":<%=time_in_sec%>"); // change seconds here (always add an additional second to your total)
		 	redo();
		}
		function m(obj) {
		 	for(var i = 0; i < obj.length; i++) {
		  		if(obj.substring(i, i + 1) == ":")
		  		break;
		 	}
		 	return(obj.substring(0, i));
		}
		
		function s(obj) {
		 	for(var i = 0; i < obj.length; i++) {
		  		if(obj.substring(i, i + 1) == ":")
		  		break;
		 	}
		 	return(obj.substring(i + 1, obj.length));
		}
		
		function dis(mins,secs) {
		 	var disp;
		 	if(mins <= 9) {
		  		disp = " 0";
		 	} else {
		  		disp = " ";
		 	}
		 	disp += mins + ":";
		 	if(secs <= 9) {
		  		disp += "0" + secs;
		 	} else {
		  		disp += secs;
		 	}
		 	return(disp);
		}
		
		function redo() {
	 	secs--;
	 	if(secs == -1) {
	  		secs = 59;
	  		mins--;
	 	}
	 	document.chatDump.disp.value = dis(mins,secs); // setup additional displays here.
	 	
	 	if((mins == 0) && (secs == 0)) 
	 	{	
	 		showDivText();
	 		document.getElementById("CHAT2").style.display="none";
			document.getElementById("submit").style.display="none";
			document.getElementById("finish").style.display="";			
			window.alert("Time is up. Press ok."); // change timeout message as required
	  		<% if(session.getAttribute("ip") != null){%>
           		if(photoNotTaken)
           		{
	           		validateText12();
           			photoNotTaken = false;
           		}
           <%}%>
	    	document.getElementById("finish").click();
	    	document.getElementById("finish").style.display="none";
			document.getElementById("processing").style.display="";
	 	} else {
	 		mockTest = setTimeout("redo()",1000);
	 	} 
		}
</script>
<script type="text/javascript">

function onFocusInput()
{
 	shortcut.remove("backspace",function()
 	{
 		return true;
 	});
}
function onBlurInput()
{
	shortcut.add("backspace",function()
	{
		document.getElementById('loginblock').click();
		document.getElementById('dispMSG').innerHTML = msg;
		myFunction();
		return false;
	});
}
</script>
<!-- Enter Key Validation Script-->
<script type="text/javascript">
function isEnterKey(evt) 
{
	var charCode = (evt.which) ? evt.which : event.keyCode;
	if (charCode == 13) {
	document.getElementById("submit").click();
	return false;
	}
	return true;
}
</script>
<script type="text/javascript">
	function validateText12()
	{
		parent.parent.related.document.getElementById("test_flag").value="5";
		parent.parent.related.webcam.capture();
	}
</script>
		
<!-- No copy paste attribute create  -->
	<script language="JavaScript" type="text/javascript">  
		var mins1
		var secs1;
		function noCpyPstTimer()
		 {
			mins1 = 1 * m("50"); // change minutes here
		 	secs1 = 0 + s("00"); // change seconds here (always add an additional second to your total)
		 	ms = 0 + ms(":00");//change millisecons here
		 	redoChk();
		}
		function m(obj) {
		 	for(var i = 0; i < obj.length; i++) {
		  		if(obj.substring(i, i + 1) == ":")
		  		break;
		 	}
		 	return(obj.substring(0, i));
		}
		function s(obj) {
		 	for(var i = 0; i < obj.length; i++) {
		  		if(obj.substring(i, i + 1) == ":")
		  		break;
		 	}
		 	return(obj.substring(i + 1, obj.length));
		}
		function ms(obj)
		 {
		    for(var i = 0; i < obj.length; i++) {
		        if(obj.substring(i, i + 1) == ":")
		        break;
		    }
		    return(obj.substring(i + 1, obj.length));
		}
		
		function dis1(mins1,secs1) {
		 	var disp1;
		 	if(mins1 <= 9) {
		  		disp1 = " 0";
		 	} else {
		  		disp1 = " ";
		 	}
		 	disp1 += mins1 + ":";
		 	if(secs1 <= 9) {
		  		disp1 += "0" + secs1;
		 	} else {
		  		disp1 += secs1;
		 	}
		 	if(ms <= 9)
		 	 {
		        disp1 += "0" + ms;
		    } else {
		        disp1 += ms;
		    }
		 	
		 	return(disp1);
		}
		function redoChk()
		 {
	 	 	ms--;
			onCpyPstChk(ms);
	    if(ms == -1)
	     {
	        ms = 99;
	        secs1--;
	     }
	    if(secs1 == -1) {
	        secs1 = 59;
	        mins1--;
	    }	
	 	if((mins1 == 0) && (secs1 == 0)&& (ms == 0)) 
	 	{
			
	 	} else 
	 	{
	 		noCpyPstTimer = setTimeout("redoChk()",1);
	 	} 
		}
</script>
<script type="text/javascript">
function onFocusMocktest()
{
	var txtInpPartC = document.getElementById('CHAT2');
	txtInpPartC.setAttribute('onpaste', 'return false');
	txtInpPartC.setAttribute('oncopy', 'return false');	
	txtInpPartC.setAttribute('oncut', 'return false');
	txtInpPartC.setAttribute('onfocus', 'onFocusMocktest(),onFocusInput()');
}
function onBlurMocktest()
{
	var txtInpPartC = document.getElementById('CHAT2');
	txtInpPartC.setAttribute('onpaste', 'return false');
	txtInpPartC.setAttribute('oncopy', 'return false');	
	txtInpPartC.setAttribute('oncut', 'return false');
	txtInpPartC.setAttribute('onblur', 'onBlurMocktest(), onBlurInput()');
}

function onCpyPstChk()
{
	var txtpassage = document.getElementById('CHAT2');
	txtpassage.setAttribute('id', 'CHAT2');
	txtpassage.setAttribute('name', 'CHAT2');
	txtpassage.setAttribute('onpaste', 'return false');
	txtpassage.setAttribute('oncopy', 'return false');	
	txtpassage.setAttribute('oncut', 'return false');
	txtpassage.setAttribute('style', 'color: red; font-size: 10px;  width: 688px; overflow: auto; background-color:#FFFFFF; border:1px solid #9BB168; font-family:Verdana,Arial,sans-serif; color:#000000; height:50px;resize:none;padding: 4px;');
	txtpassage.setAttribute('onfocus', 'onFocusMocktest(),onFocusInput()');
	txtpassage.setAttribute('onblur', 'onBlurMocktest(), onBlurInput()');
}
</script>
		
<script type="text/javascript">
	function textvalidate()
	{
		var textval = document.getElementById("CHAT2").value;
		if(textval==null || textval=='' || textval==0)
		{
			document.getElementById('loginblock').click();
			document.getElementById('dispMSG').innerHTML = 'Please enter some text';
			document.getElementById('closeblock').focus();
			myFunction();
			document.getElementById('CHAT2').focus();
			return false;
		}
		else
		{
			counter();
		}
	}
</script>

<script type="text/javascript">
	function focusset()
	{	
		document.getElementById('chatwindow').scrollTop = 9999999;	
		document.chatDump.CHAT2.focus();
	}
</script>

<script type="text/javascript">
function showDivText()
{
 // alert('Inside');
  divObj = document.getElementById("chatwindow");  
  if ( divObj )
  {
  	transcrpt=divObj.textContent;  
  	if (transcrpt)
  	{ // FF
      document.getElementById("transcriptdump").value=transcrpt;
    }
    else
    {
      // IE
      document.getElementById("transcriptdump").value=transcrpt;
      transcrpt=divObj.innerText;
    }
   }
  
} 
</script>
<script type="text/javascript">

function subTakePic()
{
	document.getElementById("finish").style.display="none";
	document.getElementById("processing").style.display=""; 
	<% if(session.getAttribute("ip") != null){%>
			if(photoNotTaken)
			{
				validateText12();
				photoNotTaken = false;
			}
	<%}%>
}
</script>

	</head>
	<body ondragstart="return false" onselectstart="return false" onKeyDown="return nocopypaste(event)">
		
		<%
			String AutoScriptId=null; 
			int mokchatscriptid=0;
			try
			{
				
		    	String mokscriptrandomid="SELECT chat_script_id FROM mock_chat_script_master where chat_type_id="+scritptypeId+" or chat_type_id='0' and  is_active=1 AND is_deleted = 0 ORDER BY RAND() LIMIT 1";
				System.out.println("Query for mokscriptrandomid \t"+mokscriptrandomid);
				Statement stmtmokrandomid = con.createStatement();
				ResultSet rsmokchatrandomid = stmtmokrandomid.executeQuery(mokscriptrandomid);
				
				if(rsmokchatrandomid.next())
				{
					mokchatscriptid =rsmokchatrandomid.getInt("chat_script_id");
					System.out.println("MockChat Script Randomid ::"+mokchatscriptid+"\t:");
				}
				
				session.setAttribute("SCRIPT_ID_QUES",mokchatscriptid);
			
				oPst = con.prepareStatement("INSERT INTO mock_chat_test_attempt_master(USER_ID,START_DATE_ACTIVE,Chat_Script_Id) VALUES("+USER_AUTOID+",NOW(),"+mokchatscriptid+")");	
				
				oPst.executeUpdate();
				System.out.println("INSERTED INTO mock_chat_test_attempt_master");
				
				
				
				String GetMasterID="SELECT Chat_Test_Attempt_Id, User_Id FROM mock_chat_test_attempt_master where User_id="+USER_AUTOID+" and Chat_Script_Id = "+mokchatscriptid+""; 
				// System.out.println("GetMasterID \t"+GetMasterID);
				Statement stmt=con.createStatement();
				ResultSet rsScriptId=stmt.executeQuery(GetMasterID);
				if(rsScriptId.next())
				{
					AutoScriptId=rsScriptId.getString("Chat_Test_Attempt_Id");
					System.out.println(" AutoScriptId  \t"+AutoScriptId);
				}
				rsScriptId.close();
				
			}
			catch(Exception e)
			{
			
			}
		%>
		
		<table border="0" width="100%">
			<tr>
				<td align="left" style="padding-left:10px;">
					<font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Post Registration > Chat Process Tests  ></font>
					<font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Mock Chat Test</font>
				</td>
				<td align="right" style="padding-right:10px;">
					<b><span class="recName"><%=USER_Name%></span></b>
				</td>
			</tr>
		</table>
		<br/>
		<div style="height: 10px;">
		</div>
		<div class="wrapper">
			<div class="inner-content">
				<div class="invalid-log-alert"></div>
				<form id="chatDump" name="chatDump" method="post" action="<%=request.getContextPath()%>/MockServlet">
					<table style="width:700px;">
						<tr>
							<th colspan="4" width="1" height="32" class="theader"><div style="float:left;padding-left: 5px;">
								Mok Chat Test Assessment  </div><div style="float:right;"><div style="float:right;">Time Remaining <input type="text" name="disp" id="disp" readonly="readonly" size="5" style="border: 0px ; color: white; font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight: bold;background-color: #666666;"/> </div></div>
							</th>
						</tr>
					</table>
					<div class="forms">
						<input type="hidden" name="transcriptdump" id="transcriptdump"/>
						<input type="hidden" name="AutoScriptID" value="<%=AutoScriptId%>"/>
						<table border="0">
							<tr>
								<td colspan="4">
								<%
								int iCt = 0;
								String strQ1 = "";
								try
								{
									String queryGetQs = "SELECT Chat_Question_Id,Chat_Question FROM mock_chat_scripts WHERE Chat_Script_Id="+mokchatscriptid+" AND is_Active = 1 AND is_deleted = 0 ORDER BY chat_question_id";
									System.out.println("queryGetQs \t"+queryGetQs);
									Statement st = con.createStatement();								
									ResultSet rs=st.executeQuery(queryGetQs);
									while(rs.next())
									{
										if(iCt==0)
										{
											strQ1 = rs.getString("Chat_Question");
										}					
										iCt = iCt + 1;
										if(iCt==1)
										{
								%>
								<input type="hidden" name="hidQ" id="hidQ<%=iCt%>" value="<%=strQ1%>" />
								<input type="hidden" name="hidQID" id="hidQID<%=iCt%>" value="<%=rs.getString("Chat_Question_Id")%>" />
								
								<%
										}
										else
										{
								%>
								<input type="hidden" name="hidQ" id="hidQ<%=iCt%>" value="<%=rs.getString("Chat_Question_Id")%>" />
								<input type="hidden" name="hidQID" id="hidQID<%=iCt%>" value="<%=rs.getString("Chat_Question_Id")%>" />
								
								<%
										}			
								%>
								<input type="hidden" name="hidA" id="hidA<%=iCt%>" value="" />
								<%
									}
									rs.close();
								}
								catch(Exception e)
								{
									e.printStackTrace();
								}
								%>  
								<input type="hidden" name="hidQCt" id="hidQCt" value="<%=iCt%>" />
									<div class="quest_input_new" id="chatwindow">
										<p>											
											<b>:: Customer :: </b><%=strQ1%>
										</p>
									</div>
								</td>
							</tr>
						</table>
					</div>
				
					<%
							hidMins=(String) request.getParameter("hidMin");
							hidSecs=(String) request.getParameter("hidSec");
					 %>
					<input type="hidden" name="hidMin" id="hidMin" value="<%=hidMins%>" />
  					<input type="hidden" name="hidSec" id="hidSec" value="<%=hidSecs%>" />
					<table>
						<tr>
							<td colspan="4">
								<div>
									<textarea onblur="onBlurMocktest(), onBlurInput()" onfocus="onFocusMocktest(),onFocusInput();" id="CHAT2" style="color: red; font-size: 10px;  width: 688px; overflow: auto; background-color:#FFFFFF; border:1px solid #9BB168; font-family:Verdana,Arial,sans-serif; color:#000000; height:50px;resize:none;padding: 4px;" name="CHAT2"  onkeypress="return isEnterKey(event);" oncopy="return false" onpaste="return false" oncut="return false"></textarea>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div style="float: right;">
									<input type="button" value="Send" id="submit" class="buttonSmall" name="submit" onclick="return textvalidate(), focusset()"/>
									<input type="submit" value="Finish" id="finish" class="buttonSmall" name="finish" onclick="subTakePic();" style="display: none;" />
									<span class="register" id="processing" style="display:none;"><b><font color="#000033" class="taL" colspan="2" style="font-size: 13px;">Processing, please wait...</font></b></span>								
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>		
		</div>
<div class="wrapperpopUP">
	<div style="display: none;">  
		<input type="button" id="loginblock" value="pop-up"/>	
	</div>
	<div class="container_16">
		<div id="facemodal" style="display:none"> 
			<div class="face-box-white borderradius5">		
			<table style="width:450px; height:100px;" border="0" cellspacing="2" cellpadding="2">
			  <tr>
					<td align="right"> 
						<a class="close" id="closeblockokbtn"></a>
					</td>
			  </tr>
			  <tr>
					<td align="center" style="padding-bottom:10px;">
						<span id="dispMSG" class="msgClass"></span>
						<br/>
						<br/>
						<input type="button" id="closeblock" value=" Ok " style="font-weight: bold;"/>
					</td>	  		
			  </tr>
			</table>
			</div>
		</div>	
	</div>
</div>

<div class="wrapperpopUPtimeUp">
	<div style="display: none;">  
		<input type="button" id="loginblocktimeUp" value="pop-up"/>
		<input type="button" id="closeblocktimeUp" value="Close-up"/>
	</div>
	<div class="container_16timeUp">
		<div id="facemodaltimeUp" style="display:none"> 
			<div class="face-box-whitetimeUp">		
			<table style="width:450px; height:100px;" border="0" cellspacing="2" cellpadding="2">
			 <tr>
					<td align="center" style="padding-left:20px; padding-top:20px;">
						<span id="dispMSGtimeUp" class="msgClasstimeUp"></span>
					</td>
			</tr>
			<tr>
					<td align="center" style="padding-bottom:10px;"> 
						<input type="button" id="timeUpbtn" value=" Ok " onclick="submitform();" style="font-weight: bold;"/>
					</td>
			  </tr>
			</table>
			</div>
		</div>	
	</div>
</div>
<div id="fade" style="display:none;"></div> 		
	</body>
	<%
	}
	catch(Exception e)
	{
		System.out.println(e.getMessage());
		e.printStackTrace();
	}
	 %>
</html>