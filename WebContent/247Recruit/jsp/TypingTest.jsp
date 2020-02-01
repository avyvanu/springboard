<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.ArrayList"%>
<%@page import="beans.TypingTestDTO"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String chkURI=request.getHeader("Referer");
	System.out.println("Display URI\t"+chkURI);
	if(chkURI==null)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	}
	else
	{
		chkURI = chkURI.toLowerCase();
		System.out.println("Check\t"+chkURI.indexOf(request.getContextPath().toLowerCase()));
		if(chkURI.indexOf(request.getContextPath().toLowerCase()) < 1)
		{
			response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		}
		//String chkSource=request.getContextPath()+" ---------- "+request.getContextPath().+" ---------- "+request.getPathTranslated()+" ---------- "+request.getRequestURI()+" ---------- "+request.getRequestURL();
		//System.out.println("Display Source\t"+chkSource);
	}
	String FullURL = request.getRequestURL()+"?"+request.getQueryString();
	FullURL = FullURL.toLowerCase();
	System.out.println("Full URL - "+FullURL);
	
	if(FullURL.indexOf("sessionid") > 0 || FullURL.indexOf("%3cscript%3e") > 0)
	{
		System.out.println("Url Script Error");
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	}
	String USER_Name =(String) session.getAttribute("USER_Name");
	

	Connection con_TDuration = null;
	Statement st_TDuration = null;
	ResultSet rs_TDuration = null;
	String time_in_min = "";
	String time_in_sec = "";
	try
	{
		String time_duration = "SELECT Time_limit_min,Time_limit_sec FROM test_master WHERE Test_id = 1";
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Typing Assessment Test ( Duration : 3 minutes )</title>
<link rel="stylesheet" type="text/css" href="../css/careers.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/TestExam.css"/>

	<script language="javascript" src="../js/shortcut.js"></script>
	<!-- POP UP JQUERY -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/text.css" media="all" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/styles.css" media="all" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/colorbox.css" media="all" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/popjsfile.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/loginpopup.js"></script>
	<!-- END POP UP JQUERY -->
	<!-- Back button jquery -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/jquery-1.2.6.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/js/NoBack.js"></script>
<style type="text/css">
	html,body
	{
		margin: 0px;
	}
	.contentSize
	{
		clear: both;
		display: block;
		overflow: hidden;
		width: 750px;
	}
	.wrapper
	{
		margin: 0 auto;
		width: 750px;
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
<script type="text/javascript" src="../example/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="../example/jquery.webcam.js"></script>

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
	// myFunction();
	
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

		function typingTest() {
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
		function redo() 
		{
		 	secs--;
		 	if(secs == -1) 
		 	{
		  		secs = 59;
		  		mins--;
		 	}
		 	document.typeTest.disp.value = dis(mins,secs); // setup additional displays here.
		 	if((mins == 0) && (secs == 0)) 
		 	{
		 		document.getElementById('loginblocktimeUp').click();
				document.getElementById('dispMSGtimeUp').innerHTML = 'Time is up. Press ok.';
				document.getElementById('timeUpbtn').focus();
				myFunctionTimeUp();
				return false;
		 	} 
		 	else 
		 	{
		 		typingTest = setTimeout("redo()",1000);
		 	} 
		}
</script>

<script type="text/javascript">
	function submitform()
	{	
		document.getElementById("Submit").style.display="none";
		document.getElementById("processing").style.display="";
  		<% if(session.getAttribute("ip") != null){%>
       		validateText12();
        <%}%>
		document.forms[0].submit();
	}
</script>
<!-- Validate the User input field blank or not -->
<script type="text/javascript">
		function textvalidate()
		{
		var textval = document.getElementById("reply").value;
		if(textval==null || textval=='' || textval==0)
		{
			document.getElementById('loginblock').click();
			document.getElementById('dispMSG').innerHTML = 'Please enter some text';
			document.getElementById('closeblock').focus();
			myFunction();
			return false;
		}
		else
		{<% if(session.getAttribute("ip") != null){%>
           validateText12();
        <%}%>
           submitform();
		}
		}
</script>

<script type="text/javascript">
function validateText12()
	{	
		parent.parent.related.document.getElementById("test_flag").value="1";
		parent.parent.related.webcam.capture();
	}
</script>
<script type="text/javascript">

function displayStartTest()
{
	document.getElementById("TRowStartTest").style.display="none"; 
	document.getElementById('reply').value = '';
	document.getElementById("displayDIVtextArea").style.display="";
	document.getElementById("TRowForSubmit").style.display="";
	document.getElementById('reply').focus();
	typingTest();
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
			chkTxtSecure();
			// disableBodyTxt();
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
			
	 	} 
	 	else 
	 	{
	 		noCpyPstTimer = setTimeout("redoChk()",1);
	 	} 
	}
</script>
	<script type="text/javascript">
		function onFocustypingblr()
		{
			var txtpassage = document.getElementById('reply');
			txtpassage.setAttribute('id', 'reply');
			txtpassage.setAttribute('name', 'reply');
			txtpassage.setAttribute('onpaste', 'return false');
			txtpassage.setAttribute('oncopy', 'return false');	
			txtpassage.setAttribute('oncut', 'return false');
			txtpassage.setAttribute('class', 'quest_input');
			txtpassage.setAttribute('onkeydown', 'return nocopypaste(event)');
		}
		
		function onCpyPstChk()
		{
			var txtpassage = document.getElementById('reply');
			txtpassage.setAttribute('id', 'reply');
			txtpassage.setAttribute('name', 'reply');
			txtpassage.setAttribute('onpaste', 'return false');
			txtpassage.setAttribute('oncopy', 'return false');	
			txtpassage.setAttribute('oncut', 'return false');
			txtpassage.setAttribute('class', 'quest_input');
			txtpassage.setAttribute('onkeydown', 'return nocopypaste(event)');
		}
</script>

<script type="text/javascript">
var txtvar = '';
function chkTxtSecure()
{
	var txtTest = document.getElementById('reply').value; // textarea field
	if(txtTest != null || txtTest.length != 0)
	{
		var lenDiff = txtTest.length - txtvar.length;
		if(lenDiff > 30)
		{
			document.getElementById('reply').value = txtvar;
		}		
		else
		{
			txtvar = document.getElementById('reply').value;
		}
	}
	else
	{
		txtvar = '';
	}
}
</script>
</head>

<body onKeyDown="nocopypaste(event);" onload="return noCpyPstTimer();"ondragstart="return false" onselectstart="return false">
<table border="0" width="100%" style="padding-top: 5px;">
     <tr>   
	    <td align="left" style="padding-left:10px;">
	        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Post Registration > </font>
	        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Chat Process Tests > </font>
	        <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Typing Test</font>		
		</td>
		<td align="right" style="padding-right:10px;">
			<b><span class="recName" style="font-size:12px;"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;"></font>			
		</td>
	</tr>
</table>
	<div class="wrapper">
	<div class="content">
		<form name="typeTest" id="ControllerServlet" action="<%=request.getContextPath()%>/TypingTest" method="post">
			<input type="hidden" name="target" value="TypingTest" />
			<input type="hidden" name="methodName" value="ErrorCheck" />
								<%
									Connection con=null;
									con= ConnectDatabase.getConnection();
									int compQsnId = 0;
									String compQsnPass=null;
									String compHeader = null;
									System.out.println(" Inside the Typing Test JSP Page");
						      		try
									{
										String compQsnQry = "SELECT * FROM bpo_typing_master where Is_active = 1 AND is_deleted = 0 ORDER BY RAND() LIMIT 1";
										System.out.println("Step 8 Query "+compQsnQry);
										Statement adrStmt = con.createStatement();
										ResultSet adrRs = adrStmt.executeQuery(compQsnQry);
										if(adrRs.next())
										{
											compQsnId = adrRs.getInt("TYPING_MASTER_ID");
											System.out.println("compQsnId"+compQsnId);
											compQsnPass = adrRs.getString("PASSAGE");
											session.setAttribute("PASSDATA",compQsnPass);
											compHeader = adrRs.getString("Typing_Test_Header");
										}
									}
									catch (Exception e)
									{
										e.printStackTrace();
									}
						     	%>
							<div class="forms" style="float: left;">
								<input type="hidden" name="typeID" id="typeID" value="<%=compQsnId%>" />
								<table border="0" cellpadding="6" width="100%" cellspacing="6">
									<tr>
										<th class="taL">
											<div style="float: left;">
												Typing Test
											</div>
											<div style="float: right;">
												Time Remaining
												<input type="text" name="disp" size="3" class="timer" id="disp"/>
											</div>
										</th>
									</tr>
									<tr>
							       <td colspan="4"><div style="float:left;"> <p style="color: #aa0000;"><b><%=compHeader %> </b></p></div></td>
							      </tr>
									<tr>
										<td>
											<div onmousedown="return false">
												<textarea class="quest_output" id="passage" style="width: 680px; height: 200px; overflow-x: hidden;" readonly="readonly" onKeyDown="return nocopypaste(event)" oncopy="return false" onpaste="return false" oncut="return false"><%=compQsnPass%></textarea>
											</div>
										</td>
									</tr>
									<tr style="display: none;" id="displayDIVtextArea">
										<td>
											<div>
												<textarea class="quest_input" id="reply" name="reply"
													style="color: red; font-size: 10px; resize: none;"
													onfocus="javascript: onFocustypingblr(), onFocusInput();"
													onKeyDown="nocopypaste(event);" onblur="onFocustypingblr(), onBlurInput();" oncopy="return false" onpaste="return false" oncut="return false"></textarea>
													<input type="hidden" name="hidentxt" id="hidentxt"/>
											</div>
										</td>
									</tr>
									<tr id="TRowForSubmit" style="display: none;">
										<td colspan="1" align="right">  
											<input name="Submit" id="Submit" type="submit" value="Finish"  class="buttonSmall" onclick="return textvalidate();"/> 
											<span class="register" id="processing" style="display:none;"><b><font color="#000033" class="taL" colspan="2">Processing, please wait...</font></b></span>
										</td>
									</tr>
									<tr id="TRowStartTest">
										<td colspan="1" align="right">
										<input name="startTest" id="startTest" type="button" value="Start Test"  class="buttonMedium" onclick="return displayStartTest();"/>
										</td>
									</tr>
								</table>
							</div>
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
<div id="fade" style="display:none;"></div>
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
<div style="display: none;">
</div>
			
	</body>
</html>