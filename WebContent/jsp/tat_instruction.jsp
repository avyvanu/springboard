<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="GlobalDeclareNEW.jsp" %>
<head>
<% 
		
	int USER_AUTOID =(Integer)session.getAttribute("USER_AUTOID");
	if(USER_AUTOID==0)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	}
	String USER_Name =(String)session.getAttribute("USER_Name");
	
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>[24]7 Online Test Instructions</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/TestExam.css"/>
<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/js/NoBack.js"></script>
<!-- Back button jquery -->
<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/jquery-1.2.6.js"></script>
<link rel="stylesheet" type="text/css" href="../css/careers.css"/>


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
	lastjavascripthash=location.hash='#loaded';	
	$('#tostep1').click(function() 
	{
		lastjavascripthash=location.hash='#step1';					
	});
	$('#tostep2').click(function() 
	{
		lastjavascripthash=location.hash='#step2';					
	});
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


<script type="text/javascript">
function redirect()
{
window.location.href = "ControllerServlet?target=TypingTest&methodName=loadTypingPage";
return false;
}
function logout()
{
<% if(session.getAttribute("ip") != null){
%>
top.window.location.href='<%=request.getContextPath()%>/jsp/Login.jsp';
<%
}else{
%>
window.location.href = "ControllerServlet?target=Logout";
<%
}%>

}
</script>

<script type="text/javascript">
function noBackOption()
{
	window.history.forward(1);
}   
</script>
</head>

<body onload="noBack(), noBackOption();"onpageshow="if (event.persisted) noBack();" onunload="">
<table border="0" width="100%" style="padding-top: 5px;">
     <tr>   
	    <td align="left" style="padding-left:10px;">
	        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Post Registration > </font>
	        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Chat Process Tests > </font>
	        <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Typing </font>		
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

  
  <h3>Typing Test</h3>
  
  <ul><li>Duration of  Assessment: 3 minutes</li>
  <li>A timer would be displayed above the passage on the right, indicating the time remaining to complete the assessment. The timer will commence as soon as you position the cursor in the typing section, indicating you are ready to start typing.</li>
    <img src="../images/type_asses.jpg" alt="" align="center" style="width: 450px; height: 250px;" />
    <li>As soon as you complete typing the full passage, please click on FINISH. This will stop the timer and will indicate the time you have taken to complete the typing test.   </li>
      <li>You may exit the test anytime by clicking on FINISH. Please remember, you would not be allowed to take the typing test again. Your scores would be computed based on how much of the test you've completed till you clicked on the <b>FINISH</b> button. </li>
     <li>Measurement: Typing speed and accuracy scores</li>
     <li>When you are ready to take the assessment, please click on <b>START</b>.</li>
	</ul>
	
   
  </td>
              
            </tr>
            
            <tr>
              <td class="taR">
              </td><td class="alterRow"><div style="float: right; overflow: hidden; margin: 0px 48px 0pt 0pt;">
                 <!--  <input type="image" class="btn" value="Submit" id="submit" name="submit" onclick="javascript:redirect();" src="../247Recruit/images/Button_Small.png" /> -->
                  
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






</body></html>