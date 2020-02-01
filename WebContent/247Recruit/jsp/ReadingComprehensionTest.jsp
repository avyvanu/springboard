<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.ArrayList"%>
<%@page import="beans.CompTestDTO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="util.CompRandum"%>
<%@page import="java.sql.PreparedStatement"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
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
	}
	String FullURL = request.getRequestURL()+"?"+request.getQueryString();
	FullURL = FullURL.toLowerCase();
	System.out.println("Full URL - "+FullURL);
	
	if(FullURL.indexOf("sessionid") > 0 || FullURL.indexOf("%3cscript%3e") > 0)
	{
		System.out.println("Url Script Error");
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	}

	String USER_Name =(String)session.getAttribute("USER_Name");
	int USER_AUTOID =(Integer) session.getAttribute("USER_AUTOID");
	if(USER_AUTOID==0)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp"); // ReadingComprehensionTest.jsp  ReadingComprehensionSucess.jsp
	}
	
	Connection con_TDuration = null;
	Statement st_TDuration = null;
	ResultSet rs_TDuration = null;
	String time_in_min = "";
	String time_in_sec = "";
	try
	{
		String time_duration = "SELECT Time_limit_min,Time_limit_sec FROM test_master WHERE Test_id = 2";
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


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>[24]7 Customer</title>

	<!-- POP UP JQUERY -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/text.css" media="all" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/styles.css" media="all" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/colorbox.css" media="all" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/popjsfile.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/loginpopup.js"></script>
	<!-- END POP UP JQUERY -->

	<!-- Back button jquery -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/jquery-1.2.6.js"></script>
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/TestExam.css"/>
	<link rel="stylesheet" type="text/css" href="../css/careers.css"/>
	<script language="javascript" src="../js/shortcut.js"></script>
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
	window.onload = init;
		function init() 
		{
		  comprehensionTest();
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

<script LANGUAGE="JavaScript">  
		var mins
		var secs;

		function comprehensionTest() {
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
	 	document.compTestPage.disp.value = dis(mins,secs); // setup additional displays here.
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
		function textvalidate()
		{
		 <% 
		 if(session.getAttribute("ip") != null)
		 {
		 %>
          validateText12();
         <%
         }
         %>
           submitform();
		}
</script>
<script type="text/javascript">
function validateText12()
	{	
		parent.parent.related.document.getElementById("test_flag").value="2";
		parent.parent.related.webcam.capture();
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

</head>
<body onKeyDown="nocopypaste(event);">
<table border="0" width="100%" style="padding-top: 5px;">
     <tr>   
	    <td align="left" style="padding-left:10px;">
	        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Post Registration > </font>
	        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Chat Process Tests > </font>
	        <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Comprehension Test</font>		
		</td>
		<td align="right" style="padding-right:10px;">
			<b><span class="recName" style="font-size:12px;"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;"></font>			
		</td>
	</tr>
</table>
<div class="wrapperSize" style="width: 720px;">
<div class="" style="clear: both;display: block; margin: 0 0 0;overflow: hidden;padding: 0;position: relative;">
<form name="compTestPage" id="compTestPage" action="<%=request.getContextPath()%>/ComprehensionTest" method="post">

<input type="hidden" name="methodName" id="methodName" value="storeRes"/>
<div class="forms"  style="float: left;">
<table border="0" cellpadding="6" width="100%" cellspacing="1" style="margin:15px 0 0 0" >
<%
// int ranNum = CompRandum.doRawRandomNumber();
Connection con=null;
con= ConnectDatabase.getConnection();
Statement stmt = null;
ResultSet resultSet = null;
Statement stmt12 = null;
ResultSet resultSet12 = null;
int compQsnId = 0;
String compQsnPass=null;
String compHeader = null;
int qsnID=0;
int no_qs=0;
String qsnStr = null;

try
{
String compQsnQry = "SELECT * FROM bpo_reading_comp_master where Is_Alive = 1 AND is_deleted = 0 ORDER BY RAND() LIMIT 1";
System.out.println("Step 8 Query "+compQsnQry);
Statement adrStmt = con.createStatement();
ResultSet adrRs = adrStmt.executeQuery(compQsnQry);
if(adrRs.next())
{
compQsnId = adrRs.getInt("READING_COMP_MASTER_ID");
compQsnPass = adrRs.getString("PASSAGE");
compHeader = adrRs.getString("Test_Header");
}
}
catch (Exception e)
{
e.printStackTrace();
}
%>
<tr>
<th colspan="4" class="taL"><div style="float:left;">Reading Comprehension</div><div style="float:right;">Time Remaining <input type="text" name="disp" size="3" class="timer" id="disp"/> </div></th>
</tr>
<tr>
       <td colspan="4"><div style="float:left;"> <p style="color: #aa0000;"><b><%=compHeader %> </b></p></div></td>
      </tr>

<tr>
<td><div style="float: left;" >

<input type="hidden" name="target" value="ComprehensionTest"/>
<input type="hidden" name="sesVal" value="CompVal"/>
<input type="hidden" name="country" value="sdfd"/>
<input type="hidden" name="timeOut" id="timeOut"/>
<input type="hidden" name="attemptQsn" id="attemptQsn"/>
<input type="hidden" name="methodName" id="methodName" value="storeRes"/>
<textarea class="quest_output" style="height: 311px;" readonly="readonly" oncut="return false" oncopy="return false" onpaste="return false"><%= compQsnPass %></textarea>

</div>
<div style="float: left;margin-left: 2px;width: 350px;" class="quest_output2">

<%

	try{
	
			
			String sql3 ="SELECT No_of_Question FROM maximum_read_assement_no";
			System.out.println("sql>>>>>>for------------------------------------"+sql3);
			Statement stmt_forsql3=con.createStatement();;
			ResultSet rs3 = stmt_forsql3.executeQuery(sql3);
			System.out.println("sql>>>>>>"+rs3);
			if (rs3.next()) {
			
		    no_qs=Integer.parseInt(rs3.getString("No_of_Question"));
			System.out.println("sql>>>>>>..............."+no_qs);
			
			
			}
			System.out.println("sql>>>>>/////////////////");			
																
														
		}catch(Exception e){
		e.getStackTrace();
		}		
		

 try
{
String compQsnQry12 = "SELECT * FROM bpo_reading_comp_question_master where READING_COMP_MASTER_ID='"+compQsnId+"' limit "+no_qs;
System.out.println("Step 8 Query "+compQsnQry12);
Statement adrStmt12 = con.createStatement();
ResultSet adrRs12 = adrStmt12.executeQuery(compQsnQry12);
int count =0;
while(adrRs12.next())
{
qsnID = adrRs12.getInt("READING_COMP_QUESTION_MASTER_ID");
System.out.println("count is:"+count);

//printing quesion no and question samtance
%>
<p><b><%= adrRs12.getString("PASSAGE_QUESTION")%></b></p>
<%


String compQsnQry123 = "SELECT * FROM bpo_reading_comp_question_answer_master  where READING_COMP_MASTER_ID="+compQsnId+" and READING_COMP_QUESTION_MASTER_ID="+qsnID ;
System.out.println("Qry is"+compQsnQry123);
Statement adrStmt123 = con.createStatement();
ResultSet adrRs124 = adrStmt123.executeQuery(compQsnQry123);
int m = 0;
while(adrRs124.next())
{

String opnId = " "+adrRs124.getString("PASSAGE_QUESTION_ANSWER");
String qsnNopVal = USER_AUTOID+":"+compQsnId+":"+qsnID +":"+ adrRs124.getString("READING_COMP_QUESTION_ANSWER_MASTER_ID")+":"+adrRs124.getString("correct_answer");
System.out.println("DATA:"+qsnNopVal);

%>
<p><input type="radio" name="opAns<%=count%>" id="opAns<%=count%>" value='<%=qsnNopVal%>' /><%=opnId%></p>
<%
 
}

count++;
 
}
%>
 <input type="hidden" name="readComp" value="<%=count%>" />
<%

}
catch(Exception ex)
{
	ex.printStackTrace();
	System.out.println("out of question :"+ex.getMessage());
}


%>


</div></td>
</tr>

									<tr>
										<td colspan="1" align="right">  
												
											<input name="Submit" id="Submit" type="submit" value="Finish"  class="buttonSmall" onclick="textvalidate();"/> 
											<span class="register" id="processing" style="display:none;"><b><font color="#000033" class="taL" colspan="2">Processing, please wait...</font></b></span>
										</td>
									</tr>

</table>

</div>



<table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#DBDBDB" id="tblSample">
<input type="hidden" name="total_box" id="total_box" />

<tbody>
</tbody>
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
</body>
</html>

