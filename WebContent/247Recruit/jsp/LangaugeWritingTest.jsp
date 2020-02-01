<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ include file="GlobalDeclare.jsp" %>
<html>
<%

Connection con_TDuration = null;
Statement st_TDuration = null;
ResultSet rs_TDuration = null;
String time_in_min = "";
String time_in_sec = "";
try
{
	String time_duration = "SELECT Time_limit_min,Time_limit_sec FROM test_master WHERE Test_id = 5";
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
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/TestExam.css"/>
	<script language="javascript" src="<%=recruitPath%>js/shortcut.js"></script>

	<!-- POP UP JQUERY -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/text.css" media="all" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/styles.css" media="all" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/colorbox.css" media="all" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/popjsfile.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/loginpopup.js"></script>
	<!-- END POP UP JQUERY -->

	<!-- Back button jquery -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/jquery-1.2.6.js"></script>
	
		<!-- jQuery for Datepicker and Tabs-->
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/demos/demos.css" rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/base/jquery.ui.all.css" rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/jquery.ui.theme.css" rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/base/jquery.ui.theme.css"  rel="stylesheet" />
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/jquery-1.4.2.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.core.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.datepicker.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.tabs.js"></script>
	<!-- End jQuery for Datepicker and Tabs-->
	
	<script language="javascript" src="<%=recruitPath%>js/shortcut.js"></script>

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
	padding: 6px 4px;	
	width: 750px;
}
.wrapper
{
	margin: 0 auto;
	width: 750px;
} 
.tPersonal
{
	width: 550px;
	height: 300px;
} 
.theader 
{
    background: url("/springboard/247Recruit/images/header_BG.jpg") repeat-x scroll 0 0 transparent;
    color: #FFFFFF;
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
	
<script type="text/javascript">
	$(function() {
		$("#tabs").tabs();
	});
</script>
<script type="text/javascript">
	function displayStartTest()
	{
		document.getElementById("displayQuestion").style.display="";
		document.getElementById("startTest").style.display="none";
		LanguageTest();
	}
</script>	
<script type="text/javascript">
	function AllowChars(evt)
	{
		var charCode = (evt.which) ? evt.which : event.keyCode;
 		if ((charCode > 47 && charCode < 58) || (charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 8 || charCode == 32 || charCode == 44 || charCode == 45 || charCode == 46 || charCode == 95) 
		{
			return true;
		}
		else
		{
			document.getElementById('loginblock').click();
			document.getElementById('dispMSG').innerHTML = 'Invalid character entered !';
			document.getElementById('closeblock').focus();
			myFunction();
			return false;
		}
	}      
</script>
	
<!-- Script for Word Count -->
<script type="text/javascript">
function cnt(w,x)
{
    var y=w.value;
    var r = 0;
	a=y.replace(/\s/g,' ');
	a=a.split(' ');
	aa=a.length;               
	if(aa!=61)
	{
		for (z=0; z<a.length; z++) 
		{
			if (a[z].length > 0)
			r++;
		}
	}
	else
	{
	}
	x.value=r;
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
			chkTxtSecurepartB();
			chkTxtSecurepartC();
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
		function onFocusBlurPrtB()
		{
			var txtInpPartB = document.getElementById('partBQ');
			txtInpPartB.setAttribute('onpaste', 'return false');
			txtInpPartB.setAttribute('oncopy', 'return false');	
			txtInpPartB.setAttribute('oncut', 'return false');
			txtInpPartB.setAttribute('onblur', 'return onFocusBlurPrtB()');
		}
		function onFocusBlurPrtC()
		{
			var txtInpPartC = document.getElementById('partCQ');
			txtInpPartC.setAttribute('onpaste', 'return false');
			txtInpPartC.setAttribute('oncopy', 'return false');	
			txtInpPartC.setAttribute('oncut', 'return false');
			txtInpPartC.setAttribute('onblur', 'return onFocusBlurPrtC()');
		}
		function onCpyPstChk()
		{
			var txtpassage = document.getElementById('passage');
			txtpassage.setAttribute('id', 'passage');
			txtpassage.setAttribute('name', 'passage');
			txtpassage.setAttribute('onpaste', 'return false');
			txtpassage.setAttribute('oncopy', 'return false');	
			txtpassage.setAttribute('oncut', 'return false');
			txtpassage.setAttribute('readonly', 'readonly');
			txtpassage.setAttribute('style', 'resize: none; width: 700px; height: 200px; overflow-x: hidden; background-color: white; text-align: justify;');
			txtpassage.setAttribute('class', 'quest_output');
			txtpassage.setAttribute('onkeydown', 'return nocopypaste(event)');
	
			//Part B//
			var txtInpPartB = document.getElementById('partBQ');
			txtInpPartB.setAttribute('id', 'partBQ');
			txtInpPartB.setAttribute('name', 'partBQ');
			txtInpPartB.setAttribute('onpaste', 'return false');
			txtInpPartB.setAttribute('oncopy', 'return false');	
			txtInpPartB.setAttribute('oncut', 'return false');
			txtInpPartB.setAttribute('onkeydown', 'return nocopypaste(event)');
			txtInpPartB.setAttribute('onKeyUp', 'cnt(this,document.LanguageTest.c)');
			txtInpPartB.setAttribute('onfocus', 'onFocusBlurPrtB(),onFocusInput()');
			txtInpPartB.setAttribute('onblur', 'onFocusBlurPrtB(), onBlurInput()');
			txtInpPartB.setAttribute('style', 'resize: none; width: 660px; height: 150px; text-align: left;');
			
			//Part C//
			var txtInpPartC = document.getElementById('partCQ');
			txtInpPartC.setAttribute('id', 'partCQ');
			txtInpPartC.setAttribute('name', 'partCQ');
			txtInpPartC.setAttribute('onpaste', 'return false');
			txtInpPartC.setAttribute('oncopy', 'return false');	
			txtInpPartC.setAttribute('oncut', 'return false');
			txtInpPartC.setAttribute('onkeydown', 'return nocopypaste(event)');
			txtInpPartC.setAttribute('onKeyUp', 'cnt(this,document.LanguageTest.c1)');
			txtInpPartC.setAttribute('onfocus', 'onFocusBlurPrtC(), onFocusInput()');
			txtInpPartC.setAttribute('onblur', 'onFocusBlurPrtC(), onBlurInput()');
			txtInpPartC.setAttribute('style', 'resize: none; width: 660px; height: 150px; text-align: left;');
			
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
	myFunction();
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
	
<script language="JavaScript" type="text/javascript">  
		var mins
		var secs;
		function LanguageTest() {
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
	 	document.LanguageTest.disp.value = dis(mins,secs); // setup additional displays here.
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
	 		LanguageTest = setTimeout("redo()",1000);
	 	} 
	}
</script>

<script type="text/javascript">
function startProcess()
{
	document.getElementById('Submit').style.display = 'none';
	document.getElementById('processing').style.display = '';
}
</script>

<script type="text/javascript">
function textvalidate()
{		
 	submitform();
}
</script>

<script type="text/javascript">
function submitform()
{		
	document.getElementById("Submit").style.display="none";
	document.getElementById("processing").style.display="";
	<%if(session.getAttribute("ip") != null){%>
   		validateText12();
    <%}%>
	document.getElementById("Submit").click();
	document.forms[0].submit();
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

<script type="text/javascript">
var txtvar = '';
function chkTxtSecurepartB()
{
	var txtTest = document.getElementById('partBQ').value; // textarea field
	if(txtTest != null || txtTest.length != 0)
	{
		var lenDiff = txtTest.length - txtvar.length;
		if(lenDiff > 30)
		{
			document.getElementById('partBQ').value = txtvar;
		}		
		else
		{
			txtvar = document.getElementById('partBQ').value;
		}
	}
	else
	{
		txtvar = '';
	}
}
</script>

<script type="text/javascript">
var txtvarc = '';
function chkTxtSecurepartC()
{
	var txtTest = document.getElementById('partCQ').value; // textarea field
	if(txtTest != null || txtTest.length != 0)
	{
		var lenDiff = txtTest.length - txtvarc.length;
		if(lenDiff > 30)
		{
			document.getElementById('partCQ').value = txtvarc;
		}		
		else
		{
			txtvarc = document.getElementById('partCQ').value;
		}
	}
	else
	{
		txtvarc = '';
	}
}
</script>
</head> 
<%
try
{
	String USER_Name =(String) session.getAttribute("USER_Name");
	int USER_AUTOID =(Integer)session.getAttribute("USER_AUTOID");
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	ResultSet rsCount = null;
	int qsCount = 0;
	PreparedStatement Pst = null;
	String Lang_Test_ID = "";
	String Lang_Passage = "";
	String PartA_Header = "";
	String PartA_Part1_Header = "";
	String PartA_Part2_Header = "";
	String PartB_Header = "";
	String PartB_Q = "";
	String PartC_Header = "";
	String PartC_Q1 = "";
	String PartC_Q2 = "";
	String PartC_Q3 = "";
	PreparedStatement ps = null;
	try
	{
   		con = ConnectDatabase.getConnection();
   		Pst =con.prepareStatement("Insert into language_test_attempt_master(Cand_Id,Start_Date) VALUES("+USER_AUTOID+",sysdate())");
        Pst.executeUpdate();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
		Pst.close();
	//String getLanguageQuestionCount = "SELECT count(*) as quesCount FROM language_test_master where Is_active = 1";
	ArrayList arrQues = new ArrayList();
	String getLanguageQuestionCount = "SELECT Lang_Test_Id FROM language_test_master WHERE Is_active = 1"; // 
	stmt = con.createStatement();
	rsCount = stmt.executeQuery(getLanguageQuestionCount);	
	while(rsCount.next())
	{
		qsCount = rsCount.getInt("Lang_Test_Id");
		arrQues.add(qsCount);
	}

	int getLength = arrQues.size();

	String num = "0";
	Random rand = new Random();
	
	if(getLength > 1)
	{
		num = arrQues.get(rand.nextInt(getLength)).toString();
	}
	else if(getLength > 0)
	{
		num = arrQues.get(0).toString();
	}
	else
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Error.jsp?ec=600");
	}
	
	if(num.equals("0"))
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Error.jsp?ec=600");
	}
	
	String getLanguagePA = "SELECT * FROM language_test_master where Is_active = 1 and lang_test_id = "+num;
	stmt = con.createStatement();
	rs = stmt.executeQuery(getLanguagePA);
	if(rs.next())
	{
		Lang_Test_ID = rs.getString("Lang_Test_Id");
		PartA_Header = rs.getString("PartA_Header");
		Lang_Passage = rs.getString("Lang_Passage");

		// PART A
		PartA_Part1_Header = rs.getString("PartA_Part1_Header");
		PartA_Part2_Header = rs.getString("PartA_Part2_Header");
		
		// PART B
		PartB_Header = rs.getString("PartB_Header");
		PartB_Q = rs.getString("PartB_Q");
		
		// PART C
		PartB_Header = rs.getString("PartB_Header");
		PartB_Q = rs.getString("PartB_Q");
		PartC_Header = rs.getString("PartC_Header");
		PartC_Q1 = rs.getString("PartC_Q1");
		PartC_Q2 = rs.getString("PartC_Q2");
		PartC_Q3 = rs.getString("PartC_Q3");		
	}
%>
 
  <body onload="return noCpyPstTimer()" onKeyDown="return nocopypaste(event)">
  <form action="<%=request.getContextPath()%>/LanguageTest" name="LanguageTest" id="LanguageTest" method="post" autocomplete="off">
  <table border="0" width="100%">
     <tr>   
		<td colspan="2" style="height: 5px;">
		</td>
	 </tr>
     <tr>   
	    <td align="left" style="padding-left:10px;">&nbsp; 
	        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Post Registration &gt; </font>
	        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Chat Process Tests > </font>
	        <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Language Test</font>		
		</td>
		<td align="right" style="padding-right:10px;">
			<b><span class="recName" style="font-size:12px;"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;"></font>			
		</td>
	</tr>
	<tr>
	<td colspan="2" align="center">
<!--******************************************************* START TAB CODE ****************************************************************** --> 
	<div class="demo" style="width: 700px;">
		<table>	
			<tr>
				<td class="theader" height="32px;">
					<div style="float: left; font-size: 13px; font-weight: bold; font: Verdana,Arial,sans-serif; padding-left: 5px;" >
						Read the below passage and answer Part A, Part B and Part C
					</div>
					<div style="float: right;font-size: 13px; font-weight: bold; Verdana,Arial,sans-serif;">
						Time Remaining
						<input id="disp" type="text" style="border: 0px ; color: white; font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight: bold;background-color: #666666;" size="5" readonly="readonly" name="disp"/>
					</div>				
				</td>
			</tr>
			<tr>
				<td align="center">
					<textarea onmousedown="return false" class="quest_output" id="passage" style="resize: none; width: 700px; height: 200px; overflow-x: hidden; background-color: white; text-align: justify;" readonly="readonly" onKeyDown="return nocopypaste(event)" oncopy="return false" onpaste="return false" oncut="return false"><%=Lang_Passage%></textarea>
				</td>
			</tr>
			<tr>
				<td align="center">
					<input name="startTest" id="startTest" type="button" value="Start Test" class="buttonMedium" onclick="return displayStartTest();"/>
<div id="displayQuestion" style="width: 700px; display: none;">
<div class="demo" style="width: 700px; padding-top: 5px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px;">
<div id="tabs">
	<ul>
		<li><a href="#tabs-1"><b>Part A</b></a></li>
		<li><a href="#tabs-2"><b>Part B</b></a></li>
		<li><a href="#tabs-3"><b>Part C</b></a></li>
	</ul>
	<!-- ==================================     START  tabs-2 Language PArt A       ==================================        -->
	<div id="tabs-1">
				<table border="0" style="width: 100%;">
				<%
				boolean fPart2 = false;
				for(int i = 1;i<11;i++)
				{
					if(i==1)
					{
					%>
					<tr>						
						<td align="left" colspan="3" nowrap="nowrap" style="font-weight: bold; font-size: 12px;"  oncopy="return false" onpaste="return false" oncut="return false">
							<%=PartA_Header%>
						</td>
					</tr>
					<tr>						
						<td align="left" colspan="3" nowrap="nowrap" style="font-weight: bold; font-size: 12px;" oncopy="return false" onpaste="return false" oncut="return false">
							<%=PartA_Part1_Header %>
						</td>
					</tr>
					<tr>
						<td align="left" oncopy="return false" onpaste="return false" oncut="return false"><%=rs.getString("PartA_Q1") %></td>
						<td align="left" oncopy="return false" onpaste="return false" oncut="return false"><input type="text" name="partA1" id="partA1" maxlength="50" onkeypress="return AllowChars(event);"/></td>
						<td></td>
					</tr>
					<%
					}
					else
					{	
						String tempPartA_Part = rs.getString("PartA_Q"+i+"_Part");
						if(tempPartA_Part.equals("1"))
						{
					%>
					<tr>
						<td align="left" oncopy="return false" onpaste="return false" oncut="return false"><%=rs.getString("PartA_Q"+i) %></td>
						<td align="left" oncopy="return false" onpaste="return false" oncut="return false"><input type="text" name="partA<%=i%>" id="partA<%=i%>" maxlength="50" onkeypress="return AllowChars(event);"/></td>
						<td></td>
					</tr>
					<%
						}
						else
						{
							if(fPart2 == true)
							{
					%>
					<tr>
						<td  align="left" colspan="3" nowrap="nowrap" oncopy="return false" onpaste="return false" oncut="return false"><%=rs.getString("PartA_Q"+i) %>	</td>
					</tr>
					<tr>
						<td  align="left" colspan="3" nowrap="nowrap" oncopy="return false" onpaste="return false" oncut="return false">
							<input type="radio" name="truFalse<%=i%>" id="truFalse<%=i%>" value="True"/> True 
							<input type="radio" name="truFalse<%=i%>" id="truFalse<%=i%>" value="False"/> False
						</td>			
					</tr>
					<%
							}
							else
							{
								fPart2 = true;
					%>
					<tr>
						<td  align="left" colspan="3" style="height: 10px;">
							<input type="hidden" name="countPart1" value="<%=i-1%>"/>
							<input type="hidden" name="LangTestID" value="<%=Lang_Test_ID%>"/>
						</td>
					</tr>
					<tr>
						<td  align="left" colspan="3" style="font-weight: bold; font-size: 12px;" oncopy="return false" onpaste="return false" oncut="return false">
							<%=PartA_Part2_Header %>
						</td>
					</tr>
					<tr>
						<td  align="left" colspan="3" ><%=rs.getString("PartA_Q"+i) %></td>
					</tr>
					<tr>
						<td  align="left" colspan="3" nowrap="nowrap" oncopy="return false" onpaste="return false" oncut="return false">
							<input type="radio" name="truFalse<%=i%>" id="truFalse<%=i%>" value="True"/> True 
							<input type="radio" name="truFalse<%=i%>" id="truFalse<%=i%>" value="False"/> False
						</td>						
					</tr>
					<%
							}
						}
					}
				}
					%>
			</table>			
	<br/>
	<b><font color="red" colspan="2" style="font-size: 11px; font-family: Verdana, sans-serif;">[ PLEASE GO TO PART B ]</font></b>
	</div>
	<!-- ==================================     END    tabs-2 Language PArt A       ==================================        -->

	<!-- ==================================     START  tabs-3 Language PArt B       ==================================        -->
	<div id="tabs-2">
		<table>
			<%if(PartB_Header!=null){ %>
			<tr>
				<td align="left" style="font-weight: bold; font-size: 12px;" oncopy="return false" onpaste="return false" oncut="return false">
				<%=PartB_Header %>
				</td>
			</tr>
			<%} %>
			<%if(PartB_Q!=null){ %>
			<tr>
				<td align="left" oncopy="return false" onpaste="return false" oncut="return false">
				<%=PartB_Q %>
				</td>
			</tr>
			<%} %>
			<%if(PartB_Q!=null){ %>
			<tr>
				<td align="left">
					<textarea class="vis" name="partBQ" id="partBQ" onKeyDown="return nocopypaste(event)" onKeyUp="cnt(this,document.LanguageTest.c)" onblur="onFocusBlurPrtB(), onBlurInput()" onfocus="onFocusBlurPrtB(),onFocusInput();" oncopy="return false" onpaste="return false" oncut="return false" style="resize: none; width: 660px; height: 150px; text-align: left;"></textarea>
				</td>
			</tr>
			<%} %>
			</table>
			<table width="660" cellpadding="0" cellspacing="0" border="0">	
				<tr>
					<td align="left" style="font-family:sans-serif;font-size:10pt;font-weight: bold;border:none;"> <br/><b>Word Count&nbsp;:</b>&nbsp;<input type="text" name="c"  readonly="readonly" value="0" size="1" onKeyUp="cnt(document.LanguageTest.partBQ,this)" style="font-family:sans-serif;font-size:10pt;font-weight: bold;border:none;background-color: #F2F2F2;text-align: center;" oncopy="return false" onpaste="return false" oncut="return false"/> 
					</td>
					<td align="right">
					 	<br/>
							<b><font color="red"  style="font-size: 11px; font-family: Verdana, sans-serif;">[ PLEASE GO TO PART C ]</font></b>
					 </td>
				</tr>
			</table>
	</div>
	<!-- ==================================     END  tabs-3 Language PArt B       ==================================        -->


	<!-- ==================================     START  tabs-4 Language PArt C       ==================================        -->
	<div id="tabs-3">
	
<table>

	<%if(PartC_Header!= null){ %>
	<tr>
		<td align="left" style="font-weight: bold; font-size: 12px;">
		<%= PartC_Header%>
		</td>
	</tr>
	<%} %>
	<%if(PartC_Q1 != null){ %>
	<tr>
		<td align="left">
		<%= PartC_Q1%>
		</td>
	</tr>
	<%} %>
	<%if(PartC_Q2 != null){ %>
	<tr>
		<td align="left">
		<%= PartC_Q2%>
		</td>
	</tr>
	<%} %>
	<%if(PartC_Q3 != null){ %>
	<tr>
		<td align="left">
		<%= PartC_Q3%>
		</td>
	</tr>
	<%} %>
	<%if(PartC_Q3 != null){ %>
	<tr>
		<td align="left"><textarea name="partCQ" id="partCQ" onKeyDown="return nocopypaste(event)" onKeyUp="cnt(this,document.LanguageTest.c1)" onblur="onFocusBlurPrtC(), onBlurInput();" onfocus="onFocusBlurPrtC(), onFocusInput();" oncopy="return false" onpaste="return false" oncut="return false" style="resize: none; width: 660px; height: 150px; text-align: left;" oncopy="return false" onpaste="return false" oncut="return false"></textarea></td>
	</tr>
	<%} %>
	
</table>
<table width="660" border="0" style="padding-bottom: 0px; padding-top: 5px;">
	<!--  <tr>
		<td align="center">
			<span class="register" id="processing" style="display:none;">
				<b><font color="#000033" colspan="2" style="font-size: 12px; font-family: Verdana, sans-serif;">Processing, please wait...</font></b>
			</span>
			<input name="Submit" id="Submit" type="submit" value="Finish"  class="buttonSmall" onclick="return startProcess();"/>
		</td>
	</tr>-->
	<tr>
		<td align="left" style="font-family:sans-serif;font-size:10pt;font-weight: bold;border:none;"> <b>Word Count&nbsp;:</b>&nbsp;<input type="text" name="c1"  readonly="readonly" value="0" size="1" onKeyUp="cnt(document.LanguageTest.partCQ,this)" style="font-family:sans-serif;font-size:10pt;font-weight: bold;border:none;background-color: #F2F2F2;text-align: center;"/> 
		</td>
		<td align="right">
			<span class="register" id="processing" style="display:none;">
				<b><font color="#000033" style="font-size: 12px; font-family: Verdana, sans-serif;">Processing, please wait...</font></b>
			</span>
			<input name="Submit" id="Submit" type="submit" value="Finish"  class="buttonSmall" onclick="return startProcess();"/>
		</td>
	</tr>
</table>
</div>
	<!-- ==================================     END  tabs-4 Language PArt C       ==================================        -->

</div>
</div>
</div>
<!--******************************************************* End TAB CODE ****************************************************************** -->
				</td>
			</tr>		
		</table>
	</div>
   </td>
	</tr>
</table>
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
	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
}
 %>  
</html>
