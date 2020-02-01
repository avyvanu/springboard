<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>

<html>
  <head>
    <base href="<%=basePath%>">
	<title>[24]7 SPRINGBOARD</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/careers.css"/>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/MasterTheme.css"/>
 
 <script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/js/NoBack.js"></script>
 
<script type="text/javascript">
function redirect()
{
	window.location.href='<%=request.getContextPath()%>/247Recruit/jsp/LangaugeWritingTest.jsp';
	return false;
}
</script>
	<!-- Back button jquery -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/jquery-1.2.6.js"></script>
	
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
			top.window.location.href = '<%=request.getContextPath()%>/jsp/Login.jsp?secruity_violation='+error+'&id='+randomString()+''+Math.random();
			lastjavascripthash=location.hash;
		}
	}, 300);
});
</script>
	

  </head>
  
  <body>
<%
	
	String USER_Name =(String) session.getAttribute("USER_Name");
	 %>
	 <table border="0" width="100%">
		<tr>
	        <td align="left" style="padding-left:10px;">
	        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Post Registration > Chat Process Tests  ></font>
		<font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Language Test</font>
		</td>
		<td align="right" style="padding-right:10px;">
				<b><span class="recName"><%=USER_Name%></span></b>
			</td>
		</tr>
		</table><br/>

<div class="wrapperSize">

<div class="">

<div class="inner-content">
  <div class="cont-lft-twocol">
    <div style="width: 720px;" class="cont-lft"> <div class="redTxt"></div>      
        <div class="forms">
          <input type="hidden" value="" id="sessionmemid" name="sessionmemid" />
          <table width="100%" cellspacing="1" cellpadding="6" border="0">
            <tbody><tr>
              <th class="taL" colspan="2">Please go through the instructions below, before you proceed.
              </th></tr>
            <tr>
              <td width="45%" colspan="2" >
              <h3>English Language Test</h3>
<ul><li>In this test, please read the given passage and summarise it in your own words (not exceeding 70 - 80 words). </li>
<li>You are required to type out the summarised passage in the space given. </li>
<li>The test will start on click of the start test button.</li>
<li>You have 45 minutes to complete this test.</li>
  <li>A timer would be displayed below the passage , indicating the time remaining to complete the assessment. The timer will commence as soon as you click on "Start" button, indicating you are ready to start the test.
  <br/></li>
  <li ><img src="<%=recruitPath%>images/LanguageTestSC.jpg" alt="" align="middle" style="width: 450px; height: 250px;"/></li>
 <li>You may exit the test anytime by clicking on FINISH. Please remember, you would not be allowed to take the language test again. <b>FINISH</b> button. </li>
    
     <li>When you are ready to take the assessment, please click on <b>START</b>.<br/>
    <b style="color: red;"> Note: </b>Time Starts when you click on Start button</li>
	</ul>
</td>
          </tr>
           <tr>
              <td class="taR">
              </td><td class="alterRow" align="center"><div style="float: right; overflow: hidden; margin: 0px 48px 0pt 0pt;">
                  <input name="Submit" type="submit" value="Start"  class="buttonMedium" onclick="javascript:redirect();"/>
                 
                </div></td>
            </tr>
          </tbody></table>
        </div>
   </div>
  </div>
  <div class="rightside rundgratxt">
 </div>
</div>
</div>
</div>
</br>
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
