<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>[24]7 Online Test Instructions</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/TestExam.css"/>
<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/js/NoBack.js"></script>
<link rel="stylesheet" type="text/css" href="../css/careers.css"/>
<script type="text/javascript">
function redirect()
{
	window.location.href="ControllerServlet?target=EnglishGrammerTest";
	return false;
}
function logout()
{
<% 
if(session.getAttribute("ip") != null)
{
%>
	top.window.location.href='<%=request.getContextPath()%>/jsp/Login.jsp';
<%
}
else
{
%>
	window.location.href = "ControllerServlet?target=Logout";
<%
}
%>

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
<table border="0" width="100%" style="padding-top: 5px;">
     <tr>   
	    <td align="left" style="padding-left:10px;">
	        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Post Registration > </font>
	        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Chat Process Tests > </font>
	        <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">English Grammar</font>		
		</td>
		<td align="right" style="padding-right:10px;">
			<b><span class="recName" style="font-size:12px;"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;"></font>			
		</td>
	</tr>
</table>

<div class="wrapperSize">

<div class="content">
<div class="inner-content">
  <div class="cont-lft-twocol">
    <div style="width: 720px;" class="cont-lft"> <div class="redTxt"></div>      
        <div style="padding: 0pt 0pt 10px;" class="forms">
          <input type="hidden" value="" id="sessionmemid" name="sessionmemid" />
          <table width="100%" cellspacing="1" cellpadding="6" border="0">
            <tbody><tr>
              <th class="taL" colspan="2">Please go through the instructions below, before you proceed.
                
            </th></tr>
            <tr>
              <td width="45%" colspan="2" >
	<h3>English Grammar Test</h3>
	 <ul><li>Duration of the test: 5 minutes</li>
  	<li>A timer would be displayed, indicating the time remaining to complete the test. </li>
    <li>A set of instructions would be displayed on the left hand side. Read the instructions carefully and quickly.</li>
    <li>A set of questions with multiple choice answers would be displayed to the right. </li>
    <li>For each question, click on the correct answer. Scroll down or up this window to verify if you have chosen the answers for all questions. </li>
    <img src="../images/eng_test.jpg" alt="" align="center" style="padding-left:75px;" />
    <li>As soon as you have answered all the questions, please click on <b>FINISH </b>.</li> 
    <li>You may exit the test anytime by clicking on <b>FINISH </b>. Please remember, you would not be allowed to take the test again. Your scores would be computed based on how much of the test you've completed till you clicked on the <b>FINISH</b> button.</li> 
    <li>Measurement: Number of correct answers (Scores)</li> 
    <li>When you are ready to take the test, please click on <b>START</b>.</li>
	</ul>
 
  </td>
              
 </tr>
            <tr>
              <td class="taR">
              </td><td class="alterRow"><div style="float: right; overflow: hidden; margin: 0px 48px 0pt 0pt;">
                  <input type="button" class="buttonMedium" value="Start" id="submit" name="submit" onclick="javascript:redirect();"/>
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

</body></html>