<%@page import="java.util.ArrayList"%>
<%@page import="beans.CompTestDTO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.ConnectDatabase"%>
<%@ include file="GlobalDeclare.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
    String canId= (String) request.getParameter("candId");
	System.out.println("canId from session\t"+canId);
	Object obj=session.getAttribute("USER_AUTOID");
	if(obj==null)
	{
	response.sendRedirect("Login.jsp");
	}
	 %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>[24]7</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/careers.css" />
<style type="text/css">

html,body

{

margin: 0px;

}


.logo

{

height: 69px;

width: 143px;

} 
.contentSize

{

border: 1px solid #CCCCCC;

clear: both;

display: block;

overflow: hidden;

padding: 6px 4px;

width: 95%;


}

.wrapper

{

margin: 0 auto;

width: 95%;
} 
.tPersonal

{

width: 550px;

height: 320px;

} 
 .theader
 {
 background: url("<%=request.getContextPath() %>/247Recruit/images/header_BG.jpg") repeat-x scroll 0 0 transparent;color: #FFFFFF;
 
 }
</style>
<!-- <script language="JavaScript">
function backButtonOverride()
{
  // Work around a Safari bug
  // that sometimes produces a blank page
  // alert("2");
  setTimeout("backButtonOverrideBody()", 1);

}

function backButtonOverrideBody()
{
  // Works if we backed up to get here
   //alert("3");
  try 
  {
    history.forward();
  } 
  catch (e) 
  {
    // OK to ignore
  }
  // Every quarter-second, try again. The only
  // guaranteed method for Opera, Firefox,
  // and Safari, which don't always call
  // onLoad but *do* resume any timers when
  // returning to a page
  setTimeout("backButtonOverrideBody()", 1000);
}

var running = false
var endTime = null
var timerID = null
function startTimer() 
 {
	
	 //alert("1");
    backButtonOverride();
     //alert("4");
    
    running = true
    now = new Date()
    //alert("5"+now);
    now = now.getTime();
     //alert("6 "+now);
    // change last multiple for the number of minutes   
    endTime = now + (1000 * 60 * 30)   
    // alert("7 "+endTime);
    showCountDown()
}
function showCountDown() {
	 //alert("8 ");
    var now = new Date()
    //alert("9"+now)
    now = now.getTime()
    //alert("10"+now)
    var endt=endTime - now;
	 //alert("11 " +endt);

    if (endt<=1495219) {
        stopTimer()
        

alert("Time out for MokChat Test. Click on Finish");

//parent.test.location="Plain.jsp"
// parent.window.location.href="<%=request.getContextPath()%>/247Recruit/jsp/Chatresultcalc.jsp";
//parent.test2.location="result.jsp"


    } else {
        var delta = new Date(endTime - now)
        //alert("delta"+delta)
        var theMin = delta.getMinutes()-50;
        var theSec = delta.getSeconds()
        var theTime = theMin
        theTime += ((theSec < 10) ? ":0" : ":") + theSec
        document.forms[0].timerDisplay.value = theTime
         
            timerID = setTimeout("showCountDown()",1000)
        }
    }
}
function stopTimer() {
    clearTimeout(timerID)
    running = false
    document.forms[0].timerDisplay.value = "0:00"
}
function callMethod()
{
	top.location.href=top.content.location.href;
	return false;
}
</script>
 -->


<SCRIPT LANGUAGE="JavaScript1.1">

<!--

//Disable right mouse click Script
//By Maximus (maximus@nsimail.com) w/ mods by DynamicDrive
//For full source code, visit http://www.dynamicdrive.com

var message="Mouse Right Click Disabled!";

///////////////////////////////////
function clickIE4(){
if (event.button==2){
alert(message);
return false;
}
}

function clickNS4(e){
if (document.layers||document.getElementById&&!document.all){
if (e.which==2||e.which==3){
alert(message);
return false;
}
}
}

if (document.layers){
document.captureEvents(Event.MOUSEDOWN);
document.onmousedown=clickNS4;
}
else if (document.all&&!document.getElementById){
document.onmousedown=clickIE4;
}

document.oncontextmenu=new Function("alert(message);return false")

// --> 
</script>
 

<script language="javascript">
function document.onkeydown()
{
///alert(event.keyCode)
///alert("you press F5")
if ( event.keyCode==116 ||  event.keyCode==8)
{
//window.location.href = "Login.jsp";
window.location = 'Login.jsp'
alert("you press F5/Back Space")

//return false;
///alert('no key');
///window.location.replace ( "http://www.example.com/anotherpage.html" );
///window.location.href = "www.google.com"; 
//window.location.href = "ControllerServlet?target=Logout"; 


//window.location.href='Login.jsp';
//window.event.returnValue = false;
//event.keyCode = 0;
//event.cancelBubble = true;
return false;
}
}
</script>

</head>
<body>
<form name="cd">
<div class="wrapper">
<div class="inner-content">
  <div class="cont-lft-twocol">
    <div style="width: 100%;" class="cont-lft"> <div class="redTxt"></div>      
        <div style="padding: 0pt 0pt 10px;">
  <table border="0" cellpadding="6" width="75%" cellspacing="1" style="margin:15px" >
   <tr>
 <td width="98%" colspan="2" align="center" >
<iframe src ="<%=request.getContextPath()%>/247Recruit/jsp/MokTesting.jsp?page=1000" width="100%" height="320" scrolling="no" frameborder="0" name="test2" id="test2">
  <p>Your browser does not support iframes.</p>
</iframe>

  </td>
      </tr>
      </table>
        </div>
     
    </div>
    
  </div>
  <div class="rightside rundgratxt">
 </div>
</div>
  </div>
</form> 
</body>
</html>