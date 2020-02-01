	<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	session.setAttribute( "pageId", "1000");
	String framePath =path+ "/247Recruit/jsp/MokTesting.jsp";
	%>
	
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<%
	Object obj=session.getAttribute("USER_AUTOID");
	if(obj==null)
	{
	response.sendRedirect("Login.jsp");
	}
		 %>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>[24]7 Online Test Instructions</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/MasterTheme.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/careers.css" />
	<script type="text/javascript">
	
	    window.history.forward();
	
	    function noBack() { window.history.forward(); }
	
	</script>
	
	<script type="text/javascript">
	function redirect()
	{
	
	location.href="<%=framePath%>";
	
	}
	</script>
	<style type="text/css">
	.contentsasa
		{
			
		    clear: both;
		    display: block;
		    overflow: hidden;
		    padding: 6px 4px;
		    width: 700px;
		    
		}
		.instrLink a
		{
			color:#F28900;
		}
	</style>
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
	
	<body onload="noBack();"onpageshow="if (event.persisted) noBack();" onunload="">
	<%
	
	String USER_Name =(String) session.getAttribute("USER_Name");
	 %>
	 <table border="0" width="100%">
		<tr>
	        <td align="left" style="padding-left:10px;">
	        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Post Registration > Chat Process Tests  ></font>
		<font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Mock Chat</font>
		</td>
		<td align="right" style="padding-right:10px;">
				<b><span class="recName"><%=USER_Name%></span></b>
			</td>
		</tr>
		</table><br/>
	<div class="wrapper">
	
	<div class="contentsasa">
	
	<div class="inner-content">
	  <div class="cont-lft-twocol">
	    <div style="width: 100%;" class="cont-lft"> <div class="redTxt"></div>      
	        <div style="padding: 0pt 0pt 10px;" class="forms">
	          <input type="hidden" value="" id="sessionmemid" name="sessionmemid"/>
	          <table width="720px" cellspacing="1" cellpadding="6" border="0">
	            <tbody><tr>
	              <th class="taL" colspan="2">Please go through the instructions below, before you proceed.
	                
	            </th></tr>
	            <tr>
	              <td width="45%" colspan="2" >
	
	    <h3>Mok Chat  Assessment Instructions</h3>
		<ul><li>Duration of  Assessment: 10 minutes</li>
	    <li>A timer would be displayed, indicating the time remaining to complete the assessment. </li>
	    <li>Please start the chat with this opening: <br/>
	    Thank you for visiting ABC Teleservices.com. My name is "Your Name". How may I help you today?</li>
		<li>Please offer additional assistance to the customer - wherever needed
		<br/>
              Agent: Is there anything else I may help you with?
          </li>
          <li> Close the chat with the following:
		<br/>
		Agent: Thank you for visiting ABC Teleservices.com today. It was a pleasure assisting you. If you'd like to give feedback on this service, just click the "Close" button on the top right of the chat window.
		</li>
		<img src="<%=request.getContextPath()%>/247Recruit/images/mokchat.jpg"/>
		
		<li>As soon as you have answered all the questions, it will automatically submit the page. </li>
		<li>You may exit the assessment anytime by clicking on <b>FINISH</b>. However, please remember, you would not be allowed to take the assessment again, and your scores would be computed on the state of completeness when you clicked on <b>FINISH</b>. </li>
		<li>Measurement: accuracy and speed of your answers (Scores).</li>
		<li>When you are ready to take the assessment, please click on <b>START</b>.</li>
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
	<div class="footer">
	    <p>&copy; Copyright 2010 [24]7. All rights reserved. <a href="#">Legal</a>|<a href="#">Privacy Policy</a></p>
	     </div>
	</div>
	
	</body></html>